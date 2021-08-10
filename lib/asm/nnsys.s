	.include "asm/macros.inc"
	.include "global.inc"

	.public _02110C7C
	.public _02110C80

	.text

	arm_func_start sub_020B4D14
sub_020B4D14: ; 0x020B4D14
	cmp r1, #0
	ldreq r0, [r0]
	ldrneh r0, [r0, #0xa]
	addne r0, r1, r0
	ldrne r0, [r0, #4]
	bx lr
	arm_func_end sub_020B4D14

	arm_func_start sub_020B4D2C
sub_020B4D2C: ; 0x020B4D2C
	cmp r1, #0
	ldreq r0, [r0, #4]
	ldrneh r0, [r0, #0xa]
	ldrne r0, [r1, r0]
	bx lr
	arm_func_end sub_020B4D2C

	arm_func_start sub_020B4D40
sub_020B4D40: ; 0x020B4D40
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0
	mov r6, r0
	bl sub_020B4D14
	movs r4, r0
	beq _020B4DA0
_020B4D5C:
	ldr r0, [r4, #0x18]
	cmp r0, r5
	bhi _020B4D8C
	ldr r0, [r4, #0x1c]
	cmp r5, r0
	bhs _020B4D8C
	mov r1, r5
	add r0, r4, #0xc
	bl sub_020B4D40
	cmp r0, #0
	moveq r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_020B4D8C:
	mov r0, r6
	mov r1, r4
	bl sub_020B4D14
	movs r4, r0
	bne _020B4D5C
_020B4DA0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B4D40

	arm_func_start sub_020B4DA8
sub_020B4DA8: ; 0x020B4DA8
	stmdb sp!, {r4, lr}
	ldr r4, _020B4DCC ; =0x021D84B4
	mov r1, r0
	mov r0, r4
	bl sub_020B4D40
	cmp r0, #0
	addne r4, r0, #0xc
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4DCC: .word 0x021D84B4
	arm_func_end sub_020B4DA8

	arm_func_start sub_020B4DD0
sub_020B4DD0: ; 0x020B4DD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [sp, #8]
	str r1, [r4]
	mov ip, #0
	str r2, [r4, #0x18]
	bic r1, ip, #0xff
	and r0, r0, #0xff
	orr r2, r1, r0
	str r3, [r4, #0x1c]
	add r0, r4, #0xc
	mov r1, #4
	str r2, [r4, #0x20]
	bl sub_020B4B68
	ldr r0, _020B4E44 ; =0x021D84B0
	ldr r0, [r0]
	cmp r0, #0
	bne _020B4E30
	ldr r0, _020B4E48 ; =0x021D84B4
	mov r1, #4
	bl sub_020B4B68
	ldr r0, _020B4E44 ; =0x021D84B0
	mov r1, #1
	str r1, [r0]
_020B4E30:
	mov r0, r4
	bl sub_020B4DA8
	mov r1, r4
	bl sub_020B4BAC
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4E44: .word 0x021D84B0
_020B4E48: .word 0x021D84B4
	arm_func_end sub_020B4DD0

	arm_func_start sub_020B4E4C
sub_020B4E4C: ; 0x020B4E4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B4DA8
	mov r1, r4
	bl sub_020B4CB4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B4E4C

	arm_func_start sub_020B4E64
sub_020B4E64: ; 0x020B4E64
	ldrh r2, [r1, #2]
	add r3, r1, #0x10
	mov r2, r2, asr #8
	and r2, r2, #0x7f
	mov r2, r2, lsl #0x10
	sub r2, r1, r2, lsr #16
	str r2, [r0]
	ldr r1, [r1, #4]
	add r1, r1, r3
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_020B4E64

	arm_func_start sub_020B4E90
sub_020B4E90: ; 0x020B4E90
	ldr r2, [r1, #8]
	ldr r1, [r1, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r0]
	cmp r1, #0
	strne r2, [r1, #8]
	streq r2, [r0, #4]
	mov r0, r2
	bx lr
	arm_func_end sub_020B4E90

	arm_func_start sub_020B4EB8
sub_020B4EB8: ; 0x020B4EB8
	str r2, [r1, #8]
	cmp r2, #0
	ldrne r3, [r2, #0xc]
	strne r1, [r2, #0xc]
	ldreq r3, [r0]
	streq r1, [r0]
	str r3, [r1, #0xc]
	cmp r3, #0
	strne r1, [r3, #8]
	streq r1, [r0, #4]
	mov r0, r1
	bx lr
	arm_func_end sub_020B4EB8

	arm_func_start sub_020B4EE8
sub_020B4EE8: ; 0x020B4EE8
	ldr r3, [r0]
	mov r2, #0
	strh r1, [r3]
	strh r2, [r3, #2]
	ldr r1, [r0, #4]
	add r0, r3, #0x10
	sub r0, r1, r0
	stmib r3, {r0, r2}
	mov r0, r3
	str r2, [r3, #0xc]
	bx lr
	arm_func_end sub_020B4EE8

	arm_func_start sub_020B4F14
sub_020B4F14: ; 0x020B4F14
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r3, r1
	mov r4, r0
	str r2, [sp]
	ldr r1, _020B4F80 ; =0x45585048
	add r2, r4, #0x38
	bl sub_020B4DD0
	mov r0, #0
	strh r0, [r4, #0x34]
	bic r0, r0, #1
	strh r0, [r4, #0x36]
	ldr r1, [r4, #0x18]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r2, [r4, #0x1c]
	ldr r1, _020B4F84 ; =0x00004652
	str r2, [sp, #8]
	bl sub_020B4EE8
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	mov r1, #0
	str r1, [r4, #0x2c]
	mov r0, r4
	str r1, [r4, #0x30]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020B4F80: .word 0x45585048
_020B4F84: .word 0x00004652
	arm_func_end sub_020B4F14

	arm_func_start sub_020B4F88
sub_020B4F88: ; 0x020B4F88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r7, r0
	add r0, sp, #0x10
	mov r8, r1
	mov r6, r2
	mov r4, r3
	bl sub_020B4E64
	ldr r3, [sp, #0x14]
	sub r5, r6, #0x10
	add r2, r4, r6
	mov r0, r7
	mov r1, r8
	str r5, [sp, #0x14]
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	bl sub_020B4E90
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r4, r0
	sub r0, r1, r2
	cmp r0, #0x14
	strlo r2, [sp, #0x14]
	blo _020B5008
	ldr r1, _020B5100 ; =0x00004652
	add r0, sp, #0x10
	bl sub_020B4EE8
	mov r1, r0
	mov r0, r7
	mov r2, r4
	bl sub_020B4EB8
	mov r4, r0
_020B5008:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	cmp r0, #0x14
	strlo r1, [sp, #8]
	blo _020B503C
	ldr r1, _020B5100 ; =0x00004652
	add r0, sp, #8
	bl sub_020B4EE8
	mov r1, r0
	mov r0, r7
	mov r2, r4
	bl sub_020B4EB8
_020B503C:
	ldr r0, [r7, #-4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #8]
	and r0, r0, #0xff
	tst r0, #1
	sub r2, r2, r1
	beq _020B5060
	mov r0, #0
	bl sub_020D47EC
_020B5060:
	ldr r2, [sp, #8]
	ldr r1, _020B5104 ; =0x00005544
	add r0, sp, #0
	str r5, [sp]
	str r2, [sp, #4]
	bl sub_020B4EE8
	mov r1, r0
	ldrh r3, [r1, #2]
	ldrh r2, [sp, #0x30]
	add r0, r7, #8
	bic r3, r3, #0x8000
	strh r3, [r1, #2]
	ldrh r3, [r1, #2]
	mov r2, r2, lsl #0x1f
	orr r2, r3, r2, lsr #16
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	ldr r3, [sp, #0x14]
	bic r2, r2, #0x7f00
	strh r2, [r1, #2]
	sub r2, r1, r3
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	ldrh r3, [r1, #2]
	mov r2, r2, lsl #0x19
	orr r2, r3, r2, lsr #17
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r3, [r7, #0x10]
	bic r2, r2, #0xff
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	and r3, r3, #0xff
	orr r2, r2, r3
	strh r2, [r1, #2]
	ldr r2, [r7, #0xc]
	bl sub_020B4EB8
	mov r0, r6
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020B5100: .word 0x00004652
_020B5104: .word 0x00005544
	arm_func_end sub_020B4F88

	arm_func_start sub_020B5108
sub_020B5108: ; 0x020B5108
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r4, [r0, #0x36]
	mov r3, r1
	ldr ip, [r0, #0x24]
	and r1, r4, #1
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	mov r1, #0
	moveq r6, #1
	movne r6, #0
	mov r4, r1
	cmp ip, #0
	sub lr, r1, #1
	beq _020B5198
	sub r2, r2, #1
	mvn r5, r2
_020B5148:
	add r8, ip, #0x10
	add r7, r2, r8
	and sb, r5, r7
	sub r7, sb, r8
	ldr r8, [ip, #4]
	add r7, r3, r7
	cmp r8, r7
	blo _020B518C
	cmp lr, r8
	bls _020B518C
	mov r1, ip
	mov lr, r8
	mov r4, sb
	cmp r6, #0
	bne _020B5198
	cmp r8, r3
	beq _020B5198
_020B518C:
	ldr ip, [ip, #0xc]
	cmp ip, #0
	bne _020B5148
_020B5198:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	mov r2, r4
	add r0, r0, #0x24
	str r5, [sp]
	bl sub_020B4F88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020B5108

	arm_func_start sub_020B51BC
sub_020B51BC: ; 0x020B51BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r4, [r0, #0x36]
	mov r3, r1
	ldr ip, [r0, #0x28]
	and r1, r4, #1
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	mov r1, #0
	moveq r5, #1
	movne r5, #0
	mov r4, r1
	cmp ip, #0
	sub lr, r1, #1
	beq _020B5248
	sub r2, r2, #1
	mvn r2, r2
_020B51FC:
	ldr r8, [ip, #4]
	add sb, ip, #0x10
	add r6, r8, sb
	sub r6, r6, r3
	and r7, r2, r6
	subs r6, r7, sb
	bmi _020B523C
	cmp lr, r8
	bls _020B523C
	mov r1, ip
	mov lr, r8
	mov r4, r7
	cmp r5, #0
	bne _020B5248
	cmp r8, r3
	beq _020B5248
_020B523C:
	ldr ip, [ip, #8]
	cmp ip, #0
	bne _020B51FC
_020B5248:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #1
	mov r2, r4
	add r0, r0, #0x24
	str r5, [sp]
	bl sub_020B4F88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020B51BC

	arm_func_start sub_020B526C
sub_020B526C: ; 0x020B526C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	ldr r2, [r5]
	ldr r1, [r5, #4]
	mov r6, r0
	str r2, [sp]
	str r1, [sp, #4]
	ldr r1, [r6]
	mov r4, #0
	cmp r1, #0
	beq _020B52E0
	ldr r0, [r5]
_020B52A0:
	cmp r1, r0
	movlo r4, r1
	blo _020B52D4
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _020B52E0
	ldr r2, [r1, #4]
	add r0, r1, #0x10
	add r2, r2, r0
	mov r0, r6
	str r2, [sp, #4]
	bl sub_020B4E90
	b _020B52E0
_020B52D4:
	ldr r1, [r1, #0xc]
	cmp r1, #0
	bne _020B52A0
_020B52E0:
	cmp r4, #0
	beq _020B5314
	ldr r2, [r4, #4]
	add r1, r4, #0x10
	ldr r0, [r5]
	add r1, r2, r1
	cmp r1, r0
	bne _020B5314
	mov r0, r6
	mov r1, r4
	str r4, [sp]
	bl sub_020B4E90
	mov r4, r0
_020B5314:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	sub r0, r1, r0
	cmp r0, #0x10
	addlo sp, sp, #8
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, pc}
	ldr r1, _020B5358 ; =0x00004652
	add r0, sp, #0
	bl sub_020B4EE8
	mov r1, r0
	mov r0, r6
	mov r2, r4
	bl sub_020B4EB8
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B5358: .word 0x00004652
	arm_func_end sub_020B526C

	arm_func_start sub_020B535C
sub_020B535C: ; 0x020B535C
	stmdb sp!, {r3, lr}
	add r1, r1, r0
	add r0, r0, #3
	bic r1, r1, #3
	bic r0, r0, #3
	cmp r0, r1
	bhi _020B5384
	sub r3, r1, r0
	cmp r3, #0x4c
	bhs _020B538C
_020B5384:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B538C:
	bl sub_020B4F14
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B535C

	arm_func_start sub_020B5394
sub_020B5394: ; 0x020B5394
	ldr ip, _020B539C ; =sub_020B4E4C
	bx ip
	.align 2, 0
_020B539C: .word sub_020B4E4C
	arm_func_end sub_020B5394

	arm_func_start sub_020B53A0
sub_020B53A0: ; 0x020B53A0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	moveq r1, #1
	add r1, r1, #3
	cmp r2, #0
	bic r1, r1, #3
	blt _020B53C4
	bl sub_020B5108
	ldmia sp!, {r3, pc}
_020B53C4:
	rsb r2, r2, #0
	bl sub_020B51BC
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B53A0

	arm_func_start sub_020B53D0
sub_020B53D0: ; 0x020B53D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r4, r1
	mov sb, r2
	sub r8, r4, #0x10
	add r1, sb, #3
	ldr r7, [r8, #4]
	bic sb, r1, #3
	cmp sb, r7
	mov r5, r0
	addeq sp, sp, #0x10
	moveq r0, sb
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bls _020B54F0
	ldr r6, [r5, #0x24]
	add r0, r8, #0x10
	cmp r6, #0
	add r0, r7, r0
	beq _020B542C
_020B541C:
	cmp r6, r0
	ldrne r6, [r6, #0xc]
	cmpne r6, #0
	bne _020B541C
_020B542C:
	cmp r6, #0
	beq _020B5448
	ldr r0, [r6, #4]
	add r1, r7, #0x10
	add r0, r1, r0
	cmp sb, r0
	bls _020B5454
_020B5448:
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B5454:
	add r0, sp, #8
	mov r1, r6
	bl sub_020B4E64
	mov r1, r6
	add r0, r5, #0x24
	bl sub_020B4E90
	ldr r2, [sp, #0xc]
	add r3, sb, r4
	ldr r6, [sp, #8]
	sub r1, r2, r3
	str r3, [sp, #8]
	cmp r1, #0x10
	strlo r2, [sp, #8]
	mov r7, r0
	ldr r0, [sp, #8]
	sub r0, r0, r4
	str r0, [r8, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	cmp r0, #0x10
	blo _020B54C8
	ldr r1, _020B552C ; =0x00004652
	add r0, sp, #8
	bl sub_020B4EE8
	mov r1, r0
	mov r2, r7
	add r0, r5, #0x24
	bl sub_020B4EB8
_020B54C8:
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	and r0, r0, #0xff
	tst r0, #1
	sub r2, r1, r6
	beq _020B5520
	mov r1, r6
	mov r0, #0
	bl sub_020D47EC
	b _020B5520
_020B54F0:
	add r0, sb, r4
	str r0, [sp]
	ldr r1, [r8, #4]
	add r0, r8, #0x10
	add r0, r1, r0
	str r0, [sp, #4]
	add r1, sp, #0
	add r0, r5, #0x24
	str sb, [r8, #4]
	bl sub_020B526C
	cmp r0, #0
	streq r7, [r8, #4]
_020B5520:
	ldr r0, [r8, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B552C: .word 0x00004652
	arm_func_end sub_020B53D0

	arm_func_start sub_020B5530
sub_020B5530: ; 0x020B5530
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	sub r4, r1, #0x10
	mov r5, r0
	add r0, sp, #0
	mov r1, r4
	bl sub_020B4E64
	mov r1, r4
	add r0, r5, #0x2c
	bl sub_020B4E90
	add r1, sp, #0
	add r0, r5, #0x24
	bl sub_020B526C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B5530

	arm_func_start sub_020B556C
sub_020B556C: ; 0x020B556C
	ldr r2, [r0, #0x24]
	mov r0, #0
	cmp r2, #0
	bxeq lr
_020B557C:
	ldr r1, [r2, #4]
	ldr r2, [r2, #0xc]
	add r0, r0, r1
	cmp r2, #0
	bne _020B557C
	bx lr
	arm_func_end sub_020B556C

	arm_func_start sub_020B5594
sub_020B5594: ; 0x020B5594
	ldrh r2, [r0, #0x34]
	strh r1, [r0, #0x34]
	mov r0, r2
	bx lr
	arm_func_end sub_020B5594

	arm_func_start sub_020B55A4
sub_020B55A4: ; 0x020B55A4
	ldr r0, [r0, #-0xc]
	bx lr
	arm_func_end sub_020B55A4

	arm_func_start sub_020B55AC
sub_020B55AC: ; 0x020B55AC
	ldrh r0, [r0, #-0xe]
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_020B55AC

	arm_func_start sub_020B55B8
sub_020B55B8: ; 0x020B55B8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r4, r0
	str r2, [sp]
	ldr r1, _020B55FC ; =0x46524D48
	add r2, r4, #0x30
	bl sub_020B4DD0
	ldr r0, [r4, #0x18]
	mov r1, #0
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x1c]
	mov r0, r4
	str r2, [r4, #0x28]
	str r1, [r4, #0x2c]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020B55FC: .word 0x46524D48
	arm_func_end sub_020B55B8

	arm_func_start sub_020B5600
sub_020B5600: ; 0x020B5600
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r3, [r4]
	sub r0, r2, #1
	mvn r2, r0
	add r0, r0, r3
	and r5, r2, r0
	ldr r0, [r4, #4]
	add r6, r1, r5
	cmp r6, r0
	movhi r0, #0
	ldmhiia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #-4]
	sub r2, r6, r3
	and r0, r0, #0xff
	tst r0, #1
	beq _020B5650
	mov r1, r3
	mov r0, #0
	bl sub_020D47EC
_020B5650:
	mov r0, r5
	str r6, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B5600

	arm_func_start sub_020B565C
sub_020B565C: ; 0x020B565C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #4]
	sub r0, r2, #1
	mvn r2, r0
	sub r1, r3, r1
	ldr r0, [r4]
	and r5, r2, r1
	cmp r5, r0
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #-4]
	sub r2, r3, r5
	and r0, r0, #0xff
	tst r0, #1
	beq _020B56A8
	mov r1, r5
	mov r0, #0
	bl sub_020D47EC
_020B56A8:
	mov r0, r5
	str r5, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B565C

	arm_func_start sub_020B56B4
sub_020B56B4: ; 0x020B56B4
	ldr r2, [r0, #0x18]
	mov r1, #0
	str r2, [r0, #0x24]
	str r1, [r0, #0x2c]
	bx lr
	arm_func_end sub_020B56B4

	arm_func_start sub_020B56C8
sub_020B56C8: ; 0x020B56C8
	ldr r2, [r0, #0x2c]
	cmp r2, #0
	beq _020B56E8
_020B56D4:
	ldr r1, [r0, #0x1c]
	str r1, [r2, #8]
	ldr r2, [r2, #0xc]
	cmp r2, #0
	bne _020B56D4
_020B56E8:
	ldr r1, [r0, #0x1c]
	str r1, [r0, #0x28]
	bx lr
	arm_func_end sub_020B56C8

	arm_func_start sub_020B56F4
sub_020B56F4: ; 0x020B56F4
	stmdb sp!, {r3, lr}
	add r1, r1, r0
	add r0, r0, #3
	bic r1, r1, #3
	bic r0, r0, #3
	cmp r0, r1
	bhi _020B571C
	sub r3, r1, r0
	cmp r3, #0x30
	bhs _020B5724
_020B571C:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B5724:
	bl sub_020B55B8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B56F4

	arm_func_start sub_020B572C
sub_020B572C: ; 0x020B572C
	ldr ip, _020B5734 ; =sub_020B4E4C
	bx ip
	.align 2, 0
_020B5734: .word sub_020B4E4C
	arm_func_end sub_020B572C

	arm_func_start sub_020B5738
sub_020B5738: ; 0x020B5738
	stmdb sp!, {r3, lr}
	cmp r1, #0
	moveq r1, #1
	add r1, r1, #3
	cmp r2, #0
	bic r1, r1, #3
	add r0, r0, #0x24
	blt _020B5760
	bl sub_020B5600
	ldmia sp!, {r3, pc}
_020B5760:
	rsb r2, r2, #0
	bl sub_020B565C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B5738

	arm_func_start sub_020B576C
sub_020B576C: ; 0x020B576C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	tst r4, #1
	beq _020B5784
	bl sub_020B56B4
_020B5784:
	tst r4, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl sub_020B56C8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B576C

	arm_func_start sub_020B5798
sub_020B5798: ; 0x020B5798
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl abs
	sub r1, r0, #1
	ldr r0, [r4, #0x24]
	mvn r2, r1
	add r0, r1, r0
	ldr r1, [r4, #0x28]
	and r0, r2, r0
	cmp r0, r1
	movhi r0, #0
	subls r0, r1, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B5798

	arm_func_start sub_020B57D0
sub_020B57D0: ; 0x020B57D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0x24]
	mov r5, r1
	add r0, r6, #0x24
	mov r1, #0x10
	mov r2, #4
	bl sub_020B5600
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	str r5, [r0]
	str r4, [r0, #4]
	ldr r1, [r6, #0x28]
	str r1, [r0, #8]
	ldr r1, [r6, #0x2c]
	str r1, [r0, #0xc]
	str r0, [r6, #0x2c]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B57D0

	arm_func_start sub_020B5820
sub_020B5820: ; 0x020B5820
	ldr r3, [r0, #0x2c]
	cmp r1, #0
	cmpne r3, #0
	beq _020B5844
_020B5830:
	ldr r2, [r3]
	cmp r2, r1
	ldrne r3, [r3, #0xc]
	cmpne r3, #0
	bne _020B5830
_020B5844:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	ldr r1, [r3, #4]
	str r1, [r0, #0x24]
	ldr r1, [r3, #8]
	str r1, [r0, #0x28]
	ldr r1, [r3, #0xc]
	str r1, [r0, #0x2c]
	mov r0, #1
	bx lr
	arm_func_end sub_020B5820

	arm_func_start sub_020B5870
sub_020B5870: ; 0x020B5870
	ldr r2, [r0]
	cmp r2, #0
	ldrne r1, [r2]
	strne r1, [r0]
	mov r0, r2
	bx lr
	arm_func_end sub_020B5870

	arm_func_start sub_020B5888
sub_020B5888: ; 0x020B5888
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #0x24
	bl sub_020B5870
	movs r4, r0
	beq _020B58C0
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x28]
	and r0, r0, #0xff
	tst r0, #1
	beq _020B58C0
	mov r1, r4
	mov r0, #0
	bl sub_020D47EC
_020B58C0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B5888

	arm_func_start sub_020B58C8
sub_020B58C8: ; 0x020B58C8
	ldr r2, [r0, #0x24]
	str r2, [r1]
	str r1, [r0, #0x24]
	bx lr
	arm_func_end sub_020B58C8

	arm_func_start sub_020B58D8
sub_020B58D8: ; 0x020B58D8
	ldr ip, _020B58E8 ; =sub_020B53A0
	mov r2, r0
	ldmib r2, {r0, r2}
	bx ip
	.align 2, 0
_020B58E8: .word sub_020B53A0
	arm_func_end sub_020B58D8

	arm_func_start sub_020B58EC
sub_020B58EC: ; 0x020B58EC
	ldr ip, _020B58F8 ; =sub_020B5530
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_020B58F8: .word sub_020B5530
	arm_func_end sub_020B58EC

	arm_func_start sub_020B58FC
sub_020B58FC: ; 0x020B58FC
	ldr ip, _020B590C ; =sub_020B5738
	mov r2, r0
	ldmib r2, {r0, r2}
	bx ip
	.align 2, 0
_020B590C: .word sub_020B5738
	arm_func_end sub_020B58FC

	arm_func_start sub_020B5910
sub_020B5910: ; 0x020B5910
	bx lr
	arm_func_end sub_020B5910

	arm_func_start sub_020B5914
sub_020B5914: ; 0x020B5914
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #4]
	ldr r2, [r0, #0x28]
	cmp r1, r2
	movhi r0, #0
	ldmhiia sp!, {r3, pc}
	bl sub_020B5888
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B5914

	arm_func_start sub_020B5934
sub_020B5934: ; 0x020B5934
	ldr ip, _020B5940 ; =sub_020B58C8
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_020B5940: .word sub_020B58C8
	arm_func_end sub_020B5934

	arm_func_start sub_020B5944
sub_020B5944: ; 0x020B5944
	ldr ip, _020B595C ; =OS_AllocFromHeap
	mov r3, r0
	mov r2, r1
	ldr r0, [r3, #8]
	ldr r1, [r3, #4]
	bx ip
	.align 2, 0
_020B595C: .word OS_AllocFromHeap
	arm_func_end sub_020B5944

	arm_func_start sub_020B5960
sub_020B5960: ; 0x020B5960
	ldr ip, _020B5978 ; =OS_FreeToHeap
	mov r3, r0
	mov r2, r1
	ldr r0, [r3, #8]
	ldr r1, [r3, #4]
	bx ip
	.align 2, 0
_020B5978: .word OS_FreeToHeap
	arm_func_end sub_020B5960

	arm_func_start sub_020B597C
sub_020B597C: ; 0x020B597C
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	ldr r2, [r2]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B597C

	arm_func_start sub_020B5990
sub_020B5990: ; 0x020B5990
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B5990

	arm_func_start sub_020B59A4
sub_020B59A4: ; 0x020B59A4
	ldr ip, _020B59B8 ; =0x02109200
	mov r3, #0
	str ip, [r0]
	stmib r0, {r1, r2, r3}
	bx lr
	.align 2, 0
_020B59B8: .word 0x02109200
	arm_func_end sub_020B59A4

	arm_func_start sub_020B59BC
sub_020B59BC: ; 0x020B59BC
	mov r0, #0
	bx lr
	arm_func_end sub_020B59BC

	arm_func_start sub_020B59C4
sub_020B59C4: ; 0x020B59C4
	mvn r0, #0
	bx lr
	arm_func_end sub_020B59C4

	arm_func_start sub_020B59CC
sub_020B59CC: ; 0x020B59CC
	mov r0, #0
	bx lr
	arm_func_end sub_020B59CC

	arm_func_start sub_020B59D4
sub_020B59D4: ; 0x020B59D4
	mvn r0, #0
	bx lr
	arm_func_end sub_020B59D4

	arm_func_start sub_020B59DC
sub_020B59DC: ; 0x020B59DC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _020B5A1C ; =_02110950
	mov ip, #0x18
	mla r6, r0, ip, r5
	ldr lr, [sp, #0x10]
	ldr r0, _020B5A20 ; =_02110934
	mla r4, r1, ip, r5
	str r6, [r0, #8]
	mla r1, r2, ip, r5
	str r4, [r0, #0xc]
	mla r2, r3, ip, r5
	str r1, [r0, #0x10]
	mla r1, lr, ip, r5
	str r2, [r0, #0x14]
	str r1, [r0, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B5A1C: .word _02110950
_020B5A20: .word _02110934
	arm_func_end sub_020B59DC

	arm_func_start sub_020B5A24
sub_020B5A24: ; 0x020B5A24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #2
	mov ip, #1
	mov r0, #4
	mov r1, #3
	bhi _020B5A58
	mov r2, #2
	mov r3, #0
	str ip, [sp]
	bl sub_020B59DC
	b _020B5A68
_020B5A58:
	mov r2, #0
	mov r3, #2
	str ip, [sp]
	bl sub_020B59DC
_020B5A68:
	ldr r0, _020B5A98 ; =0x021D84C0
	strh r5, [r0]
	bl sub_020B5AAC
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, _020B5A9C ; =sub_020B5B20
	ldr r1, _020B5AA0 ; =_02110924
	ldr r2, _020B5AA4 ; =sub_020B5C90
	ldr r0, _020B5AA8 ; =_02110928
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B5A98: .word 0x021D84C0
_020B5A9C: .word sub_020B5B20
_020B5AA0: .word _02110924
_020B5AA4: .word sub_020B5C90
_020B5AA8: .word _02110928
	arm_func_end sub_020B5A24

	arm_func_start sub_020B5AAC
sub_020B5AAC: ; 0x020B5AAC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020B5B18 ; =0x021D84C0
	mov r5, #0
	ldrh r7, [r0]
	ldr r6, _020B5B1C ; =_02110950
	mov lr, r5
	cmp r7, #1
	addhi r7, r7, #1
	mov r4, #1
	mov r1, r5
	mov r0, #0x20000
	mov r3, r5
	mov r2, #0x10000
_020B5AE0:
	cmp r5, r7
	strlt r4, [r6, #8]
	strge lr, [r6, #8]
	ldr ip, [r6, #0xc]
	add r5, r5, #1
	cmp ip, #0
	strne r3, [r6]
	strne r2, [r6, #4]
	streq r1, [r6]
	streq r0, [r6, #4]
	cmp r5, #5
	add r6, r6, #0x18
	blt _020B5AE0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B5B18: .word 0x021D84C0
_020B5B1C: .word _02110950
	arm_func_end sub_020B5AAC

	arm_func_start sub_020B5B20
sub_020B5B20: ; 0x020B5B20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	cmp r0, #0
	moveq r3, #0x10
	addne r0, r0, #0xf
	bicne r3, r0, #0xf
	ldr r0, _020B5C7C ; =0x0007FFF0
	cmp r3, r0
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r1, #0
	beq _020B5C04
	mov r4, #0
	ldr r8, _020B5C80 ; =_02110980
	ldr sb, _020B5C84 ; =_02110968
	ldr r0, _020B5C88 ; =_02110934
	mov r7, r4
_020B5B60:
	ldr lr, [r0, r4, lsl #2]
	ldr r5, [lr, #8]
	cmp r5, #0
	beq _020B5BF0
	ldmia lr, {r5, r6}
	sub r5, r6, r5
	cmp r5, r3
	blo _020B5BF0
	ldrh r5, [lr, #0x10]
	cmp r5, #0
	beq _020B5B98
	cmp r5, #3
	beq _020B5BA0
	b _020B5BA8
_020B5B98:
	mov ip, sb
	b _020B5BAC
_020B5BA0:
	mov ip, r8
	b _020B5BAC
_020B5BA8:
	mov ip, r7
_020B5BAC:
	ldr r5, [ip, #8]
	cmp r5, #0
	beq _020B5BF0
	ldmia ip, {r5, r6}
	sub r5, r6, r5
	cmp r5, r3, lsr #1
	blo _020B5BF0
	ldr r4, [lr]
	mov r0, #1
	add r2, r4, r3
	str r2, [lr]
	ldr r2, [ip]
	add r2, r2, r3, lsr #1
	str r2, [ip]
	ldr r2, [lr, #0x14]
	add r2, r4, r2
	b _020B5C58
_020B5BF0:
	add r4, r4, #1
	cmp r4, #2
	blt _020B5B60
	mov r0, #0
	b _020B5C58
_020B5C04:
	ldr lr, _020B5C8C ; =_0211093C
	mov r5, #0
_020B5C0C:
	ldr ip, [lr, r5, lsl #2]
	ldr r0, [ip, #8]
	cmp r0, #0
	beq _020B5C48
	ldmia ip, {r0, r4}
	sub r0, r4, r0
	cmp r0, r3
	blo _020B5C48
	ldr r2, [ip, #4]
	mov r0, #1
	sub r4, r2, r3
	str r4, [ip, #4]
	ldr r2, [ip, #0x14]
	add r2, r4, r2
	b _020B5C58
_020B5C48:
	add r5, r5, #1
	cmp r5, #5
	blt _020B5C0C
	mov r0, #0
_020B5C58:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r2, lsl #0xd
	mov r2, r3, lsr #4
	mov r0, r0, lsr #0x10
	orr r0, r0, r2, lsl #16
	orr r0, r0, r1, lsl #31
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B5C7C: .word 0x0007FFF0
_020B5C80: .word _02110980
_020B5C84: .word _02110968
_020B5C88: .word _02110934
_020B5C8C: .word _0211093C
	arm_func_end sub_020B5B20

	arm_func_start sub_020B5C90
sub_020B5C90: ; 0x020B5C90
	mov r0, #0
	bx lr
	arm_func_end sub_020B5C90

	arm_func_start sub_020B5C98
sub_020B5C98: ; 0x020B5C98
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr ip, _020B5CD4 ; =_02110950
	mov lr, r3
_020B5CA8:
	ldr r1, [ip]
	add r3, r3, #1
	str r1, [r0, lr, lsl #2]
	ldr r2, [ip, #4]
	add r1, r0, lr, lsl #2
	str r2, [r1, #4]
	cmp r3, #5
	add ip, ip, #0x18
	add lr, lr, #2
	blt _020B5CA8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B5CD4: .word _02110950
	arm_func_end sub_020B5C98

	arm_func_start sub_020B5CD8
sub_020B5CD8: ; 0x020B5CD8
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr lr, _020B5D14 ; =_02110950
	mov ip, r3
_020B5CE8:
	ldr r2, [r0, ip, lsl #2]
	add r1, r0, ip, lsl #2
	str r2, [lr]
	ldr r1, [r1, #4]
	add r3, r3, #1
	str r1, [lr, #4]
	cmp r3, #5
	add ip, ip, #2
	add lr, lr, #0x18
	blt _020B5CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B5D14: .word _02110950
	arm_func_end sub_020B5CD8

	arm_func_start sub_020B5D18
sub_020B5D18: ; 0x020B5D18
	stmdb sp!, {r4, lr}
	ldr r2, _020B5D50 ; =0x021D84C4
	mov r4, r1
	str r0, [r2, #8]
	bl sub_020B5EE0
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _020B5D54 ; =sub_020B5D64
	ldr r1, _020B5D58 ; =_0211092C
	ldr r2, _020B5D5C ; =sub_020B5EA0
	ldr r0, _020B5D60 ; =_02110930
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B5D50: .word 0x021D84C4
_020B5D54: .word sub_020B5D64
_020B5D58: .word _0211092C
_020B5D5C: .word sub_020B5EA0
_020B5D60: .word _02110930
	arm_func_end sub_020B5D18

	arm_func_start sub_020B5D64
sub_020B5D64: ; 0x020B5D64
	stmdb sp!, {r4, lr}
	cmp r0, #0
	moveq r0, #8
	addne r0, r0, #7
	ldr ip, _020B5E98 ; =0x0007FFF8
	bicne r0, r0, #7
	cmp r0, ip
	mov r3, #0
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	cmp r2, #1
	bne _020B5E10
	ldr r2, _020B5E9C ; =0x021D84C4
	cmp r1, #0
	ldr lr, [r2]
	andeq r2, lr, #0xf
	rsbeq r2, r2, #0x10
	andeq r4, r2, #0xf
	beq _020B5DBC
	and r2, lr, #7
	rsb r2, r2, #8
	and r4, r2, #7
_020B5DBC:
	ldr r2, _020B5E9C ; =0x021D84C4
	add ip, r0, r4
	ldr r2, [r2, #4]
	sub r2, r2, lr
	cmp r2, ip
	blo _020B5E08
	cmp r1, #0
	add r1, lr, ip
	beq _020B5DEC
	cmp r1, #0x10000
	movhi lr, #0
	bhi _020B5E78
_020B5DEC:
	ldr r1, _020B5E9C ; =0x021D84C4
	add r3, lr, r4
	ldr r2, [r1]
	mov lr, #1
	add r2, r2, ip
	str r2, [r1]
	b _020B5E78
_020B5E08:
	mov lr, #0
	b _020B5E78
_020B5E10:
	ldr r2, _020B5E9C ; =0x021D84C4
	ldr lr, [r2, #4]
	cmp lr, r0
	blo _020B5E74
	sub r2, lr, r0
	cmp r1, #0
	andne r4, r2, #7
	andeq r4, r2, #0xf
	ldr r2, _020B5E9C ; =0x021D84C4
	add ip, r0, r4
	ldr r2, [r2]
	sub r2, lr, r2
	cmp r2, ip
	blo _020B5E74
	cmp r1, #0
	beq _020B5E5C
	cmp lr, #0x10000
	movhi lr, #0
	bhi _020B5E78
_020B5E5C:
	ldr r1, _020B5E9C ; =0x021D84C4
	mov lr, #1
	ldr r2, [r1, #4]
	sub r3, r2, ip
	str r3, [r1, #4]
	b _020B5E78
_020B5E74:
	mov lr, #0
_020B5E78:
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r3, lsl #0xd
	mov r2, r0, lsr #3
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B5E98: .word 0x0007FFF8
_020B5E9C: .word 0x021D84C4
	arm_func_end sub_020B5D64

	arm_func_start sub_020B5EA0
sub_020B5EA0: ; 0x020B5EA0
	mov r0, #0
	bx lr
	arm_func_end sub_020B5EA0

	arm_func_start sub_020B5EA8
sub_020B5EA8: ; 0x020B5EA8
	ldr r1, _020B5EC0 ; =0x021D84C4
	ldr r2, [r1]
	str r2, [r0]
	ldr r1, [r1, #4]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020B5EC0: .word 0x021D84C4
	arm_func_end sub_020B5EA8

	arm_func_start sub_020B5EC4
sub_020B5EC4: ; 0x020B5EC4
	ldr r2, [r0]
	ldr r1, _020B5EDC ; =0x021D84C4
	str r2, [r1]
	ldr r0, [r0, #4]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020B5EDC: .word 0x021D84C4
	arm_func_end sub_020B5EC4

	arm_func_start sub_020B5EE0
sub_020B5EE0: ; 0x020B5EE0
	ldr r0, _020B5EF8 ; =0x021D84C4
	mov r1, #0
	str r1, [r0]
	ldr r1, [r0, #8]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020B5EF8: .word 0x021D84C4
	arm_func_end sub_020B5EE0

	arm_func_start sub_020B5EFC
sub_020B5EFC: ; 0x020B5EFC
	stmdb sp!, {r3, lr}
	mov r2, r0
	add r0, r1, #1
	ldr r1, [r2, #4]
	bl _u32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B5EFC

	arm_func_start sub_020B5F1C
sub_020B5F1C: ; 0x020B5F1C
	ldrh r1, [r0, #0xc]
	ldr r0, [r0, #4]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020B5F1C

	arm_func_start sub_020B5F34
sub_020B5F34: ; 0x020B5F34
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020B5F34

	arm_func_start sub_020B5F48
sub_020B5F48: ; 0x020B5F48
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D08EC
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020D0948
	bl sub_020D0A88
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B5F48

	arm_func_start sub_020B5F74
sub_020B5F74: ; 0x020B5F74
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D0AD4
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020D0B08
	bl sub_020D0B74
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B5F74

	arm_func_start sub_020B5FA0
sub_020B5FA0: ; 0x020B5FA0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl sub_020D0BB8
	mov r0, r5
	mov r1, r4
	bl sub_020D0C48
	bl sub_020D0D1C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B5FA0

	arm_func_start sub_020B5FC4
sub_020B5FC4: ; 0x020B5FC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl sub_020D0BB8
	mov r0, r5
	mov r1, r4
	bl sub_020D0CB0
	bl sub_020D0D1C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B5FC4

	arm_func_start sub_020B5FE8
sub_020B5FE8: ; 0x020B5FE8
	ldr ip, _020B5FF0 ; =sub_020D0224
	bx ip
	.align 2, 0
_020B5FF0: .word sub_020D0224
	arm_func_end sub_020B5FE8

	arm_func_start sub_020B5FF4
sub_020B5FF4: ; 0x020B5FF4
	ldr ip, _020B5FFC ; =sub_020D02E4
	bx ip
	.align 2, 0
_020B5FFC: .word sub_020D02E4
	arm_func_end sub_020B5FF4

	arm_func_start sub_020B6000
sub_020B6000: ; 0x020B6000
	ldr ip, _020B6008 ; =sub_020D03A4
	bx ip
	.align 2, 0
_020B6008: .word sub_020D03A4
	arm_func_end sub_020B6000

	arm_func_start sub_020B600C
sub_020B600C: ; 0x020B600C
	ldr ip, _020B6014 ; =sub_020D0464
	bx ip
	.align 2, 0
_020B6014: .word sub_020D0464
	arm_func_end sub_020B600C

	arm_func_start sub_020B6018
sub_020B6018: ; 0x020B6018
	ldr ip, _020B6020 ; =sub_020CFF24
	bx ip
	.align 2, 0
_020B6020: .word sub_020CFF24
	arm_func_end sub_020B6018

	arm_func_start sub_020B6024
sub_020B6024: ; 0x020B6024
	ldr ip, _020B602C ; =sub_020CFFE4
	bx ip
	.align 2, 0
_020B602C: .word sub_020CFFE4
	arm_func_end sub_020B6024

	arm_func_start sub_020B6030
sub_020B6030: ; 0x020B6030
	ldr ip, _020B6038 ; =sub_020D00A4
	bx ip
	.align 2, 0
_020B6038: .word sub_020D00A4
	arm_func_end sub_020B6030

	arm_func_start sub_020B603C
sub_020B603C: ; 0x020B603C
	ldr ip, _020B6044 ; =sub_020D0164
	bx ip
	.align 2, 0
_020B6044: .word sub_020D0164
	arm_func_end sub_020B603C

	arm_func_start sub_020B6048
sub_020B6048: ; 0x020B6048
	ldr ip, _020B6050 ; =sub_020D00A4
	bx ip
	.align 2, 0
_020B6050: .word sub_020D00A4
	arm_func_end sub_020B6048

	arm_func_start sub_020B6054
sub_020B6054: ; 0x020B6054
	ldr ip, _020B605C ; =sub_020D0164
	bx ip
	.align 2, 0
_020B605C: .word sub_020D0164
	arm_func_end sub_020B6054

	arm_func_start sub_020B6060
sub_020B6060: ; 0x020B6060
	ldr ip, _020B6068 ; =sub_020CFD18
	bx ip
	.align 2, 0
_020B6068: .word sub_020CFD18
	arm_func_end sub_020B6060

	arm_func_start sub_020B606C
sub_020B606C: ; 0x020B606C
	ldr ip, _020B6074 ; =sub_020CFC6C
	bx ip
	.align 2, 0
_020B6074: .word sub_020CFC6C
	arm_func_end sub_020B606C

	arm_func_start sub_020B6078
sub_020B6078: ; 0x020B6078
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D067C
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020D06C4
	bl sub_020D0730
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B6078

	arm_func_start sub_020B60A4
sub_020B60A4: ; 0x020B60A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D0524
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020D05C4
	bl sub_020D0634
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B60A4

	arm_func_start sub_020B60D0
sub_020B60D0: ; 0x020B60D0
	ldr ip, _020B60D8 ; =sub_020CFDC8
	bx ip
	.align 2, 0
_020B60D8: .word sub_020CFDC8
	arm_func_end sub_020B60D0

	arm_func_start sub_020B60DC
sub_020B60DC: ; 0x020B60DC
	ldr ip, _020B60E4 ; =sub_020CFE74
	bx ip
	.align 2, 0
_020B60E4: .word sub_020CFE74
	arm_func_end sub_020B60DC

	arm_func_start sub_020B60E8
sub_020B60E8: ; 0x020B60E8
	ldr ip, _020B60F0 ; =sub_020D0284
	bx ip
	.align 2, 0
_020B60F0: .word sub_020D0284
	arm_func_end sub_020B60E8

	arm_func_start sub_020B60F4
sub_020B60F4: ; 0x020B60F4
	ldr ip, _020B60FC ; =sub_020D0344
	bx ip
	.align 2, 0
_020B60FC: .word sub_020D0344
	arm_func_end sub_020B60F4

	arm_func_start sub_020B6100
sub_020B6100: ; 0x020B6100
	ldr ip, _020B6108 ; =sub_020D0404
	bx ip
	.align 2, 0
_020B6108: .word sub_020D0404
	arm_func_end sub_020B6100

	arm_func_start sub_020B610C
sub_020B610C: ; 0x020B610C
	ldr ip, _020B6114 ; =sub_020D04C4
	bx ip
	.align 2, 0
_020B6114: .word sub_020D04C4
	arm_func_end sub_020B610C

	arm_func_start sub_020B6118
sub_020B6118: ; 0x020B6118
	ldr ip, _020B6120 ; =sub_020CFF84
	bx ip
	.align 2, 0
_020B6120: .word sub_020CFF84
	arm_func_end sub_020B6118

	arm_func_start sub_020B6124
sub_020B6124: ; 0x020B6124
	ldr ip, _020B612C ; =sub_020D0044
	bx ip
	.align 2, 0
_020B612C: .word sub_020D0044
	arm_func_end sub_020B6124

	arm_func_start sub_020B6130
sub_020B6130: ; 0x020B6130
	ldr ip, _020B6138 ; =sub_020D0104
	bx ip
	.align 2, 0
_020B6138: .word sub_020D0104
	arm_func_end sub_020B6130

	arm_func_start sub_020B613C
sub_020B613C: ; 0x020B613C
	ldr ip, _020B6144 ; =sub_020D01C4
	bx ip
	.align 2, 0
_020B6144: .word sub_020D01C4
	arm_func_end sub_020B613C

	arm_func_start sub_020B6148
sub_020B6148: ; 0x020B6148
	ldr ip, _020B6150 ; =sub_020D0104
	bx ip
	.align 2, 0
_020B6150: .word sub_020D0104
	arm_func_end sub_020B6148

	arm_func_start sub_020B6154
sub_020B6154: ; 0x020B6154
	ldr ip, _020B615C ; =sub_020D01C4
	bx ip
	.align 2, 0
_020B615C: .word sub_020D01C4
	arm_func_end sub_020B6154

	arm_func_start sub_020B6160
sub_020B6160: ; 0x020B6160
	ldr ip, _020B6168 ; =sub_020CFD70
	bx ip
	.align 2, 0
_020B6168: .word sub_020CFD70
	arm_func_end sub_020B6160

	arm_func_start sub_020B616C
sub_020B616C: ; 0x020B616C
	ldr ip, _020B6174 ; =sub_020CFCC0
	bx ip
	.align 2, 0
_020B6174: .word sub_020CFCC0
	arm_func_end sub_020B616C

	arm_func_start sub_020B6178
sub_020B6178: ; 0x020B6178
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D0830
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020D0848
	bl sub_020D08AC
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B6178

	arm_func_start sub_020B61A4
sub_020B61A4: ; 0x020B61A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D0774
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020D078C
	bl sub_020D07F0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B61A4

	arm_func_start sub_020B61D0
sub_020B61D0: ; 0x020B61D0
	ldr ip, _020B61D8 ; =sub_020CFE1C
	bx ip
	.align 2, 0
_020B61D8: .word sub_020CFE1C
	arm_func_end sub_020B61D0

	arm_func_start sub_020B61DC
sub_020B61DC: ; 0x020B61DC
	ldr ip, _020B61E4 ; =sub_020CFECC
	bx ip
	.align 2, 0
_020B61E4: .word sub_020CFECC
	arm_func_end sub_020B61DC

	arm_func_start sub_020B61E8
sub_020B61E8: ; 0x020B61E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5]
	ldr r2, _020B6214 ; =0x02109210
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	ldr r4, [r2, r3, lsl #2]
	bl DC_FlushRange
	ldmib r5, {r0, r1, r2}
	blx r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6214: .word 0x02109210
	arm_func_end sub_020B61E8

	arm_func_start sub_020B6218
sub_020B6218: ; 0x020B6218
	mov r1, #0
	strh r1, [r0, #0xa]
	strh r1, [r0, #8]
	strh r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_020B6218

	arm_func_start sub_020B6230
sub_020B6230: ; 0x020B6230
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B5F1C
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xa]
	mov r0, r4
	bl sub_020B5EFC
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	mov r0, #1
	add r1, r1, #1
	strh r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B6230

	arm_func_start sub_020B626C
sub_020B626C: ; 0x020B626C
	ldrh r1, [r0, #8]
	ldr r0, [r0]
	add r0, r0, r1, lsl #4
	bx lr
	arm_func_end sub_020B626C

	arm_func_start sub_020B627C
sub_020B627C: ; 0x020B627C
	ldrh r1, [r0, #0xa]
	ldr r0, [r0]
	add r0, r0, r1, lsl #4
	bx lr
	arm_func_end sub_020B627C

	arm_func_start sub_020B628C
sub_020B628C: ; 0x020B628C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B5F34
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #8]
	mov r0, r4
	bl sub_020B5EFC
	strh r0, [r4, #8]
	ldrh r1, [r4, #0xc]
	mov r0, #1
	sub r1, r1, #1
	strh r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B628C

	arm_func_start sub_020B62C8
sub_020B62C8: ; 0x020B62C8
	ldr r2, _020B62E0 ; =0x021D84D0
	ldr ip, _020B62E4 ; =sub_020B6218
	str r0, [r2]
	ldr r0, _020B62E8 ; =0x021D84D0
	str r1, [r2, #4]
	bx ip
	.align 2, 0
_020B62E0: .word 0x021D84D0
_020B62E4: .word sub_020B6218
_020B62E8: .word 0x021D84D0
	arm_func_end sub_020B62C8

	arm_func_start sub_020B62EC
sub_020B62EC: ; 0x020B62EC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020B6348 ; =0x021D84D0
	mov r0, r4
	bl sub_020B626C
	mov r5, r0
	mov r0, r4
	bl sub_020B628C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020B6310:
	mov r0, r5
	bl sub_020B61E8
	ldr r2, [r4, #0x10]
	ldr r1, [r5, #0xc]
	mov r0, r4
	sub r1, r2, r1
	str r1, [r4, #0x10]
	bl sub_020B626C
	mov r5, r0
	mov r0, r4
	bl sub_020B628C
	cmp r0, #0
	bne _020B6310
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6348: .word 0x021D84D0
	arm_func_end sub_020B62EC

	arm_func_start sub_020B634C
sub_020B634C: ; 0x020B634C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _020B63B0 ; =0x021D84D0
	mov sb, r0
	mov r0, r5
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl sub_020B5F1C
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	bl sub_020B627C
	mov r4, r0
	str sb, [r4]
	stmib r4, {r7, r8}
	mov r0, r5
	str r6, [r4, #0xc]
	bl sub_020B6230
	ldr r2, [r5, #0x10]
	ldr r1, [r4, #0xc]
	mov r0, #1
	add r1, r2, r1
	str r1, [r5, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B63B0: .word 0x021D84D0
	arm_func_end sub_020B634C

	arm_func_start sub_020B63B4
sub_020B63B4: ; 0x020B63B4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, [r0]
	mov lr, #0
	cmp r3, #0
	beq _020B6490
	mov r8, lr
	mov r4, lr
_020B63D0:
	ldr r6, [r3]
	ldr r5, [r2, #4]
	ldr ip, [r3, #0xc]
	cmp r6, r5
	bne _020B642C
	ldr r5, [r3, #4]
	orr lr, lr, #1
	add r5, r6, r5
	str r5, [r2, #4]
	ldr r6, [r3, #8]
	ldr r5, [r3, #0xc]
	cmp r6, #0
	strne r5, [r6, #0xc]
	streq r5, [r0]
	cmp r5, #0
	strne r6, [r5, #8]
	ldr r5, [r1]
	cmp r5, #0
	strne r3, [r5, #8]
	ldr r5, [r1]
	str r5, [r3, #0xc]
	str r8, [r3, #8]
	str r3, [r1]
_020B642C:
	ldr r7, [r3]
	ldr r5, [r3, #4]
	ldr r6, [r2]
	add r5, r7, r5
	cmp r6, r5
	bne _020B6484
	str r7, [r2]
	ldr r6, [r3, #8]
	ldr r5, [r3, #0xc]
	cmp r6, #0
	strne r5, [r6, #0xc]
	streq r5, [r0]
	cmp r5, #0
	strne r6, [r5, #8]
	ldr r5, [r1]
	orr lr, lr, #1
	cmp r5, #0
	strne r3, [r5, #8]
	ldr r5, [r1]
	str r5, [r3, #0xc]
	str r4, [r3, #8]
	str r3, [r1]
_020B6484:
	mov r3, ip
	cmp ip, #0
	bne _020B63D0
_020B6490:
	mov r0, lr
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020B63B4

	arm_func_start sub_020B6498
sub_020B6498: ; 0x020B6498
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_020B6498

	arm_func_start sub_020B64A4
sub_020B64A4: ; 0x020B64A4
	stmdb sp!, {r4, lr}
	subs lr, r1, #1
	mov r2, #0
	beq _020B64DC
	mov r4, r0
_020B64B8:
	add r3, r2, #1
	add r2, r0, r2, lsl #4
	add ip, r0, r3, lsl #4
	str ip, [r2, #0xc]
	str r4, [r2, #0x18]
	mov r2, r3
	cmp r3, lr
	add r4, r4, #0x10
	blo _020B64B8
_020B64DC:
	mov r2, #0
	str r2, [r0, #8]
	add r1, r0, r1, lsl #4
	str r2, [r1, #-4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B64A4

	arm_func_start sub_020B64F0
sub_020B64F0: ; 0x020B64F0
	stmdb sp!, {r3, lr}
	ldr lr, [r1]
	cmp lr, #0
	ldrne ip, [lr, #0xc]
	strne ip, [r1]
	cmp lr, #0
	beq _020B6544
	stmia lr, {r2, r3}
	mov r1, #0
	str r1, [lr, #8]
	str r1, [lr, #0xc]
	ldr r1, [r0]
	cmp r1, #0
	strne lr, [r1, #8]
	ldr r2, [r0]
	mov r1, #0
	str r2, [lr, #0xc]
	str r1, [lr, #8]
	str lr, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020B6544:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B64F0

	arm_func_start sub_020B654C
sub_020B654C: ; 0x020B654C
	stmdb sp!, {r3, lr}
	mov ip, #0
	str ip, [sp]
	bl sub_020B6560
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B654C

	arm_func_start sub_020B6560
sub_020B6560: ; 0x020B6560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, [r0]
	ldr sb, [sp, #0x28]
	cmp r7, #0
	mov r6, #0
	beq _020B65C8
	sub ip, sb, #1
	mvn r8, ip
	mov fp, r6
_020B6584:
	cmp sb, #1
	ldrls lr, [r7]
	movls r5, fp
	movls r4, r3
	bls _020B65AC
	ldr r5, [r7]
	add r4, r5, ip
	and lr, r8, r4
	sub r5, lr, r5
	add r4, r3, r5
_020B65AC:
	ldr sl, [r7, #4]
	cmp sl, r4
	movhs r6, r7
	bhs _020B65C8
	ldr r7, [r7, #0xc]
	cmp r7, #0
	bne _020B6584
_020B65C8:
	cmp r6, #0
	beq _020B6694
	cmp r5, #0
	beq _020B6628
	ldr r8, [r1]
	cmp r8, #0
	ldrne r3, [r8, #0xc]
	strne r3, [r1]
	cmp r8, #0
	beq _020B6694
	ldr r7, [r6]
	mov r3, #0
	str r7, [r8]
	str r5, [r8, #4]
	str r3, [r8, #8]
	str r3, [r8, #0xc]
	ldr r3, [r0]
	cmp r3, #0
	strne r8, [r3, #8]
	ldr r5, [r0]
	mov r3, #0
	str r5, [r8, #0xc]
	str r3, [r8, #8]
	str r8, [r0]
_020B6628:
	ldr r3, [r6, #4]
	sub r3, r3, r4
	str r3, [r6, #4]
	ldr r3, [r6]
	add r3, r3, r4
	str r3, [r6]
	ldr r3, [r6, #4]
	cmp r3, #0
	bne _020B6688
	ldr r4, [r6, #8]
	ldr r3, [r6, #0xc]
	cmp r4, #0
	strne r3, [r4, #0xc]
	streq r3, [r0]
	cmp r3, #0
	strne r4, [r3, #8]
	ldr r0, [r1]
	cmp r0, #0
	strne r6, [r0, #8]
	ldr r3, [r1]
	mov r0, #0
	str r3, [r6, #0xc]
	str r0, [r6, #8]
	str r6, [r1]
_020B6688:
	str lr, [r2]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B6694:
	mov r0, #0
	str r0, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020B6560

	arm_func_start sub_020B66A0
sub_020B66A0: ; 0x020B66A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r5, [r7]
	mov r6, r1
	cmp r5, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r4, sp, #0
_020B66C4:
	ldr r1, [r5]
	mov r0, r7
	str r1, [sp]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	mov r1, r6
	add r3, r3, r2
	mov r2, r4
	str r3, [sp, #4]
	bl sub_020B63B4
	cmp r0, #0
	ldreq r5, [r5, #0xc]
	beq _020B6714
	ldr r0, [sp]
	str r0, [r5]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	sub r0, r1, r0
	str r0, [r5, #4]
	ldr r5, [r7]
_020B6714:
	cmp r5, #0
	bne _020B66C4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020B66A0

	arm_func_start sub_020B6724
sub_020B6724: ; 0x020B6724
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	add r3, r2, r3
	str r2, [sp]
	add r2, sp, #0
	mov r5, r1
	str r3, [sp, #4]
	mov r4, r0
	bl sub_020B63B4
	ldr r3, [r5]
	cmp r3, #0
	ldrne r0, [r3, #0xc]
	strne r0, [r5]
	cmp r3, #0
	addeq sp, sp, #8
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [sp]
	str r1, [r3]
	ldr r2, [sp, #4]
	ldr r1, [sp]
	sub r1, r2, r1
	str r1, [r3, #4]
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	ldr r0, [r4]
	cmp r0, #0
	strne r3, [r0, #8]
	ldr r1, [r4]
	mov r0, #0
	str r1, [r3, #0xc]
	str r0, [r3, #8]
	str r3, [r4]
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B6724

	arm_func_start sub_020B67B4
sub_020B67B4: ; 0x020B67B4
	mov r0, r0, lsl #4
	bx lr
	arm_func_end sub_020B67B4

	arm_func_start sub_020B67BC
sub_020B67BC: ; 0x020B67BC
	stmdb sp!, {r3, lr}
	ldr ip, _020B6800 ; =0x021D84E4
	str r0, [ip, #0xc]
	str r1, [ip, #0x10]
	str r2, [ip, #0x14]
	str r3, [ip, #0x18]
	bl sub_020B6918
	ldr r0, [sp, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _020B6804 ; =sub_020B6814
	ldr r1, _020B6808 ; =_02110924
	ldr r2, _020B680C ; =sub_020B68A4
	ldr r0, _020B6810 ; =_02110928
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6800: .word 0x021D84E4
_020B6804: .word sub_020B6814
_020B6808: .word _02110924
_020B680C: .word sub_020B68A4
_020B6810: .word _02110928
	arm_func_end sub_020B67BC

	arm_func_start sub_020B6814
sub_020B6814: ; 0x020B6814
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	moveq r5, #0x10
	addne r0, r0, #0xf
	bicne r5, r0, #0xf
	ldr r0, _020B6894 ; =0x0007FFF0
	mov r4, r1
	cmp r5, r0
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	add r2, sp, #0
	beq _020B685C
	ldr r0, _020B6898 ; =0x021D84E8
	ldr r1, _020B689C ; =0x021D84EC
	mov r3, r5
	bl sub_020B654C
	b _020B686C
_020B685C:
	ldr r0, _020B68A0 ; =0x021D84E4
	ldr r1, _020B689C ; =0x021D84EC
	mov r3, r5
	bl sub_020B654C
_020B686C:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [sp]
	mov r1, r5, lsr #4
	mov r0, r0, lsl #0xd
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	orr r0, r0, r4, lsl #31
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6894: .word 0x0007FFF0
_020B6898: .word 0x021D84E8
_020B689C: .word 0x021D84EC
_020B68A0: .word 0x021D84E4
	arm_func_end sub_020B6814

	arm_func_start sub_020B68A4
sub_020B68A4: ; 0x020B68A4
	stmdb sp!, {r3, lr}
	ldr r1, _020B6908 ; =0x7FFF0000
	mov r2, r0, lsl #0x10
	and r1, r0, r1
	mov r1, r1, lsr #0x10
	and r0, r0, #0x80000000
	mov r2, r2, lsr #0xd
	movs r3, r1, lsl #4
	mov r0, r0, lsr #0x1f
	beq _020B6900
	cmp r0, #0
	beq _020B68E4
	ldr r0, _020B690C ; =0x021D84E8
	ldr r1, _020B6910 ; =0x021D84EC
	bl sub_020B6724
	b _020B68F0
_020B68E4:
	ldr r0, _020B6914 ; =0x021D84E4
	ldr r1, _020B6910 ; =0x021D84EC
	bl sub_020B6724
_020B68F0:
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
_020B6900:
	mov r0, #2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6908: .word 0x7FFF0000
_020B690C: .word 0x021D84E8
_020B6910: .word 0x021D84EC
_020B6914: .word 0x021D84E4
	arm_func_end sub_020B68A4

	arm_func_start sub_020B6918
sub_020B6918: ; 0x020B6918
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	ldr lr, _020B6B00 ; =0x021092A0
	add r4, sp, #0
	ldmia lr!, {r0, r1, r2, r3}
	mov ip, r4
	stmia r4!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, _020B6B04 ; =0x021D84E4
	mov r3, #0
	ldr r2, [r0, #0x10]
	ldr r1, [r0, #0xc]
	add r0, r2, r2, lsr #1
	mov r4, r2, lsr #1
	sub r1, r1, r0
_020B6960:
	cmp r3, #0
	cmpne r3, #2
	bne _020B69A0
	ldr lr, [ip]
	cmp lr, #0
	cmpne r2, #0
	beq _020B69A0
	ldr r0, [ip, #8]
	cmp lr, r2
	movhi lr, r2
	add r0, r0, lr
	str r0, [ip, #8]
	ldr r0, [ip]
	sub r2, r2, lr
	sub r0, r0, lr
	str r0, [ip]
_020B69A0:
	add r3, r3, #1
	cmp r3, #4
	add ip, ip, #0xc
	blo _020B6960
	ldr r0, [sp, #0xc]
	add r2, sp, #0
	sub r0, r0, r4
	str r0, [sp, #0xc]
	mov r3, #0
_020B69C4:
	ldr ip, [r2]
	cmp ip, #0
	cmpne r1, #0
	beq _020B69F8
	ldr r0, [r2, #4]
	cmp ip, r1
	movhi ip, r1
	add r0, r0, ip
	str r0, [r2, #4]
	ldr r0, [r2]
	sub r1, r1, ip
	sub r0, r0, ip
	str r0, [r2]
_020B69F8:
	add r3, r3, #1
	cmp r3, #4
	add r2, r2, #0xc
	blo _020B69C4
	ldr r0, _020B6B08 ; =0x021D84E4
	bl sub_020B6498
	ldr r0, _020B6B0C ; =0x021D84E8
	bl sub_020B6498
	ldr r0, _020B6B04 ; =0x021D84E4
	ldr r1, [r0, #0x18]
	ldr r0, [r0, #0x14]
	mov r1, r1, lsr #4
	bl sub_020B64A4
	ldr r3, [sp, #8]
	ldr r1, _020B6B04 ; =0x021D84E4
	cmp r3, #0
	str r0, [r1, #8]
	beq _020B6A50
	ldr r0, _020B6B0C ; =0x021D84E8
	ldr r1, _020B6B10 ; =0x021D84EC
	mov r2, #0
	bl sub_020B64F0
_020B6A50:
	ldr r3, [sp, #4]
	ldr r2, [sp, #8]
	cmp r3, #0
	beq _020B6A6C
	ldr r0, _020B6B08 ; =0x021D84E4
	ldr r1, _020B6B10 ; =0x021D84EC
	bl sub_020B64F0
_020B6A6C:
	ldr r3, [sp, #0x20]
	cmp r3, #0
	beq _020B6A88
	ldr r0, _020B6B0C ; =0x021D84E8
	ldr r1, _020B6B10 ; =0x021D84EC
	mov r2, #0x40000
	bl sub_020B64F0
_020B6A88:
	ldr r3, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	cmp r3, #0
	beq _020B6AA8
	ldr r0, _020B6B08 ; =0x021D84E4
	ldr r1, _020B6B10 ; =0x021D84EC
	add r2, r2, #0x40000
	bl sub_020B64F0
_020B6AA8:
	ldr r3, [sp, #0x28]
	cmp r3, #0
	beq _020B6AC4
	ldr r0, _020B6B08 ; =0x021D84E4
	ldr r1, _020B6B10 ; =0x021D84EC
	mov r2, #0x60000
	bl sub_020B64F0
_020B6AC4:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _020B6AE0
	ldr r0, _020B6B08 ; =0x021D84E4
	ldr r1, _020B6B10 ; =0x021D84EC
	add r2, r4, #0x20000
	bl sub_020B64F0
_020B6AE0:
	ldr r0, _020B6B08 ; =0x021D84E4
	ldr r1, _020B6B10 ; =0x021D84EC
	bl sub_020B66A0
	ldr r0, _020B6B0C ; =0x021D84E8
	ldr r1, _020B6B10 ; =0x021D84EC
	bl sub_020B66A0
	add sp, sp, #0x30
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B6B00: .word 0x021092A0
_020B6B04: .word 0x021D84E4
_020B6B08: .word 0x021D84E4
_020B6B0C: .word 0x021D84E8
_020B6B10: .word 0x021D84EC
	arm_func_end sub_020B6918

	arm_func_start sub_020B6B14
sub_020B6B14: ; 0x020B6B14
	mov r0, r0, lsl #4
	bx lr
	arm_func_end sub_020B6B14

	arm_func_start sub_020B6B1C
sub_020B6B1C: ; 0x020B6B1C
	stmdb sp!, {r4, lr}
	ldr ip, _020B6B5C ; =0x021D8500
	mov r4, r3
	str r0, [ip, #8]
	str r1, [ip, #0xc]
	str r2, [ip, #0x10]
	bl sub_020B6C80
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _020B6B60 ; =sub_020B6B70
	ldr r1, _020B6B64 ; =_0211092C
	ldr r2, _020B6B68 ; =sub_020B6C3C
	ldr r0, _020B6B6C ; =_02110930
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B6B5C: .word 0x021D8500
_020B6B60: .word sub_020B6B70
_020B6B64: .word _0211092C
_020B6B68: .word sub_020B6C3C
_020B6B6C: .word _02110930
	arm_func_end sub_020B6B1C

	arm_func_start sub_020B6B70
sub_020B6B70: ; 0x020B6B70
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r0, #0
	moveq r4, #8
	addne r0, r0, #7
	bicne r4, r0, #7
	ldr r0, _020B6C30 ; =0x0007FFF8
	cmp r4, r0
	addhs sp, sp, #8
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	cmp r1, #0
	add r2, sp, #4
	beq _020B6BEC
	mov ip, #8
	ldr r0, _020B6C34 ; =0x021D8500
	ldr r1, _020B6C38 ; =0x021D8504
	mov r3, r4
	str ip, [sp]
	bl sub_020B6560
	ldr r2, [sp, #4]
	add r1, r2, r4
	cmp r1, #0x10000
	bls _020B6C04
	ldr r0, _020B6C34 ; =0x021D8500
	ldr r1, _020B6C38 ; =0x021D8504
	mov r3, r4
	bl sub_020B6724
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B6BEC:
	ldr r0, _020B6C34 ; =0x021D8500
	mov ip, #0x10
	ldr r1, _020B6C38 ; =0x021D8504
	mov r3, r4
	str ip, [sp]
	bl sub_020B6560
_020B6C04:
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [sp, #4]
	mov r1, r4, lsr #3
	mov r0, r0, lsl #0xd
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B6C30: .word 0x0007FFF8
_020B6C34: .word 0x021D8500
_020B6C38: .word 0x021D8504
	arm_func_end sub_020B6B70

	arm_func_start sub_020B6C3C
sub_020B6C3C: ; 0x020B6C3C
	stmdb sp!, {r3, lr}
	mov r1, #0x10000
	rsb r1, r1, #0
	and r1, r0, r1
	mov r2, r0, lsl #0x10
	mov r3, r1, lsr #0x10
	ldr r0, _020B6C78 ; =0x021D8500
	ldr r1, _020B6C7C ; =0x021D8504
	mov r2, r2, lsr #0xd
	mov r3, r3, lsl #3
	bl sub_020B6724
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6C78: .word 0x021D8500
_020B6C7C: .word 0x021D8504
	arm_func_end sub_020B6C3C

	arm_func_start sub_020B6C80
sub_020B6C80: ; 0x020B6C80
	stmdb sp!, {r3, lr}
	ldr r0, _020B6CD0 ; =0x021D8500
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0xc]
	mov r1, r1, lsr #4
	bl sub_020B64A4
	ldr r1, _020B6CD0 ; =0x021D8500
	str r0, [r1, #4]
	ldr r0, _020B6CD4 ; =0x021D8500
	bl sub_020B6498
	ldr r1, _020B6CD0 ; =0x021D8500
	ldr r0, _020B6CD4 ; =0x021D8500
	ldr r3, [r1, #8]
	ldr r1, _020B6CD8 ; =0x021D8504
	mov r2, #0
	bl sub_020B64F0
	ldr r0, _020B6CD4 ; =0x021D8500
	ldr r1, _020B6CD8 ; =0x021D8504
	bl sub_020B66A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6CD0: .word 0x021D8500
_020B6CD4: .word 0x021D8500
_020B6CD8: .word 0x021D8504
	arm_func_end sub_020B6C80

	arm_func_start sub_020B6CDC
sub_020B6CDC: ; 0x020B6CDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B6D14 ; =0x41424E4B
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B6D30
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6D14: .word 0x41424E4B
	arm_func_end sub_020B6CDC

	arm_func_start sub_020B6D18
sub_020B6D18: ; 0x020B6D18
	ldr ip, _020B6D20 ; =sub_020B6CDC
	bx ip
	.align 2, 0
_020B6D20: .word sub_020B6CDC
	arm_func_end sub_020B6D18

	arm_func_start sub_020B6D24
sub_020B6D24: ; 0x020B6D24
	ldr ip, _020B6D2C ; =sub_020B6CDC
	bx ip
	.align 2, 0
_020B6D2C: .word sub_020B6CDC
	arm_func_end sub_020B6D24

	arm_func_start sub_020B6D30
sub_020B6D30: ; 0x020B6D30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, [r0, #4]
	mov ip, #0
	add r1, r1, r0
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, r0
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r6, r1, r0
	str r6, [r0, #0xc]
	ldrh r1, [r0]
	ldmib r0, {r4, r5}
	cmp r1, #0
	bls _020B6DD4
	mov r1, ip
_020B6D70:
	add r2, r4, ip, lsl #4
	ldr r7, [r2, #0xc]
	mov r3, ip, lsl #4
	add r7, r5, r7
	str r7, [r2, #0xc]
	ldrh r7, [r4, r3]
	mov lr, r1
	cmp r7, #0
	bls _020B6DBC
_020B6D94:
	ldr sb, [r2, #0xc]
	add r7, lr, #1
	ldr r8, [sb, lr, lsl #3]
	mov r7, r7, lsl #0x10
	add r8, r6, r8
	str r8, [sb, lr, lsl #3]
	ldrh r8, [r4, r3]
	mov lr, r7, lsr #0x10
	cmp r8, r7, lsr #16
	bhi _020B6D94
_020B6DBC:
	ldrh r3, [r0]
	add r2, ip, #1
	mov r2, r2, lsl #0x10
	cmp r3, r2, lsr #16
	mov ip, r2, lsr #0x10
	bhi _020B6D70
_020B6DD4:
	ldr r1, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r2, r1, r0
	str r2, [r0, #0x14]
	add r4, r2, #8
	ldr r1, [r4, #4]
	mov r0, #0
	add r1, r1, r4
	str r1, [r4, #4]
	ldrh r1, [r2, #8]
	cmp r1, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r3, r0
	mov r7, r0
_020B6E10:
	ldr r6, [r4, #4]
	mov r1, r7
	add r2, r6, r3
	ldr r5, [r2, #4]
	add r5, r5, r4
	str r5, [r2, #4]
	ldr r5, [r2, #8]
	add r5, r5, r4
	str r5, [r2, #8]
	ldrh r5, [r6, r3]
	cmp r5, #0
	bls _020B6E68
	mov r8, r7
_020B6E44:
	ldr r6, [r2, #8]
	add r1, r1, #1
	ldr r5, [r6, r8]
	add r5, r5, r4
	str r5, [r6, r8]
	ldrh r5, [r2]
	add r8, r8, #4
	cmp r1, r5
	blo _020B6E44
_020B6E68:
	ldrh r1, [r4]
	add r0, r0, #1
	add r3, r3, #0xc
	cmp r0, r1
	blo _020B6E10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020B6D30

	arm_func_start sub_020B6E80
sub_020B6E80: ; 0x020B6E80
	ldrh r2, [r0]
	cmp r2, r1
	ldrhi r0, [r0, #4]
	addhi r0, r0, r1, lsl #4
	movls r0, #0
	bx lr
	arm_func_end sub_020B6E80

	arm_func_start sub_020B6E98
sub_020B6E98: ; 0x020B6E98
	ldrh r1, [r0, #2]
	tst r1, #1
	ldrh r1, [r0]
	ldrne r0, [r0, #4]
	addne r0, r0, r1, lsl #4
	ldreq r0, [r0, #4]
	addeq r0, r0, r1, lsl #3
	bx lr
	arm_func_end sub_020B6E98

	arm_func_start sub_020B6EB8
sub_020B6EB8: ; 0x020B6EB8
	ldr ip, _020B6EC4 ; =sub_020B7254
	add r0, r0, #8
	bx ip
	.align 2, 0
_020B6EC4: .word sub_020B7254
	arm_func_end sub_020B6EB8

	arm_func_start sub_020B6EC8
sub_020B6EC8: ; 0x020B6EC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B6F00 ; =0x4345424B
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B6F2C
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6F00: .word 0x4345424B
	arm_func_end sub_020B6EC8

	arm_func_start sub_020B6F04
sub_020B6F04: ; 0x020B6F04
	ldrh r2, [r0]
	cmp r1, r2
	movhs r0, #0
	bxhs lr
	ldrh r2, [r0, #2]
	ldr r0, [r0, #4]
	tst r2, #1
	addne r0, r0, r1, lsl #4
	addeq r0, r0, r1, lsl #3
	bx lr
	arm_func_end sub_020B6F04

	arm_func_start sub_020B6F2C
sub_020B6F2C: ; 0x020B6F2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r1, [r5, #4]
	add r1, r1, r5
	str r1, [r5, #4]
	bl sub_020B6E98
	ldrh r1, [r5]
	mov r4, r0
	mov r6, #0
	cmp r1, #0
	bls _020B6F88
_020B6F58:
	mov r0, r5
	mov r1, r6
	bl sub_020B6F04
	ldr r2, [r0, #4]
	add r1, r6, #1
	add r2, r2, r4
	str r2, [r0, #4]
	mov r0, r1, lsl #0x10
	ldrh r1, [r5]
	mov r6, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B6F58
_020B6F88:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _020B6FAC
	add r1, r0, r5
	str r1, [r5, #0xc]
	ldr r0, [r1, #4]
	add r0, r0, r1
	str r0, [r1, #4]
	str r1, [r5, #0xc]
_020B6FAC:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r0, r5
	str r0, [r5, #0x14]
	bl sub_020B6EB8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B6F2C

	arm_func_start sub_020B6FC8
sub_020B6FC8: ; 0x020B6FC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B7000 ; =0x4D43424B
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B7014
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B7000: .word 0x4D43424B
	arm_func_end sub_020B6FC8

	arm_func_start sub_020B7004
sub_020B7004: ; 0x020B7004
	ldr ip, _020B7010 ; =sub_020B7254
	add r0, r0, #8
	bx ip
	.align 2, 0
_020B7010: .word sub_020B7254
	arm_func_end sub_020B7004

	arm_func_start sub_020B7014
sub_020B7014: ; 0x020B7014
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #4]
	mov lr, #0
	add r1, r1, r0
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, r0
	str r1, [r0, #8]
	ldrh r1, [r0]
	ldr r4, [r0, #4]
	cmp r1, #0
	bls _020B7070
_020B7044:
	add r3, r4, lr, lsl #3
	ldr ip, [r0, #8]
	ldr r2, [r3, #4]
	add r1, lr, #1
	add r2, ip, r2
	str r2, [r3, #4]
	ldrh r2, [r0]
	mov r1, r1, lsl #0x10
	mov lr, r1, lsr #0x10
	cmp r2, r1, lsr #16
	bhi _020B7044
_020B7070:
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	add r1, r1, r0
	str r1, [r0, #0x10]
	mov r0, r1
	bl sub_020B7004
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B7014

	arm_func_start sub_020B7090
sub_020B7090: ; 0x020B7090
	ldrh r2, [r0]
	cmp r1, r2
	ldrlo r0, [r0, #4]
	addlo r0, r0, r1, lsl #3
	movhs r0, #0
	bx lr
	arm_func_end sub_020B7090

	arm_func_start sub_020B70A8
sub_020B70A8: ; 0x020B70A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B70E0 ; =0x43484152
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B70E4
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B70E0: .word 0x43484152
	arm_func_end sub_020B70A8

	arm_func_start sub_020B70E4
sub_020B70E4: ; 0x020B70E4
	ldr r1, [r0, #0x14]
	add r1, r1, r0
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020B70E4

	arm_func_start sub_020B70F4
sub_020B70F4: ; 0x020B70F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B712C ; =0x43484152
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B7130
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B712C: .word 0x43484152
	arm_func_end sub_020B70F4

	arm_func_start sub_020B7130
sub_020B7130: ; 0x020B7130
	ldr r1, [r0, #0x14]
	add r1, r1, r0
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020B7130

	arm_func_start sub_020B7140
sub_020B7140: ; 0x020B7140
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B7178 ; =0x504C5454
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B71C8
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B7178: .word 0x504C5454
	arm_func_end sub_020B7140

	arm_func_start sub_020B717C
sub_020B717C: ; 0x020B717C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B71B4 ; =0x50434D50
	bl sub_020B720C
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl sub_020B71B8
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B71B4: .word 0x50434D50
	arm_func_end sub_020B717C

	arm_func_start sub_020B71B8
sub_020B71B8: ; 0x020B71B8
	ldr r1, [r0, #4]
	add r1, r1, r0
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_020B71B8

	arm_func_start sub_020B71C8
sub_020B71C8: ; 0x020B71C8
	ldr r1, [r0, #0xc]
	add r1, r1, r0
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_020B71C8

	arm_func_start sub_020B71D8
sub_020B71D8: ; 0x020B71D8
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, _020B7208 ; =0x5343524E
	bl sub_020B720C
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4]
	ldmeqia sp!, {r4, pc}
	add r0, r0, #8
	str r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B7208: .word 0x5343524E
	arm_func_end sub_020B71D8

	arm_func_start sub_020B720C
sub_020B720C: ; 0x020B720C
	ldrh r2, [r0, #0xc]
	ldrh ip, [r0, #0xe]
	mov r3, #0
	add r0, r0, r2
	cmp ip, #0
	bls _020B724C
_020B7224:
	ldr r2, [r0]
	cmp r2, r1
	bxeq lr
	add r2, r3, #1
	mov r2, r2, lsl #0x10
	ldr r3, [r0, #4]
	cmp ip, r2, lsr #16
	add r0, r0, r3
	mov r3, r2, lsr #0x10
	bhi _020B7224
_020B724C:
	mov r0, #0
	bx lr
	arm_func_end sub_020B720C

	arm_func_start sub_020B7254
sub_020B7254: ; 0x020B7254
	ldr r1, [r0, #4]
	mov ip, #0
	add r1, r1, r0
	str r1, [r0, #4]
	ldrh r1, [r0]
	cmp r1, #0
	bxls lr
_020B7270:
	ldr r3, [r0, #4]
	add r1, ip, #1
	ldr r2, [r3, ip, lsl #2]
	mov r1, r1, lsl #0x10
	add r2, r0, r2
	str r2, [r3, ip, lsl #2]
	ldrh r2, [r0]
	mov ip, r1, lsr #0x10
	cmp r2, r1, lsr #16
	bhi _020B7270
	bx lr
	arm_func_end sub_020B7254

	arm_func_start sub_020B729C
sub_020B729C: ; 0x020B729C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, r3, lsl #8
	mov r0, r0, lsl #8
	ldr r3, _020B734C ; =0x04000500
	mov r4, ip, asr #0x10
	mov r0, r0, asr #0x10
	mov lr, r4, lsl #0x10
	mov r4, r0, lsl #0x10
	mov r0, r1, lsl #8
	mov ip, #1
	mov r0, r0, asr #0x10
	mov r5, r0, lsl #0x10
	mov r0, #0x10000000
	mov r1, r2, lsl #8
	mov r1, r1, asr #0x10
	mov r2, r1, lsl #0x10
	mov r7, lr, lsr #0x10
	mov r1, r4, lsr #0x10
	mov r5, r5, lsr #0x10
	mov r2, r2, lsr #0x10
	str ip, [r3]
	orr r4, r1, r7, lsl #16
	sub r6, r3, #0x78
	str r4, [r6]
	sub lr, r3, #0x74
	str r0, [lr]
	mov ip, #0
	str ip, [lr]
	orr r4, r5, r7, lsl #16
	str r4, [r6]
	add r0, r0, #0x1000
	str r0, [lr]
	str ip, [lr]
	orr r0, r5, r2, lsl #16
	str r0, [r6]
	mov r0, #0x1000
	str r0, [lr]
	str ip, [lr]
	orr r0, r1, r2, lsl #16
	str r0, [r6]
	str ip, [lr]
	str ip, [lr]
	str ip, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B734C: .word 0x04000500
	arm_func_end sub_020B729C

	arm_func_start sub_020B7350
sub_020B7350: ; 0x020B7350
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	ldr r2, _020B7400 ; =0xBFFF0000
	ldr r1, _020B7404 ; =0x04000580
	mov r0, r2, lsl #6
	str r2, [r1]
	str r0, [sp]
	mov r1, #0x400000
	str r1, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r2, r0
	mov r1, #0xc0000
	mov r3, #0x100000
	str r0, [sp, #0x10]
	bl sub_020CFB08
	ldr r1, _020B7408 ; =0x0400044C
	mov r5, #0
	ldr r0, _020B740C ; =0x021092E0
	str r5, [r1]
	add r4, sp, #0x2c
	ldr ip, _020B7410 ; =0x021092EC
	add lr, sp, #0x20
	ldmia r0, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	add r3, sp, #0x14
	ldmia ip, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r2, r3
	str r5, [r4]
	str r5, [r4, #4]
	str r5, [r4, #8]
	mov r0, r4
	mov r1, lr
	mov r3, #1
	str r5, [sp]
	bl sub_020CFB6C
	ldr r0, _020B7414 ; =0x04000440
	mov r1, #1
	str r1, [r0]
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B7400: .word 0xBFFF0000
_020B7404: .word 0x04000580
_020B7408: .word 0x0400044C
_020B740C: .word 0x021092E0
_020B7410: .word 0x021092EC
_020B7414: .word 0x04000440
	arm_func_end sub_020B7350

	arm_func_start sub_020B7418
sub_020B7418: ; 0x020B7418
	stmdb sp!, {r4, lr}
	ldr lr, _020B747C ; =0x04000470
	mov r0, r0, lsl #0xc
	str r0, [lr]
	mov r4, r1, lsl #0xc
	ldr ip, [sp, #8]
	str r4, [lr]
	mov r4, r2, lsl #0xc
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r4, [lr]
	mov r4, r3, lsl #0xc
	ldr r3, [sp, #0x18]
	mov ip, ip, lsl #0xc
	str r4, [lr, #-4]!
	str ip, [lr]
	mov ip, #0x1000
	mov r0, r0, lsl #0xc
	mov r1, r1, lsl #0xc
	mov r2, r2, lsl #0xc
	mov r3, r3, lsl #0xc
	str ip, [lr]
	bl sub_020B729C
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B747C: .word 0x04000470
	arm_func_end sub_020B7418

	arm_func_start sub_020B7480
sub_020B7480: ; 0x020B7480
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldreq r0, [r4, #0x1c]
	ldreq r0, [r0, #8]
	cmp r0, #3
	cmpne r0, #4
	bne _020B751C
	ldr r0, [r4, #8]
	eor r0, r0, #1
	str r0, [r4, #8]
	ldr r1, [r4, #0x1c]
	ldr r2, [r4]
	ldrh r0, [r1, #2]
	ldr r1, [r1, #0xc]
	add r0, r1, r0, lsl #3
	sub r0, r0, #8
	cmp r2, r0
	bhi _020B7564
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _020B74EC
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x28]
	blx r2
_020B74EC:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldreq r0, [r4, #0x1c]
	ldreq r0, [r0, #8]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #0
	strne r0, [r4, #0xc]
	bne _020B7564
	mov r0, r4
	bl sub_020B781C
	b _020B7564
_020B751C:
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _020B7538
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x28]
	blx r2
_020B7538:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldreq r0, [r4, #0x1c]
	ldreq r0, [r0, #8]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #0
	strne r0, [r4, #0xc]
	bne _020B7564
	mov r0, r4
	bl sub_020B781C
_020B7564:
	ldr r1, [r4, #0x1c]
	ldr r2, [r4]
	ldrh r0, [r1]
	ldr r1, [r1, #0xc]
	add r0, r1, r0, lsl #3
	sub r0, r0, #8
	cmp r2, r0
	strhi r0, [r4]
	ldmhiia sp!, {r4, pc}
	cmp r2, r1
	strlo r1, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B7480

	arm_func_start sub_020B7594
sub_020B7594: ; 0x020B7594
	ldr r3, [r0, #0x1c]
	ldrh r2, [r3]
	cmp r1, r2
	bhs _020B75C4
	ldr r2, [r3, #0xc]
	add r2, r2, r1, lsl #3
	str r2, [r0]
	ldrh r1, [r2, #4]
	cmp r1, #0
	strne r2, [r0, #4]
	mov r0, #1
	bx lr
_020B75C4:
	mov r0, #0
	bx lr
	arm_func_end sub_020B7594

	arm_func_start sub_020B75CC
sub_020B75CC: ; 0x020B75CC
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bx lr
	arm_func_end sub_020B75CC

	arm_func_start sub_020B75D8
sub_020B75D8: ; 0x020B75D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #0xc]
	mov sb, #0
	cmp r0, #1
	movne r0, sb
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x14]
	smull r2, r1, r0, r1
	adds r0, r2, #0x800
	adc r1, r1, sb
	mov r0, r0, lsr #0xc
	orr r0, r0, r1, lsl #20
	bl abs
	mov r4, #1
	ldr r1, [sl, #0x10]
	mov fp, sb
	add r0, r1, r0
	str r0, [sl, #0x10]
	mov r8, r4
	mov r7, sb
	mov r5, sb
	mov r6, r4
	b _020B7754
_020B7638:
	ldr r0, [sl]
	ldr r1, [sl, #0x10]
	ldrh r0, [r0, #4]
	mov sb, r8
	sub r0, r1, r0, lsl #12
	str r0, [sl, #0x10]
	ldr r0, [sl, #0x14]
	cmp r0, #0
	movgt r1, r8
	ldr r0, [sl, #8]
	movle r1, r7
	teq r1, r0
	ldr r0, [sl]
	addne r0, r0, #8
	subeq r0, r0, #8
	str r0, [sl]
	ldr r1, [sl, #0x14]
	ldr r0, [sl]
	cmp r1, #0
	movgt r2, r6
	ldr r1, [sl, #8]
	movle r2, r5
	teq r2, r1
	ldr r1, [sl, #0x1c]
	ldr r2, [r1, #0xc]
	beq _020B76B8
	ldrh r1, [r1]
	add r1, r2, r1, lsl #3
	cmp r0, r1
	movhs r0, r4
	movlo r0, fp
	b _020B76D0
_020B76B8:
	ldrh r1, [r1, #2]
	add r1, r2, r1, lsl #3
	sub r1, r1, #8
	cmp r0, r1
	movls r0, #1
	movhi r0, #0
_020B76D0:
	cmp r0, #0
	beq _020B76E0
	mov r0, sl
	bl sub_020B7480
_020B76E0:
	ldr r1, [sl]
	ldrh r0, [r1, #4]
	cmp r0, #0
	strne r1, [sl, #4]
	ldr r0, [sl, #0x20]
	cmp r0, #0
	beq _020B7754
	ldr r0, [sl, #0x1c]
	ldr r2, [sl, #0x20]
	ldr r0, [r0, #0xc]
	cmp r2, #2
	ldr r1, [sl]
	sub r0, r1, r0
	mov r0, r0, lsl #0xd
	mov r1, r0, lsr #0x10
	beq _020B772C
	cmp r2, #3
	beq _020B7748
	b _020B7754
_020B772C:
	ldrh r0, [sl, #0x2c]
	cmp r1, r0
	bne _020B7754
	ldr r0, [sl, #0x24]
	ldr r2, [sl, #0x28]
	blx r2
	b _020B7754
_020B7748:
	ldr r0, [sl, #0x24]
	ldr r2, [sl, #0x28]
	blx r2
_020B7754:
	ldr r0, [sl, #0xc]
	cmp r0, #0
	beq _020B7778
	ldr r0, [sl]
	ldr r1, [sl, #0x10]
	ldrh r0, [r0, #4]
	cmp r1, r0, lsl #12
	movge r0, #1
	bge _020B777C
_020B7778:
	mov r0, #0
_020B777C:
	cmp r0, #0
	bne _020B7638
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020B75D8

	arm_func_start sub_020B778C
sub_020B778C: ; 0x020B778C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B7594
	cmp r0, #0
	movne r1, #0
	strne r1, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B778C

	arm_func_start sub_020B77A8
sub_020B77A8: ; 0x020B77A8
	ldr r1, [r0, #0x1c]
	ldr r2, [r0]
	ldr r0, [r1, #0xc]
	sub r0, r2, r0
	mov r0, r0, lsl #0xd
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end sub_020B77A8

	arm_func_start sub_020B77C4
sub_020B77C4: ; 0x020B77C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x20
	bl sub_020B7804
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #4]
	str r1, [r4, #8]
	mov r0, #1
	str r0, [r4, #0xc]
	str r1, [r4, #0x10]
	mov r0, #0x1000
	str r0, [r4, #0x14]
	str r1, [r4, #0x18]
	str r1, [r4, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B77C4

	arm_func_start sub_020B7804
sub_020B7804: ; 0x020B7804
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	strh r1, [r0, #0xc]
	bx lr
	arm_func_end sub_020B7804

	arm_func_start sub_020B781C
sub_020B781C: ; 0x020B781C
	ldr r1, [r0, #0x14]
	cmp r1, #0
	movgt r2, #1
	ldr r1, [r0, #8]
	movle r2, #0
	teq r2, r1
	ldr r2, [r0, #0x1c]
	beq _020B784C
	ldrh r1, [r2, #2]
	ldr r2, [r2, #0xc]
	add r1, r2, r1, lsl #3
	b _020B785C
_020B784C:
	ldrh r1, [r2]
	ldr r2, [r2, #0xc]
	add r1, r2, r1, lsl #3
	sub r1, r1, #8
_020B785C:
	str r1, [r0]
	ldr r2, [r0]
	ldr ip, _020B7878 ; =sub_020B75D8
	mov r1, #0
	str r2, [r0, #4]
	str r1, [r0, #0x10]
	bx ip
	.align 2, 0
_020B7878: .word sub_020B75D8
	arm_func_end sub_020B781C

	arm_func_start sub_020B787C
sub_020B787C: ; 0x020B787C
	ldr ip, _020B7888 ; =sub_020B781C
	str r1, [r0, #0x1c]
	bx ip
	.align 2, 0
_020B7888: .word sub_020B781C
	arm_func_end sub_020B787C

	arm_func_start sub_020B788C
sub_020B788C: ; 0x020B788C
	ldr r1, [r0, #0x18]
	cmp r1, #0
	ldreq r0, [r0, #0x1c]
	ldreq r1, [r0, #8]
	cmp r1, #2
	cmpne r1, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020B788C

	arm_func_start sub_020B78B0
sub_020B78B0: ; 0x020B78B0
	ldr ip, _020B78C0 ; =sub_020D47B8
	add r1, r1, #0x400
	add r1, r1, #0x7000000
	bx ip
	.align 2, 0
_020B78C0: .word sub_020D47B8
	arm_func_end sub_020B78B0

	arm_func_start sub_020B78C4
sub_020B78C4: ; 0x020B78C4
	ldr ip, _020B78D0 ; =sub_020D47B8
	add r1, r1, #0x7000000
	bx ip
	.align 2, 0
_020B78D0: .word sub_020D47B8
	arm_func_end sub_020B78C4

	arm_func_start sub_020B78D4
sub_020B78D4: ; 0x020B78D4
	stmdb sp!, {r3, lr}
	ldr r1, _020B796C ; =0x021D8618
	mov r0, #0xc0
	mov r2, #0x400
	bl sub_020D4790
	ldr r1, _020B7970 ; =0x021D8B58
	mov r0, #0xc0
	mov r2, #0x400
	bl sub_020D4790
	ldr r1, _020B7974 ; =0x021D9098
	mov r0, #0xc0
	mov r2, #0x400
	bl sub_020D4790
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B797C ; =0x021D8518
	mov r2, #0x100
	bl sub_020D4790
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7980 ; =0x021D8A58
	mov r2, #0x100
	bl sub_020D4790
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7984 ; =0x021D8F98
	mov r2, #0x100
	bl sub_020D4790
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7988 ; =0x021D8A18
	mov r2, #0x40
	bl sub_020D4790
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B798C ; =0x021D8F58
	mov r2, #0x40
	bl sub_020D4790
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7990 ; =0x021D9498
	mov r2, #0x40
	bl sub_020D4790
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B796C: .word 0x021D8618
_020B7970: .word 0x021D8B58
_020B7974: .word 0x021D9098
_020B7978: .word 0x0000FFFF
_020B797C: .word 0x021D8518
_020B7980: .word 0x021D8A58
_020B7984: .word 0x021D8F98
_020B7988: .word 0x021D8A18
_020B798C: .word 0x021D8F58
_020B7990: .word 0x021D9498
	arm_func_end sub_020B78D4

	arm_func_start sub_020B7994
sub_020B7994: ; 0x020B7994
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, [sp, #0x1c]
	ldr r6, _020B7B04 ; =0x021D8518
	mov r4, #0x540
	mla r4, r5, r4, r6
	mov ip, r1
	sub r1, r2, #1
	add r1, ip, r1
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	add lr, r4, ip, lsl #1
	add r7, r4, r2, lsl #1
	mov r6, r0
	mov r5, r3
	cmp lr, r7
	bhi _020B79F4
	ldr r0, _020B7B08 ; =0x0000FFFF
_020B79D8:
	ldrh r1, [lr]
	cmp r1, r0
	movne r0, #0
	bne _020B79F8
	add lr, lr, #2
	cmp lr, r7
	bls _020B79D8
_020B79F4:
	mov r0, #1
_020B79F8:
	cmp r0, #0
	beq _020B7A3C
	ldr r0, _020B7B0C ; =0x021D8514
	sub r1, r2, ip
	ldrh r7, [r0]
	add r3, r1, #1
	add r1, r4, ip, lsl #1
	add lr, r7, #1
	strh lr, [r0]
	strh r7, [r6, #0x10]
	strh ip, [r6, #4]
	strh r2, [r6, #6]
	strh ip, [r6, #8]
	ldrh r0, [r6, #0x10]
	mov r2, r3, lsl #1
	bl sub_020D4790
	b _020B7A44
_020B7A3C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B7A44:
	ldrh r0, [sp, #0x18]
	add r3, r4, #0x500
	cmp r0, #0
	bne _020B7A70
	mov r0, #0x20
	strh r0, [r6, #0xa]
	mov r0, #0
	strh r0, [r6, #0xc]
	ldrh r0, [r6, #0xa]
	strh r0, [r6, #0xe]
	b _020B7AEC
_020B7A70:
	sub r0, r0, #1
	add r0, r5, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	add r7, r3, r5, lsl #1
	add r4, r3, r2, lsl #1
	cmp r7, r4
	bhi _020B7AB0
	ldr r0, _020B7B08 ; =0x0000FFFF
_020B7A94:
	ldrh r1, [r7]
	cmp r1, r0
	movne r0, #0
	bne _020B7AB4
	add r7, r7, #2
	cmp r7, r4
	bls _020B7A94
_020B7AB0:
	mov r0, #1
_020B7AB4:
	cmp r0, #0
	beq _020B7AE4
	strh r5, [r6, #0xa]
	strh r2, [r6, #0xc]
	strh r5, [r6, #0xe]
	sub r0, r2, r5
	add r2, r0, #1
	ldrh r0, [r6, #0x10]
	add r1, r3, r5, lsl #1
	mov r2, r2, lsl #1
	bl sub_020D4790
	b _020B7AEC
_020B7AE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B7AEC:
	mov r1, #0
	ldr r0, [sp, #0x1c]
	str r1, [r6, #0x14]
	str r0, [r6]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B7B04: .word 0x021D8518
_020B7B08: .word 0x0000FFFF
_020B7B0C: .word 0x021D8514
	arm_func_end sub_020B7994

	arm_func_start sub_020B7B10
sub_020B7B10: ; 0x020B7B10
	stmdb sp!, {r4, lr}
	ldrh lr, [r0, #6]
	ldrh ip, [r0, #8]
	mov r4, #0
	add r3, lr, #1
	cmp ip, r3
	bgt _020B7B38
	ldrh r3, [r0, #4]
	cmp r3, lr
	movls r4, #1
_020B7B38:
	cmp r4, #0
	moveq r3, #0
	beq _020B7B54
	sub r3, lr, ip
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
_020B7B54:
	cmp r3, #1
	movhs r3, #1
	movlo r3, #0
	cmp r3, #0
	beq _020B7BE4
	ldr r4, [r0]
	ldr ip, _020B7BEC ; =0x021D8518
	mov r3, #0x540
	mla ip, r4, r3, ip
	ldrh r3, [r0, #8]
	add r4, ip, #0x100
	ldrh ip, [r1]
	mov lr, r3, lsl #3
	add r3, r4, r3, lsl #3
	strh ip, [r4, lr]
	ldrh lr, [r1, #2]
	ldr ip, _020B7BF0 ; =0x0000FFFE
	strh lr, [r3, #2]
	ldrh r1, [r1, #4]
	cmp r2, ip
	strh r1, [r3, #4]
	beq _020B7BD0
	ldr r1, [r3]
	mov ip, r1, lsl #0x16
	mov ip, ip, lsr #0x1e
	tst ip, #1
	beq _020B7BD0
	bic ip, r1, #0x3e000000
	mov r1, r2, lsl #0x1b
	orr r1, ip, r1, lsr #2
	str r1, [r3]
_020B7BD0:
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	mov r0, #1
	ldmia sp!, {r4, pc}
_020B7BE4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B7BEC: .word 0x021D8518
_020B7BF0: .word 0x0000FFFE
	arm_func_end sub_020B7B10

	arm_func_start sub_020B7BF4
sub_020B7BF4: ; 0x020B7BF4
	stmdb sp!, {r3, lr}
	ldrh lr, [r0, #0xc]
	ldrh ip, [r0, #0xe]
	mov r3, #0
	add r2, lr, #1
	cmp ip, r2
	bgt _020B7C1C
	ldrh r2, [r0, #0xa]
	cmp r2, lr
	movls r3, #1
_020B7C1C:
	cmp r3, #0
	moveq r2, #0
	beq _020B7C38
	sub r2, lr, ip
	add r2, r2, #1
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
_020B7C38:
	cmp r2, #1
	movhs r2, #1
	movlo r2, #0
	cmp r2, #0
	ldreq r0, _020B7CB0 ; =0x0000FFFE
	ldmeqia sp!, {r3, pc}
	ldr lr, [r0]
	ldr r3, _020B7CB4 ; =0x021D8518
	mov r2, #0x540
	mla ip, lr, r2, r3
	ldr r3, [r1]
	ldrh r2, [r0, #0xe]
	add ip, ip, #0x100
	mov r3, r3, asr #4
	add ip, ip, r2, lsl #5
	strh r3, [ip, #6]
	ldr r3, [r1, #4]
	mov r3, r3, asr #4
	strh r3, [ip, #0xe]
	ldr r3, [r1, #8]
	mov r3, r3, asr #4
	strh r3, [ip, #0x16]
	ldr r1, [r1, #0xc]
	mov r1, r1, asr #4
	strh r1, [ip, #0x1e]
	ldrh r1, [r0, #0xe]
	add r1, r1, #1
	strh r1, [r0, #0xe]
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B7CB0: .word 0x0000FFFE
_020B7CB4: .word 0x021D8518
	arm_func_end sub_020B7BF4

	arm_func_start sub_020B7CB8
sub_020B7CB8: ; 0x020B7CB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r0
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _020B7D4C
	ldr r6, [r7]
	ldr r1, _020B7EB4 ; =0x021D8518
	mov r0, #0x540
	mla r1, r6, r0, r1
	ldrh r3, [r7, #4]
	ldrh r0, [r7, #6]
	add r5, r1, #0x100
	mov r4, r3, lsl #3
	sub r0, r0, r3
	add r0, r0, #1
	mov r0, r0, lsl #0x13
	mov r8, r0, lsr #0x10
	mov r2, r4, lsl #0x10
	mov r1, r8
	add r0, r5, r3, lsl #3
	mov r7, r2, lsr #0x10
	bl DC_FlushRange
	cmp r6, #0
	beq _020B7D24
	cmp r6, #1
	beq _020B7D38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B7D24:
	mov r1, r7
	mov r2, r8
	add r0, r5, r4
	bl sub_020CFDC8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B7D38:
	mov r1, r7
	mov r2, r8
	add r0, r5, r4
	bl sub_020CFE1C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B7D4C:
	ldr r0, [r7]
	ldr r2, _020B7EB4 ; =0x021D8518
	mov r1, #0x540
	mla r2, r0, r1, r2
	ldrh r5, [r7, #4]
	ldrh r1, [r7, #6]
	ldr r3, _020B7EB8 ; =_021109C8
	add r4, r2, #0x100
	sub r1, r1, r5
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r2, r5, lsl #0x13
	add r6, r4, r5, lsl #3
	movs r5, r1, lsr #0x10
	mov r4, r2, lsr #0x10
	ldr sb, [r3, r0, lsl #2]
	mov sl, #0
	beq _020B7DCC
	mov r8, #6
_020B7D98:
	mov r0, r6
	mov r1, r4
	mov r2, r8
	blx sb
	add r2, r4, #8
	add r0, sl, #1
	mov r1, r0, lsl #0x10
	mov r0, r2, lsl #0x10
	cmp r5, r1, lsr #16
	mov r4, r0, lsr #0x10
	add r6, r6, #8
	mov sl, r1, lsr #0x10
	bhi _020B7D98
_020B7DCC:
	ldrh r2, [r7, #0xc]
	ldrh r1, [r7, #0xe]
	mov r3, #0
	add r0, r2, #1
	cmp r1, r0
	bgt _020B7DF0
	ldrh r0, [r7, #0xa]
	cmp r0, r2
	movls r3, #1
_020B7DF0:
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r7]
	ldr r2, _020B7EB4 ; =0x021D8518
	mov r1, #0x540
	mla r2, r0, r1, r2
	ldr r3, _020B7EB8 ; =_021109C8
	ldrh r5, [r7, #0xa]
	ldrh r1, [r7, #0xc]
	add r4, r2, #0x100
	mov r2, r5, lsl #0x15
	sub r1, r1, r5
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	ldr r6, [r3, r0, lsl #2]
	add sl, r4, r5, lsl #5
	movs sb, r1, lsr #0x10
	mov r8, r2, lsr #0x10
	mov r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r5, #2
	mov r4, r5
	mov fp, r5
_020B7E4C:
	mov r2, r5
	add r0, sl, #6
	add r1, r8, #6
	blx r6
	mov r2, r4
	add r0, sl, #0xe
	add r1, r8, #0xe
	blx r6
	add r0, sl, #0x16
	add r1, r8, #0x16
	mov r2, fp
	blx r6
	add r0, sl, #0x1e
	add r1, r8, #0x1e
	mov r2, #2
	blx r6
	add r0, r8, #0x20
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	add sl, sl, #0x20
	cmp sb, r0, lsr #16
	mov r7, r0, lsr #0x10
	bhi _020B7E4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B7EB4: .word 0x021D8518
_020B7EB8: .word _021109C8
	arm_func_end sub_020B7CB8

	arm_func_start sub_020B7EBC
sub_020B7EBC: ; 0x020B7EBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _020B7F74
	ldrh r3, [r5, #6]
	ldrh r1, [r5, #8]
	mov r2, #0
	add r0, r3, #1
	cmp r1, r0
	bgt _020B7EF4
	ldrh r0, [r5, #4]
	cmp r0, r3
	movls r2, #1
_020B7EF4:
	cmp r2, #0
	moveq r4, #0
	beq _020B7F14
	ldrh r0, [r5, #4]
	sub r0, r3, r0
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0xd
_020B7F14:
	ldr r2, [r5]
	ldr r1, _020B7FDC ; =0x021D8518
	mov r0, #0x540
	mla r1, r2, r0, r1
	add r2, r1, #0x100
	ldrh r0, [r5, #4]
	mov r1, r4
	add r6, r2, r0, lsl #3
	mov r0, r6
	bl sub_020D285C
	ldr r0, _020B7FE0 ; =_02110C80
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	mov r1, r6
	beq _020B7F64
	mov r3, r4
	mov r2, #0xc0
	bl sub_020D3F74
	b _020B7FC8
_020B7F64:
	mov r2, r4
	mov r0, #0xc0
	bl sub_020D47EC
	b _020B7FC8
_020B7F74:
	ldr r2, [r5]
	ldr r1, _020B7FDC ; =0x021D8518
	mov r0, #0x540
	mla r1, r2, r0, r1
	ldrh r2, [r5, #4]
	ldrh r0, [r5, #6]
	add r1, r1, #0x100
	add r3, r1, r2, lsl #3
	sub r0, r0, r2
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	movs r2, r0, lsr #0x10
	mov r0, #0
	beq _020B7FC8
	mov r1, #0xc0
_020B7FB0:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	cmp r2, r0, lsr #16
	strh r1, [r3], #8
	mov r0, r0, lsr #0x10
	bhi _020B7FB0
_020B7FC8:
	ldrh r0, [r5, #4]
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	strh r0, [r5, #0xe]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B7FDC: .word 0x021D8518
_020B7FE0: .word _02110C80
	arm_func_end sub_020B7EBC

	arm_func_start sub_020B7FE4
sub_020B7FE4: ; 0x020B7FE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B7CB8
	mov r0, r4
	bl sub_020B7EBC
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B7FE4

	arm_func_start sub_020B7FFC
sub_020B7FFC: ; 0x020B7FFC
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bx lr
	arm_func_end sub_020B7FFC

	arm_func_start sub_020B8008
sub_020B8008: ; 0x020B8008
	mov r2, #0
	mvn r1, #0
_020B8010:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blt _020B8010
	bx lr
	arm_func_end sub_020B8008

	arm_func_start sub_020B8024
sub_020B8024: ; 0x020B8024
	str r2, [r0, r1, lsl #2]
	bx lr
	arm_func_end sub_020B8024

	arm_func_start sub_020B802C
sub_020B802C: ; 0x020B802C
	ldr r0, [r0, r1, lsl #2]
	bx lr
	arm_func_end sub_020B802C

	arm_func_start sub_020B8034
sub_020B8034: ; 0x020B8034
	ldr r1, [r0, r1, lsl #2]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_020B8034

	arm_func_start sub_020B804C
sub_020B804C: ; 0x020B804C
	mov r3, #0
	mvn r2, #0
_020B8054:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #8]
	cmp r3, #3
	blt _020B8054
	bx lr
	arm_func_end sub_020B804C

	arm_func_start sub_020B806C
sub_020B806C: ; 0x020B806C
	add r0, r0, r1, lsl #2
	str r2, [r0, #8]
	bx lr
	arm_func_end sub_020B806C

	arm_func_start sub_020B8078
sub_020B8078: ; 0x020B8078
	add r0, r0, r1, lsl #2
	ldr r0, [r0, #8]
	bx lr
	arm_func_end sub_020B8078

	arm_func_start sub_020B8084
sub_020B8084: ; 0x020B8084
	add r0, r0, r1, lsl #2
	ldr r1, [r0, #8]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_020B8084

	arm_func_start sub_020B80A0
sub_020B80A0: ; 0x020B80A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	movs r5, r2
	mov r6, r1
	mov r4, r3
	ldr r0, [r7, #8]
	beq _020B8104
	cmp r5, #1
	beq _020B80D0
	cmp r5, #2
	beq _020B80EC
	b _020B8104
_020B80D0:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _020B82C4 ; =0xFFCFFFEF
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
	b _020B8104
_020B80EC:
	ldr r3, _020B82C8 ; =0x04001000
	ldr r1, _020B82C4 ; =0xFFCFFFEF
	ldr r2, [r3]
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
_020B8104:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x10]
	bl DC_FlushRange
	cmp r5, #0
	beq _020B812C
	cmp r5, #1
	beq _020B8148
	cmp r5, #2
	beq _020B815C
	b _020B816C
_020B812C:
	bl sub_020D08EC
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl sub_020D0948
	bl sub_020D0A88
	b _020B816C
_020B8148:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl sub_020CFE74
	b _020B816C
_020B815C:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl sub_020CFECC
_020B816C:
	ldr r0, [r7, #8]
	cmp r0, #0
	ldrh r0, [r7, #2]
	bne _020B8284
	cmp r0, #0x10
	bgt _020B81B8
	bge _020B81E4
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B81F4
_020B8194: ; jump table
	b _020B81F4 ; case 0
	b _020B81C4 ; case 1
	b _020B81CC ; case 2
	b _020B81F4 ; case 3
	b _020B81D4 ; case 4
	b _020B81F4 ; case 5
	b _020B81F4 ; case 6
	b _020B81F4 ; case 7
	b _020B81DC ; case 8
_020B81B8:
	cmp r0, #0x20
	beq _020B81EC
	b _020B81F4
_020B81C4:
	mov r0, #0
	b _020B81F8
_020B81CC:
	mov r0, #1
	b _020B81F8
_020B81D4:
	mov r0, #2
	b _020B81F8
_020B81DC:
	mov r0, #3
	b _020B81F8
_020B81E4:
	mov r0, #4
	b _020B81F8
_020B81EC:
	mov r0, #5
	b _020B81F8
_020B81F4:
	mov r0, #0
_020B81F8:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	cmp r0, #0x10
	bgt _020B823C
	bge _020B8268
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B8278
_020B8218: ; jump table
	b _020B8278 ; case 0
	b _020B8248 ; case 1
	b _020B8250 ; case 2
	b _020B8278 ; case 3
	b _020B8258 ; case 4
	b _020B8278 ; case 5
	b _020B8278 ; case 6
	b _020B8278 ; case 7
	b _020B8260 ; case 8
_020B823C:
	cmp r0, #0x20
	beq _020B8270
	b _020B8278
_020B8248:
	mov r0, #0
	b _020B827C
_020B8250:
	mov r0, #1
	b _020B827C
_020B8258:
	mov r0, #2
	b _020B827C
_020B8260:
	mov r0, #3
	b _020B827C
_020B8268:
	mov r0, #4
	b _020B827C
_020B8270:
	mov r0, #5
	b _020B827C
_020B8278:
	mov r0, #0
_020B827C:
	str r0, [r4, #0x10]
	b _020B8290
_020B8284:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	str r0, [r4, #0x10]
_020B8290:
	ldr r1, [r7, #4]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r3, [r7, #8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	str r3, [r4, #0x20]
	bl sub_020B8024
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B82C4: .word 0xFFCFFFEF
_020B82C8: .word 0x04001000
	arm_func_end sub_020B80A0

	arm_func_start sub_020B82CC
sub_020B82CC: ; 0x020B82CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	movs r5, r2
	mov r6, r1
	mov r4, r3
	ldr r0, [r7, #8]
	beq _020B8330
	cmp r5, #1
	beq _020B82FC
	cmp r5, #2
	beq _020B8318
	b _020B8330
_020B82FC:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _020B84F0 ; =0xFFCFFFEF
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
	b _020B8330
_020B8318:
	ldr r3, _020B84F4 ; =0x04001000
	ldr r1, _020B84F0 ; =0xFFCFFFEF
	ldr r2, [r3]
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
_020B8330:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x10]
	bl DC_FlushRange
	cmp r5, #0
	beq _020B8358
	cmp r5, #1
	beq _020B8374
	cmp r5, #2
	beq _020B8388
	b _020B8398
_020B8358:
	bl sub_020D08EC
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl sub_020D0948
	bl sub_020D0A88
	b _020B8398
_020B8374:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl sub_020CFE74
	b _020B8398
_020B8388:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl sub_020CFECC
_020B8398:
	ldr r0, [r7, #8]
	cmp r0, #0
	ldrh r0, [r7, #2]
	bne _020B84B0
	cmp r0, #0x10
	bgt _020B83E4
	bge _020B8410
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B8420
_020B83C0: ; jump table
	b _020B8420 ; case 0
	b _020B83F0 ; case 1
	b _020B83F8 ; case 2
	b _020B8420 ; case 3
	b _020B8400 ; case 4
	b _020B8420 ; case 5
	b _020B8420 ; case 6
	b _020B8420 ; case 7
	b _020B8408 ; case 8
_020B83E4:
	cmp r0, #0x20
	beq _020B8418
	b _020B8420
_020B83F0:
	mov r0, #0
	b _020B8424
_020B83F8:
	mov r0, #1
	b _020B8424
_020B8400:
	mov r0, #2
	b _020B8424
_020B8408:
	mov r0, #3
	b _020B8424
_020B8410:
	mov r0, #4
	b _020B8424
_020B8418:
	mov r0, #5
	b _020B8424
_020B8420:
	mov r0, #0
_020B8424:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	cmp r0, #0x10
	bgt _020B8468
	bge _020B8494
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B84A4
_020B8444: ; jump table
	b _020B84A4 ; case 0
	b _020B8474 ; case 1
	b _020B847C ; case 2
	b _020B84A4 ; case 3
	b _020B8484 ; case 4
	b _020B84A4 ; case 5
	b _020B84A4 ; case 6
	b _020B84A4 ; case 7
	b _020B848C ; case 8
_020B8468:
	cmp r0, #0x20
	beq _020B849C
	b _020B84A4
_020B8474:
	mov r0, #0
	b _020B84A8
_020B847C:
	mov r0, #1
	b _020B84A8
_020B8484:
	mov r0, #2
	b _020B84A8
_020B848C:
	mov r0, #3
	b _020B84A8
_020B8494:
	mov r0, #4
	b _020B84A8
_020B849C:
	mov r0, #5
	b _020B84A8
_020B84A4:
	mov r0, #0
_020B84A8:
	str r0, [r4, #0x10]
	b _020B84BC
_020B84B0:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	str r0, [r4, #0x10]
_020B84BC:
	ldr r1, [r7, #4]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r3, [r7, #8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	str r3, [r4, #0x20]
	bl sub_020B8024
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B84F0: .word 0xFFCFFFEF
_020B84F4: .word 0x04001000
	arm_func_end sub_020B82CC

	arm_func_start sub_020B84F8
sub_020B84F8: ; 0x020B84F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x10]
	mov r5, r2
	mov r4, r3
	bl DC_FlushRange
	cmp r5, #0
	ldr r0, [r7, #8]
	beq _020B856C
	cmp r5, #1
	beq _020B8538
	cmp r5, #2
	beq _020B8554
	b _020B856C
_020B8538:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _020B86C4 ; =0xFFCFFFEF
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
	b _020B856C
_020B8554:
	ldr r3, _020B86C8 ; =0x04001000
	ldr r1, _020B86C4 ; =0xFFCFFFEF
	ldr r2, [r3]
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
_020B856C:
	ldr r0, [r7, #8]
	cmp r0, #0
	ldrh r0, [r7, #2]
	bne _020B8684
	cmp r0, #0x10
	bgt _020B85B8
	bge _020B85E4
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B85F4
_020B8594: ; jump table
	b _020B85F4 ; case 0
	b _020B85C4 ; case 1
	b _020B85CC ; case 2
	b _020B85F4 ; case 3
	b _020B85D4 ; case 4
	b _020B85F4 ; case 5
	b _020B85F4 ; case 6
	b _020B85F4 ; case 7
	b _020B85DC ; case 8
_020B85B8:
	cmp r0, #0x20
	beq _020B85EC
	b _020B85F4
_020B85C4:
	mov r0, #0
	b _020B85F8
_020B85CC:
	mov r0, #1
	b _020B85F8
_020B85D4:
	mov r0, #2
	b _020B85F8
_020B85DC:
	mov r0, #3
	b _020B85F8
_020B85E4:
	mov r0, #4
	b _020B85F8
_020B85EC:
	mov r0, #5
	b _020B85F8
_020B85F4:
	mov r0, #0
_020B85F8:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	cmp r0, #0x10
	bgt _020B863C
	bge _020B8668
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B8678
_020B8618: ; jump table
	b _020B8678 ; case 0
	b _020B8648 ; case 1
	b _020B8650 ; case 2
	b _020B8678 ; case 3
	b _020B8658 ; case 4
	b _020B8678 ; case 5
	b _020B8678 ; case 6
	b _020B8678 ; case 7
	b _020B8660 ; case 8
_020B863C:
	cmp r0, #0x20
	beq _020B8670
	b _020B8678
_020B8648:
	mov r0, #0
	b _020B867C
_020B8650:
	mov r0, #1
	b _020B867C
_020B8658:
	mov r0, #2
	b _020B867C
_020B8660:
	mov r0, #3
	b _020B867C
_020B8668:
	mov r0, #4
	b _020B867C
_020B8670:
	mov r0, #5
	b _020B867C
_020B8678:
	mov r0, #0
_020B867C:
	str r0, [r4, #0x10]
	b _020B8690
_020B8684:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	str r0, [r4, #0x10]
_020B8690:
	ldr r1, [r7, #4]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r3, [r7, #8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	str r3, [r4, #0x20]
	bl sub_020B8024
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B86C4: .word 0xFFCFFFEF
_020B86C8: .word 0x04001000
	arm_func_end sub_020B84F8

	arm_func_start sub_020B86CC
sub_020B86CC: ; 0x020B86CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0xc]
	ldr r5, [sb, #8]
	mov r8, r1
	mov r7, r2
	mov r0, r4
	mov r1, r5
	mov r6, r3
	bl DC_FlushRange
	cmp r7, #0
	beq _020B8788
	cmp r7, #1
	beq _020B8710
	cmp r7, #2
	beq _020B874C
	b _020B87A0
_020B8710:
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _020B8738
	bl sub_020D067C
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_020D06C4
	bl sub_020D0730
	b _020B87A0
_020B8738:
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_020CFD18
	b _020B87A0
_020B874C:
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _020B8774
	bl sub_020D0830
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_020D0848
	bl sub_020D08AC
	b _020B87A0
_020B8774:
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_020CFD70
	b _020B87A0
_020B8788:
	bl sub_020D0AD4
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_020D0B08
	bl sub_020D0B74
_020B87A0:
	ldr r1, [sb]
	mov r0, r6
	str r1, [r6]
	ldr r3, [sb, #4]
	mov r1, r7
	mov r2, r8
	str r3, [r6, #4]
	bl sub_020B806C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020B86CC

	arm_func_start sub_020B87C4
sub_020B87C4: ; 0x020B87C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r0, [sl]
	str r1, [sp]
	cmp r0, #3
	ldr r0, [sp, #0x30]
	moveq r8, #0x20
	str r0, [sp, #0x30]
	ldr r0, [sp]
	mov sb, r2
	ldrh r0, [r0]
	mov fp, r3
	movne r8, #0x200
	str r0, [sp, #4]
	mov r7, #0
	movs r0, r0
	beq _020B88F8
_020B880C:
	ldr r0, [sp]
	ldr r5, [sl, #0xc]
	ldr r1, [r0, #4]
	mov r0, r7, lsl #1
	ldrh r0, [r1, r0]
	mul r4, r8, r7
	mul r6, r8, r0
	ldr r1, [sl, #8]
	mov r0, r5
	bl DC_FlushRange
	cmp fp, #0
	beq _020B88C8
	cmp fp, #1
	beq _020B8850
	cmp fp, #2
	beq _020B888C
	b _020B88E0
_020B8850:
	ldr r0, [sl, #4]
	cmp r0, #0
	beq _020B8878
	bl sub_020D067C
	add r0, r5, r4
	mov r2, r8
	add r1, sb, r6
	bl sub_020D06C4
	bl sub_020D0730
	b _020B88E0
_020B8878:
	mov r2, r8
	add r0, r5, r4
	add r1, sb, r6
	bl sub_020CFD18
	b _020B88E0
_020B888C:
	ldr r0, [sl, #4]
	cmp r0, #0
	beq _020B88B4
	bl sub_020D0830
	add r0, r5, r4
	mov r2, r8
	add r1, sb, r6
	bl sub_020D0848
	bl sub_020D08AC
	b _020B88E0
_020B88B4:
	mov r2, r8
	add r0, r5, r4
	add r1, sb, r6
	bl sub_020CFD70
	b _020B88E0
_020B88C8:
	bl sub_020D0AD4
	add r0, r5, r4
	mov r2, r8
	add r1, sb, r6
	bl sub_020D0B08
	bl sub_020D0B74
_020B88E0:
	add r0, r7, #1
	mov r1, r0, lsl #0x10
	ldr r0, [sp, #4]
	mov r7, r1, lsr #0x10
	cmp r0, r1, lsr #16
	bhi _020B880C
_020B88F8:
	ldr r0, [sp, #0x30]
	ldr r2, [sl]
	mov r1, r0
	str r2, [r1]
	ldr r4, [sl, #4]
	mov r3, r0
	mov r1, fp
	mov r2, sb
	str r4, [r3, #4]
	bl sub_020B806C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020B87C4

	arm_func_start sub_020B8928
sub_020B8928: ; 0x020B8928
	mov r2, #0
	mvn r1, #0
_020B8930:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blt _020B8930
	bx lr
	arm_func_end sub_020B8928

	arm_func_start sub_020B8944
sub_020B8944: ; 0x020B8944
	str r2, [r0, r1, lsl #2]
	bx lr
	arm_func_end sub_020B8944

	arm_func_start sub_020B894C
sub_020B894C: ; 0x020B894C
	ldr r0, [r0, r1, lsl #2]
	bx lr
	arm_func_end sub_020B894C

	arm_func_start sub_020B8954
sub_020B8954: ; 0x020B8954
	ldr r3, [r0]
	cmp r3, #1
	bxne lr
	ldrh r3, [r0, #0x12]
	orr r3, r3, #8
	strh r3, [r0, #0x12]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	bx lr
	arm_func_end sub_020B8954

	arm_func_start sub_020B8978
sub_020B8978: ; 0x020B8978
	ldr r2, [r0]
	cmp r2, #1
	bxne lr
	ldrh r2, [r0, #0x12]
	orr r2, r2, #4
	strh r2, [r0, #0x12]
	strh r1, [r0, #0x10]
	bx lr
	arm_func_end sub_020B8978

	arm_func_start sub_020B8998
sub_020B8998: ; 0x020B8998
	ldr r3, [r0]
	cmp r3, #1
	bxne lr
	ldrh r3, [r0, #0x12]
	orr r3, r3, #2
	strh r3, [r0, #0x12]
	stmib r0, {r1, r2}
	bx lr
	arm_func_end sub_020B8998

	arm_func_start sub_020B89B8
sub_020B89B8: ; 0x020B89B8
	ldr ip, _020B89C4 ; =sub_020B89C8
	str r1, [r0]
	bx ip
	.align 2, 0
_020B89C4: .word sub_020B89C8
	arm_func_end sub_020B89B8

	arm_func_start sub_020B89C8
sub_020B89C8: ; 0x020B89C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r1, r4, #4
	mov r0, #0
	mov r2, #0x18
	bl sub_020D4790
	mov r0, #0x1000
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B89C8

	arm_func_start sub_020B89F0
sub_020B89F0: ; 0x020B89F0
	mov r2, #0
	str r2, [r0]
	str r1, [r0, #4]
	mov r1, #1
	str r1, [r0, #8]
	ldr ip, _020B8A10 ; =sub_020B89B8
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_020B8A10: .word sub_020B89B8
	arm_func_end sub_020B89F0

	arm_func_start sub_020B8A14
sub_020B8A14: ; 0x020B8A14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	ldrh r1, [r1, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020B75CC
	mov r0, r4
	bl sub_020B75CC
	mov r5, r0
	ldr r6, [r4, #0x34]
	ldrh r1, [r5]
	mov r0, r6
	bl sub_020B6F04
	str r0, [r4, #0x30]
	ldr r1, [r4, #0x1c]
	add r0, r4, #0x3c
	ldr r2, [r1, #4]
	mov r1, #1
	and r7, r2, #0xff
	bl sub_020B89B8
	cmp r7, #0
	beq _020B8AB4
	cmp r7, #2
	bne _020B8A8C
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x3c
	bl sub_020B8954
	b _020B8AB4
_020B8A8C:
	add r0, r4, #0x3c
	ldmib r5, {r1, r2}
	bl sub_020B8998
	ldrh r1, [r5, #2]
	add r0, r4, #0x3c
	bl sub_020B8978
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x3c
	bl sub_020B8954
_020B8AB4:
	ldr r2, [r6, #0xc]
	cmp r2, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x38]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r5]
	ldr r2, [r2, #4]
	ldr r0, [r4, #0x38]
	add r3, r2, r1, lsl #3
	ldmia r3, {r1, r2}
	bl sub_020BAEC0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020B8A14

	arm_func_start sub_020B8B04
sub_020B8B04: ; 0x020B8B04
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	str r2, [r5, #0x34]
	mvn r2, #0
	add r0, r5, #0x3c
	mov r1, #1
	str r2, [r5, #0x38]
	bl sub_020B89B8
	mov r0, r5
	bl sub_020B77C4
	mov r0, r5
	mov r1, r4
	bl sub_020B8BC4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B8B04

	arm_func_start sub_020B8B40
sub_020B8B40: ; 0x020B8B40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r4, r2
	ldr r2, [r4, #0xc]
	mov r5, r1
	ldr r1, [r2]
	ldr r2, [sp, #0x34]
	str r1, [sp]
	ldr r1, [sp, #0x38]
	str r2, [sp, #4]
	mov r6, r3
	mov r7, r0
	ldr ip, [sp, #0x3c]
	str r1, [sp, #8]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	mov r0, r6
	str ip, [sp, #0xc]
	bl sub_020BAC94
	str r6, [r7, #0x38]
	str r4, [r7, #0x34]
	add r0, r7, #0x3c
	mov r1, #1
	str r6, [r7, #0x38]
	bl sub_020B89B8
	mov r0, r7
	bl sub_020B77C4
	mov r0, r7
	mov r1, r5
	bl sub_020B8BC4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020B8B40

	arm_func_start sub_020B8BC4
sub_020B8BC4: ; 0x020B8BC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B787C
	mov r0, r4
	bl sub_020B8A14
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B8BC4

	arm_func_start sub_020B8BDC
sub_020B8BDC: ; 0x020B8BDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B75D8
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl sub_020B8A14
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B8BDC

	arm_func_start sub_020B8BFC
sub_020B8BFC: ; 0x020B8BFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020B778C
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl sub_020B8A14
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B8BFC

	arm_func_start sub_020B8C1C
sub_020B8C1C: ; 0x020B8C1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	str r0, [sp]
	str sl, [r0]
	ldr r0, [r0, #8]
	mov sb, r2
	cmp r0, #1
	bne _020B8D84
	ldrh r1, [sl, #2]
	ldr r0, [sp]
	mov r4, #0
	ldr r5, [r0, #0xc]
	cmp r1, #0
	bls _020B8C7C
	mov r3, r4
	mov r0, #0x5c
_020B8C5C:
	mla r1, r4, r0, r5
	str r3, [r1, #0x58]
	ldrh r2, [sl, #2]
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	cmp r2, r1, lsr #16
	mov r4, r1, lsr #0x10
	bhi _020B8C5C
_020B8C7C:
	ldrh r0, [sl]
	mov r8, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B8C8C:
	ldr r0, [sl, #4]
	mov r1, #0x5c
	add r6, r0, r8, lsl #3
	ldrh r0, [r6, #6]
	and r0, r0, #0xff00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	mla r7, r0, r1, r5
	ldr r0, [r7, #0x58]
	cmp r0, #0
	bne _020B8D68
	ldr r0, [sp]
	ldrh r1, [r6]
	ldr r0, [r0, #4]
	bl sub_020B6E80
	mov r4, r0
	mov r0, r7
	mov r1, r4
	bl sub_020B8BC4
	mov r0, #1
	str r0, [r7, #0xc]
	ldrh r0, [r6, #6]
	and r0, r0, #0xf
	cmp r0, #1
	bne _020B8D60
	ldrh r3, [r4]
	mov r6, #0
	mov r1, r6
	cmp r3, #0
	bls _020B8D20
	ldr r2, [r4, #0xc]
_020B8D08:
	add r0, r2, r1, lsl #3
	ldrh r0, [r0, #4]
	add r1, r1, #1
	cmp r1, r3
	add r6, r6, r0
	blo _020B8D08
_020B8D20:
	mov r0, r7
	bl sub_020B788C
	cmp r0, #0
	beq _020B8D4C
	mov r0, sb
	mov r1, r6
	bl _u32_div_f
	mov r0, r7
	mov r1, r1, lsl #0xc
	bl sub_020B8BDC
	b _020B8D60
_020B8D4C:
	cmp sb, r6
	movlo r6, sb
	mov r0, r7
	mov r1, r6, lsl #0xc
	bl sub_020B8BDC
_020B8D60:
	mov r0, #1
	str r0, [r7, #0x58]
_020B8D68:
	ldrh r1, [sl]
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #16
	mov r8, r0, lsr #0x10
	bhi _020B8C8C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B8D84:
	ldr r0, [sp]
	ldrh r1, [sl]
	ldr fp, [r0, #0xc]
	mov r7, #0
	cmp r1, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B8D9C:
	mov r0, #0x28
	mul r2, r7, r0
	ldr r3, [sl, #4]
	mov r0, r7, lsl #3
	ldrh r1, [r3, r0]
	ldr r0, [sp]
	ldr r6, [fp, r2]
	ldr r0, [r0, #4]
	add r5, r3, r7, lsl #3
	bl sub_020B6E80
	mov r4, r0
	mov r0, r6
	mov r1, r4
	bl sub_020B8BC4
	mov r0, #1
	str r0, [r6, #0xc]
	ldrh r0, [r5, #6]
	and r0, r0, #0xf
	cmp r0, #1
	bne _020B8E5C
	ldrh r3, [r4]
	mov r8, #0
	mov r1, r8
	cmp r3, #0
	bls _020B8E1C
	ldr r2, [r4, #0xc]
_020B8E04:
	add r0, r2, r1, lsl #3
	ldrh r0, [r0, #4]
	add r1, r1, #1
	cmp r1, r3
	add r8, r8, r0
	blo _020B8E04
_020B8E1C:
	mov r0, r6
	bl sub_020B788C
	cmp r0, #0
	beq _020B8E48
	mov r0, sb
	mov r1, r8
	bl _u32_div_f
	mov r0, r6
	mov r1, r1, lsl #0xc
	bl sub_020B8BDC
	b _020B8E5C
_020B8E48:
	cmp sb, r8
	movlo r8, sb
	mov r0, r6
	mov r1, r8, lsl #0xc
	bl sub_020B8BDC
_020B8E5C:
	mov r0, #0x28
	mla r3, r7, r0, fp
	mov r0, #1
	str r0, [r3, #8]
	ldrsh r1, [r5, #2]
	ldrsh r2, [r5, #4]
	add r0, r3, #0xc
	bl sub_020B8954
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [sl]
	mov r7, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B8D9C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020B8C1C

	arm_func_start sub_020B8E98
sub_020B8E98: ; 0x020B8E98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_020B787C
	mov r0, #0
	strh r0, [r4, #0x30]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl sub_020B75CC
	mov r5, r0
	ldrh r1, [r5]
	ldr r0, [r4, #0x44]
	bl sub_020B7090
	ldr r1, [r4, #0x1c]
	mov r7, r0
	ldr r1, [r1, #4]
	add r0, r4, #0x48
	and r6, r1, #0xff
	mov r1, #1
	bl sub_020B89B8
	cmp r6, #0
	beq _020B8F3C
	cmp r6, #2
	bne _020B8F14
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x48
	bl sub_020B8954
	b _020B8F3C
_020B8F14:
	add r0, r4, #0x48
	ldmib r5, {r1, r2}
	bl sub_020B8998
	ldrh r1, [r5, #2]
	add r0, r4, #0x48
	bl sub_020B8978
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x48
	bl sub_020B8954
_020B8F3C:
	ldrh r2, [r4, #0x30]
	mov r1, r7
	add r0, r4, #0x34
	bl sub_020B8C1C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020B8E98

	arm_func_start sub_020B8F50
sub_020B8F50: ; 0x020B8F50
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrh r0, [r4]
	mov r5, #0
	mov r6, r5
	cmp r0, #0
	bls _020B8F9C
_020B8F6C:
	mov r0, r4
	mov r1, r6
	bl sub_020B7090
	ldrh r0, [r0]
	ldrh r1, [r4]
	cmp r0, r5
	movhi r5, r0
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #16
	mov r6, r0, lsr #0x10
	bhi _020B8F6C
_020B8F9C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B8F50

	arm_func_start sub_020B8FA4
sub_020B8FA4: ; 0x020B8FA4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r0, [r7, #8]
	mov r6, r1
	cmp r0, #1
	ldr r0, [r7]
	mov r4, #0
	ldr r5, [r7, #0xc]
	bne _020B9004
	ldrh r0, [r0, #2]
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0x5c
_020B8FD8:
	mla r0, r4, r8, r5
	mov r1, r6
	bl sub_020B8BDC
	ldr r1, [r7]
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1, #2]
	mov r4, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B8FD8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020B9004:
	ldrh r0, [r0]
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0x28
_020B9014:
	mul r0, r4, r8
	ldr r0, [r5, r0]
	mov r1, r6
	bl sub_020B8BDC
	ldr r1, [r7]
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1]
	mov r4, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B9014
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020B8FA4

	arm_func_start sub_020B9044
sub_020B9044: ; 0x020B9044
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r2, [r4]
	mov r6, r1
	ldrh r5, [r2, #4]
	bl sub_020B75D8
	cmp r0, #0
	beq _020B9114
	ldrh r0, [r4, #0x30]
	add r0, r0, r5
	strh r0, [r4, #0x30]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl sub_020B75CC
	mov r5, r0
	ldrh r1, [r5]
	ldr r0, [r4, #0x44]
	bl sub_020B7090
	ldr r1, [r4, #0x1c]
	mov r7, r0
	ldr r1, [r1, #4]
	add r0, r4, #0x48
	and r6, r1, #0xff
	mov r1, #1
	bl sub_020B89B8
	cmp r6, #0
	beq _020B9100
	cmp r6, #2
	bne _020B90D8
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x48
	bl sub_020B8954
	b _020B9100
_020B90D8:
	add r0, r4, #0x48
	ldmib r5, {r1, r2}
	bl sub_020B8998
	ldrh r1, [r5, #2]
	add r0, r4, #0x48
	bl sub_020B8978
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x48
	bl sub_020B8954
_020B9100:
	ldrh r2, [r4, #0x30]
	mov r1, r7
	add r0, r4, #0x34
	bl sub_020B8C1C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B9114:
	mov r1, r6
	add r0, r4, #0x34
	bl sub_020B8FA4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020B9044

	arm_func_start sub_020B9124
sub_020B9124: ; 0x020B9124
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_020B778C
	cmp r0, #0
	ldrne r0, [r4, #4]
	ldrneh r0, [r0, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl sub_020B75CC
	mov r5, r0
	ldrh r1, [r5]
	ldr r0, [r4, #0x44]
	bl sub_020B7090
	ldr r1, [r4, #0x1c]
	mov r7, r0
	ldr r1, [r1, #4]
	add r0, r4, #0x48
	and r6, r1, #0xff
	mov r1, #1
	bl sub_020B89B8
	cmp r6, #0
	beq _020B91C4
	cmp r6, #2
	bne _020B919C
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x48
	bl sub_020B8954
	b _020B91C4
_020B919C:
	add r0, r4, #0x48
	ldmib r5, {r1, r2}
	bl sub_020B8998
	ldrh r1, [r5, #2]
	add r0, r4, #0x48
	bl sub_020B8978
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x48
	bl sub_020B8954
_020B91C4:
	ldrh r2, [r4, #0x30]
	mov r1, r7
	add r0, r4, #0x34
	bl sub_020B8C1C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020B9124

	arm_func_start sub_020B91D8
sub_020B91D8: ; 0x020B91D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
	str r5, [r0, #0x3c]
	ldr r7, [sp, #0x28]
	str r5, [r0, #0x34]
	mov sl, r1
	str r7, [r0, #0x38]
	str r0, [sp]
	movs r8, r3
	mov sb, r2
	str sl, [r0, #0x40]
	ldr fp, [sp, #0x2c]
	beq _020B925C
_020B920C:
	mov r0, #0x28
	mul r4, r5, r0
	mov r1, #1
	add r0, sl, r4
	bl sub_020B89F0
	mov r0, #0x58
	mla r6, r5, r0, sb
	mov r0, r7
	mov r1, #0
	str r6, [sl, r4]
	bl sub_020B6E80
	mov r1, r0
	mov r0, r6
	mov r2, fp
	bl sub_020B8B04
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	cmp r8, r0, lsr #16
	mov r5, r0, lsr #0x10
	bhi _020B920C
_020B925C:
	ldr r0, [sp]
	bl sub_020B77C4
	ldr r0, [sp]
	ldr r3, [sp, #0x30]
	ldr r2, [sp]
	add r0, r0, #0x48
	mov r1, #1
	str r3, [r2, #0x44]
	bl sub_020B89B8
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020B91D8

	arm_func_start sub_020B9290
sub_020B9290: ; 0x020B9290
	stmdb sp!, {r4, lr}
	ldr r0, _020B9318 ; =0x021D94D8
	ldr ip, [r0, #0xc]
	ldr r1, [r0, #4]
	mov r0, #0x18
	mul r3, ip, r0
	cmp r1, #0
	beq _020B92C8
	ldr r1, _020B931C ; =0x021D9678
	mov r2, #0
	ldr r0, _020B9320 ; =0x021D967C
	str r2, [r1, r3]
	str r2, [r0, r3]
	b _020B9308
_020B92C8:
	ldr r1, _020B9324 ; =0x021D9668
	mov r2, #0x1000
	str r2, [r1, r3]
	add r4, r1, r3
	mov r1, #0
	str r1, [r4, #4]
	ldr r0, _020B9328 ; =0x021D9968
	str r1, [r4, #8]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	add lr, r0, r3
	str r1, [r4, #0x14]
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_020B9308:
	ldr r0, _020B932C ; =0x021D94E8
	mov r1, #0
	str r1, [r0, ip, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B9318: .word 0x021D94D8
_020B931C: .word 0x021D9678
_020B9320: .word 0x021D967C
_020B9324: .word 0x021D9668
_020B9328: .word 0x021D9968
_020B932C: .word 0x021D94E8
	arm_func_end sub_020B9290

	arm_func_start sub_020B9330
sub_020B9330: ; 0x020B9330
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020B9454 ; =0x021D94D8
	ldr r1, _020B9458 ; =0x021D9568
	ldr r0, [r0, #0xc]
	mov r2, #1
	mov r0, r0, lsl #0x10
	add r3, r1, r0, lsr #13
	ldrh r0, [r3, #4]
	cmp r0, #1
	cmpne r0, #2
	movne r2, #0
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020B9454 ; =0x021D94D8
	ldrh r4, [r3, #2]
	ldrh r5, [r0]
	mov r2, #0x10
	cmp r5, #0x1f
	addlo r1, r5, #1
	strloh r1, [r0]
	ldr r0, _020B945C ; =0x021D9C68
	strh r5, [r3]
	add r0, r0, r5, lsl #5
	add r1, r0, #0x10
	mvn r0, #0
	bl sub_020D4858
	ldr r0, _020B9454 ; =0x021D94D8
	ldr r1, [r0, #4]
	ldr ip, [r0, #0xc]
	cmp r1, #0
	ldreq r1, _020B9460 ; =0x021D9968
	mov r0, #0x18
	mlaeq r1, ip, r0, r1
	beq _020B93DC
	mul r3, ip, r0
	ldr r1, _020B9464 ; =0x021D9678
	ldr r0, _020B9468 ; =_021109DC
	ldr r2, [r1, r3]
	ldr r1, _020B946C ; =0x021D967C
	str r2, [r0, #0x18]
	ldr r2, [r1, r3]
	ldr r1, _020B9470 ; =_021109E4
	str r2, [r0, #0x1c]
_020B93DC:
	mov r2, ip, lsl #0x10
	ldr r0, _020B9458 ; =0x021D9568
	mov r2, r2, lsr #0xd
	ldrh ip, [r0, r2]
	ldr lr, _020B945C ; =0x021D9C68
	ldr r3, [r1]
	ldr r2, _020B9454 ; =0x021D94D8
	str r3, [lr, ip, lsl #5]
	ldr r3, [r1, #4]
	add ip, lr, ip, lsl #5
	str r3, [ip, #4]
	ldr r3, [r1, #8]
	ldr r2, [r2, #0xc]
	str r3, [ip, #8]
	ldr r3, [r1, #0xc]
	mov r1, r2, lsl #0x10
	str r3, [ip, #0xc]
	movs lr, r1, lsr #0x10
	ldmmiia sp!, {r3, r4, r5, pc}
	mov r1, #3
_020B942C:
	add r3, r0, lr, lsl #3
	ldrh r2, [r3, #2]
	mov ip, lr, lsl #3
	cmp r4, r2
	ldmneia sp!, {r3, r4, r5, pc}
	strh r1, [r3, #4]
	strh r5, [r0, ip]
	subs lr, lr, #1
	bpl _020B942C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B9454: .word 0x021D94D8
_020B9458: .word 0x021D9568
_020B945C: .word 0x021D9C68
_020B9460: .word 0x021D9968
_020B9464: .word 0x021D9678
_020B9468: .word _021109DC
_020B946C: .word 0x021D967C
_020B9470: .word _021109E4
	arm_func_end sub_020B9330

	arm_func_start sub_020B9474
sub_020B9474: ; 0x020B9474
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020B9570 ; =0x021D94D8
	mov r6, r0
	ldr r0, [r2, #8]
	mov r5, r1
	ldr r4, [r0, #0x74]
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _020B9504
	ldr r0, [r2, #4]
	cmp r0, #0
	ldreq r2, [r2, #0xc]
	ldreq r1, _020B9574 ; =0x021D9668
	mov r0, #0x18
	mlaeq r1, r2, r0, r1
	beq _020B94DC
	ldr r1, [r2, #0xc]
	mul r3, r1, r0
	ldr r1, _020B9578 ; =0x021D9678
	ldr r0, _020B957C ; =_021109DC
	ldr r2, [r1, r3]
	ldr r1, _020B9580 ; =0x021D967C
	str r2, [r0, #0x18]
	ldr r2, [r1, r3]
	ldr r1, _020B9584 ; =_021109E4
	str r2, [r0, #0x1c]
_020B94DC:
	ldr r3, [r4, #0x34]
	mov r0, r5
	mov r2, r4
	blx r3
	cmp r0, #0
	moveq r0, #0
	streq r0, [r6, #0x30]
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r6, #0x30]
_020B9504:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020B9570 ; =0x021D94D8
	ldr r1, [r0, #4]
	cmp r1, #0
	ldr r1, [r0, #0xc]
	ldreq r2, _020B9574 ; =0x021D9668
	mov r0, #0x18
	mlaeq r3, r1, r0, r2
	beq _020B9554
	mul r3, r1, r0
	ldr r1, _020B9578 ; =0x021D9678
	ldr r0, _020B957C ; =_021109DC
	ldr r2, [r1, r3]
	ldr r1, _020B9580 ; =0x021D967C
	str r2, [r0, #0x18]
	ldr r1, [r1, r3]
	ldr r3, _020B9584 ; =_021109E4
	str r1, [r0, #0x1c]
_020B9554:
	ldr r0, _020B9570 ; =0x021D94D8
	ldr r6, [r4, #0x38]
	ldr r0, [r0, #8]
	mov r1, r4
	mov r2, r5
	blx r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B9570: .word 0x021D94D8
_020B9574: .word 0x021D9668
_020B9578: .word 0x021D9678
_020B957C: .word _021109DC
_020B9580: .word 0x021D967C
_020B9584: .word _021109E4
	arm_func_end sub_020B9474

	arm_func_start sub_020B9588
sub_020B9588: ; 0x020B9588
	stmdb sp!, {r4, lr}
	ldr r3, _020B95F4 ; =0x021D94D8
	mov r2, r1
	ldr r0, [r3, #8]
	ldr r1, [r0, #0x74]
	ldr r4, [r1, #0x3c]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r4, [r3, #4]
	ldr ip, [r3, #0xc]
	cmp r4, #0
	ldreq lr, _020B95F8 ; =0x021D9668
	mov r3, #0x18
	mlaeq r3, ip, r3, lr
	beq _020B95E8
	mul r4, ip, r3
	ldr r3, _020B95FC ; =0x021D9678
	ldr ip, _020B9600 ; =_021109DC
	ldr lr, [r3, r4]
	ldr r3, _020B9604 ; =0x021D967C
	str lr, [ip, #0x18]
	ldr lr, [r3, r4]
	ldr r3, _020B9608 ; =_021109E4
	str lr, [ip, #0x1c]
_020B95E8:
	ldr ip, [r1, #0x3c]
	blx ip
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B95F4: .word 0x021D94D8
_020B95F8: .word 0x021D9668
_020B95FC: .word 0x021D9678
_020B9600: .word _021109DC
_020B9604: .word 0x021D967C
_020B9608: .word _021109E4
	arm_func_end sub_020B9588

	arm_func_start sub_020B960C
sub_020B960C: ; 0x020B960C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r3, _020B97E0 ; =0x021D94D8
	mov r6, r0
	ldr r0, [r3, #8]
	mov r5, r1
	mov r4, r2
	bl sub_020BAB44
	cmp r0, #0
	beq _020B965C
	ldrh r1, [r6, #0x3c]
	and r1, r1, #0xf000
	mov r1, r1, lsl #4
	mov r1, r1, lsr #0x10
	bl sub_020B7FFC
	ldr r1, [r6, #0x3c]
	mov r0, r0, lsl #0x1c
	bic r1, r1, #0xf000
	orr r0, r1, r0, lsr #16
	str r0, [r6, #0x3c]
_020B965C:
	ldr r0, _020B97E0 ; =0x021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	cmp r0, #0
	beq _020B9768
	ldr r0, [r1, #0x84]
	tst r0, #1
	beq _020B9694
	ldrh r0, [r1, #0x88]
	ldr r1, [r6, #0x3c]
	bic r1, r1, #0xc00
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #20
	str r0, [r6, #0x3c]
_020B9694:
	ldr r0, _020B97E0 ; =0x021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #2
	beq _020B96C0
	ldrh r0, [r1, #0x8a]
	ldr r1, [r6, #0x3c]
	bic r1, r1, #0xf000
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	str r0, [r6, #0x3c]
_020B96C0:
	ldr r0, _020B97E0 ; =0x021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #0x10
	beq _020B96F4
	ldr r2, [r6, #0x3c]
	ldrh r0, [r1, #0x94]
	mov r1, r2, lsl #0x10
	bic r2, r2, #0xf000
	add r0, r0, r1, lsr #28
	mov r0, r0, lsl #0x1c
	orr r0, r2, r0, lsr #16
	str r0, [r6, #0x3c]
_020B96F4:
	ldr r0, _020B97E0 ; =0x021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #4
	beq _020B9724
	ldr r0, [r1, #0x90]
	cmp r0, #0
	ldr r0, [r6, #0x38]
	orrne r0, r0, #0x1000
	strne r0, [r6, #0x38]
	biceq r0, r0, #0x1000
	streq r0, [r6, #0x38]
_020B9724:
	ldr r0, _020B97E0 ; =0x021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #8
	beq _020B9768
	ldr r0, [r6, #0x38]
	ldrh r2, [r6, #0x3c]
	ldr r1, [r1, #0x8c]
	bic r0, r0, #0xc00
	orr r0, r0, r1, lsl #10
	str r0, [r6, #0x38]
	ldrh r0, [r6, #0x3c]
	and r1, r2, #0xf000
	mov r1, r1, asr #0xc
	bic r0, r0, #0xf000
	orr r0, r0, r1, lsl #12
	strh r0, [r6, #0x3c]
_020B9768:
	ldr r2, _020B97E0 ; =0x021D94D8
	ldr r0, [r2, #8]
	ldr r1, [r0, #0x74]
	ldr r3, [r1, #0x40]
	cmp r3, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r3, [r2, #4]
	cmp r3, #0
	ldr r3, [r2, #0xc]
	ldreq r6, _020B97E4 ; =0x021D9668
	mov r2, #0x18
	mlaeq r6, r3, r2, r6
	beq _020B97C4
	mul ip, r3, r2
	ldr r3, _020B97E8 ; =0x021D9678
	ldr r2, _020B97EC ; =_021109DC
	ldr r6, [r3, ip]
	ldr r3, _020B97F0 ; =0x021D967C
	str r6, [r2, #0x18]
	ldr r3, [r3, ip]
	ldr r6, _020B97F4 ; =_021109E4
	str r3, [r2, #0x1c]
_020B97C4:
	str r6, [sp]
	ldr r6, [r1, #0x40]
	mov r2, r5
	mov r3, r4
	blx r6
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020B97E0: .word 0x021D94D8
_020B97E4: .word 0x021D9668
_020B97E8: .word 0x021D9678
_020B97EC: .word _021109DC
_020B97F0: .word 0x021D967C
_020B97F4: .word _021109E4
	arm_func_end sub_020B960C

	arm_func_start sub_020B97F8
sub_020B97F8: ; 0x020B97F8
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _020B9874 ; =0x021D94D8
	mov ip, r1
	ldr r0, [lr, #8]
	mov r3, r2
	ldr r1, [r0, #0x74]
	ldr r2, [r1, #0x44]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [lr, #4]
	cmp r2, #0
	ldreq lr, [lr, #0xc]
	ldreq r4, _020B9878 ; =0x021D9668
	mov r2, #0x18
	mlaeq r5, lr, r2, r4
	beq _020B9860
	ldr r4, [lr, #0xc]
	mul r5, r4, r2
	ldr r4, _020B987C ; =0x021D9678
	ldr r2, _020B9880 ; =_021109DC
	ldr lr, [r4, r5]
	ldr r4, _020B9884 ; =0x021D967C
	str lr, [r2, #0x18]
	ldr r4, [r4, r5]
	ldr r5, _020B9888 ; =_021109E4
	str r4, [r2, #0x1c]
_020B9860:
	str r5, [sp]
	ldr lr, [r1, #0x44]
	mov r2, ip
	blx lr
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B9874: .word 0x021D94D8
_020B9878: .word 0x021D9668
_020B987C: .word 0x021D9678
_020B9880: .word _021109DC
_020B9884: .word 0x021D967C
_020B9888: .word _021109E4
	arm_func_end sub_020B97F8

	arm_func_start sub_020B988C
sub_020B988C: ; 0x020B988C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, _020B9CA8 ; =0x021D94D8
	mov r4, r0
	ldr fp, [r7, #8]
	ldr r0, [fp, #0x7c]
	ldr sb, [fp, #0x70]
	tst r0, #2
	beq _020B9A7C
	ldr r0, [sb, #0x14]
	cmp r0, #0
	beq _020B99EC
	ldr r0, [r7, #4]
	mov r1, #0
	cmp r0, #0
	bne _020B98E0
	ldr r2, _020B9CAC ; =_021109DC
	ldr r0, _020B9CB0 ; =0x0000FFFE
	ldrh r2, [r2]
	cmp r2, r0
	movne r0, #1
	bne _020B98E4
_020B98E0:
	mov r0, #0
_020B98E4:
	cmp r0, #0
	beq _020B9970
	ldr r0, _020B9CA8 ; =0x021D94D8
	ldr r0, [r0, #0xf94]
	cmp r0, #0
	beq _020B994C
	ldr r0, _020B9CB4 ; =0x021D9FD8
	ldr r1, _020B9CB8 ; =0x021DA06C
	ldrh r0, [r0, #0x90]
	ldr r1, [r1, r0, lsl #2]
	cmp r1, #0
	bne _020B9970
	bl sub_020B9330
	ldr r0, _020B9CA8 ; =0x021D94D8
	ldr r2, _020B9CBC ; =0x021D9568
	ldr r0, [r0, #0xc]
	ldr r1, _020B9CB4 ; =0x021D9FD8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0xd
	ldrh r3, [r2, r0]
	ldr r5, _020B9CC0 ; =0x021D9C68
	ldrh r2, [r1, #0x90]
	ldr r0, _020B9CB8 ; =0x021DA06C
	add r1, r5, r3, lsl #5
	str r1, [r0, r2, lsl #2]
	b _020B9970
_020B994C:
	bl sub_020B9330
	ldr r0, _020B9CA8 ; =0x021D94D8
	ldr r1, _020B9CBC ; =0x021D9568
	ldr r0, [r0, #0xc]
	ldr r2, _020B9CC0 ; =0x021D9C68
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0xd
	ldrh r0, [r1, r0]
	add r1, r2, r0, lsl #5
_020B9970:
	ldr r0, _020B9CA8 ; =0x021D94D8
	ldr r2, [r0, #4]
	cmp r2, #0
	ldr r2, [r0, #0xc]
	ldreq r3, _020B9CC4 ; =0x021D9668
	mov r0, #0x18
	mlaeq r0, r2, r0, r3
	beq _020B99B4
	mul r5, r2, r0
	ldr r0, _020B9CC8 ; =0x021D9678
	ldr r2, _020B9CAC ; =_021109DC
	ldr r3, [r0, r5]
	ldr r0, _020B9CCC ; =0x021D967C
	str r3, [r2, #0x18]
	ldr r3, [r0, r5]
	ldr r0, _020B9CD0 ; =_021109E4
	str r3, [r2, #0x1c]
_020B99B4:
	bl sub_020BBF34
	ldr r1, _020B9CAC ; =_021109DC
	mvn r0, #0
	ldr r1, [r1, #4]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B99E4
	bl sub_020BC1D4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B99E4:
	bl sub_020BC120
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B99EC:
	ldr r2, [r7, #0xc]
	ldr r1, _020B9CD4 ; =0x021D94E8
	mov r0, fp
	ldr r1, [r1, r2, lsl #2]
	bl sub_020BBF4C
	mov r0, r7
	ldr r1, [r0, #4]
	cmp r1, #0
	ldr r1, [r0, #0xc]
	ldreq r2, _020B9CC4 ; =0x021D9668
	mov r0, #0x18
	mlaeq r0, r1, r0, r2
	beq _020B9A44
	mul r3, r1, r0
	ldr r0, _020B9CC8 ; =0x021D9678
	ldr r1, _020B9CAC ; =_021109DC
	ldr r2, [r0, r3]
	ldr r0, _020B9CCC ; =0x021D967C
	str r2, [r1, #0x18]
	ldr r2, [r0, r3]
	ldr r0, _020B9CD0 ; =_021109E4
	str r2, [r1, #0x1c]
_020B9A44:
	bl sub_020BBECC
	ldr r1, _020B9CAC ; =_021109DC
	mvn r0, #0
	ldr r1, [r1, #4]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B9A74
	bl sub_020BC1D4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B9A74:
	bl sub_020BC120
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B9A7C:
	cmp sb, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r8, _020B9CC4 ; =0x021D9668
	ldr r6, _020B9CAC ; =_021109DC
	mvn r5, #0
_020B9A90:
	ldr r0, [sb, #0x10]
	cmp r0, #0
	beq _020B9C98
	ldr r0, [sb, #0x14]
	ldr sl, [r7, #8]
	cmp r0, #0
	mov r1, sb
	beq _020B9BFC
	str sb, [sl, #0x74]
	mov r0, sl
	bl sub_020BBF54
	ldr r1, [sb, #0x28]
	ldr r2, [sb, #0x2c]
	mov r0, sl
	bl sub_020BBEB8
	mov r0, sl
	bl sub_020BBFB0
	ldr r0, [r7, #4]
	mov r1, #0
	cmp r0, #0
	bne _020B9AF8
	ldrh r2, [r6]
	ldr r0, _020B9CB0 ; =0x0000FFFE
	cmp r2, r0
	movne r0, #1
	bne _020B9AFC
_020B9AF8:
	mov r0, #0
_020B9AFC:
	cmp r0, #0
	beq _020B9B84
	ldr r0, [r7, #0xf94]
	cmp r0, #0
	beq _020B9B64
	ldr r0, _020B9CB4 ; =0x021D9FD8
	ldrh r1, [r0, #0x90]
	ldr r0, _020B9CD8 ; =0x021DA068
	add r0, r0, r1, lsl #2
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _020B9B84
	bl sub_020B9330
	ldr r0, _020B9CB4 ; =0x021D9FD8
	ldr r2, [r7, #0xc]
	ldrh r1, [r0, #0x90]
	mov r0, r2, lsl #0x10
	mov r2, r0, lsr #0xd
	ldr r0, _020B9CBC ; =0x021D9568
	ldrh r3, [r0, r2]
	ldr r0, _020B9CD8 ; =0x021DA068
	add r2, r0, r1, lsl #2
	ldr r0, _020B9CC0 ; =0x021D9C68
	add r1, r0, r3, lsl #5
	str r1, [r2, #4]
	b _020B9B84
_020B9B64:
	bl sub_020B9330
	ldr r0, [r7, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0xd
	ldr r0, _020B9CBC ; =0x021D9568
	ldrh r1, [r0, r1]
	ldr r0, _020B9CC0 ; =0x021D9C68
	add r1, r0, r1, lsl #5
_020B9B84:
	ldr r0, [r7, #4]
	cmp r0, #0
	ldreq r2, [r7, #0xc]
	moveq r0, #0x18
	mlaeq r0, r2, r0, r8
	beq _020B9BBC
	ldr r3, [r7, #0xc]
	mov r2, #0x18
	mla sl, r3, r2, r8
	ldr r2, [sl, #0x10]
	ldr r0, _020B9CD0 ; =_021109E4
	str r2, [r6, #0x18]
	ldr r2, [sl, #0x14]
	str r2, [r6, #0x1c]
_020B9BBC:
	bl sub_020BBF34
	ldr r1, [r6, #4]
	cmp r1, r5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B9BE4
	bl sub_020BC1D4
	b _020B9BE8
_020B9BE4:
	bl sub_020BC120
_020B9BE8:
	ldr r1, [r7, #8]
	mov r0, #0
	str r0, [r1, #0x74]
	bl sub_020BC0BC
	b _020B9C98
_020B9BFC:
	mov r0, sl
	str sb, [sl, #0x74]
	bl sub_020BBF54
	mov r0, sl
	bl sub_020BBFB0
	ldr r2, [r7, #0xc]
	ldr r1, _020B9CD4 ; =0x021D94E8
	mov r0, fp
	ldr r1, [r1, r2, lsl #2]
	bl sub_020BBF4C
	ldr r0, [r7, #4]
	cmp r0, #0
	ldreq r1, [r7, #0xc]
	moveq r0, #0x18
	mlaeq r0, r1, r0, r8
	beq _020B9C5C
	ldr r2, [r7, #0xc]
	mov r1, #0x18
	mla r3, r2, r1, r8
	ldr r1, [r3, #0x10]
	ldr r0, _020B9CD0 ; =_021109E4
	str r1, [r6, #0x18]
	ldr r1, [r3, #0x14]
	str r1, [r6, #0x1c]
_020B9C5C:
	bl sub_020BBECC
	ldr r1, [r6, #4]
	cmp r1, r5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B9C84
	bl sub_020BC1D4
	b _020B9C88
_020B9C84:
	bl sub_020BC120
_020B9C88:
	ldr r1, [r7, #8]
	mov r0, #0
	str r0, [r1, #0x74]
	bl sub_020BC0BC
_020B9C98:
	ldr sb, [sb, #0x30]
	cmp sb, #0
	bne _020B9A90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B9CA8: .word 0x021D94D8
_020B9CAC: .word _021109DC
_020B9CB0: .word 0x0000FFFE
_020B9CB4: .word 0x021D9FD8
_020B9CB8: .word 0x021DA06C
_020B9CBC: .word 0x021D9568
_020B9CC0: .word 0x021D9C68
_020B9CC4: .word 0x021D9668
_020B9CC8: .word 0x021D9678
_020B9CCC: .word 0x021D967C
_020B9CD0: .word _021109E4
_020B9CD4: .word 0x021D94E8
_020B9CD8: .word 0x021DA068
	arm_func_end sub_020B988C

	arm_func_start sub_020B9CDC
sub_020B9CDC: ; 0x020B9CDC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldrh r0, [r5, #0x4e]
	ldr r4, [r5, #0x30]
	cmp r0, #0
	bne _020B9D3C
	ldr r2, [r5, #0x38]
	mvn r0, #0
	cmp r2, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020B9D30
	ldr r1, _020B9E2C ; =_021109DC
	mov r0, r4
	str r2, [r1, #4]
	bl sub_020B988C
	ldr r0, _020B9E2C ; =_021109DC
	mvn r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B9D30:
	mov r0, r4
	bl sub_020B988C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B9D3C:
	bl sub_020BA560
	ldrh r0, [r5, #0x4e]
	tst r0, #8
	beq _020B9D8C
	ldr r0, _020B9E30 ; =0x021D94D8
	ldrsh r7, [r5, #0x4a]
	ldr r0, [r0, #8]
	ldrsh r6, [r5, #0x48]
	bl sub_020BBF5C
	cmp r0, #0
	ldr r0, _020B9E30 ; =0x021D94D8
	rsbne r6, r6, #0
	ldr r0, [r0, #8]
	bl sub_020BBF70
	cmp r0, #0
	rsbne r7, r7, #0
	mov r0, r6, lsl #0xc
	mov r1, r7, lsl #0xc
	mov r2, #0
	bl sub_020BA7D4
_020B9D8C:
	ldrh r0, [r5, #0x4e]
	tst r0, #4
	beq _020B9DC0
	ldrh r0, [r5, #0x4c]
	ldr r2, _020B9E34 ; =0x021094DC
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	add r0, r1, #1
	mov r3, r1, lsl #1
	mov r1, r0, lsl #1
	ldrsh r0, [r2, r3]
	ldrsh r1, [r2, r1]
	bl sub_020BAA24
_020B9DC0:
	ldrh r0, [r5, #0x4e]
	tst r0, #2
	beq _020B9DDC
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	mov r2, #0x1000
	bl sub_020BA8D0
_020B9DDC:
	ldr r2, [r5, #0x38]
	mvn r0, #0
	cmp r2, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020B9E18
	ldr r1, _020B9E2C ; =_021109DC
	mov r0, r4
	str r2, [r1, #4]
	bl sub_020B988C
	ldr r0, _020B9E2C ; =_021109DC
	mvn r1, #0
	str r1, [r0, #4]
	b _020B9E20
_020B9E18:
	mov r0, r4
	bl sub_020B988C
_020B9E20:
	mov r0, #1
	bl sub_020BA784
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B9E2C: .word _021109DC
_020B9E30: .word 0x021D94D8
_020B9E34: .word 0x021094DC
	arm_func_end sub_020B9CDC

	arm_func_start sub_020B9E38
sub_020B9E38: ; 0x020B9E38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r5]
	bl sub_020BA560
	ldrh r0, [r5, #0x1e]
	tst r0, #8
	beq _020B9EA0
	ldr r0, _020B9F04 ; =0x021D94D8
	ldrsh r7, [r5, #0x1a]
	ldr r0, [r0, #8]
	ldrsh r6, [r5, #0x18]
	bl sub_020BBF5C
	cmp r0, #0
	ldr r0, _020B9F04 ; =0x021D94D8
	rsbne r6, r6, #0
	ldr r0, [r0, #8]
	bl sub_020BBF70
	cmp r0, #0
	rsbne r7, r7, #0
	mov r0, r6, lsl #0xc
	mov r1, r7, lsl #0xc
	mov r2, #0
	bl sub_020BA7D4
_020B9EA0:
	ldrh r0, [r5, #0x1e]
	tst r0, #4
	beq _020B9ED4
	ldrh r0, [r5, #0x1c]
	ldr r2, _020B9F08 ; =0x021094DC
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	add r0, r1, #1
	mov r3, r1, lsl #1
	mov r1, r0, lsl #1
	ldrsh r0, [r2, r3]
	ldrsh r1, [r2, r1]
	bl sub_020BAA24
_020B9ED4:
	ldrh r0, [r5, #0x1e]
	tst r0, #2
	beq _020B9EF0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	mov r2, #0x1000
	bl sub_020BA8D0
_020B9EF0:
	mov r0, r4
	bl sub_020B9CDC
	mov r0, #1
	bl sub_020BA784
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B9F04: .word 0x021D94D8
_020B9F08: .word 0x021094DC
	arm_func_end sub_020B9E38

	arm_func_start sub_020B9F0C
sub_020B9F0C: ; 0x020B9F0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_020BBE6C
	mov r6, #0
	str r6, [r4, #0x70]
	str r6, [r4, #0x74]
	str r6, [r4, #0x78]
	str r6, [r4, #0x7c]
	str r6, [r4, #0x80]
	str r6, [r4, #0x84]
	strh r6, [r4, #0x88]
	strh r6, [r4, #0x8a]
	str r6, [r4, #0x8c]
	str r6, [r4, #0x90]
	strh r6, [r4, #0x94]
	ldr r1, _020B9FB4 ; =0x021D94D8
	ldr r2, _020B9FB8 ; =0x0000FFFE
	ldr r0, _020B9FBC ; =_021109DC
	ldr r7, _020B9FC0 ; =0x021D9C68
	str r6, [r1, #0xc]
	strh r2, [r0]
	mvn r5, #0
	mov r4, #0x10
_020B9F68:
	mov r0, r5
	mov r2, r4
	add r1, r7, #0x10
	bl sub_020D4858
	add r6, r6, #1
	cmp r6, #0x20
	add r7, r7, #0x20
	blt _020B9F68
	ldr r3, _020B9FB4 ; =0x021D94D8
	mov r0, #0
	strh r0, [r3]
	ldr r1, _020B9FC4 ; =0x021D9568
	mov r2, #0x100
	strh r0, [r3, #2]
	bl sub_020D4858
	ldr r0, _020B9FB4 ; =0x021D94D8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B9FB4: .word 0x021D94D8
_020B9FB8: .word 0x0000FFFE
_020B9FBC: .word _021109DC
_020B9FC0: .word 0x021D9C68
_020B9FC4: .word 0x021D9568
	arm_func_end sub_020B9F0C

	arm_func_start sub_020B9FC8
sub_020B9FC8: ; 0x020B9FC8
	ldr r2, [r0, #0x70]
	str r2, [r1, #0x30]
	str r1, [r0, #0x70]
	bx lr
	arm_func_end sub_020B9FC8

	arm_func_start sub_020B9FD8
sub_020B9FD8: ; 0x020B9FD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	mov r2, #0x48
	bl sub_020D4790
	mov r0, #1
	str r0, [r4, #0x10]
	mov r0, #3
	ldr r1, _020BA024 ; =sub_020B9474
	str r0, [r4, #0x14]
	ldr r0, _020BA028 ; =sub_020B9588
	str r1, [r4, #0x18]
	ldr r1, _020BA02C ; =sub_020B960C
	str r0, [r4, #0x1c]
	ldr r0, _020BA030 ; =sub_020B97F8
	str r1, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BA024: .word sub_020B9474
_020BA028: .word sub_020B9588
_020BA02C: .word sub_020B960C
_020BA030: .word sub_020B97F8
	arm_func_end sub_020B9FD8

	arm_func_start sub_020BA034
sub_020BA034: ; 0x020BA034
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _020BA0C4 ; =0x021D94D8
	mov r4, #0
	str r0, [r5, #8]
	ldr r1, _020BA0C8 ; =0x0000FFFE
	ldr r0, _020BA0CC ; =_021109DC
	str r4, [r5, #0xc]
	strh r1, [r0]
	ldrh r0, [r5]
	cmp r0, #0
	ble _020BA090
	ldr r8, _020BA0D0 ; =0x021D9C68
	mvn r7, #0
	mov r6, #0x10
_020BA06C:
	mov r0, r7
	mov r2, r6
	add r1, r8, #0x10
	bl sub_020D4858
	ldrh r0, [r5]
	add r4, r4, #1
	add r8, r8, #0x20
	cmp r4, r0
	blt _020BA06C
_020BA090:
	ldr r3, _020BA0C4 ; =0x021D94D8
	mov r0, #0
	strh r0, [r3]
	ldr r1, _020BA0D4 ; =0x021D9568
	mov r2, #0x100
	strh r0, [r3, #2]
	bl sub_020D4858
	ldr r0, _020BA0D8 ; =0x04000444
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0x10]
	bl sub_020B9290
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BA0C4: .word 0x021D94D8
_020BA0C8: .word 0x0000FFFE
_020BA0CC: .word _021109DC
_020BA0D0: .word 0x021D9C68
_020BA0D4: .word 0x021D9568
_020BA0D8: .word 0x04000444
	arm_func_end sub_020BA034

	arm_func_start sub_020BA0DC
sub_020BA0DC: ; 0x020BA0DC
	stmdb sp!, {r3, lr}
	ldr r1, _020BA140 ; =0x04000448
	mov r2, #1
	ldr r0, _020BA144 ; =0x021D94D8
	str r2, [r1]
	ldr r3, [r0, #8]
	ldr r2, [r3, #0x7c]
	cmp r2, #0
	beq _020BA130
	tst r2, #1
	movne r1, #0
	strne r1, [r0, #4]
	tst r2, #2
	beq _020BA120
	mov r0, #0
	str r0, [r3, #0x74]
	bl sub_020BC0BC
_020BA120:
	ldr r0, _020BA144 ; =0x021D94D8
	mov r1, #0
	ldr r0, [r0, #8]
	str r1, [r0, #0x7c]
_020BA130:
	ldr r0, _020BA144 ; =0x021D94D8
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BA140: .word 0x04000448
_020BA144: .word 0x021D94D8
	arm_func_end sub_020BA0DC

	arm_func_start sub_020BA148
sub_020BA148: ; 0x020BA148
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020BA1AC ; =0x021D94D8
	mov r5, r0
	ldr r1, [r1, #8]
	ldr r1, [r1, #0x80]
	cmp r1, #0
	beq _020BA1A4
	bl sub_020BB224
	mov r4, r0
	mov r0, #1
	bl sub_020BB1F0
	ldr r0, _020BA1AC ; =0x021D94D8
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	bl sub_020BB214
	mov r0, r5
	bl sub_020B9CDC
	mov r0, #0
	bl sub_020BB1F0
	mov r0, r4
	bl sub_020BB214
	bl sub_020BB200
	ldmia sp!, {r3, r4, r5, pc}
_020BA1A4:
	bl sub_020B9CDC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BA1AC: .word 0x021D94D8
	arm_func_end sub_020BA148

	arm_func_start sub_020BA1B0
sub_020BA1B0: ; 0x020BA1B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _020BA3AC
	ldr r0, [r5]
	mov r2, #0
	ldrh r0, [r0, #2]
	cmp r0, #0
	bls _020BA204
	ldr r3, _020BA478 ; =0x021DA068
	mov r4, r2
_020BA1E0:
	add r0, r3, r2, lsl #2
	str r4, [r0, #4]
	ldr r0, [r5]
	add r2, r2, #1
	ldrh r1, [r0, #2]
	mov r0, r2, lsl #0x10
	mov r2, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA1E0
_020BA204:
	ldr r6, _020BA47C ; =0x021D94D8
	mov r0, #1
	str r0, [r6, #0xf94]
	ldr r0, [r6, #8]
	mov sl, #0
	ldr r0, [r0, #0x80]
	cmp r0, #0
	beq _020BA2FC
	bl sub_020BB224
	str r0, [sp]
	mov r0, #1
	bl sub_020BB1F0
	mov r0, r6
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	bl sub_020BB214
	ldr r2, [r5]
	ldrh r0, [r2]
	cmp r0, #0
	bls _020BA2E4
	ldr fp, _020BA480 ; =0x021D9FD8
_020BA258:
	ldr r0, [r2, #4]
	ldr r8, [r5, #0xc]
	add r7, r0, sl, lsl #3
	ldrh r0, [r7, #6]
	and r0, r0, #0xff00
	mov r0, r0, lsl #8
	mov sb, r0, lsr #0x10
	strh sb, [fp, #0x90]
	bl sub_020BA560
	ldrsh r4, [r7, #4]
	ldr r0, [r6, #8]
	ldrsh r7, [r7, #2]
	bl sub_020BBF5C
	cmp r0, #0
	ldr r0, [r6, #8]
	rsbne r7, r7, #0
	bl sub_020BBF70
	cmp r0, #0
	rsbne r4, r4, #0
	mov r2, #0
	mov r0, r7, lsl #0xc
	mov r1, r4, lsl #0xc
	bl sub_020BA7D4
	mov r0, #0x5c
	mla r0, sb, r0, r8
	bl sub_020B9CDC
	mov r0, #1
	bl sub_020BA784
	ldr r2, [r5]
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r2]
	mov sl, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA258
_020BA2E4:
	mov r0, #0
	bl sub_020BB1F0
	ldr r0, [sp]
	bl sub_020BB214
	bl sub_020BB200
	b _020BA39C
_020BA2FC:
	ldr r2, [r5]
	ldrh r0, [r2]
	cmp r0, #0
	bls _020BA39C
	ldr fp, _020BA480 ; =0x021D9FD8
_020BA310:
	ldr r0, [r2, #4]
	ldr r8, [r5, #0xc]
	add r7, r0, sl, lsl #3
	ldrh r0, [r7, #6]
	and r0, r0, #0xff00
	mov r0, r0, lsl #8
	mov sb, r0, lsr #0x10
	strh sb, [fp, #0x90]
	bl sub_020BA560
	ldrsh r4, [r7, #4]
	ldr r0, [r6, #8]
	ldrsh r7, [r7, #2]
	bl sub_020BBF5C
	cmp r0, #0
	ldr r0, [r6, #8]
	rsbne r7, r7, #0
	bl sub_020BBF70
	cmp r0, #0
	rsbne r4, r4, #0
	mov r2, #0
	mov r0, r7, lsl #0xc
	mov r1, r4, lsl #0xc
	bl sub_020BA7D4
	mov r0, #0x5c
	mla r0, sb, r0, r8
	bl sub_020B9CDC
	mov r0, #1
	bl sub_020BA784
	ldr r2, [r5]
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r2]
	mov sl, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA310
_020BA39C:
	ldr r0, _020BA47C ; =0x021D94D8
	mov r1, #0
	str r1, [r0, #0xf94]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BA3AC:
	ldr r0, _020BA47C ; =0x021D94D8
	ldr r4, [r5, #0xc]
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	cmp r0, #0
	beq _020BA438
	bl sub_020BB224
	mov r6, r0
	mov r0, #1
	bl sub_020BB1F0
	ldr r0, _020BA47C ; =0x021D94D8
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	bl sub_020BB214
	ldr r0, [r5]
	mov r7, #0
	ldrh r0, [r0]
	cmp r0, #0
	bls _020BA420
	mov r8, #0x28
_020BA3FC:
	mla r0, r7, r8, r4
	bl sub_020B9E38
	ldr r1, [r5]
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1]
	mov r7, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA3FC
_020BA420:
	mov r0, #0
	bl sub_020BB1F0
	mov r0, r6
	bl sub_020BB214
	bl sub_020BB200
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BA438:
	ldr r0, [r5]
	mov r6, #0
	ldrh r0, [r0]
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r7, #0x28
_020BA450:
	mla r0, r6, r7, r4
	bl sub_020B9E38
	ldr r1, [r5]
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1]
	mov r6, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA450
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BA478: .word 0x021DA068
_020BA47C: .word 0x021D94D8
_020BA480: .word 0x021D9FD8
	arm_func_end sub_020BA1B0

	arm_func_start sub_020BA484
sub_020BA484: ; 0x020BA484
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrh r0, [r4, #0x5a]
	cmp r0, #0
	bne _020BA4A4
	add r0, r4, #0x34
	bl sub_020BA1B0
	ldmia sp!, {r4, r5, r6, pc}
_020BA4A4:
	bl sub_020BA560
	ldrh r0, [r4, #0x5a]
	tst r0, #8
	beq _020BA4F4
	ldr r0, _020BA558 ; =0x021D94D8
	ldrsh r6, [r4, #0x56]
	ldr r0, [r0, #8]
	ldrsh r5, [r4, #0x54]
	bl sub_020BBF5C
	cmp r0, #0
	ldr r0, _020BA558 ; =0x021D94D8
	rsbne r5, r5, #0
	ldr r0, [r0, #8]
	bl sub_020BBF70
	cmp r0, #0
	rsbne r6, r6, #0
	mov r0, r5, lsl #0xc
	mov r1, r6, lsl #0xc
	mov r2, #0
	bl sub_020BA7D4
_020BA4F4:
	ldrh r0, [r4, #0x5a]
	tst r0, #4
	beq _020BA528
	ldrh r0, [r4, #0x58]
	ldr r2, _020BA55C ; =0x021094DC
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	add r0, r1, #1
	mov r3, r1, lsl #1
	mov r1, r0, lsl #1
	ldrsh r0, [r2, r3]
	ldrsh r1, [r2, r1]
	bl sub_020BAA24
_020BA528:
	ldrh r0, [r4, #0x5a]
	tst r0, #2
	beq _020BA544
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	mov r2, #0x1000
	bl sub_020BA8D0
_020BA544:
	add r0, r4, #0x34
	bl sub_020BA1B0
	mov r0, #1
	bl sub_020BA784
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BA558: .word 0x021D94D8
_020BA55C: .word 0x021094DC
	arm_func_end sub_020BA484

	arm_func_start sub_020BA560
sub_020BA560: ; 0x020BA560
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _020BA764 ; =0x021D94D8
	ldr r1, [r0, #8]
	ldr r1, [r1, #0x7c]
	tst r1, #1
	bne _020BA6A0
	ldr r1, [r0, #0xc]
	mov r0, r1, lsl #0x10
	add r6, r1, #1
	cmp r6, #0x20
	mov r5, r0, lsr #0x10
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	beq _020BA640
	ldr r0, _020BA764 ; =0x021D94D8
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020BA5E4
	ldr r3, [r0, #0xc]
	mov r0, #0x18
	mul r8, r3, r0
	ldr r4, _020BA768 ; =0x021D9678
	ldr r1, _020BA76C ; =0x021D94E8
	mul r7, r6, r0
	ldr r2, [r4, r8]
	ldr r0, [r1, r3, lsl #2]
	ldr r3, _020BA770 ; =0x021D967C
	str r2, [r4, r7]
	ldr r2, [r3, r8]
	str r0, [r1, r6, lsl #2]
	str r2, [r3, r7]
	b _020BA638
_020BA5E4:
	ldr r4, [r0, #0xc]
	mov r0, #0x18
	mul lr, r4, r0
	ldr r1, _020BA774 ; =0x021D9668
	mul ip, r6, r0
	ldr r8, _020BA778 ; =0x021D9968
	add sl, r1, lr
	ldr r7, _020BA76C ; =0x021D94E8
	add sb, r1, ip
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1}
	stmia sb, {r0, r1}
	add sb, r8, lr
	ldr r4, [r7, r4, lsl #2]
	add r8, r8, ip
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	str r4, [r7, r6, lsl #2]
	ldmia sb, {r0, r1}
	stmia r8, {r0, r1}
_020BA638:
	ldr r0, _020BA764 ; =0x021D94D8
	str r6, [r0, #0xc]
_020BA640:
	ldr r0, _020BA764 ; =0x021D94D8
	ldr r2, _020BA77C ; =0x021D9568
	ldr r0, [r0, #0xc]
	mov r6, r5, lsl #3
	mov r0, r0, lsl #0x10
	add r4, r2, r5, lsl #3
	mov r3, r0, lsr #0x10
	mov r5, r3, lsl #3
	ldrh r1, [r2, r6]
	ldrh r0, [r4, #2]
	add r3, r2, r3, lsl #3
	strh r1, [r2, r5]
	strh r0, [r3, #2]
	ldrh r2, [r4, #4]
	ldrh r0, [r4, #6]
	ldr r1, _020BA780 ; =0x021D956C
	strh r2, [r3, #4]
	strh r0, [r3, #6]
	ldrh r0, [r1, r6]
	cmp r0, #1
	moveq r0, #2
	streqh r0, [r1, r5]
	strneh r0, [r1, r5]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020BA6A0:
	ldr r0, [r0, #0xc]
	add r4, r0, #1
	cmp r4, #0x20
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _020BA764 ; =0x021D94D8
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020BA704
	ldr r3, [r0, #0xc]
	mov r0, #0x18
	mul r7, r3, r0
	ldr r5, _020BA768 ; =0x021D9678
	ldr r1, _020BA76C ; =0x021D94E8
	mul r6, r4, r0
	ldr r2, [r5, r7]
	ldr r0, [r1, r3, lsl #2]
	ldr r3, _020BA770 ; =0x021D967C
	str r2, [r5, r6]
	ldr r2, [r3, r7]
	str r0, [r1, r4, lsl #2]
	str r2, [r3, r6]
	b _020BA758
_020BA704:
	ldr sb, [r0, #0xc]
	mov r0, #0x18
	mul lr, sb, r0
	ldr r1, _020BA774 ; =0x021D9668
	mul r8, r4, r0
	ldr ip, _020BA778 ; =0x021D9968
	add r5, r1, lr
	ldr r6, _020BA76C ; =0x021D94E8
	add r7, r1, r8
	ldmia r5!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1}
	ldr r5, [r6, sb, lsl #2]
	add lr, ip, lr
	stmia r7, {r0, r1}
	add ip, ip, r8
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	str r5, [r6, r4, lsl #2]
_020BA758:
	ldr r0, _020BA764 ; =0x021D94D8
	str r4, [r0, #0xc]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BA764: .word 0x021D94D8
_020BA768: .word 0x021D9678
_020BA76C: .word 0x021D94E8
_020BA770: .word 0x021D967C
_020BA774: .word 0x021D9668
_020BA778: .word 0x021D9968
_020BA77C: .word 0x021D9568
_020BA780: .word 0x021D956C
	arm_func_end sub_020BA560

	arm_func_start sub_020BA784
sub_020BA784: ; 0x020BA784
	ldr r0, _020BA7C8 ; =0x021D94D8
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	bxne lr
	ldr r1, _020BA7C8 ; =0x021D94D8
	ldr r0, _020BA7CC ; =_021109DC
	ldr r3, [r1, #0xc]
	ldrh r2, [r0]
	sub r3, r3, #1
	str r3, [r1, #0xc]
	cmp r2, r3
	ldrgt r1, _020BA7D0 ; =0x0000FFFE
	strgth r1, [r0]
	bx lr
	.align 2, 0
_020BA7C8: .word 0x021D94D8
_020BA7CC: .word _021109DC
_020BA7D0: .word 0x0000FFFE
	arm_func_end sub_020BA784

	arm_func_start sub_020BA7D4
sub_020BA7D4: ; 0x020BA7D4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, _020BA8B8 ; =0x021D94D8
	mov r4, r2
	ldr r2, [r3, #4]
	cmp r2, #0
	beq _020BA834
	ldr r2, [r3, #0xc]
	mov r3, #0x18
	mul r6, r2, r3
	ldr r5, _020BA8BC ; =0x021D9678
	ldr r3, _020BA8C0 ; =0x021D94E8
	ldr ip, [r5, r6]
	ldr lr, _020BA8C4 ; =0x021D967C
	add r0, ip, r0
	str r0, [r5, r6]
	ldr r0, [r3, r2, lsl #2]
	ldr ip, [lr, r6]
	add r0, r0, r4
	add r1, ip, r1
	str r0, [r3, r2, lsl #2]
	add sp, sp, #0x18
	str r1, [lr, r6]
	ldmia sp!, {r4, r5, r6, pc}
_020BA834:
	mov ip, #0x1000
	mov r2, #0
	str r0, [sp, #0x10]
	str ip, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str ip, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r1, [r3, #0xc]
	mov r0, #0x18
	mul r3, r1, r0
	ldr r2, _020BA8C8 ; =0x021D9668
	add r0, sp, #0
	add r1, r2, r3
	add r2, r2, r3
	bl sub_020BAB58
	ldr r1, _020BA8B8 ; =0x021D94D8
	mov r0, #0x18
	ldr r1, [r1, #0xc]
	ldr r2, _020BA8CC ; =0x021D9968
	mul r3, r1, r0
	add r1, r2, r3
	add r0, sp, #0
	add r2, r2, r3
	bl sub_020BAB58
	ldr r0, _020BA8B8 ; =0x021D94D8
	ldr r2, _020BA8C0 ; =0x021D94E8
	ldr r1, [r0, #0xc]
	ldr r0, [r2, r1, lsl #2]
	add r0, r0, r4
	str r0, [r2, r1, lsl #2]
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BA8B8: .word 0x021D94D8
_020BA8BC: .word 0x021D9678
_020BA8C0: .word 0x021D94E8
_020BA8C4: .word 0x021D967C
_020BA8C8: .word 0x021D9668
_020BA8CC: .word 0x021D9968
	arm_func_end sub_020BA7D4

	arm_func_start sub_020BA8D0
sub_020BA8D0: ; 0x020BA8D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	ldr r2, _020BAA0C ; =0x021D94D8
	mov lr, #0
	ldr r3, [r2, #0xc]
	mov r2, #0x18
	mul ip, r3, r2
	mov r5, r0
	mov r4, r1
	ldr r2, _020BAA10 ; =0x021D9668
	add r0, sp, #0
	add r1, r2, ip
	add r2, r2, ip
	str r5, [sp]
	str lr, [sp, #4]
	str lr, [sp, #8]
	str r4, [sp, #0xc]
	str lr, [sp, #0x10]
	str lr, [sp, #0x14]
	bl sub_020BAB58
	mov r0, r5
	bl sub_020CCBB0
	mov r1, #0
	str r0, [sp]
	mov r0, r4
	str r1, [sp, #4]
	str r1, [sp, #8]
	bl sub_020CCBB0
	mov ip, #0
	ldr r1, _020BAA0C ; =0x021D94D8
	str r0, [sp, #0xc]
	ldr r1, [r1, #0xc]
	mov r0, #0x18
	mul r3, r1, r0
	ldr r2, _020BAA14 ; =0x021D9968
	add r0, sp, #0
	add r1, r2, r3
	add r2, r2, r3
	str ip, [sp, #0x10]
	str ip, [sp, #0x14]
	bl sub_020BAB58
	ldr r0, _020BAA0C ; =0x021D94D8
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020BA99C
	ldr r1, _020BAA18 ; =_021109DC
	ldr r0, _020BAA1C ; =0x0000FFFE
	ldrh r1, [r1]
	cmp r1, r0
	movne r0, #1
	bne _020BA9A0
_020BA99C:
	mov r0, #0
_020BA9A0:
	cmp r0, #0
	bne _020BA9B8
	ldr r1, _020BAA0C ; =0x021D94D8
	ldr r0, _020BAA18 ; =_021109DC
	ldr r1, [r1, #0xc]
	strh r1, [r0]
_020BA9B8:
	ldr r1, _020BAA0C ; =0x021D94D8
	ldr r2, _020BAA20 ; =0x021D9568
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x10
	add ip, r2, r0, lsr #13
	ldrh r0, [ip, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BAA04
_020BA9DC: ; jump table
	b _020BA9EC ; case 0
	b _020BAA04 ; case 1
	b _020BA9EC ; case 2
	b _020BA9EC ; case 3
_020BA9EC:
	ldrh r3, [r1, #2]
	mov r0, #1
	add r2, r3, #1
	strh r2, [r1, #2]
	strh r3, [ip, #2]
	strh r0, [ip, #4]
_020BAA04:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BAA0C: .word 0x021D94D8
_020BAA10: .word 0x021D9668
_020BAA14: .word 0x021D9968
_020BAA18: .word _021109DC
_020BAA1C: .word 0x0000FFFE
_020BAA20: .word 0x021D9568
	arm_func_end sub_020BA8D0

	arm_func_start sub_020BAA24
sub_020BAA24: ; 0x020BAA24
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr r2, _020BAB2C ; =0x021D94D8
	mov lr, #0
	ldr r3, [r2, #0xc]
	mov r2, #0x18
	mul ip, r3, r2
	rsb r3, r0, #0
	str r0, [sp, #4]
	ldr r2, _020BAB30 ; =0x021D9668
	add r0, sp, #0
	str r1, [sp]
	str r1, [sp, #0xc]
	add r1, r2, ip
	add r2, r2, ip
	str r3, [sp, #8]
	str lr, [sp, #0x10]
	str lr, [sp, #0x14]
	bl sub_020BAB58
	ldr r1, _020BAB2C ; =0x021D94D8
	mov r0, #0x18
	ldr r1, [r1, #0xc]
	ldr r2, _020BAB34 ; =0x021D9968
	mul r3, r1, r0
	add r1, r2, r3
	add r0, sp, #0
	add r2, r2, r3
	bl sub_020BAB58
	ldr r0, _020BAB2C ; =0x021D94D8
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020BAABC
	ldr r1, _020BAB38 ; =_021109DC
	ldr r0, _020BAB3C ; =0x0000FFFE
	ldrh r1, [r1]
	cmp r1, r0
	movne r0, #1
	bne _020BAAC0
_020BAABC:
	mov r0, #0
_020BAAC0:
	cmp r0, #0
	bne _020BAAD8
	ldr r1, _020BAB2C ; =0x021D94D8
	ldr r0, _020BAB38 ; =_021109DC
	ldr r1, [r1, #0xc]
	strh r1, [r0]
_020BAAD8:
	ldr r1, _020BAB2C ; =0x021D94D8
	ldr r2, _020BAB40 ; =0x021D9568
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x10
	add ip, r2, r0, lsr #13
	ldrh r0, [ip, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BAB24
_020BAAFC: ; jump table
	b _020BAB0C ; case 0
	b _020BAB24 ; case 1
	b _020BAB0C ; case 2
	b _020BAB0C ; case 3
_020BAB0C:
	ldrh r3, [r1, #2]
	mov r0, #1
	add r2, r3, #1
	strh r2, [r1, #2]
	strh r3, [ip, #2]
	strh r0, [ip, #4]
_020BAB24:
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BAB2C: .word 0x021D94D8
_020BAB30: .word 0x021D9668
_020BAB34: .word 0x021D9968
_020BAB38: .word _021109DC
_020BAB3C: .word 0x0000FFFE
_020BAB40: .word 0x021D9568
	arm_func_end sub_020BAA24

	arm_func_start sub_020BAB44
sub_020BAB44: ; 0x020BAB44
	ldr r0, [r0, #0x78]
	bx lr
	arm_func_end sub_020BAB44

	arm_func_start sub_020BAB4C
sub_020BAB4C: ; 0x020BAB4C
	ldr ip, _020BAB54 ; =sub_020BBEAC
	bx ip
	.align 2, 0
_020BAB54: .word sub_020BBEAC
	arm_func_end sub_020BAB4C

	arm_func_start sub_020BAB58
sub_020BAB58: ; 0x020BAB58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	ldr r4, [r0, #4]
	ldr r3, [r1, #8]
	mov ip, r2
	smull r6, r5, r4, r3
	ldr r4, [r0]
	ldr r3, [r1]
	cmp ip, r1
	smlal r6, r5, r4, r3
	mov r3, r6, lsr #0xc
	addeq r2, sp, #0
	orr r3, r3, r5, lsl #20
	str r3, [r2]
	ldr r4, [r0, #4]
	ldr r3, [r1, #0xc]
	ldr r5, [r0]
	smull r7, r6, r4, r3
	ldr r3, [r1, #4]
	add lr, sp, #0
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [r2, #4]
	ldr r4, [r0, #0xc]
	ldr r3, [r1, #8]
	ldr r5, [r0, #8]
	smull r7, r6, r4, r3
	ldr r3, [r1]
	cmp r2, lr
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [r2, #8]
	ldr r4, [r0, #0xc]
	ldr r3, [r1, #0xc]
	ldr r5, [r0, #8]
	smull r7, r6, r4, r3
	ldr r3, [r1, #4]
	addne sp, sp, #0x18
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [r2, #0xc]
	ldr r4, [r0, #0x14]
	ldr r3, [r1, #8]
	ldr r5, [r0, #0x10]
	smull r7, r6, r4, r3
	ldr r3, [r1]
	ldr r4, [r1, #0x10]
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	add r3, r4, r3
	str r3, [r2, #0x10]
	ldr r4, [r0, #0x14]
	ldr r3, [r1, #0xc]
	ldr r5, [r0, #0x10]
	ldr r0, [r1, #4]
	smull r6, r3, r4, r3
	smlal r6, r3, r5, r0
	mov r0, r6, lsr #0xc
	ldr r1, [r1, #0x14]
	orr r0, r0, r3, lsl #20
	add r0, r1, r0
	str r0, [r2, #0x14]
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020BAB58

	arm_func_start sub_020BAC7C
sub_020BAC7C: ; 0x020BAC7C
	ldr r2, _020BAC90 ; =0x021DA470
	mov r1, #0x30
	ldr r2, [r2, #8]
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_020BAC90: .word 0x021DA470
	arm_func_end sub_020BAC7C

	arm_func_start sub_020BAC94
sub_020BAC94: ; 0x020BAC94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _020BAD34 ; =0x021DA470
	mov r4, #0x30
	ldr ip, [ip, #8]
	mov r7, r1
	mla r4, r0, r4, ip
	mov r0, r4
	mov r6, r2
	mov r5, r3
	bl sub_020B8928
	mvn r0, #0
	cmp r7, r0
	beq _020BACD8
	mov r0, r4
	mov r2, r7
	mov r1, #0
	bl sub_020B8944
_020BACD8:
	mvn r0, #0
	cmp r6, r0
	beq _020BACF4
	mov r0, r4
	mov r2, r6
	mov r1, #1
	bl sub_020B8944
_020BACF4:
	mvn r0, #0
	cmp r5, r0
	beq _020BAD10
	mov r0, r4
	mov r2, r5
	mov r1, #2
	bl sub_020B8944
_020BAD10:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #0xc]
	ldr r1, [sp, #0x20]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x24]
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020BAD34: .word 0x021DA470
	arm_func_end sub_020BAC94

	arm_func_start sub_020BAD38
sub_020BAD38: ; 0x020BAD38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020BAD98 ; =0x021DA470
	movs r6, r1
	mov r7, r0
	mov r5, #0
	stmia r3, {r2, r6, r7}
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r4, r5
_020BAD58:
	mov r0, r7
	bl sub_020B8928
	str r4, [r7, #0xc]
	str r4, [r7, #0x10]
	str r4, [r7, #0x14]
	str r4, [r7, #0x18]
	str r4, [r7, #0x1c]
	str r4, [r7, #0x20]
	str r4, [r7, #0x24]
	str r4, [r7, #0x28]
	add r5, r5, #1
	str r4, [r7, #0x2c]
	cmp r5, r6
	add r7, r7, #0x30
	blo _020BAD58
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020BAD98: .word 0x021DA470
	arm_func_end sub_020BAD38

	arm_func_start sub_020BAD9C
sub_020BAD9C: ; 0x020BAD9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r1, _020BAEB8 ; =0x021DA470
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	addls sp, sp, #8
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	str r0, [sp]
_020BADC8:
	ldr r4, _020BAEB8 ; =0x021DA470
	ldr r0, [sp]
	ldr r1, [r4, #8]
	add r8, r1, r0
	ldr r0, [r8, #0x1c]
	cmp r0, #0
	beq _020BAE84
	mov r7, #0
	cmp r7, #3
	bge _020BAE7C
	ldr r5, _020BAEBC ; =0x02109328
	mov fp, r7
	mov r6, #1
_020BADFC:
	ldr r0, [r8, #0x24]
	mov r1, fp
	tst r0, r6, lsl r7
	beq _020BAE18
	ldr r0, [r8, #0x20]
	tst r0, r6, lsl r7
	movne r1, r6
_020BAE18:
	cmp r1, #0
	beq _020BAE70
	cmp r7, #0
	ldreq sl, [r8, #0x14]
	ldr sb, [r5, r7, lsl #2]
	mov r0, r8
	mov r1, r7
	ldrne sl, [r8, #0x10]
	bl sub_020B894C
	ldr r2, [r8, #0x28]
	mov r1, r0
	mov r0, sb
	ldr r3, [r8, #0x2c]
	ldr sb, [r4]
	add r2, sl, r2
	blx sb
	cmp r0, #0
	beq _020BAE70
	mvn r0, r6, lsl r7
	ldr r1, [r8, #0x24]
	and r0, r1, r0
	str r0, [r8, #0x24]
_020BAE70:
	add r7, r7, #1
	cmp r7, #3
	blt _020BADFC
_020BAE7C:
	mov r0, #0
	str r0, [r8, #0x20]
_020BAE84:
	ldr r0, [sp, #4]
	ldr r1, _020BAEB8 ; =0x021DA470
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	add r0, r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	cmp r0, r1
	blo _020BADC8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BAEB8: .word 0x021DA470
_020BAEBC: .word 0x02109328
	arm_func_end sub_020BAD9C

	arm_func_start sub_020BAEC0
sub_020BAEC0: ; 0x020BAEC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl sub_020BAC7C
	mvn r1, #0
	str r1, [r0, #0x24]
	str r5, [r0, #0x28]
	str r4, [r0, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BAEC0

	arm_func_start sub_020BAEE4
sub_020BAEE4: ; 0x020BAEE4
	ldr r1, _020BAF38 ; =0x021DA470
	mov r0, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	bls _020BAF30
	ldr ip, [r1, #8]
	mov r2, ip
_020BAF00:
	ldr r1, [r2, #0x1c]
	cmp r1, #1
	beq _020BAF20
	mov r1, #0x30
	mla r1, r0, r1, ip
	mov r2, #1
	str r2, [r1, #0x1c]
	bx lr
_020BAF20:
	add r0, r0, #1
	cmp r0, r3
	add r2, r2, #0x30
	blo _020BAF00
_020BAF30:
	mvn r0, #0
	bx lr
	.align 2, 0
_020BAF38: .word 0x021DA470
	arm_func_end sub_020BAEE4

	arm_func_start sub_020BAF3C
sub_020BAF3C: ; 0x020BAF3C
	stmdb sp!, {r4, lr}
	ldr r2, _020BAF84 ; =0x021DA470
	mov r1, #0x30
	ldr r2, [r2, #8]
	mla r4, r0, r1, r2
	mov r0, r4
	bl sub_020B8928
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BAF84: .word 0x021DA470
	arm_func_end sub_020BAF3C

	arm_func_start sub_020BAF88
sub_020BAF88: ; 0x020BAF88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r0
	ldr r0, _020BB1C8 ; =0xC000C000
	ldmia r6, {r4, r5}
	and r0, r4, r0
	and r4, r0, #0xc0000000
	mov lr, r4, lsr #0x1e
	and r0, r0, #0xc000
	mov r5, r5, lsl #0x16
	mov ip, r0, asr #0xe
	mov r5, r5, lsr #0x16
	ldr r4, _020BB1CC ; =0x02109310
	mov r7, r5, lsl #0x10
	ldr r0, _020BB1D0 ; =0x021092F8
	add r5, r4, ip, lsl #3
	mov r8, lr, lsl #1
	add r4, r0, ip, lsl #3
	ldrh r5, [r8, r5]
	ldr r0, [sp, #0x20]
	ldrh r4, [r8, r4]
	str r5, [r0, #0x10]
	mov r5, r1
	str r4, [r0, #0x14]
	ldr r8, [r5, #0x14]
	mov r4, r3
	cmp r8, #0
	mov r1, r7, lsr #0x10
	bne _020BB068
	ldr r3, [r5, #8]
	ldr r7, [r5]
	mov r3, r3, lsl #0x1a
	orr r2, r3, r2, lsr #3
	orr r2, r2, #0x40000000
	orr r2, r2, r7, lsl #20
	ldr r3, [r5, #4]
	ldr r7, [r5, #0x10]
	orr r3, r2, r3, lsl #23
	ldr r2, _020BB1D4 ; =0x040004A8
	orr r3, r3, r7, lsl #29
	str r3, [r2]
	ldr r2, [r5, #8]
	ldr r3, [r5]
	cmp r2, #4
	ldr r2, _020BB1D8 ; =0x02109344
	moveq r1, r1, lsl #0xf
	ldr r2, [r2, r3, lsl #2]
	moveq r1, r1, lsr #0x10
	sub r2, r2, #1
	and r2, r1, r2
	mov r2, r2, lsl #0xf
	str r2, [r0]
	ldr r2, [r5]
	mov r1, r1, asr r2
	mov r1, r1, lsl #0xf
	b _020BB0D0
_020BB068:
	and r3, r8, #0x700000
	mov r3, r3, asr #0x14
	add r7, r3, #5
	mov r3, ip, lsl #0x10
	add ip, r2, r1, lsl r7
	mov r1, lr, lsl #0x10
	mov r8, r3, lsr #0x10
	ldr r7, _020BB1DC ; =0x02109364
	ldr lr, [r5, #8]
	mov r3, ip, lsr #3
	orr ip, r3, lr, lsl #26
	ldr r2, _020BB1E0 ; =0x02109394
	mov lr, r1, lsr #0x10
	add r1, r2, r8, lsl #4
	add r3, r7, r8, lsl #4
	ldr r2, [r3, lr, lsl #2]
	orr r3, ip, #0x40000000
	orr r2, r3, r2, lsl #20
	ldr r1, [r1, lr, lsl #2]
	ldr r3, [r5, #0x10]
	orr r2, r2, r1, lsl #23
	ldr r1, _020BB1D4 ; =0x040004A8
	orr r2, r2, r3, lsl #29
	str r2, [r1]
	mov r1, #0
	str r1, [r0]
_020BB0D0:
	str r1, [r0, #4]
	ldr r2, [r0]
	ldr r1, [r0, #0x10]
	add r1, r2, r1, lsl #12
	str r1, [r0, #8]
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x14]
	add r1, r2, r1, lsl #12
	str r1, [r0, #0xc]
	ldr r1, [r6]
	mov r2, r1, lsl #2
	mov r1, r1, lsl #3
	mov ip, r2, lsr #0x1f
	movs r3, r1, lsr #0x1f
	beq _020BB11C
	ldr r2, [r0]
	ldr r1, [r0, #8]
	str r1, [r0]
	str r2, [r0, #8]
_020BB11C:
	cmp ip, #0
	beq _020BB134
	ldr r2, [r0, #4]
	ldr r1, [r0, #0xc]
	str r1, [r0, #4]
	str r2, [r0, #0xc]
_020BB134:
	ldr r1, _020BB1E4 ; =0x021DA47C
	ldr r7, [r1]
	cmp r7, #0
	beq _020BB15C
	str r3, [sp]
	add r1, r0, #4
	add r2, r0, #8
	add r3, r0, #0xc
	str ip, [sp, #4]
	blx r7
_020BB15C:
	ldr r0, [r6, #4]
	ldr r1, [r6]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x1c
	mov r3, r1, lsl #0x12
	ldr r1, [r5, #0xc]
	mov r0, r0, lsl #0x10
	ldr r2, _020BB1E8 ; =0x0210933C
	mov r3, r3, lsr #0x1f
	cmp r1, #0
	mov r0, r0, lsr #0x10
	ldr r1, [r2, r3, lsl #2]
	movne r0, r0, lsl #9
	bne _020BB1A0
	cmp r1, #4
	moveq r0, #0
	movne r0, r0, lsl #5
_020BB1A0:
	cmp r1, #2
	moveq r2, #1
	movne r2, #0
	add r1, r4, r0
	rsb r0, r2, #4
	mov r1, r1, lsr r0
	ldr r0, _020BB1EC ; =0x040004AC
	str r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BB1C8: .word 0xC000C000
_020BB1CC: .word 0x02109310
_020BB1D0: .word 0x021092F8
_020BB1D4: .word 0x040004A8
_020BB1D8: .word 0x02109344
_020BB1DC: .word 0x02109364
_020BB1E0: .word 0x02109394
_020BB1E4: .word 0x021DA47C
_020BB1E8: .word 0x0210933C
_020BB1EC: .word 0x040004AC
	arm_func_end sub_020BAF88

	arm_func_start sub_020BB1F0
sub_020BB1F0: ; 0x020BB1F0
	ldr r1, _020BB1FC ; =0x021DA47C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020BB1FC: .word 0x021DA47C
	arm_func_end sub_020BB1F0

	arm_func_start sub_020BB200
sub_020BB200: ; 0x020BB200
	ldr r0, _020BB210 ; =0x021DA47C
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020BB210: .word 0x021DA47C
	arm_func_end sub_020BB200

	arm_func_start sub_020BB214
sub_020BB214: ; 0x020BB214
	ldr r1, _020BB220 ; =_021109FC
	str r0, [r1]
	bx lr
	.align 2, 0
_020BB220: .word _021109FC
	arm_func_end sub_020BB214

	arm_func_start sub_020BB224
sub_020BB224: ; 0x020BB224
	ldr r0, _020BB230 ; =_021109FC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020BB230: .word _021109FC
	arm_func_end sub_020BB224

	arm_func_start sub_020BB234
sub_020BB234: ; 0x020BB234
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	add ip, sp, #4
	mov r5, r1
	mov r4, r2
	mov r7, r3
	mov r6, r0
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	ldr r3, [sp, #0x38]
	mov r0, r7
	str ip, [sp]
	bl sub_020BAF88
	ldr r2, [r7]
	and r1, r2, #0x300
	cmp r1, #0x100
	cmpne r1, #0x300
	andne r0, r2, #0x30000000
	orrne r1, r1, r0
	cmp r1, #0x300
	bne _020BB2F8
	ldr r0, _020BB468 ; =0xC000C000
	ldr r3, _020BB46C ; =0x02109310
	and r2, r2, r0
	and r0, r2, #0xc0000000
	and r2, r2, #0xc000
	mov ip, r2, asr #0xe
	mov lr, r0, lsr #0x1e
	ldr r1, _020BB470 ; =0x021DA47C
	ldr r2, _020BB474 ; =0x021092F8
	ldr r0, [r1, #8]
	mov lr, lr, lsl #1
	cmp r0, #0
	ldrne r0, [r1, #4]
	add r3, r3, ip, lsl #3
	add r2, r2, ip, lsl #3
	ldrh ip, [lr, r3]
	ldrh r3, [lr, r2]
	addne r4, r0, r4, lsl #12
	add r2, r6, ip, asr #1
	add r0, r5, r3, asr #1
	ldr r1, _020BB478 ; =0x04000470
	mov r2, r2, lsl #0xc
	str r2, [r1]
	mov r0, r0, lsl #0xc
	moveq r4, r4, lsl #0xc
	str r0, [r1]
	str r4, [r1]
	b _020BB328
_020BB2F8:
	ldr r0, _020BB470 ; =0x021DA47C
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r0, [r0, #4]
	ldr r1, _020BB478 ; =0x04000470
	addne r2, r0, r4, lsl #12
	mov r0, r6, lsl #0xc
	str r0, [r1]
	mov r0, r5, lsl #0xc
	moveq r2, r4, lsl #0xc
	str r0, [r1]
	str r2, [r1]
_020BB328:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r1, _020BB47C ; =0x0400046C
	mov r0, r0, lsl #0xc
	str r0, [r1]
	mov r0, r2, lsl #0xc
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #0x94]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #4]
	mov r0, r0, lsl #8
	mov r2, r0, asr #0x10
	mov r0, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r4, r0, asr #0x10
	mov r3, r2, lsr #0x10
	mov r2, r4, lsl #0x10
	mov r3, r3, lsl #0x10
	orr r2, r3, r2, lsr #16
	mov r0, #0x10000
	str r2, [r1, #0x1c]
	str r0, [r1, #0x24]
	ldr r2, [sp, #0x10]
	ldr r4, [sp, #0xc]
	mov r2, r2, lsl #8
	mov r3, r2, asr #0x10
	mov r2, r4, lsl #8
	mov r3, r3, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r3, lsr #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	orr r2, r3, r2, lsr #16
	str r2, [r1, #0x1c]
	add r0, r0, #0x40
	str r0, [r1, #0x24]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r0, r0, lsl #8
	mov r2, r0, asr #0x10
	mov r0, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r2, r2, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	orr r0, r2, r0, lsr #16
	str r0, [r1, #0x1c]
	mov r0, #0x40
	str r0, [r1, #0x24]
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	mov r0, r0, lsl #8
	mov r2, r0, asr #0x10
	mov r0, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r2, r2, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	orr r0, r2, r0, lsr #16
	str r0, [r1, #0x1c]
	mov r0, #0
	str r0, [r1, #0x24]
	ldr r2, _020BB470 ; =0x021DA47C
	str r0, [r1, #0x98]
	ldr r0, [r2, #8]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, _020BB480 ; =_021109FC
	ldr r1, [r2, #4]
	ldr r0, [r0]
	add r0, r1, r0
	str r0, [r2, #4]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020BB468: .word 0xC000C000
_020BB46C: .word 0x02109310
_020BB470: .word 0x021DA47C
_020BB474: .word 0x021092F8
_020BB478: .word 0x04000470
_020BB47C: .word 0x0400046C
_020BB480: .word _021109FC
	arm_func_end sub_020BB234

	arm_func_start sub_020BB484
sub_020BB484: ; 0x020BB484
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r4, [r1]
	ldr r3, _020BB728 ; =0x01FF0000
	and r3, r4, r3
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	cmp r3, #0xff
	orrgt r3, r3, #0xff00
	movgt r3, r3, lsl #0x10
	movgt r3, r3, asr #0x10
	mov r3, r3, lsl #0xc
	str r3, [sp, #8]
	ldr r3, [r1]
	and r3, r3, #0xff
	cmp r3, #0x7f
	orrgt r3, r3, #0xff00
	movgt r3, r3, lsl #0x10
	movgt r3, r3, asr #0x10
	mov r3, r3, lsl #0xc
	str r3, [sp, #0xc]
	ldr r5, [r1]
	and r4, r5, #0x300
	cmp r4, #0x100
	cmpne r4, #0x300
	andne r3, r5, #0x30000000
	orrne r4, r4, r3
	cmp r4, #0x300
	bne _020BB548
	ldr r3, _020BB72C ; =0xC000C000
	ldr r4, _020BB730 ; =0x02109310
	and r3, r5, r3
	and r5, r3, #0xc0000000
	and r3, r3, #0xc000
	mov r6, r5, lsr #0x1e
	mov r5, r3, asr #0xe
	ldr r3, _020BB734 ; =0x021092F8
	mov r6, r6, lsl #1
	add r4, r4, r5, lsl #3
	add r3, r3, r5, lsl #3
	ldrh r5, [r6, r4]
	ldr r7, [sp, #8]
	ldrh r3, [r6, r3]
	ldr r4, [sp, #0xc]
	add r5, r7, r5, lsl #11
	add r3, r4, r3, lsl #11
	str r5, [sp, #8]
	str r3, [sp, #0xc]
_020BB548:
	ldr r6, [r0, #8]
	ldr r4, [sp, #0xc]
	add r3, sp, #8
	smull r4, r7, r6, r4
	cmp r3, r3
	addeq r3, sp, #0
	adds r8, r4, #0x1000
	ldr r5, [r0]
	ldr r4, [sp, #8]
	adc r6, r7, #0
	smlal r8, r6, r5, r4
	mov r4, r8, lsr #0xc
	orr r4, r4, r6, lsl #20
	str r4, [r3]
	ldr r6, [r0, #0xc]
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #4]
	smull r4, r7, r6, r4
	adds r8, r4, #0x1000
	ldr r4, [sp, #8]
	adc r6, r7, #0
	smlal r8, r6, r5, r4
	mov r5, r8, lsr #0xc
	add r4, sp, #0
	orr r5, r5, r6, lsl #20
	str r5, [r3, #4]
	cmp r3, r4
	bne _020BB5C8
	ldr r4, [sp]
	ldr r3, [sp, #4]
	str r4, [sp, #8]
	str r3, [sp, #0xc]
_020BB5C8:
	ldr r3, _020BB738 ; =0x021DA498
	ldr r3, [r3]
	ldr r3, [r3, #4]
	cmp r3, #0
	beq _020BB610
	cmp r3, #2
	moveq r5, #0x300
	movne r5, #0x100
	ldr r4, [r1]
	ldr r3, _020BB73C ; =0xC1FFFCFF
	cmp r5, #0x100
	andeq r3, r4, r3
	orreq r3, r3, r5
	streq r3, [r1]
	beq _020BB610
	and r3, r4, r3
	orr r3, r3, r5
	str r3, [r1]
_020BB610:
	ldr r6, [r1]
	ldr r5, _020BB730 ; =0x02109310
	and r4, r6, #0x300
	cmp r4, #0x100
	cmpne r4, #0x300
	andne r3, r6, #0x30000000
	orrne r4, r4, r3
	ldr r3, _020BB72C ; =0xC000C000
	ldr r8, _020BB734 ; =0x021092F8
	and r3, r6, r3
	and r6, r3, #0xc0000000
	and r3, r3, #0xc000
	mov lr, r3, asr #0xe
	mov r6, r6, lsr #0x1e
	mov r3, r6, lsl #1
	add r5, r5, lr, lsl #3
	ldrh r5, [r3, r5]
	add lr, r8, lr, lsl #3
	ldrh r3, [r3, lr]
	mov ip, r5, asr #1
	mov r5, ip, lsl #0xc
	ldr r6, [r0]
	rsb r7, r5, #0
	mla r7, r6, ip, r7
	ldr r6, [r0, #8]
	mov r3, r3, asr #1
	mla r7, r6, r3, r7
	ldr lr, [sp, #8]
	cmp r4, #0x300
	add r6, lr, r7
	str r6, [sp, #8]
	mov lr, r3, lsl #0xc
	ldr r6, [r0, #4]
	rsb r7, lr, #0
	mla r7, r6, ip, r7
	ldr r0, [r0, #0xc]
	ldr r6, [sp, #0xc]
	mla r3, r0, r3, r7
	add r0, r6, r3
	str r0, [sp, #0xc]
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _020BB6D8
	ldr r3, [sp, #8]
	ldr r0, [sp, #0xc]
	sub r3, r3, r5
	sub r0, r0, lr
	str r3, [sp, #8]
	str r0, [sp, #0xc]
_020BB6D8:
	ldr r4, [sp, #8]
	ldr r0, [r2]
	ldr r3, [sp, #0xc]
	add r4, r4, r0
	str r4, [sp, #8]
	ldr r0, [r2, #4]
	mov r4, r4, asr #0xc
	add r0, r3, r0
	str r0, [sp, #0xc]
	mov r2, r0, asr #0xc
	ldr r3, [r1]
	ldr r0, _020BB740 ; =0xFE00FF00
	and r2, r2, #0xff
	and r0, r3, r0
	mov r3, r4, lsl #0x17
	orr r0, r0, r2
	orr r0, r0, r3, lsr #7
	str r0, [r1]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BB728: .word 0x01FF0000
_020BB72C: .word 0xC000C000
_020BB730: .word 0x02109310
_020BB734: .word 0x021092F8
_020BB738: .word 0x021DA498
_020BB73C: .word 0xC1FFFCFF
_020BB740: .word 0xFE00FF00
	arm_func_end sub_020BB484

	arm_func_start sub_020BB744
sub_020BB744: ; 0x020BB744
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldr r2, _020BBB44 ; =0x021DA498
	mov r6, r0
	ldr r4, [r2]
	ldr r0, _020BBB44 ; =0x021DA498
	ldr r5, [r4, #0x2c]
	mov fp, r1
	cmp r5, #0
	ldreq r5, _020BBB48 ; =0x021093CC
	ldr r2, [r0]
	ldr r3, [r5, #0x10]
	str r3, [sp, #0x18]
	ldr r1, [r5, #0x14]
	str r1, [sp, #0x1c]
	ldr r0, [r6]
	sub r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r6, #4]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r1, [r2, #0x24]
	ldr r0, [r2, #0x10]
	cmp r1, #0
	str r0, [sp, #0xc]
	bne _020BB7C0
	ldr r0, [r2, #0x28]
	cmp r0, #0
	movne r0, #1
	strne r0, [sp]
	bne _020BB7C8
_020BB7C0:
	mov r0, #0
	str r0, [sp]
_020BB7C8:
	ldrh r0, [fp]
	mov r8, #0
	cmp r0, #0
	addls sp, sp, #0x40
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0x400
	str r0, [sp, #0x10]
	ldr r0, _020BBB4C ; =0x0000FFFE
	ldr r7, _020BBB44 ; =0x021DA498
	add r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	rsb r0, r0, #0
	str r0, [sp, #0x10]
_020BB800:
	mov r0, #6
	mul r1, r8, r0
	ldr r2, [r7]
	mov r0, #1
	str r0, [r2, #0x30]
	ldr r0, [fp, #4]
	add r2, r0, r1
	ldrh r0, [r0, r1]
	strh r0, [r4, #0x38]
	ldrh r0, [r2, #2]
	strh r0, [r4, #0x3a]
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x3c]
	ldr r3, [r6, #0x20]
	cmp r3, #0
	beq _020BB850
	ldr r0, [r7]
	mov r1, fp
	mov r2, r8
	blx r3
_020BB850:
	ldr r0, [r7]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BBB24
	ldr r0, [sp]
	ldr r1, [r4, #0x3c]
	cmp r0, #0
	ldr r0, [sp, #0x10]
	and r2, r1, r0
	ldr r0, [sp, #0xc]
	mov r1, r1, lsl #0x16
	add r1, r0, r1, lsr #22
	ldr r0, [sp, #0x10]
	and r0, r1, r0, lsr #22
	orr r0, r2, r0
	str r0, [r4, #0x3c]
	beq _020BB994
	ldr r0, [r4, #0x38]
	ldr lr, [r7]
	mov r1, r0, lsl #2
	mov r0, r0, lsl #3
	mov r1, r1, lsr #0x1f
	mov r0, r0, lsr #0x1f
	orr sl, r0, r1, lsl #1
	ldr sb, [lr, #0x28]
	ldr r1, [r6, #0x14]
	add r0, sb, sl, lsl #2
	add r0, r0, r1, lsl #1
	ldrh r1, [r0, #0xe]
	ldr r0, [sp, #0x14]
	str r1, [sp, #8]
	cmp r1, r0
	bne _020BB960
	cmp sl, #0
	bne _020BB8F0
	ldr r1, [lr, #0x20]
	mov r0, sb
	blx r1
	str r0, [sp, #8]
	b _020BB94C
_020BB8F0:
	add ip, sp, #0x20
	ldmia sb, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	tst sl, #1
	beq _020BB91C
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	rsb r1, r1, #0
	str r1, [sp, #0x20]
	rsb r0, r0, #0
	str r0, [sp, #0x24]
_020BB91C:
	tst sl, #2
	beq _020BB93C
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	rsb r1, r1, #0
	str r1, [sp, #0x28]
	rsb r0, r0, #0
	str r0, [sp, #0x2c]
_020BB93C:
	ldr r1, [lr, #0x20]
	add r0, sp, #0x20
	blx r1
	str r0, [sp, #8]
_020BB94C:
	ldr r1, [r6, #0x14]
	add r0, sb, sl, lsl #2
	add r1, r0, r1, lsl #1
	ldr r0, [sp, #8]
	strh r0, [r1, #0xe]
_020BB960:
	ldr r1, [r5]
	add r0, sp, #0x30
	str r1, [sp, #0x30]
	ldr r2, [r5, #4]
	add r1, r4, #0x38
	str r2, [sp, #0x34]
	ldr r3, [r5, #8]
	add r2, sp, #0x18
	str r3, [sp, #0x38]
	ldr r3, [r5, #0xc]
	str r3, [sp, #0x3c]
	bl sub_020BB484
	b _020BBAE4
_020BB994:
	ldr r0, _020BBB4C ; =0x0000FFFE
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _020BBA9C
	ldr r2, [r4, #0x38]
	ldr r1, _020BBB50 ; =0xC000C000
	mov sl, r2, lsl #3
	and sb, r2, r1
	bl sub_020BBF5C
	eor r0, r0, sl, lsr #31
	ldr r1, [r4, #0x38]
	str r0, [sp, #4]
	ldr r0, [r7]
	mov sl, r1, lsl #2
	bl sub_020BBF70
	eor r2, r0, sl, lsr #31
	ldr r0, [r4, #0x38]
	bic r1, r0, #0x10000000
	ldr r0, [sp, #4]
	orr r0, r1, r0, lsl #28
	bic r0, r0, #0x20000000
	orr r0, r0, r2, lsl #29
	str r0, [r4, #0x38]
	ldr r0, [r7]
	bl sub_020BBF5C
	cmp r0, #0
	beq _020BBA4C
	and r1, sb, #0xc000
	mov r2, r1, asr #0xe
	ldr r1, _020BBB54 ; =0x02109310
	and r3, sb, #0xc0000000
	mov r3, r3, lsr #0x1e
	add r2, r1, r2, lsl #3
	mov r3, r3, lsl #1
	ldr r0, [r4, #0x38]
	ldr r1, _020BBB58 ; =0xFE00FFFF
	ldrh r2, [r3, r2]
	and r1, r0, r1
	mov r0, r0, lsl #7
	add r0, r2, r0, lsr #23
	rsb r0, r0, #0
	mov r0, r0, lsl #0x17
	orr r0, r1, r0, lsr #7
	str r0, [r4, #0x38]
_020BBA4C:
	ldr r0, [r7]
	bl sub_020BBF70
	cmp r0, #0
	beq _020BBA9C
	and r1, sb, #0xc000
	mov r3, r1, asr #0xe
	and r1, sb, #0xc0000000
	mov r1, r1, lsr #0x1e
	mov r2, r1, lsl #1
	ldr r1, _020BBB5C ; =0x021092F8
	ldr r0, [r4, #0x38]
	add r1, r1, r3, lsl #3
	ldrh r1, [r2, r1]
	bic r2, r0, #0xff
	mov r0, r0, lsl #0x18
	add r0, r1, r0, lsr #24
	rsb r0, r0, #0
	and r0, r0, #0xff
	orr r0, r2, r0
	str r0, [r4, #0x38]
_020BBA9C:
	ldr r2, [r4, #0x38]
	ldr r0, _020BBB58 ; =0xFE00FFFF
	ldr r1, [sp, #0x18]
	and r3, r2, r0
	mov r2, r2, lsl #7
	mov r0, r1, asr #0xc
	add r0, r0, r2, lsr #23
	mov r0, r0, lsl #0x17
	orr r0, r3, r0, lsr #7
	str r0, [r4, #0x38]
	bic r2, r0, #0xff
	mov r1, r0, lsl #0x18
	ldr r0, [sp, #0x1c]
	mov r0, r0, asr #0xc
	add r0, r0, r1, lsr #24
	and r0, r0, #0xff
	orr r0, r2, r0
	str r0, [r4, #0x38]
_020BBAE4:
	ldr r3, [r7]
	ldr r1, [sp, #8]
	ldr r3, [r3, #0x1c]
	add r0, r4, #0x38
	mov r2, #0
	blx r3
	cmp r0, #1
	addne sp, sp, #0x40
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [r6, #0x24]
	cmp r3, #0
	beq _020BBB24
	ldr r0, [r7]
	mov r1, fp
	mov r2, r8
	blx r3
_020BBB24:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	ldrh r1, [fp]
	cmp r1, r0, lsr #16
	bhi _020BB800
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BBB44: .word 0x021DA498
_020BBB48: .word 0x021093CC
_020BBB4C: .word 0x0000FFFE
_020BBB50: .word 0xC000C000
_020BBB54: .word 0x02109310
_020BBB58: .word 0xFE00FFFF
_020BBB5C: .word 0x021092F8
	arm_func_end sub_020BB744

	arm_func_start sub_020BBB60
sub_020BBB60: ; 0x020BBB60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r1, _020BBD94 ; =0x021DA498
	mov r7, r0
	ldr r0, [r1]
	add r0, r0, #0x40
	bl sub_020CF510
	ldr r0, _020BBD94 ; =0x021DA498
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _020BBD24
	ldr r2, [r7]
	ldr r1, _020BBD98 ; =0xC000C000
	and r4, r2, r1
	bl sub_020BBF5C
	cmp r0, #0
	ldr r0, [r7]
	beq _020BBBF0
	mov r0, r0, lsl #7
	mov r3, r0, lsr #0x17
	and r2, r4, #0xc000
	and r1, r4, #0xc0000000
	mov r1, r1, lsr #0x1e
	ldr r0, _020BBD9C ; =0x02109310
	mov r2, r2, asr #0xe
	mov r1, r1, lsl #1
	add r0, r0, r2, lsl #3
	cmp r3, #0xff
	ldrh r1, [r1, r0]
	orrgt r0, r3, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r3, r0, asr #0x10
	add r0, r3, r1
	rsb r0, r0, #0
	b _020BBC08
_020BBBF0:
	mov r0, r0, lsl #7
	mov r0, r0, lsr #0x17
	cmp r0, #0xff
	orrgt r0, r0, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r0, r0, asr #0x10
_020BBC08:
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, _020BBD94 ; =0x021DA498
	mov r1, r1, lsl #0x10
	ldr r0, [r0]
	mov r5, r1, asr #0x10
	bl sub_020BBF70
	cmp r0, #0
	ldr r0, [r7]
	beq _020BBC74
	mov r0, r0, lsl #0x18
	mov r3, r0, lsr #0x18
	and r2, r4, #0xc000
	and r1, r4, #0xc0000000
	mov r1, r1, lsr #0x1e
	ldr r0, _020BBDA0 ; =0x021092F8
	mov r2, r2, asr #0xe
	mov r1, r1, lsl #1
	add r0, r0, r2, lsl #3
	cmp r3, #0x7f
	ldrh r1, [r1, r0]
	orrgt r0, r3, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r3, r0, asr #0x10
	add r0, r3, r1
	rsb r0, r0, #0
	b _020BBC8C
_020BBC74:
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	cmp r0, #0x7f
	orrgt r0, r0, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r0, r0, asr #0x10
_020BBC8C:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	ldr r0, _020BBD94 ; =0x021DA498
	ldr r1, [r7]
	ldr r0, [r0]
	mov r6, r1, lsl #3
	bl sub_020BBF5C
	ldr r2, [r7]
	ldr r1, _020BBD94 ; =0x021DA498
	eor r6, r0, r6, lsr #31
	ldr r0, [r1]
	mov r8, r2, lsl #2
	bl sub_020BBF70
	ldr r1, [r7]
	eor r3, r0, r8, lsr #31
	bic r2, r1, #0x10000000
	orr r2, r2, r6, lsl #28
	bic r2, r2, #0x20000000
	mov r1, r4, lsl #0x10
	orr r3, r2, r3, lsl #29
	str r2, [r7]
	str r3, [r7]
	ldr r2, _020BBD94 ; =0x021DA498
	mov r0, r5
	ldr r5, [r2]
	mov r1, r1, asr #0x10
	ldr r4, [r5, #8]
	mov r3, r7
	add r4, r4, #0xc
	str r4, [sp]
	ldr r4, [r5, #0x14]
	mvn r2, #0
	str r4, [sp, #4]
	ldr r4, [r5, #0x18]
	str r4, [sp, #8]
	bl sub_020BB234
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020BBD24:
	ldr r2, _020BBD94 ; =0x021DA498
	ldr r0, [r7]
	ldr r5, [r2]
	mov r0, r0, lsl #7
	ldr r1, [r7]
	ldr r4, [r5, #8]
	mov r0, r0, lsr #0x17
	cmp r0, #0xff
	orrgt r0, r0, #0xff00
	mov r1, r1, lsl #0x18
	add r4, r4, #0xc
	movgt r0, r0, lsl #0x10
	str r4, [sp]
	ldr r4, [r5, #0x14]
	mov r1, r1, lsr #0x18
	movgt r0, r0, asr #0x10
	cmp r1, #0x7f
	orrgt r1, r1, #0xff00
	movgt r1, r1, lsl #0x10
	str r4, [sp, #4]
	ldr r4, [r5, #0x18]
	movgt r1, r1, asr #0x10
	mov r3, r7
	mvn r2, #0
	str r4, [sp, #8]
	bl sub_020BB234
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BBD94: .word 0x021DA498
_020BBD98: .word 0xC000C000
_020BBD9C: .word 0x02109310
_020BBDA0: .word 0x021092F8
	arm_func_end sub_020BBB60

	arm_func_start sub_020BBDA4
sub_020BBDA4: ; 0x020BBDA4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	ldr r5, _020BBE68 ; =0x021DA498
	ldrh r1, [sb]
	ldr r7, [r5]
	mov sl, r0
	mov r8, #0
	cmp r1, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r6, #1
	mov r4, #6
_020BBDD0:
	mul r1, r8, r4
	ldr r0, [r5]
	str r6, [r0, #0x30]
	ldr r2, [sb, #4]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	strh r0, [r7, #0x38]
	ldrh r0, [r1, #2]
	strh r0, [r7, #0x3a]
	ldrh r0, [r1, #4]
	strh r0, [r7, #0x3c]
	ldr r3, [sl, #0x20]
	cmp r3, #0
	beq _020BBE18
	ldr r0, [r5]
	mov r1, sb
	mov r2, r8
	blx r3
_020BBE18:
	ldr r0, [r5]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BBE30
	add r0, r7, #0x38
	bl sub_020BBB60
_020BBE30:
	ldr r3, [sl, #0x24]
	cmp r3, #0
	beq _020BBE4C
	ldr r0, [r5]
	mov r1, sb
	mov r2, r8
	blx r3
_020BBE4C:
	ldrh r1, [sb]
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #16
	mov r8, r0, lsr #0x10
	bhi _020BBDD0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BBE68: .word 0x021DA498
	arm_func_end sub_020BBDA4

	arm_func_start sub_020BBE6C
sub_020BBE6C: ; 0x020BBE6C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	mov r2, #0x70
	bl sub_020D4790
	mov r1, #0
	str r1, [r4]
	mov r0, #2
	stmib r4, {r0, r1}
	str r1, [r4, #0xc]
	str r1, [r4, #0x24]
	mov r0, #1
	str r0, [r4, #0x30]
	str r1, [r4, #0x28]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020BBE6C

	arm_func_start sub_020BBEAC
sub_020BBEAC: ; 0x020BBEAC
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	arm_func_end sub_020BBEAC

	arm_func_start sub_020BBEB8
sub_020BBEB8: ; 0x020BBEB8
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	bx lr
	arm_func_end sub_020BBEB8

	arm_func_start sub_020BBEC4
sub_020BBEC4: ; 0x020BBEC4
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_020BBEC4

	arm_func_start sub_020BBECC
sub_020BBECC: ; 0x020BBECC
	ldr r1, _020BBF30 ; =0x021DA498
	mov r3, #0
	ldr ip, [r1]
	mov r1, #0x1000
	str r0, [ip, #0x2c]
	ldr r2, [r0]
	str r2, [ip, #0x40]
	ldr r2, [r0, #4]
	str r2, [ip, #0x44]
	str r3, [ip, #0x48]
	ldr r2, [r0, #8]
	str r2, [ip, #0x4c]
	ldr r2, [r0, #0xc]
	str r2, [ip, #0x50]
	str r3, [ip, #0x54]
	str r3, [ip, #0x58]
	str r3, [ip, #0x5c]
	str r1, [ip, #0x60]
	ldr r1, [r0, #0x10]
	str r1, [ip, #0x64]
	ldr r0, [r0, #0x14]
	str r0, [ip, #0x68]
	ldr r0, [ip, #0x34]
	str r0, [ip, #0x6c]
	bx lr
	.align 2, 0
_020BBF30: .word 0x021DA498
	arm_func_end sub_020BBECC

	arm_func_start sub_020BBF34
sub_020BBF34: ; 0x020BBF34
	ldr r2, _020BBF48 ; =0x021DA498
	ldr r2, [r2]
	str r0, [r2, #0x2c]
	str r1, [r2, #0x28]
	bx lr
	.align 2, 0
_020BBF48: .word 0x021DA498
	arm_func_end sub_020BBF34

	arm_func_start sub_020BBF4C
sub_020BBF4C: ; 0x020BBF4C
	str r1, [r0, #0x34]
	bx lr
	arm_func_end sub_020BBF4C

	arm_func_start sub_020BBF54
sub_020BBF54: ; 0x020BBF54
	str r1, [r0]
	bx lr
	arm_func_end sub_020BBF54

	arm_func_start sub_020BBF5C
sub_020BBF5C: ; 0x020BBF5C
	ldr r0, [r0, #0x24]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_020BBF5C

	arm_func_start sub_020BBF70
sub_020BBF70: ; 0x020BBF70
	ldr r0, [r0, #0x24]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_020BBF70

	arm_func_start sub_020BBF84
sub_020BBF84: ; 0x020BBF84
	cmp r1, #0
	ldr r1, [r0, #0x24]
	orrne r1, r1, #1
	biceq r1, r1, #1
	str r1, [r0, #0x24]
	ldr r1, [r0, #0x24]
	cmp r2, #0
	orrne r1, r1, #2
	biceq r1, r1, #2
	str r1, [r0, #0x24]
	bx lr
	arm_func_end sub_020BBF84

	arm_func_start sub_020BBFB0
sub_020BBFB0: ; 0x020BBFB0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020BC0B4 ; =0x021DA498
	mov r4, r0
	str r4, [r2]
	ldr r0, [r4]
	ldr r5, [r0, #0x14]
	cmp r5, #0
	bne _020BC068
	ldr lr, _020BC0B8 ; =0x04000440
	mov r1, #0
	str r1, [lr]
	str r1, [lr, #4]
	ldr ip, [r4]
	mov r0, #1
	ldmia ip, {r3, ip}
	rsb r3, r3, #0
	str r3, [lr, #0x30]
	rsb r3, ip, #0
	str r3, [lr, #0x30]
	str r1, [lr, #0x30]
	str r0, [lr]
	ldr r0, [r2]
	ldr r5, [r0, #8]
	mov r0, r5
	bl sub_020B8034
	cmp r0, #0
	moveq r0, #0
	beq _020BC02C
	mov r0, r5
	mov r1, #0
	bl sub_020B802C
_020BC02C:
	ldr r1, _020BC0B4 ; =0x021DA498
	str r0, [r4, #0x14]
	ldr r0, [r1]
	mov r1, #0
	ldr r5, [r0, #0xc]
	mov r0, r5
	bl sub_020B8084
	cmp r0, #0
	moveq r0, #0
	beq _020BC060
	mov r0, r5
	mov r1, #0
	bl sub_020B8078
_020BC060:
	str r0, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, pc}
_020BC068:
	ldr r4, [r4, #8]
	mov r1, r5
	mov r0, r4
	bl sub_020B8034
	cmp r0, #0
	moveq r1, #0
	beq _020BC0A4
	mov r0, r4
	mov r1, r5
	bl sub_020B802C
	ldr r1, [r4, #0x20]
	and r1, r1, #0x700000
	mov r1, r1, asr #0x14
	add r1, r1, #5
	mov r1, r0, lsr r1
_020BC0A4:
	ldr r0, _020BC0B4 ; =0x021DA498
	ldr r0, [r0]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BC0B4: .word 0x021DA498
_020BC0B8: .word 0x04000440
	arm_func_end sub_020BBFB0

	arm_func_start sub_020BC0BC
sub_020BC0BC: ; 0x020BC0BC
	ldr r0, _020BC118 ; =0x021DA498
	ldr r3, [r0]
	ldr r1, [r3]
	ldr r1, [r1, #0x14]
	cmp r1, #0
	bne _020BC0F0
	ldr r1, _020BC11C ; =0x04000440
	mov r0, #0
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #8]
	str r0, [r1]
	b _020BC108
_020BC0F0:
	mov r2, #0
	str r2, [r3, #0x10]
	ldr r1, [r0]
	str r2, [r1, #0x2c]
	ldr r0, [r0]
	str r2, [r0, #0x28]
_020BC108:
	ldr r0, _020BC118 ; =0x021DA498
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_020BC118: .word 0x021DA498
_020BC11C: .word 0x04000440
	arm_func_end sub_020BC0BC

	arm_func_start sub_020BC120
sub_020BC120: ; 0x020BC120
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020BC1D0 ; =0x021DA498
	mov r5, r0
	ldr r2, [r1]
	ldr r4, [r2]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r2, #0x30]
	ldr r2, [r4, #0x18]
	cmp r2, #0
	beq _020BC160
	ldr r0, [r1]
	mov r1, r5
	blx r2
_020BC160:
	ldr r0, _020BC1D0 ; =0x021DA498
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BC1B0
	ldr r0, [r4, #0x14]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BC1B0
_020BC184: ; jump table
	b _020BC194 ; case 0
	b _020BC1A4 ; case 1
	b _020BC1A4 ; case 2
	b _020BC1B0 ; case 3
_020BC194:
	mov r0, r4
	mov r1, r5
	bl sub_020BBDA4
	b _020BC1B0
_020BC1A4:
	mov r0, r4
	mov r1, r5
	bl sub_020BB744
_020BC1B0:
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020BC1D0 ; =0x021DA498
	mov r1, r5
	ldr r0, [r0]
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BC1D0: .word 0x021DA498
	arm_func_end sub_020BC120

	arm_func_start sub_020BC1D4
sub_020BC1D4: ; 0x020BC1D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020BC2B8 ; =0x021DA498
	mov r6, r0
	ldr r3, [r2]
	mov r4, r1
	ldr r5, [r3]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r3, #0x30]
	ldr r3, [r5, #0x18]
	cmp r3, #0
	beq _020BC218
	ldr r0, [r2]
	mov r1, r6
	blx r3
_020BC218:
	ldr r0, _020BC2B8 ; =0x021DA498
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BC298
	mvn r0, #0
	cmp r4, r0
	beq _020BC25C
	mov r0, r4
	ldr r4, [r5, #0x14]
	bl sub_020BAC7C
	mov r3, #1
	mvn r1, r3, lsl r4
	ldr r2, [r0, #0x20]
	and r1, r2, r1
	orr r1, r1, r3, lsl r4
	str r1, [r0, #0x20]
_020BC25C:
	ldr r0, [r5, #0x14]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BC298
_020BC26C: ; jump table
	b _020BC27C ; case 0
	b _020BC28C ; case 1
	b _020BC28C ; case 2
	b _020BC298 ; case 3
_020BC27C:
	mov r0, r5
	mov r1, r6
	bl sub_020BBDA4
	b _020BC298
_020BC28C:
	mov r0, r5
	mov r1, r6
	bl sub_020BB744
_020BC298:
	ldr r2, [r5, #0x1c]
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020BC2B8 ; =0x021DA498
	mov r1, r6
	ldr r0, [r0]
	blx r2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BC2B8: .word 0x021DA498
	arm_func_end sub_020BC1D4

	arm_func_start sub_020BC2BC
sub_020BC2BC: ; 0x020BC2BC
	stmdb sp!, {r3, lr}
	ldrh r3, [r0, #4]
	ldr r2, _020BC380 ; =0x0000FFFF
	cmp r3, #0
	beq _020BC2E4
	cmp r3, #1
	beq _020BC300
	cmp r3, #2
	beq _020BC314
	b _020BC378
_020BC2E4:
	ldrh r2, [r0]
	ldrh r3, [r0, #0xc]
	sub r0, r1, r2
	add r0, r3, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	b _020BC378
_020BC300:
	ldrh r2, [r0]
	sub r1, r1, r2
	add r0, r0, r1, lsl #1
	ldrh r2, [r0, #0xc]
	b _020BC378
_020BC314:
	ldrh r3, [r0, #0xc]
	add ip, r0, #0xe
	sub r0, r3, #1
	add lr, ip, r0, lsl #2
	cmp ip, lr
	bhi _020BC378
_020BC32C:
	sub r3, lr, ip
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	mov r0, r0, asr #2
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	mov r0, r3, lsl #2
	ldrh r0, [ip, r0]
	add r3, ip, r3, lsl #2
	cmp r0, r1
	addlo ip, r3, #4
	blo _020BC370
	cmp r1, r0
	sublo lr, r3, #4
	blo _020BC370
	ldrh r2, [r3, #2]
	b _020BC378
_020BC370:
	cmp ip, lr
	bls _020BC32C
_020BC378:
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BC380: .word 0x0000FFFF
	arm_func_end sub_020BC2BC

	arm_func_start sub_020BC384
sub_020BC384: ; 0x020BC384
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r4
	bl sub_020BDD04
	ldr r0, _020BC3A4 ; =sub_020BDF94
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BC3A4: .word sub_020BDF94
	arm_func_end sub_020BC384

	arm_func_start sub_020BC3A8
sub_020BC3A8: ; 0x020BC3A8
	stmdb sp!, {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _020BC3E4
_020BC3BC:
	ldrh r2, [r0]
	cmp r2, r1
	ldrlsh r2, [r0, #2]
	cmpls r1, r2
	bhi _020BC3D8
	bl sub_020BC2BC
	ldmia sp!, {r3, pc}
_020BC3D8:
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020BC3BC
_020BC3E4:
	ldr r0, _020BC3EC ; =0x0000FFFF
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BC3EC: .word 0x0000FFFF
	arm_func_end sub_020BC3A8

	arm_func_start sub_020BC3F0
sub_020BC3F0: ; 0x020BC3F0
	ldr ip, [r0]
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _020BC434
_020BC400:
	ldrh r2, [r3]
	cmp r2, r1
	ldrlsh r0, [r3, #2]
	cmpls r1, r0
	bhi _020BC428
	sub r0, r1, r2
	add r1, r3, #8
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	bx lr
_020BC428:
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _020BC400
_020BC434:
	add r0, ip, #4
	bx lr
	arm_func_end sub_020BC3F0

	arm_func_start sub_020BC43C
sub_020BC43C: ; 0x020BC43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r0
	str r2, [sp]
	ldr r5, [r8, #4]
	add r0, sp, #0
	mov r7, r1
	mov r6, r3
	mov r4, #0
	blx r5
	movs r1, r0
	beq _020BC4B8
	ldr sb, _020BC4E4 ; =0x0000FFFF
	add sl, sp, #0
_020BC474:
	cmp r1, #0xa
	beq _020BC4B8
	mov r0, r8
	bl sub_020BC3A8
	mov r1, r0
	cmp r1, sb
	ldreq r0, [r8]
	ldreqh r1, [r0, #2]
	mov r0, r8
	bl sub_020BC3F0
	ldrsb r1, [r0, #2]
	mov r0, sl
	add r1, r7, r1
	add r4, r4, r1
	blx r5
	movs r1, r0
	bne _020BC474
_020BC4B8:
	cmp r6, #0
	beq _020BC4D0
	cmp r1, #0xa
	ldreq r0, [sp]
	movne r0, #0
	str r0, [r6]
_020BC4D0:
	cmp r4, #0
	subgt r4, r4, r7
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BC4E4: .word 0x0000FFFF
	arm_func_end sub_020BC43C

	arm_func_start sub_020BC4E8
sub_020BC4E8: ; 0x020BC4E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	add r4, sp, #0
	mov r3, #0
	mov r8, r0
	str r2, [sp, #8]
	str r3, [r4]
	str r3, [r4, #4]
	ldr r7, [r8, #4]
	add r0, sp, #8
	mov r4, r1
	mov r6, #1
	blx r7
	cmp r0, #0
	beq _020BC540
	add r5, sp, #8
_020BC528:
	cmp r0, #0xa
	mov r0, r5
	addeq r6, r6, #1
	blx r7
	cmp r0, #0
	bne _020BC528
_020BC540:
	ldr r0, [r8]
	ldrsb r0, [r0, #1]
	add r0, r4, r0
	mul r0, r6, r0
	sub r0, r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020BC4E8

	arm_func_start sub_020BC55C
sub_020BC55C: ; 0x020BC55C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r6, r2
	ldr r2, [sp, #0x28]
	add sb, sp, #0
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r3
	str r4, [sb]
	str r4, [sb, #4]
	cmp r2, #0
	mov r4, #1
	beq _020BC5C4
	add sb, sp, #0x28
_020BC598:
	mov r0, r7
	mov r1, r6
	mov r3, sb
	bl sub_020BC43C
	ldr r1, [sp]
	ldr r2, [sp, #0x28]
	cmp r0, r1
	strgt r0, [sp]
	add r4, r4, #1
	cmp r2, #0
	bne _020BC598
_020BC5C4:
	ldr r0, [r7]
	sub r2, r4, #1
	ldrsb r1, [r0, #1]
	ldr r0, [sp]
	add r1, r5, r1
	mul r1, r2, r1
	sub r1, r1, r5
	str r1, [sp, #4]
	stmia r8, {r0, r1}
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020BC55C

	arm_func_start sub_020BC5F0
sub_020BC5F0: ; 0x020BC5F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, #3
	ldr r7, [sp, #0x20]
	ldr r6, [sp, #0x24]
	ldr r8, _020BC6E4 ; =0x02109414
	mov r5, #0
	mov sb, sl
	mvn r4, #0
_020BC610:
	and ip, r3, r4, lsl r6
	cmp ip, r1
	and lr, r2, r4, lsl r7
	bhi _020BC654
	mla r5, r2, ip, r5
	cmp lr, r0
	bhi _020BC644
	sub r3, r3, ip
	mla r5, lr, r3, r5
	sub r0, r0, lr
	sub r1, r1, ip
	sub r2, r2, lr
	b _020BC69C
_020BC644:
	mov r2, lr
	sub r1, r1, ip
	sub r3, r3, ip
	b _020BC69C
_020BC654:
	cmp lr, r0
	mvn r3, r4, lsl r6
	bhi _020BC674
	mla r5, lr, ip, r5
	mov r3, ip
	sub r0, r0, lr
	sub r2, r2, lr
	b _020BC69C
_020BC674:
	and r2, r1, r4, lsl r6
	mla r5, lr, r2, r5
	and r2, r0, r4, lsl r7
	mvn r4, r4, lsl r7
	add r2, r5, r2, lsl r6
	and r1, r1, r3
	add r1, r2, r1, lsl r7
	and r0, r0, r4
	add r0, r1, r0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020BC69C:
	cmp r2, #8
	movge r6, sl
	movlt r6, r2
	clzlt r6, r6
	rsblt r6, r6, #0x1f
	cmp r3, #8
	movge r7, sb
	movlt r7, r3
	clzlt r7, r7
	rsblt r7, r7, #0x1f
	add r7, r8, r7, lsl #3
	add ip, r7, r6, lsl #1
	ldrb r7, [r7, r6, lsl #1]
	ldrb r6, [ip, #1]
	str r7, [sp, #0x20]
	str r6, [sp, #0x24]
	b _020BC610
	arm_func_end sub_020BC5F0

	arm_func_start sub_020BC6E0
sub_020BC6E0: ; 0x020BC6E0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BC6E4: .word 0x02109414
	arm_func_end sub_020BC6E0

	arm_func_start sub_020BC6E8
sub_020BC6E8: ; 0x020BC6E8
	ldrb r3, [r0, #1]
	ldr r2, _020BC700 ; =0x02109434
	ldrb r1, [r0]
	add r0, r2, r3, lsl #4
	ldr r0, [r0, r1, lsl #2]
	bx lr
	.align 2, 0
_020BC700: .word 0x02109434
	arm_func_end sub_020BC6E8

	arm_func_start sub_020BC704
sub_020BC704: ; 0x020BC704
	stmdb sp!, {r3, r4, r5, lr}
	cmp r3, #8
	ldreq r4, [sp, #0x10]
	mov ip, r0
	ldr r0, [sp, #0x14]
	cmpeq r4, #8
	bne _020BC734
	ldr r2, [sp, #0x18]
	mov r1, ip
	mov r2, r2, lsl #3
	bl sub_020D4858
	ldmia sp!, {r3, r4, r5, pc}
_020BC734:
	ldr r4, [sp, #0x18]
	cmp r4, #4
	bne _020BC794
	mov r5, r1, lsl #2
	add r4, r5, r3, lsl #2
	mvn r3, #0
	rsb r4, r4, #0x20
	mov r3, r3, lsr r5
	add r1, r4, r1, lsl #2
	mov r3, r3, lsl r1
	ldr r1, [sp, #0x10]
	add r2, ip, r2, lsl #2
	add r5, r2, r1, lsl #2
	and r1, r0, r3, lsr r4
	mvn r3, r3, lsr r4
	cmp r2, r5
	ldmhsia sp!, {r3, r4, r5, pc}
_020BC778:
	ldr r0, [r2]
	and r0, r0, r3
	orr r0, r1, r0
	str r0, [r2], #4
	cmp r2, r5
	blo _020BC778
	ldmia sp!, {r3, r4, r5, pc}
_020BC794:
	mov r1, r1, lsl #3
	mvn r4, #0
	add r3, r1, r3, lsl #3
	rsb r3, r3, #0x40
	mov r5, r4, lsr r1
	cmp r3, #0x20
	movlo r5, r5, lsl r1
	blo _020BC7C4
	sub lr, r3, #0x20
	add r4, r1, lr
	mov r4, r5, lsl r4
	mov r5, r4, lsr lr
_020BC7C4:
	mvn lr, #0
	mov r4, lr, lsl r3
	cmp r1, #0x20
	movlo r3, r4, lsr r3
	blo _020BC7E8
	sub lr, r1, #0x20
	add r1, lr, r3
	mov r1, r4, lsr r1
	mov r3, r1, lsl lr
_020BC7E8:
	ldr r1, [sp, #0x10]
	add r4, ip, r2, lsl #3
	add ip, r4, r1, lsl #3
	and r1, r0, r5
	and r2, r0, r3
	mvn r5, r5
	mvn r3, r3
	cmp r4, ip
	ldmhsia sp!, {r3, r4, r5, pc}
_020BC80C:
	ldr r0, [r4]
	and r0, r0, r5
	orr r0, r1, r0
	str r0, [r4]
	ldr r0, [r4, #4]
	and r0, r0, r3
	orr r0, r2, r0
	str r0, [r4, #4]
	add r4, r4, #8
	cmp r4, ip
	blo _020BC80C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BC704

	arm_func_start sub_020BC83C
sub_020BC83C: ; 0x020BC83C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	ldr r5, [r0, #8]
	ldr r4, [r0, #0xc]
	cmp r5, #0
	strge r5, [sp]
	movlt r1, #0
	strlt r1, [sp]
	ldr r1, [r0, #0x10]
	cmp r4, #0
	add sl, r5, r1
	ldr r1, [r0, #0x14]
	movge r2, r4
	movlt r2, #0
	cmp sl, #8
	add r3, r4, r1
	movge sl, #8
	cmp r3, #8
	movge r3, #8
	cmp r4, #0
	movgt r4, #0
	cmp r5, #0
	ldr r7, [r0, #0x20]
	movgt r5, #0
	rsb r1, r4, #0
	mul r6, sl, r7
	ldr r8, [r0, #0x1c]
	rsb r4, r5, #0
	mul sb, r8, r4
	ldr r4, [r0, #0x18]
	mov sl, r6
	str r4, [sp, #0x10]
	ldr r4, [sp]
	cmp r7, #4
	mul r5, r4, r7
	ldr r4, [sp, #0x10]
	str r5, [sp]
	mla r4, r1, r4, sb
	ldr r1, [r0, #4]
	str r1, [sp, #0x14]
	ldr r1, [r0]
	bne _020BC9AC
	ldr r7, [r0, #0x24]
	add r0, r1, r2, lsl #2
	str r0, [sp, #0xc]
	add r0, r1, r3, lsl #2
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r0
	addhs sp, sp, #0x28
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov fp, #0xf
	add r5, sp, #0x20
_020BC910:
	ldr r0, [sp, #0xc]
	mov r1, r4, lsr #0x1f
	ldr sb, [r0]
	ldr r0, [sp, #0x14]
	rsb r2, r1, r4, lsl #29
	add r0, r0, r4, lsr #3
	str r0, [sp, #0x20]
	mov r0, #0
	strb r0, [sp, #0x24]
	strb r0, [sp, #0x25]
	mov r0, r5
	add r1, r1, r2, ror #29
	bl sub_020BDF34
	ldr r6, [sp]
	mov r0, r6
	cmp r0, sl
	bhs _020BC984
_020BC954:
	mov r0, r5
	mov r1, r8
	bl sub_020BDF34
	cmp r0, #0
	beq _020BC978
	add r0, r7, r0
	mvn r1, fp, lsl r6
	and r1, sb, r1
	orr sb, r1, r0, lsl r6
_020BC978:
	add r6, r6, #4
	cmp r6, sl
	blo _020BC954
_020BC984:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	str sb, [r1], #4
	cmp r1, r0
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	add r4, r4, r0
	blo _020BC910
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BC9AC:
	ldr r5, [r0, #0x24]
	add r0, r1, r3, lsl #3
	add fp, r1, r2, lsl #3
	str r0, [sp, #4]
	cmp fp, r0
	addhs sp, sp, #0x28
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BC9C8:
	mov r1, r4, lsr #0x1f
	rsb r0, r1, r4, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, [sp, #0x14]
	ldmia fp, {r6, r7}
	mov r2, #0
	add r0, r0, r4, lsr #3
	str r0, [sp, #0x18]
	add r0, sp, #0x18
	strb r2, [sp, #0x1c]
	strb r2, [sp, #0x1d]
	bl sub_020BDF34
	ldr sb, [sp]
	mov r0, sb
	cmp r0, sl
	bhs _020BCA58
_020BCA08:
	add r0, sp, #0x18
	mov r1, r8
	bl sub_020BDF34
	cmp r0, #0
	beq _020BCA4C
	add r1, r5, r0
	cmp sb, #0x20
	mov r0, #0xff
	bhs _020BCA3C
	mvn r0, r0, lsl sb
	and r0, r6, r0
	orr r6, r0, r1, lsl sb
	b _020BCA4C
_020BCA3C:
	sub r2, sb, #0x20
	mvn r0, r0, lsl r2
	and r0, r7, r0
	orr r7, r0, r1, lsl r2
_020BCA4C:
	add sb, sb, #8
	cmp sb, sl
	blo _020BCA08
_020BCA58:
	ldr r0, [sp, #4]
	stmia fp, {r6, r7}
	add fp, fp, #8
	cmp fp, r0
	ldr r0, [sp, #0x10]
	add r4, r4, r0
	blo _020BC9C8
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BC83C

	arm_func_start sub_020BCA7C
sub_020BCA7C: ; 0x020BCA7C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r4, [sp, #0x54]
	ldrb r6, [r0, #0xc]
	str r4, [sp, #0x54]
	ldr r4, [r4]
	ldr r5, [r1]
	mov r7, r6, lsl #6
	ldrb r4, [r4, #1]
	mov r6, r7, asr #2
	add r6, r7, r6, lsr #29
	cmp r4, #0
	ldr r5, [r5, #8]
	mov sl, r2
	mov sb, r3
	mov r8, r6, asr #3
	addeq sp, sp, #0x2c
	ldmib r0, {fp, ip}
	ldr lr, [r0]
	ldrb r2, [r5, #1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	adds r7, sl, r4
	addmi sp, sp, #0x2c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	adds r3, sb, r2
	addmi sp, sp, #0x2c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movle r5, #0
	movgt r5, sl, lsr #3
	cmp sb, #0
	movle r6, #0
	add r7, r7, #7
	movgt r6, sb, lsr #3
	cmp fp, r7, lsr #3
	mov r7, r7, lsr #3
	add r3, r3, #7
	movls r7, fp
	mov fp, r3, lsr #3
	cmp ip, r3, lsr #3
	movls fp, ip
	subs r3, r7, r5
	sub fp, fp, r6
	addmi sp, sp, #0x2c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp fp, #0
	addlt sp, sp, #0x2c
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [r0, #0x10]
	cmp sl, #0
	mla r6, r7, r6, r5
	sub r5, r7, r3
	mul r5, r8, r5
	str r5, [sp]
	ldr r5, [sp, #0x54]
	mla r7, r8, r6, lr
	ldr ip, [r5, #4]
	ldr r6, [sp, #0x50]
	str ip, [sp, #8]
	sub r5, r6, #1
	str r4, [sp, #0x14]
	str r5, [sp, #0x28]
	str r2, [sp, #0x18]
	ldr r2, [r1]
	andge sl, sl, #7
	ldr r2, [r2, #8]
	cmp sb, #0
	ldrb r2, [r2, #6]
	andge sb, sb, #7
	sub fp, sb, fp, lsl #3
	str r2, [sp, #0x20]
	ldrb r0, [r0, #0xc]
	cmp sb, fp
	sub r6, sl, r3, lsl #3
	str r0, [sp, #0x24]
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0]
	smulbb r0, r2, r0
	str r0, [sp, #0x1c]
	addle sp, sp, #0x2c
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r4, sp, #4
_020BCBC8:
	mov r5, sl
	str sb, [sp, #0x10]
	cmp sl, r6
	ble _020BCBF8
_020BCBD8:
	mov r0, r4
	str r7, [sp, #4]
	str r5, [sp, #0xc]
	bl sub_020BC83C
	sub r5, r5, #8
	cmp r5, r6
	add r7, r7, r8
	bgt _020BCBD8
_020BCBF8:
	ldr r0, [sp]
	sub sb, sb, #8
	cmp sb, fp
	add r7, r7, r0
	bgt _020BCBC8
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BCA7C

	arm_func_start sub_020BCC14
sub_020BCC14: ; 0x020BCC14
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	ldr r6, [sp, #0x74]
	ldrb r5, [r0, #0xc]
	ldr r4, [r6]
	ldr r7, [r1]
	mov r8, r5, lsl #6
	ldrb r4, [r4, #1]
	mov r5, r8, asr #2
	add r5, r8, r5, lsr #29
	ldr r7, [r7, #8]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r4, #0
	mov sb, r5, asr #3
	addeq sp, sp, #0x4c
	ldmib r0, {r3, r5}
	ldrb r2, [r7, #1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sp, #8]
	adds r7, r7, r4
	addmi sp, sp, #0x4c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r8, [sp, #0xc]
	adds r8, r8, r2
	addmi sp, sp, #0x4c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sl, [sp, #8]
	add r7, r7, #7
	cmp sl, #0
	movle sl, #0
	strle sl, [sp, #0x10]
	movgt sl, sl, lsr #3
	strgt sl, [sp, #0x10]
	ldr sl, [sp, #0xc]
	cmp sl, #0
	movle sl, #0
	movgt sl, sl, lsr #3
	cmp r3, r7, lsr #3
	mov r7, r7, lsr #3
	movls r7, r3
	add r3, r8, #7
	cmp r5, r3, lsr #3
	mov r8, r3, lsr #3
	ldr r3, [sp, #0x10]
	movls r8, r5
	subs r5, r7, r3
	sub r7, r8, sl
	addmi sp, sp, #0x4c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0
	addlt sp, sp, #0x4c
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [sp, #8]
	ldr fp, [r0]
	cmp r3, #0
	andge r3, r3, #7
	strge r3, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r8, [sp, #8]
	ldr r6, [r6, #4]
	cmp r3, #0
	andge r3, r3, #7
	strge r3, [sp, #0xc]
	ldr r3, [sp, #0x70]
	sub r5, r8, r5, lsl #3
	ldr r8, [sp, #0xc]
	sub r3, r3, #1
	str r3, [sp, #0x48]
	sub r7, r8, r7, lsl #3
	str r2, [sp, #0x38]
	str r6, [sp, #0x28]
	str r4, [sp, #0x34]
	ldr r4, [r1]
	mov r3, r8
	mov r2, r7
	cmp r3, r2
	ldr r2, [r4, #8]
	str r7, [sp, #0x1c]
	ldrb r3, [r2, #6]
	str r3, [sp, #0x40]
	ldrb r2, [r0, #0xc]
	str r2, [sp, #0x44]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	ldrb r1, [r1]
	smulbb r1, r3, r1
	str r1, [sp, #0x3c]
	ldr r3, [r0, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r0, #8]
	str r1, [sp, #0x14]
	mov r2, r3, lsl #0x18
	mov r1, r3, lsl #0x10
	str r3, [sp, #0x20]
	str r0, [sp, #0x18]
	mov r8, r2, lsr #0x18
	mov r7, r1, lsr #0x18
	addle sp, sp, #0x4c
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BCDA4:
	ldr r0, [sp, #0xc]
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x30]
	ldr r0, [sp, #8]
	cmp r0, r5
	mov r4, r0
	ble _020BCE00
_020BCDC0:
	ldr r2, [sp, #0x14]
	str r8, [sp]
	ldr r3, [sp, #0x18]
	mov r0, r6
	mov r1, sl
	str r7, [sp, #4]
	bl sub_020BC5F0
	mla r1, r0, sb, fp
	add r0, sp, #0x24
	str r4, [sp, #0x2c]
	str r1, [sp, #0x24]
	bl sub_020BC83C
	sub r4, r4, #8
	add r6, r6, #1
	cmp r4, r5
	bgt _020BCDC0
_020BCE00:
	ldr r0, [sp, #0xc]
	add sl, sl, #1
	sub r1, r0, #8
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0xc]
	cmp r1, r0
	bgt _020BCDA4
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BCC14

	arm_func_start sub_020BCE24
sub_020BCE24: ; 0x020BCE24
	stmdb sp!, {r3, lr}
	mov r3, r0
	ldrb r2, [r3, #0xc]
	ldr ip, [r3, #4]
	cmp r2, #4
	orreq r0, r1, r1, lsl #4
	orreq r0, r0, r0, lsl #8
	orrne r0, r1, r1, lsl #8
	orr r1, r0, r0, lsl #16
	ldr r0, [r3, #8]
	mov r2, r2, lsl #6
	mul lr, ip, r0
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	mov r2, r0, asr #3
	mov r0, r1
	mul r2, lr, r2
	ldr r1, [r3]
	bl sub_020D4858
	ldmia sp!, {r3, pc}
	arm_func_end sub_020BCE24

	arm_func_start sub_020BCE74
sub_020BCE74: ; 0x020BCE74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldrb r2, [r7, #0xc]
	mov r6, r1
	ldr sb, [r7]
	cmp r2, #4
	orreq r0, r6, r6, lsl #4
	orreq r0, r0, r0, lsl #8
	orrne r0, r6, r6, lsl #8
	mov r1, r2, lsl #6
	orr r6, r0, r0, lsl #16
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r3, r0, asr #3
	ldr r2, [r7, #0x10]
	ldr r1, [r7, #4]
	ldr r0, [r7, #8]
	mul r5, r3, r2
	mul r4, r3, r1
	mov r8, #0
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020BCECC:
	mov r0, r6
	mov r1, sb
	mov r2, r4
	bl sub_020D4858
	ldr r0, [r7, #8]
	add r8, r8, #1
	cmp r8, r0
	add sb, sb, r5
	blt _020BCECC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020BCE74

	arm_func_start sub_020BCEF4
sub_020BCEF4: ; 0x020BCEF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x58]
	mov sb, r2
	ldrb fp, [r0, #0xc]
	mov sl, r1
	add r1, sb, r4
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x5c]
	mov r1, r3
	add r1, r1, r2
	cmp fp, #4
	str r1, [sp, #0x24]
	orreq r1, sl, sl, lsl #4
	orreq r1, r1, r1, lsl #8
	orrne r1, sl, sl, lsl #8
	str r3, [sp, #0xc]
	orr sl, r1, r1, lsl #16
	ldr r1, [sp, #0xc]
	mov r6, fp, lsl #6
	bic r1, r1, #7
	mov r4, r6, asr #2
	mov r2, r1, asr #2
	str r1, [sp, #0x2c]
	add r1, r1, r2, lsr #29
	ldr r2, [r0, #0x10]
	mov r3, r1, asr #3
	mul r1, r3, r2
	bic r3, sb, #7
	mov r5, r3, asr #2
	add r4, r6, r4, lsr #29
	str r3, [sp, #0x18]
	add r5, r3, r5, lsr #29
	mov r3, r4, asr #3
	str r3, [sp, #0x14]
	add r4, r1, r5, asr #3
	ldr r3, [sp, #0x24]
	ldr r5, [r0]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mla r4, r1, r4, r5
	add r3, r3, #7
	bic r1, r3, #7
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x14]
	add r0, r0, #7
	mul r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	str r4, [sp, #0x1c]
	cmp r2, r1
	bic r6, r0, #7
	addge sp, sp, #0x30
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BCFD0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	movge r8, #0
	bge _020BCFF0
	mov r1, r0
	ldr r0, [sp, #0x2c]
	sub r8, r1, r0
_020BCFF0:
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	ldr r7, [sp, #0x1c]
	sub r0, r1, r0
	cmp r0, #8
	movgt r0, #8
	sub r5, r0, r8
	ldr r0, [sp, #0x18]
	cmp r0, r6
	mov r4, r0
	bge _020BD060
_020BD01C:
	ldr r0, [sp, #0x28]
	cmp r4, sb
	sublt r1, sb, r4
	sub r0, r0, r4
	movge r1, #0
	cmp r0, #8
	movgt r0, #8
	sub r3, r0, r1
	mov r0, r7
	mov r2, r8
	stmia sp, {r5, sl, fp}
	bl sub_020BC704
	ldr r0, [sp, #0x14]
	add r4, r4, #8
	add r7, r7, r0
	cmp r4, r6
	blt _020BD01C
_020BD060:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	add r1, r0, #8
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x2c]
	cmp r1, r0
	blt _020BCFD0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BCEF4

	arm_func_start sub_020BD090
sub_020BD090: ; 0x020BD090
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	ldrb r4, [r0, #0xc]
	mov sl, r2
	mov fp, r1
	str r4, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r4, [sp, #0x70]
	cmp r1, #4
	add r1, sl, r4
	str r1, [sp, #0x3c]
	ldr r2, [sp, #0x74]
	mov r1, r3
	add r1, r1, r2
	bic r2, sl, #7
	str r1, [sp, #0x38]
	str r3, [sp, #0xc]
	str r2, [sp, #0x28]
	ldr r2, [sp, #0xc]
	orreq r1, fp, fp, lsl #4
	bic r2, r2, #7
	str r2, [sp, #0x40]
	ldr r2, [sp, #0x10]
	orreq r1, r1, r1, lsl #8
	mov r5, r2, lsl #6
	ldr r2, [sp, #0x38]
	mov r3, r5, asr #2
	add r6, r2, #7
	ldr r2, [sp, #0x28]
	add r3, r5, r3, lsr #29
	mov r4, r2, asr #2
	ldr r2, [sp, #0x40]
	orrne r1, fp, fp, lsl #8
	mov r5, r2, asr #2
	bic r2, r6, #7
	str r2, [sp, #0x34]
	mov r2, r3, asr #3
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x28]
	orr fp, r1, r1, lsl #16
	add r2, r2, r4, lsr #29
	mov r2, r2, asr #3
	str r2, [sp, #0x2c]
	ldr r2, [sp, #0x40]
	ldr r1, [r0, #0x10]
	add r2, r2, r5, lsr #29
	mov r8, r2, asr #3
	ldr r3, [sp, #0x40]
	ldr r2, [sp, #0x34]
	str r1, [sp, #0x44]
	cmp r3, r2
	ldr r2, [sp, #0x3c]
	add r2, r2, #7
	bic r7, r2, #7
	ldr r2, [r0, #4]
	str r2, [sp, #0x18]
	ldr r2, [r0, #8]
	ldr r0, [r0]
	str r2, [sp, #0x1c]
	str r0, [sp, #0x30]
	mov r0, r1, lsl #0x18
	mov r0, r0, lsr #0x18
	str r0, [sp, #0x20]
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x18
	str r0, [sp, #0x24]
	addge sp, sp, #0x48
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BD1A0:
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	movge sb, #0
	bge _020BD1C0
	mov r1, r0
	ldr r0, [sp, #0x40]
	sub sb, r1, r0
_020BD1C0:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x40]
	ldr r6, [sp, #0x2c]
	sub r0, r1, r0
	cmp r0, #8
	movgt r0, #8
	sub r5, r0, sb
	ldr r0, [sp, #0x28]
	cmp r0, r7
	mov r4, r0
	bge _020BD260
_020BD1EC:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, r6
	mov r1, r8
	bl sub_020BC5F0
	ldr r2, [sp, #0x3c]
	cmp r4, sl
	sublt r1, sl, r4
	sub r2, r2, r4
	movge r1, #0
	cmp r2, #8
	movgt r2, #8
	stmia sp, {r5, fp}
	sub r3, r2, r1
	ldr r2, [sp, #0x10]
	ldr ip, [sp, #0x14]
	str r2, [sp, #8]
	ldr r2, [sp, #0x30]
	mla r0, ip, r0, r2
	mov r2, sb
	bl sub_020BC704
	add r4, r4, #8
	add r6, r6, #1
	cmp r4, r7
	blt _020BD1EC
_020BD260:
	ldr r0, [sp, #0x40]
	add r8, r8, #1
	add r1, r0, #8
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x40]
	cmp r1, r0
	blt _020BD1A0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BD090

	arm_func_start sub_020BD284
sub_020BD284: ; 0x020BD284
	str r2, [r0, #4]
	ldr r2, [sp]
	str r3, [r0, #8]
	strb r2, [r0, #0xc]
	ldr r2, [sp, #4]
	str r1, [r0]
	ldr r1, [sp, #8]
	str r2, [r0, #0x14]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_020BD284

	arm_func_start sub_020BD2AC
sub_020BD2AC: ; 0x020BD2AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r7, r1
	ldrh r1, [sp, #0x2c]
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	bl sub_020BC3A8
	ldr r1, _020BD3CC ; =0x0000FFFF
	mov r4, r0
	cmp r4, r1
	ldreq r0, [r7]
	ldreqh r4, [r0, #2]
	mov r0, r7
	mov r1, r4
	bl sub_020BC3F0
	str r0, [sp, #8]
	ldr r1, [r7]
	ldr r2, [r1, #8]
	ldrh r1, [r2, #2]
	add r2, r2, #8
	mla r1, r4, r1, r2
	str r1, [sp, #0xc]
	ldr r1, [r7]
	ldr r3, [r1, #8]
	ldrb r1, [r3, #7]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _020BD390
_020BD324: ; jump table
	b _020BD344 ; case 0
	b _020BD350 ; case 1
	b _020BD350 ; case 2
	b _020BD364 ; case 3
	b _020BD364 ; case 4
	b _020BD380 ; case 5
	b _020BD380 ; case 6
	b _020BD344 ; case 7
_020BD344:
	ldrsb r0, [r0]
	add r6, r6, r0
	b _020BD390
_020BD350:
	ldrb r1, [r3]
	ldrsb r0, [r0]
	sub r6, r6, r1
	add r5, r5, r0
	b _020BD390
_020BD364:
	ldrsb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r0, [r3, #1]
	add r1, r2, r1
	sub r6, r6, r1
	sub r5, r5, r0
	b _020BD390
_020BD380:
	ldrsb r1, [r0]
	ldrb r0, [r3, #1]
	add r0, r1, r0
	sub r5, r5, r0
_020BD390:
	ldr r1, [sp, #0x28]
	add r0, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [r8, #0x14]
	mov r0, r8
	ldr r4, [r1]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	blx r4
	ldr r0, [sp, #8]
	ldrsb r0, [r0, #2]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BD3CC: .word 0x0000FFFF
	arm_func_end sub_020BD2AC

	arm_func_start sub_020BD3D0
sub_020BD3D0: ; 0x020BD3D0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr lr, [sp, #0x10]
	ldr ip, _020BD3F8 ; =0x021093FC
	str lr, [sp]
	str ip, [sp, #4]
	str r2, [sp, #8]
	bl sub_020BD284
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020BD3F8: .word 0x021093FC
	arm_func_end sub_020BD3D0

	arm_func_start sub_020BD3FC
sub_020BD3FC: ; 0x020BD3FC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	cmp r2, #8
	movlt r4, r2
	movge ip, #3
	clzlt r4, r4
	rsblt ip, r4, #0x1f
	cmp r3, #8
	movlt r4, r3
	movge r5, #3
	clzlt r4, r4
	rsblt r5, r4, #0x1f
	ldr r4, _020BD47C ; =0x02109414
	ldr lr, [sp, #0xc]
	add r5, r4, r5, lsl #3
	add r4, r5, ip, lsl #1
	ldrb ip, [r5, ip, lsl #1]
	bic r5, lr, #0xff
	ldrb r4, [r4, #1]
	ldr lr, [sp, #0x20]
	orr r5, r5, ip
	str lr, [sp]
	ldr ip, _020BD480 ; =0x02109408
	bic lr, r5, #0xff00
	mov r4, r4, lsl #0x18
	orr r4, lr, r4, lsr #16
	str ip, [sp, #4]
	str r4, [sp, #0xc]
	str r4, [sp, #8]
	bl sub_020BD284
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BD47C: .word 0x02109414
_020BD480: .word 0x02109408
	arm_func_end sub_020BD3FC

	arm_func_start sub_020BD484
sub_020BD484: ; 0x020BD484
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r5, [sp, #0x24]
	ldr lr, [sp, #0x20]
	cmp r5, #0x20
	ldr ip, [sp, #0x28]
	bgt _020BD4C0
	mla r4, r5, lr, r3
	ldr lr, [sp, #0x2c]
	mov r3, r5
	add r0, r0, r4, lsl #1
	stmia sp, {ip, lr}
	bl sub_020BD534
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020BD4C0:
	add r6, lr, r2
	ldr r4, [sp, #0x2c]
	cmp lr, r6
	add r5, r3, r1
	addge sp, sp, #8
	mov r1, r4, lsl #0x1c
	ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
_020BD4DC:
	cmp lr, #0x20
	movlt r2, lr
	addge r2, lr, #0x20
	mov r7, r3
	cmp r3, r5
	add r8, r0, r2, lsl #6
	bge _020BD520
_020BD4F8:
	cmp r7, #0x20
	movlt r2, r7
	addge r2, r7, #0x3e0
	orr r4, ip, r1, lsr #16
	mov r2, r2, lsl #1
	add r7, r7, #1
	strh r4, [r8, r2]
	cmp r7, r5
	add ip, ip, #1
	blt _020BD4F8
_020BD520:
	add lr, lr, #1
	cmp lr, r6
	blt _020BD4DC
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020BD484

	arm_func_start sub_020BD534
sub_020BD534: ; 0x020BD534
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, [sp, #0x1c]
	ldr r8, [sp, #0x18]
	mov r6, #0
	cmp r2, #0
	mov ip, r4, lsl #0x1c
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r4, r6
_020BD554:
	mov r7, r0
	mov r5, r4
	cmp r1, #0
	ble _020BD57C
_020BD564:
	orr lr, r8, ip, lsr #16
	add r5, r5, #1
	cmp r5, r1
	add r8, r8, #1
	strh lr, [r7], #2
	blt _020BD564
_020BD57C:
	add r6, r6, #1
	cmp r6, r2
	add r0, r0, r3, lsl #1
	blt _020BD554
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020BD534

	arm_func_start sub_020BD590
sub_020BD590: ; 0x020BD590
	stmdb sp!, {r3, r4, r5, lr}
	mov r3, r0, lsr #3
	mov r5, r1, lsr #3
	mov r2, #0
	mla lr, r3, r5, r2
	and r4, r0, #2
	and r2, r0, #1
	add r2, r2, r4, lsr #1
	and r0, r0, #4
	mov ip, r2, lsl #1
	add ip, ip, r0, lsr #2
	mla ip, r5, ip, lr
	and r4, r1, #2
	and lr, r1, #1
	add r4, lr, r4, lsr #1
	and lr, r1, #4
	mov r1, r4, lsl #1
	add r1, r1, lr, lsr #2
	mla ip, r3, r1, ip
	add r1, r2, r0, lsr #2
	add r0, r4, lr, lsr #2
	mla r0, r1, r0, ip
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BD590

	arm_func_start sub_020BD5EC
sub_020BD5EC: ; 0x020BD5EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	mov r7, r0
	mov r0, r1
	cmp r0, #8
	ldr r0, [sp, #0x60]
	str r1, [sp, #0x10]
	str r0, [sp, #0x60]
	str r2, [sp, #0x14]
	ldrlt r0, [sp, #0x10]
	str r3, [sp, #0x34]
	ldr r6, [sp, #0x64]
	ldr r5, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	movge r2, #3
	clzlt r0, r0
	rsblt r2, r0, #0x1f
	ldr r0, [sp, #0x14]
	cmp r0, #8
	ldrlt r0, [sp, #0x14]
	movge r1, #3
	clzlt r0, r0
	rsblt r1, r0, #0x1f
	ldr r0, _020BD8D8 ; =0x02109414
	mvn r3, #0
	add r1, r0, r1, lsl #3
	add r0, r1, r2, lsl #1
	ldrb fp, [r1, r2, lsl #1]
	ldrb r1, [r0, #1]
	ldr r2, [sp, #0x14]
	cmp r6, #0
	str r1, [sp, #0x30]
	ldr r1, [sp, #0x10]
	and r1, r1, r3, lsl fp
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	and r1, r2, r3, lsl r1
	str r1, [sp, #0x28]
	moveq r1, #1
	streq r1, [sp, #0x18]
	movne r1, #2
	strne r1, [sp, #0x18]
	mov r1, #0
	str r1, [sp, #0x24]
	bl sub_020BC6E8
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	mov sb, r1, asr fp
	ldr r1, [sp, #0x30]
	mov r1, r2, asr r1
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x18]
	mov r2, r1, lsl fp
	ldr r1, [sp, #0x30]
	mov r8, r2, lsl r1
	mov r1, #0
	str r1, [sp, #0x1c]
	b _020BD76C
_020BD6D4:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x30]
	mov sl, #0
	mov r2, r2, lsl r1
	ldr r1, [sp, #0x60]
	add r1, r1, r2, lsl #3
	mov r2, #0x400
	and r3, r1, #0xff
	rsb r2, r2, #0
	b _020BD758
_020BD6FC:
	mov ip, sl, lsl fp
	ldr r1, [sp, #0x34]
	add sl, sl, #1
	add r1, r1, ip, lsl #3
	mov lr, r1, lsl #0x17
	ldr ip, [r7]
	ldr r1, _020BD8DC ; =0xFE00FF00
	and r1, ip, r1
	orr r1, r1, r3
	orr ip, r1, lr, lsr #7
	ldr r1, _020BD8E0 ; =0x3FFF3FFF
	and r1, ip, r1
	orr r1, r1, r0
	str r1, [r7]
	ldrh r1, [r7, #4]
	and r1, r1, r2
	orr r1, r1, r5
	strh r1, [r7, #4]
	ldr r1, [r7]
	add r5, r5, r8, asr r4
	bic r1, r1, #0x2000
	orr r1, r1, r6, lsl #13
	str r1, [r7], #8
_020BD758:
	cmp sl, sb
	blt _020BD6FC
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	str r1, [sp, #0x1c]
_020BD76C:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	cmp r2, r1
	blt _020BD6D4
	ldr r0, [sp, #0x24]
	mla r0, sb, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bhs _020BD7F4
	ldr r0, [sp, #0x60]
	ldr r1, [sp, #0x10]
	stmia sp, {r0, r6}
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x2c]
	sub r8, r1, r0
	ldr r1, [sp, #0x34]
	str r5, [sp, #8]
	add r3, r1, r2, lsl #3
	ldr r2, [sp, #0x28]
	mov r0, r7
	mov r1, r8
	str r4, [sp, #0xc]
	bl sub_020BD5EC
	ldr r1, [sp, #0x18]
	add r7, r7, r0, lsl #3
	mul r2, r1, r8
	ldr r1, [sp, #0x28]
	mul r2, r1, r2
	ldr r1, [sp, #0x24]
	add r5, r5, r2, lsr r4
	add r0, r1, r0
	str r0, [sp, #0x24]
_020BD7F4:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bhs _020BD860
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x34]
	add r0, r1, r0, lsl #3
	stmia sp, {r0, r6}
	str r5, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	str r4, [sp, #0xc]
	sub r8, r1, r0
	ldr r1, [sp, #0x2c]
	mov r0, r7
	mov r2, r8
	bl sub_020BD5EC
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x2c]
	add r7, r7, r0, lsl #3
	mul r1, r2, r1
	mul r1, r8, r1
	add r5, r5, r1, lsr r4
	ldr r1, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x24]
_020BD860:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	ldrlo r1, [sp, #0x28]
	ldrlo r0, [sp, #0x14]
	cmplo r1, r0
	bhs _020BD8CC
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	add r0, r1, r0, lsl #3
	stmia sp, {r0, r6}
	str r5, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x14]
	sub r1, r2, r1
	ldr r2, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	sub r2, r3, r2
	ldr r3, [sp, #0x34]
	mov r0, r7
	add r3, r3, r5, lsl #3
	str r4, [sp, #0xc]
	bl sub_020BD5EC
	ldr r1, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x24]
_020BD8CC:
	ldr r0, [sp, #0x24]
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BD8D8: .word 0x02109414
_020BD8DC: .word 0xFE00FF00
_020BD8E0: .word 0x3FFF3FFF
	arm_func_end sub_020BD5EC

	arm_func_start sub_020BD8E4
sub_020BD8E4: ; 0x020BD8E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov fp, r0
	ldr r4, [fp, #8]
	ldr r5, [fp, #4]
	ldr r6, [sp, #0x38]
	add r0, sp, #0xc
	str r6, [sp, #0xc]
	ldr r6, [r5, #4]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #8]
	ldrsb r8, [sp, #0x41]
	blx r6
	cmp r0, #0
	beq _020BD96C
	ldrsb r7, [sp, #0x40]
_020BD928:
	cmp r0, #0xa
	beq _020BD96C
	ldr r1, [sp, #8]
	mov r2, sl
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [fp]
	mov r1, r5
	mov r3, sb
	bl sub_020BD2AC
	add r0, r4, r0
	mla sl, r0, r7, sl
	mla sb, r0, r8, sb
	add r0, sp, #0xc
	blx r6
	cmp r0, #0
	bne _020BD928
_020BD96C:
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0xa
	ldreq r1, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	movne r1, #0
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BD8E4

	arm_func_start sub_020BD998
sub_020BD998: ; 0x020BD998
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sl, r0
	ldr r0, [sl, #4]
	ldr r4, [sp, #0x60]
	ldr r0, [r0]
	ldrsb r8, [sp, #0x65]
	ldrsb r0, [r0, #1]
	ldr r5, [sl, #0xc]
	ldrsb sb, [sp, #0x64]
	add r5, r5, r0
	rsb r0, r8, #0
	mul r0, r5, r0
	str r0, [sp, #0x20]
	mul r0, r5, sb
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x58]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	mov fp, r3
	str r4, [sp, #0x30]
	cmp r4, #0
	str r0, [sp, #0x58]
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [sp, #0x5c]
	mov r6, #0
	and r0, r2, #0x800
	add r1, fp, #1
	str r0, [sp, #0x18]
	add r0, r1, r1, lsr #31
	str r0, [sp, #0x2c]
	and r0, r2, #0x400
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x64]
	mov r7, r6
	str r0, [sp, #0x24]
	ldrb r0, [sp, #0x65]
	str r0, [sp, #0x28]
_020BDA34:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldr r0, [sp, #0xc]
	add r4, r0, r6
	ldr r0, [sp, #0x10]
	add r5, r0, r7
	beq _020BDA70
	ldr r2, [sp, #0x30]
	mov r3, #0
	ldmib sl, {r0, r1}
	bl sub_020BC43C
	sub r0, fp, r0
	mla r4, r0, sb, r4
	mla r5, r0, r8, r5
	b _020BDAA8
_020BDA70:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _020BDAA8
	ldr r2, [sp, #0x30]
	mov r3, #0
	ldmib sl, {r0, r1}
	bl sub_020BC43C
	add r0, r0, #1
	add r0, r0, r0, lsr #31
	mov r1, r0, asr #1
	ldr r0, [sp, #0x2c]
	rsb r0, r1, r0, asr #1
	mla r4, r0, sb, r4
	mla r5, r0, r8, r5
_020BDAA8:
	ldr r3, [sp, #0x30]
	mov r1, r4
	str r3, [sp]
	add r3, sp, #0x30
	str r3, [sp, #4]
	ldr r3, [sp, #0x24]
	mov r2, r5
	strb r3, [sp, #8]
	ldr r3, [sp, #0x28]
	mov r0, sl
	strb r3, [sp, #9]
	ldr r3, [sp, #0x58]
	bl sub_020BD8E4
	ldr r0, [sp, #0x20]
	add r6, r6, r0
	ldr r0, [sp, #0x1c]
	add r7, r7, r0
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020BDA34
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BD998

	arm_func_start sub_020BDB00
sub_020BDB00: ; 0x020BDB00
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	ldr r4, [sp, #0x44]
	mov r8, r0
	str r4, [sp]
	add r0, sp, #0x18
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldmib r8, {r1, r2, r3}
	ldr r4, [sp, #0x40]
	bl sub_020BC55C
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	tst r4, #0x10
	beq _020BDB74
	add r0, r2, #1
	rsb r0, r0, #0
	add r0, r0, r0, lsr #31
	ldrsb r1, [sp, #0x48]
	mov r2, r0, asr #1
	ldrsb r0, [sp, #0x49]
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
	b _020BDB90
_020BDB74:
	tst r4, #0x20
	beq _020BDB90
	ldrsb r1, [sp, #0x48]
	ldrsb r0, [sp, #0x49]
	rsb r2, r2, #0
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
_020BDB90:
	tst r4, #2
	beq _020BDBC4
	ldr r0, [sp, #0x24]
	ldrsb r2, [sp, #0x49]
	add r0, r0, #1
	rsb r0, r0, #0
	add r0, r0, r0, lsr #31
	ldrsb r1, [sp, #0x48]
	mov r3, r0, asr #1
	rsb r0, r2, #0
	mla r7, r3, r0, r7
	mla r6, r3, r1, r6
	b _020BDBE8
_020BDBC4:
	tst r4, #4
	beq _020BDBE8
	ldrsb r1, [sp, #0x49]
	ldr r2, [sp, #0x24]
	ldrsb r0, [sp, #0x48]
	rsb r2, r2, #0
	rsb r1, r1, #0
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
_020BDBE8:
	str r5, [sp]
	ldr r1, [sp, #0x44]
	str r4, [sp, #4]
	ldrb r0, [sp, #0x48]
	str r1, [sp, #8]
	ldrb r4, [sp, #0x49]
	strb r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	strb r4, [sp, #0xd]
	bl sub_020BD998
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020BDB00

	arm_func_start sub_020BDC24
sub_020BDC24: ; 0x020BDC24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr ip, [sp, #0x30]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	tst ip, #0x100
	beq _020BDC78
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	ldr r2, [sp, #0x34]
	bl sub_020BC4E8
	ldrsb r2, [sp, #0x39]
	ldr r3, [sp, #0x28]
	ldrsb r1, [sp, #0x38]
	sub r3, r3, r0
	rsb r0, r2, #0
	mla r6, r3, r0, r6
	mla r5, r3, r1, r5
	b _020BDCC0
_020BDC78:
	tst ip, #0x80
	beq _020BDCC0
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	ldr r2, [sp, #0x34]
	bl sub_020BC4E8
	ldr r1, [sp, #0x28]
	add r0, r0, #1
	ldrsb r3, [sp, #0x39]
	add ip, r1, #1
	add r1, r0, r0, lsr #31
	ldrsb r2, [sp, #0x38]
	add r0, ip, ip, lsr #31
	mov r1, r1, asr #1
	rsb r1, r1, r0, asr #1
	rsb r0, r3, #0
	mla r6, r1, r0, r6
	mla r5, r1, r2, r5
_020BDCC0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	str r1, [sp]
	ldr r1, [sp, #0x34]
	str r0, [sp, #4]
	ldrb r0, [sp, #0x38]
	str r1, [sp, #8]
	ldrb ip, [sp, #0x39]
	strb r0, [sp, #0xc]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	strb ip, [sp, #0xd]
	bl sub_020BD998
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020BDC24

	arm_func_start sub_020BDD04
sub_020BDD04: ; 0x020BDD04
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, #0
	beq _020BDD7C
	cmp r6, #0
	beq _020BDD34
	ldr r1, [r6]
	ldr r0, _020BDE4C ; =0x4E465452
	cmp r1, r0
	moveq r0, #1
	beq _020BDD38
_020BDD34:
	mov r0, #0
_020BDD38:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020BDD80
	cmp r6, #0
	beq _020BDD68
	ldrh r1, [r6, #6]
	ldr r0, _020BDE50 ; =0x00000101
	cmp r1, r0
	movhs r0, #1
	bhs _020BDD6C
_020BDD68:
	mov r0, #0
_020BDD6C:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _020BDD80
_020BDD7C:
	mov r0, r4
_020BDD80:
	cmp r0, #0
	bne _020BDE00
	cmp r6, #0
	beq _020BDDEC
	beq _020BDDA8
	ldr r1, [r6]
	ldr r0, _020BDE4C ; =0x4E465452
	cmp r1, r0
	moveq r0, #1
	beq _020BDDAC
_020BDDA8:
	mov r0, #0
_020BDDAC:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020BDDF0
	cmp r6, #0
	beq _020BDDD8
	ldrh r0, [r6, #6]
	cmp r0, #0x100
	movhs r0, #1
	bhs _020BDDDC
_020BDDD8:
	mov r0, #0
_020BDDDC:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _020BDDF0
_020BDDEC:
	mov r0, #0
_020BDDF0:
	cmp r0, #0
	bne _020BDDFC
	bl sub_020D3F48
_020BDDFC:
	mov r4, #1
_020BDE00:
	mov r0, r6
	bl sub_020BDE58
	ldr r1, _020BDE54 ; =0x46494E46
	mov r0, r6
	bl sub_020B720C
	cmp r0, #0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r0, #8
	str r0, [r5]
	cmp r4, #0
	beq _020BDE44
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #7]
_020BDE44:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BDE4C: .word 0x4E465452
_020BDE50: .word 0x00000101
_020BDE54: .word 0x46494E46
	arm_func_end sub_020BDD04

	arm_func_start sub_020BDE58
sub_020BDE58: ; 0x020BDE58
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r1, [r0, #0xc]
	ldrh r3, [r0, #0xe]
	mov r2, #0
	add r1, r0, r1
	cmp r3, #0
	ldmleia sp!, {r4, r5, r6, pc}
	ldr r3, _020BDF24 ; =0x46494E46
	ldr ip, _020BDF28 ; =0x43574448
	ldr r4, _020BDF2C ; =0x434D4150
	ldr lr, _020BDF30 ; =0x43474C50
_020BDE84:
	ldr r5, [r1]
	cmp r5, r4
	bhi _020BDE9C
	bhs _020BDEF8
	cmp r5, lr
	b _020BDF08
_020BDE9C:
	cmp r5, ip
	bhi _020BDEAC
	beq _020BDEE4
	b _020BDF08
_020BDEAC:
	cmp r5, r3
	bne _020BDF08
	ldr r5, [r1, #0x10]
	add r5, r5, r0
	str r5, [r1, #0x10]
	ldr r5, [r1, #0x14]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x14]
	ldr r5, [r1, #0x18]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x18]
	b _020BDF08
_020BDEE4:
	ldr r5, [r1, #0xc]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0xc]
	b _020BDF08
_020BDEF8:
	ldr r5, [r1, #0x10]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x10]
_020BDF08:
	ldrh r5, [r0, #0xe]
	ldr r6, [r1, #4]
	add r2, r2, #1
	cmp r2, r5
	add r1, r1, r6
	blt _020BDE84
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BDF24: .word 0x46494E46
_020BDF28: .word 0x43574448
_020BDF2C: .word 0x434D4150
_020BDF30: .word 0x43474C50
	arm_func_end sub_020BDE58

	arm_func_start sub_020BDF34
sub_020BDF34: ; 0x020BDF34
	stmdb sp!, {r4, r5, r6, lr}
	ldrsb r3, [r0, #4]
	ldrb r4, [r0, #5]
	mov r5, r1
	cmp r3, r5
	subge r1, r3, r5
	movge r2, r4, lsr r1
	strgeb r1, [r0, #4]
	bge _020BDF84
	ldr r2, [r0]
	sub r6, r5, r3
	add r1, r2, #1
	str r1, [r0]
	ldrb r3, [r2]
	mov r1, r6
	mov r2, #8
	strb r3, [r0, #5]
	strb r2, [r0, #4]
	bl sub_020BDF34
	orr r2, r0, r4, lsl r6
_020BDF84:
	rsb r0, r5, #8
	mov r1, #0xff
	and r0, r2, r1, asr r0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020BDF34

	arm_func_start sub_020BDF94
sub_020BDF94: ; 0x020BDF94
	ldr r1, [r0]
	ldrh r2, [r1], #2
	str r1, [r0]
	mov r0, r2
	bx lr
	arm_func_end sub_020BDF94

	arm_func_start sub_020BDFA8
sub_020BDFA8: ; 0x020BDFA8
	cmp r0, #0
	cmpne r1, #0
	moveq r0, #0
	bxeq lr
	ldrb r0, [r0]
	cmp r0, #0x4a
	beq _020BDFEC
	cmp r0, #0x4d
	beq _020BDFD8
	cmp r0, #0x56
	beq _020BDFEC
	b _020BE000
_020BDFD8:
	ldrb r0, [r1, #0x18]
	mov r0, r0, lsl #1
	add r0, r0, #0x1c
	bic r0, r0, #3
	bx lr
_020BDFEC:
	ldrb r0, [r1, #0x17]
	mov r0, r0, lsl #1
	add r0, r0, #0x1c
	bic r0, r0, #3
	bx lr
_020BE000:
	mov r0, #0
	bx lr
	arm_func_end sub_020BDFA8

	arm_func_start sub_020BE008
sub_020BE008: ; 0x020BE008
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0
	str ip, [r0]
	str r1, [r0, #8]
	str ip, [r0, #0x10]
	mov r4, #0x7f
	strb r4, [r0, #0x18]
	mov r4, #0x1000
	str r4, [r0, #4]
	str r3, [r0, #0x14]
	strb ip, [r0, #0x19]
	ldr r3, _020BE09C ; =_02110A00
	str ip, [r0, #0xc]
	ldr r7, [r3]
	cmp r7, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r6, [r1]
	ldr r4, _020BE0A0 ; =_02110A24
_020BE050:
	ldrb r3, [r4, ip, lsl #3]
	mov r5, ip, lsl #3
	cmp r6, r3
	bne _020BE08C
	add r3, r4, r5
	ldrh lr, [r1, #2]
	ldrh r3, [r3, #2]
	cmp lr, r3
	bne _020BE08C
	ldr r3, _020BE0A4 ; =_02110A28
	ldr r3, [r3, r5]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	blx r3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020BE08C:
	add ip, ip, #1
	cmp ip, r7
	blo _020BE050
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020BE09C: .word _02110A00
_020BE0A0: .word _02110A24
_020BE0A4: .word _02110A28
	arm_func_end sub_020BE008

	arm_func_start sub_020BE0A8
sub_020BE0A8: ; 0x020BE0A8
	cmp r1, #0
	bxlt lr
	ldrb r2, [r0, #0x19]
	cmp r1, r2
	bxge lr
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #0x1a]
	mov r3, r1, lsl #1
	tst r2, #0x100
	bxeq lr
	add r1, r0, #0x1a
	ldrh r0, [r1, r3]
	bic r0, r0, #0x200
	strh r0, [r1, r3]
	bx lr
	arm_func_end sub_020BE0A8

	arm_func_start sub_020BE0E4
sub_020BE0E4: ; 0x020BE0E4
	cmp r1, #0
	bxlt lr
	ldrb r2, [r0, #0x19]
	cmp r1, r2
	bxge lr
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #0x1a]
	mov r3, r1, lsl #1
	tst r2, #0x100
	bxeq lr
	add r1, r0, #0x1a
	ldrh r0, [r1, r3]
	orr r0, r0, #0x200
	strh r0, [r1, r3]
	bx lr
	arm_func_end sub_020BE0E4

	arm_func_start sub_020BE120
sub_020BE120: ; 0x020BE120
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x54
	bl sub_020D47EC
	ldr r0, _020BE168 ; =_02110A20
	ldr r1, _020BE16C ; =_02110A1C
	ldr r2, [r0]
	ldr r0, _020BE170 ; =_02110A18
	str r2, [r5, #0xc]
	ldr r1, [r1]
	str r1, [r5, #0x14]
	ldr r0, [r0]
	str r0, [r5, #0x1c]
	str r4, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BE168: .word _02110A20
_020BE16C: .word _02110A1C
_020BE170: .word _02110A18
	arm_func_end sub_020BE120

	arm_func_start sub_020BE174
sub_020BE174: ; 0x020BE174
	ldr ip, [r0]
	cmp ip, #0
	streq r1, [r0]
	bxeq lr
	ldr r2, [ip, #0x10]
	cmp r2, #0
	bne _020BE1D4
	ldrb r3, [ip, #0x18]
	ldrb r2, [r1, #0x18]
	cmp r3, r2
	bls _020BE1CC
	ldr r2, [r1, #0x10]
	mov r3, r1
	cmp r2, #0
	beq _020BE1C0
_020BE1B0:
	ldr r3, [r3, #0x10]
	ldr r2, [r3, #0x10]
	cmp r2, #0
	bne _020BE1B0
_020BE1C0:
	str ip, [r3, #0x10]
	str r1, [r0]
	bx lr
_020BE1CC:
	str r1, [ip, #0x10]
	bx lr
_020BE1D4:
	beq _020BE224
	ldrb r3, [r1, #0x18]
_020BE1DC:
	ldrb r0, [r2, #0x18]
	cmp r0, r3
	blo _020BE214
	ldr r0, [r1, #0x10]
	mov r3, r1
	cmp r0, #0
	beq _020BE208
_020BE1F8:
	ldr r3, [r3, #0x10]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	bne _020BE1F8
_020BE208:
	str r1, [ip, #0x10]
	str r2, [r3, #0x10]
	bx lr
_020BE214:
	mov ip, r2
	ldr r2, [r2, #0x10]
	cmp r2, #0
	bne _020BE1DC
_020BE224:
	str r1, [ip, #0x10]
	bx lr
	arm_func_end sub_020BE174

	arm_func_start sub_020BE22C
sub_020BE22C: ; 0x020BE22C
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #1
	mov r4, #0
_020BE240:
	ldrb r2, [r1, #0x19]
	mov r5, r4
	cmp r2, #0
	ble _020BE284
_020BE250:
	add r2, r1, r5, lsl #1
	ldrh r2, [r2, #0x1a]
	tst r2, #0x100
	beq _020BE274
	mov lr, r5, asr #5
	ldr ip, [r0, lr, lsl #2]
	and r2, r5, #0x1f
	orr r2, ip, r3, lsl r2
	str r2, [r0, lr, lsl #2]
_020BE274:
	ldrb r2, [r1, #0x19]
	add r5, r5, #1
	cmp r5, r2
	blt _020BE250
_020BE284:
	ldr r1, [r1, #0x10]
	cmp r1, #0
	bne _020BE240
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BE22C

	arm_func_start sub_020BE294
sub_020BE294: ; 0x020BE294
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	ldrne r0, [r4, #8]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r0]
	cmp r0, #0x4a
	beq _020BE2E4
	cmp r0, #0x4d
	beq _020BE2CC
	cmp r0, #0x56
	beq _020BE2FC
	ldmia sp!, {r3, r4, r5, pc}
_020BE2CC:
	add r0, r5, #0x3c
	bl sub_020BE22C
	mov r1, r4
	add r0, r5, #8
	bl sub_020BE174
	ldmia sp!, {r3, r4, r5, pc}
_020BE2E4:
	add r0, r5, #0x44
	bl sub_020BE22C
	mov r1, r4
	add r0, r5, #0x10
	bl sub_020BE174
	ldmia sp!, {r3, r4, r5, pc}
_020BE2FC:
	add r0, r5, #0x4c
	bl sub_020BE22C
	mov r1, r4
	add r0, r5, #0x18
	bl sub_020BE174
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BE294

	arm_func_start sub_020BE314
sub_020BE314: ; 0x020BE314
	ldr r3, [r0]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r1
	bne _020BE344
	ldr r3, [r3, #0x10]
	mov r2, #0
	str r3, [r0]
	str r2, [r1, #0x10]
	mov r0, #1
	bx lr
_020BE344:
	ldr r2, [r3, #0x10]
	cmp r2, #0
	beq _020BE380
_020BE350:
	cmp r2, r1
	bne _020BE370
	ldr r1, [r2, #0x10]
	mov r0, #0
	str r1, [r3, #0x10]
	str r0, [r2, #0x10]
	mov r0, #1
	bx lr
_020BE370:
	mov r3, r2
	ldr r2, [r2, #0x10]
	cmp r2, #0
	bne _020BE350
_020BE380:
	mov r0, #0
	bx lr
	arm_func_end sub_020BE314

	arm_func_start sub_020BE388
sub_020BE388: ; 0x020BE388
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #8
	mov r4, r1
	bl sub_020BE314
	cmp r0, #0
	bne _020BE3CC
	mov r1, r4
	add r0, r5, #0x10
	bl sub_020BE314
	cmp r0, #0
	bne _020BE3CC
	mov r1, r4
	add r0, r5, #0x18
	bl sub_020BE314
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020BE3CC:
	ldr r0, [r5]
	orr r0, r0, #0x10
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BE388

	arm_func_start sub_020BE3DC
sub_020BE3DC: ; 0x020BE3DC
	cmp r0, #0
	ldrneh r0, [r0, #0xc]
	movne r0, r0, lsl #3
	moveq r0, #0
	bx lr
	arm_func_end sub_020BE3DC

	arm_func_start sub_020BE3F0
sub_020BE3F0: ; 0x020BE3F0
	cmp r0, #0
	ldrneh r0, [r0, #0x1c]
	movne r0, r0, lsl #3
	moveq r0, #0
	bx lr
	arm_func_end sub_020BE3F0

	arm_func_start sub_020BE404
sub_020BE404: ; 0x020BE404
	cmp r1, #0
	strne r1, [r0, #8]
	cmp r2, #0
	strne r2, [r0, #0x18]
	bx lr
	arm_func_end sub_020BE404

	arm_func_start sub_020BE418
sub_020BE418: ; 0x020BE418
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r8, r1
	mov sb, r0
	beq _020BE42C
	bl sub_020D08EC
_020BE42C:
	ldrh r0, [sb, #0xc]
	movs r2, r0, lsl #3
	beq _020BE45C
	ldr r0, [sb, #8]
	ldr r3, [sb, #0x14]
	mov r1, r0, lsl #0x10
	add r0, sb, r3
	mov r1, r1, lsr #0xd
	bl sub_020D0948
	ldrh r0, [sb, #0x10]
	orr r0, r0, #1
	strh r0, [sb, #0x10]
_020BE45C:
	ldrh r0, [sb, #0x1c]
	movs r6, r0, lsl #3
	beq _020BE4BC
	ldr r1, [sb, #0x18]
	ldr r0, [sb, #0x24]
	mov r4, r1, lsl #0x10
	mov r7, r4, lsr #0xd
	mov r1, r7
	mov r2, r6
	add r0, sb, r0
	ldr r5, [sb, #0x28]
	bl sub_020D0948
	ldr r0, _020BE4CC ; =0x0001FFFF
	and r1, r7, #0x40000
	and r0, r0, r4, lsr #13
	mov r0, r0, lsr #1
	add r2, r0, #0x20000
	add r0, sb, r5
	add r1, r2, r1, lsr #2
	mov r2, r6, lsr #1
	bl sub_020D0948
	ldrh r0, [sb, #0x20]
	orr r0, r0, #1
	strh r0, [sb, #0x20]
_020BE4BC:
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl sub_020D0A88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020BE4CC: .word 0x0001FFFF
	arm_func_end sub_020BE418

	arm_func_start sub_020BE4D0
sub_020BE4D0: ; 0x020BE4D0
	cmp r1, #0
	beq _020BE4F4
	ldrh ip, [r0, #0x10]
	mov r3, #0
	bic ip, ip, #1
	strh ip, [r0, #0x10]
	ldr ip, [r0, #8]
	str ip, [r1]
	str r3, [r0, #8]
_020BE4F4:
	cmp r2, #0
	bxeq lr
	ldrh r3, [r0, #0x20]
	mov r1, #0
	bic r3, r3, #1
	strh r3, [r0, #0x20]
	ldr r3, [r0, #0x18]
	str r3, [r2]
	str r1, [r0, #0x18]
	bx lr
	arm_func_end sub_020BE4D0

	arm_func_start sub_020BE51C
sub_020BE51C: ; 0x020BE51C
	cmp r0, #0
	ldrneh r0, [r0, #0x30]
	movne r0, r0, lsl #3
	moveq r0, #0
	bx lr
	arm_func_end sub_020BE51C

	arm_func_start sub_020BE530
sub_020BE530: ; 0x020BE530
	str r1, [r0, #0x2c]
	bx lr
	arm_func_end sub_020BE530

	arm_func_start sub_020BE538
sub_020BE538: ; 0x020BE538
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r1
	mov r4, r0
	beq _020BE54C
	bl sub_020D0AD4
_020BE54C:
	ldr r0, [r4, #0x2c]
	ldrh r2, [r4, #0x30]
	mov r1, r0, lsl #0x10
	ldr r3, [r4, #0x38]
	mov r1, r1, lsr #0xd
	add r0, r4, r3
	mov r2, r2, lsl #3
	bl sub_020D0B08
	ldrh r0, [r4, #0x32]
	cmp r5, #0
	orr r0, r0, #1
	strh r0, [r4, #0x32]
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_020D0B74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BE538

	arm_func_start sub_020BE588
sub_020BE588: ; 0x020BE588
	ldrh r2, [r0, #0x32]
	mov r1, #0
	bic r2, r2, #1
	strh r2, [r0, #0x32]
	ldr r2, [r0, #0x2c]
	str r1, [r0, #0x2c]
	mov r0, r2
	bx lr
	arm_func_end sub_020BE588

	arm_func_start sub_020BE5A8
sub_020BE5A8: ; 0x020BE5A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r3
	ldr r1, [r8]
	mov sl, r0
	and r0, r1, #0x1c000000
	ldrh r3, [sb]
	cmp r0, #0x14000000
	mov r5, #0
	add r0, sl, r3
	str r0, [sp]
	ldrne r0, [r2, #8]
	ldreq r0, [r2, #0x18]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bic fp, r0, #0xe0000000
	ldrb r0, [sb, #2]
	cmp r0, #0
	bls _020BE6C4
	add r4, sl, #4
_020BE5F8:
	ldr r0, [sp]
	cmp sl, #0
	ldrb r2, [r0, r5]
	beq _020BE648
	cmp r4, #0
	beq _020BE634
	ldrb r0, [sl, #5]
	cmp r2, r0
	bhs _020BE634
	ldrh r0, [sl, #0xa]
	add r1, r4, r0
	add r1, r1, #4
	ldrh r0, [r4, r0]
	mla r1, r0, r2, r1
	b _020BE638
_020BE634:
	mov r1, #0
_020BE638:
	cmp r1, #0
	ldrne r0, [r1]
	addne r7, sl, r0
	bne _020BE64C
_020BE648:
	mov r7, #0
_020BE64C:
	ldr r0, [r8]
	ldr r1, [r7, #0x14]
	add r0, r0, fp
	orr r0, r1, r0
	str r0, [r7, #0x14]
	ldr r3, [r8, #4]
	ldr r0, _020BE6D4 ; =0x000007FF
	ldrh r1, [r7, #0x20]
	and r2, r3, r0
	and r0, r3, r0, lsl #11
	mov r6, r0, lsr #0xb
	cmp r2, r1
	moveq r0, #0x1000
	beq _020BE690
	mov r0, r2, lsl #0xc
	mov r1, r1, lsl #0xc
	bl sub_020CCBA0
_020BE690:
	str r0, [r7, #0x24]
	ldrh r1, [r7, #0x22]
	cmp r6, r1
	moveq r0, #0x1000
	beq _020BE6B0
	mov r0, r6, lsl #0xc
	mov r1, r1, lsl #0xc
	bl sub_020CCBA0
_020BE6B0:
	str r0, [r7, #0x28]
	ldrb r0, [sb, #2]
	add r5, r5, #1
	cmp r5, r0
	blo _020BE5F8
_020BE6C4:
	ldrb r0, [sb, #3]
	orr r0, r0, #1
	strb r0, [sb, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BE6D4: .word 0x000007FF
	arm_func_end sub_020BE5A8

	arm_func_start sub_020BE6D8
sub_020BE6D8: ; 0x020BE6D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r3, [r1]
	ldrb r2, [r1, #2]
	mov lr, #0
	add ip, r0, r3
	cmp r2, #0
	bls _020BE77C
	ldr r4, _020BE78C ; =0xC00F0000
	add r2, r0, #4
	mov r7, lr
	mov r6, lr
	mov r5, #0x1000
_020BE708:
	cmp r0, #0
	ldrb r3, [ip, lr]
	beq _020BE754
	cmp r2, #0
	beq _020BE740
	ldrb r8, [r0, #5]
	cmp r3, r8
	bhs _020BE740
	ldrh sb, [r0, #0xa]
	ldrh r8, [r2, sb]
	add sb, r2, sb
	add sb, sb, #4
	mla r3, r8, r3, sb
	b _020BE744
_020BE740:
	mov r3, r7
_020BE744:
	cmp r3, #0
	ldrne r3, [r3]
	addne r8, r0, r3
	bne _020BE758
_020BE754:
	mov r8, r6
_020BE758:
	ldr r3, [r8, #0x14]
	add lr, lr, #1
	and r3, r3, r4
	str r3, [r8, #0x14]
	str r5, [r8, #0x24]
	str r5, [r8, #0x28]
	ldrb r3, [r1, #2]
	cmp lr, r3
	blo _020BE708
_020BE77C:
	ldrb r0, [r1, #3]
	bic r0, r0, #1
	strb r0, [r1, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020BE78C: .word 0xC00F0000
	arm_func_end sub_020BE6D8

	arm_func_start sub_020BE790
sub_020BE790: ; 0x020BE790
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov r7, #1
	cmpne r1, #0
	addne r8, r0, r1
	moveq r8, #0
	ldrh r0, [r8]
	mov r6, #0
	add r5, r8, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	bls _020BE888
	mov sb, r6
	mov r4, r6
	mov fp, r6
_020BE7D4:
	cmp r5, #0
	beq _020BE800
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BE800
	ldrh r0, [r5, #6]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, sb
	b _020BE804
_020BE800:
	mov r1, r4
_020BE804:
	cmp sl, #0
	moveq r3, fp
	beq _020BE81C
	add r0, sl, #0x3c
	bl sub_020C3818
	mov r3, r0
_020BE81C:
	cmp r3, #0
	beq _020BE870
	cmp r5, #0
	beq _020BE850
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BE850
	ldrh r1, [r5, #6]
	ldrh r0, [r5, r1]
	add r1, r5, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020BE854
_020BE850:
	mov r1, #0
_020BE854:
	ldrb r0, [r1, #3]
	tst r0, #1
	bne _020BE874
	mov r0, r8
	mov r2, sl
	bl sub_020BE5A8
	b _020BE874
_020BE870:
	mov r7, #0
_020BE874:
	ldrb r0, [r5, #1]
	add r6, r6, #1
	add sb, sb, #0x10
	cmp r6, r0
	blo _020BE7D4
_020BE888:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BE790

	arm_func_start sub_020BE890
sub_020BE890: ; 0x020BE890
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	cmpne r1, #0
	addne r0, r0, r1
	moveq r0, #0
	ldrh r1, [r0]
	cmp ip, #0
	add r1, r0, r1
	beq _020BE8F0
	adds r5, ip, #0x3c
	beq _020BE8E8
	ldrb r4, [ip, #0x3d]
	cmp r3, r4
	bhs _020BE8E8
	ldrh lr, [ip, #0x42]
	ldrh r4, [r5, lr]
	add lr, r5, lr
	add lr, lr, #4
	mla r3, r4, r3, lr
	b _020BE8F4
_020BE8E8:
	mov r3, #0
	b _020BE8F4
_020BE8F0:
	mov r3, #0
_020BE8F4:
	cmp r1, #0
	beq _020BE920
	ldrb r4, [r1, #1]
	cmp r2, r4
	bhs _020BE920
	ldrh r4, [r1, #6]
	ldrh lr, [r1, r4]
	add r1, r1, r4
	add r1, r1, #4
	mla r1, lr, r2, r1
	b _020BE924
_020BE920:
	mov r1, #0
_020BE924:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, ip
	bl sub_020BE5A8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BE890

	arm_func_start sub_020BE940
sub_020BE940: ; 0x020BE940
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov r5, #0
	cmpne r1, #0
	addne r6, r0, r1
	moveq r6, #0
	ldrh r0, [r6]
	add r4, r6, r0
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
	mov r7, r5
_020BE974:
	cmp r4, #0
	beq _020BE9A0
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _020BE9A0
	ldrh r1, [r4, #6]
	ldrh r0, [r4, r1]
	add r1, r4, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020BE9A4
_020BE9A0:
	mov r1, r7
_020BE9A4:
	ldrb r0, [r1, #3]
	tst r0, #1
	beq _020BE9B8
	mov r0, r6
	bl sub_020BE6D8
_020BE9B8:
	ldrb r0, [r4, #1]
	add r5, r5, #1
	cmp r5, r0
	blo _020BE974
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020BE940

	arm_func_start sub_020BE9CC
sub_020BE9CC: ; 0x020BE9CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, [r2, #0x2c]
	ldrh r5, [r1]
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	ldrh r4, [r3, #2]
	bic r2, r2, #0xe0000000
	mov r2, r2, lsl #0x10
	tst r4, #1
	add ip, r0, r5
	mov r5, r2, lsr #0x10
	ldrh r4, [r3]
	bne _020BEA10
	mov r2, r4, lsl #0xf
	mov r3, r5, lsl #0xf
	mov r4, r2, lsr #0x10
	mov r5, r3, lsr #0x10
_020BEA10:
	ldrb r2, [r1, #2]
	mov r3, #0
	cmp r2, #0
	bls _020BEA9C
	add r2, r4, r5
	mov lr, r2, lsl #0x10
	add r2, r0, #4
	mov r4, lr, lsr #0x10
	mov r6, r3
	mov r5, r3
_020BEA38:
	cmp r0, #0
	ldrb r8, [ip, r3]
	beq _020BEA84
	cmp r2, #0
	beq _020BEA70
	ldrb r7, [r0, #5]
	cmp r8, r7
	bhs _020BEA70
	ldrh r7, [r0, #0xa]
	ldrh lr, [r2, r7]
	add r7, r2, r7
	add r7, r7, #4
	mla r7, lr, r8, r7
	b _020BEA74
_020BEA70:
	mov r7, r6
_020BEA74:
	cmp r7, #0
	ldrne lr, [r7]
	addne r7, r0, lr
	bne _020BEA88
_020BEA84:
	mov r7, r5
_020BEA88:
	strh r4, [r7, #0x1c]
	ldrb lr, [r1, #2]
	add r3, r3, #1
	cmp r3, lr
	blo _020BEA38
_020BEA9C:
	ldrb r0, [r1, #3]
	orr r0, r0, #1
	strb r0, [r1, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020BE9CC

	arm_func_start sub_020BEAAC
sub_020BEAAC: ; 0x020BEAAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov r7, #1
	cmpne r1, #0
	addne r8, r0, r1
	moveq r8, #0
	ldrh r0, [r8, #2]
	mov r6, #0
	add r5, r8, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	bls _020BEBAC
	mov sb, r6
	mov r4, r6
	mov fp, r6
_020BEAF0:
	cmp r5, #0
	beq _020BEB1C
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BEB1C
	ldrh r0, [r5, #6]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, sb
	b _020BEB20
_020BEB1C:
	mov r1, r4
_020BEB20:
	cmp sl, #0
	ldrneh r0, [sl, #0x34]
	cmpne r0, #0
	moveq r3, fp
	beq _020BEB40
	add r0, sl, r0
	bl sub_020C3818
	mov r3, r0
_020BEB40:
	cmp r3, #0
	beq _020BEB94
	cmp r5, #0
	beq _020BEB74
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BEB74
	ldrh r1, [r5, #6]
	ldrh r0, [r5, r1]
	add r1, r5, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020BEB78
_020BEB74:
	mov r1, #0
_020BEB78:
	ldrb r0, [r1, #3]
	tst r0, #1
	bne _020BEB98
	mov r0, r8
	mov r2, sl
	bl sub_020BE9CC
	b _020BEB98
_020BEB94:
	mov r7, #0
_020BEB98:
	ldrb r0, [r5, #1]
	add r6, r6, #1
	add sb, sb, #0x10
	cmp r6, r0
	blo _020BEAF0
_020BEBAC:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BEAAC

	arm_func_start sub_020BEBB4
sub_020BEBB4: ; 0x020BEBB4
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	cmpne r1, #0
	addne r0, r0, r1
	moveq r0, #0
	ldrh r1, [r0, #2]
	cmp ip, #0
	ldrneh r4, [ip, #0x34]
	add r1, r0, r1
	cmpne r4, #0
	beq _020BEC1C
	adds r5, ip, r4
	beq _020BEC14
	ldrb r4, [r5, #1]
	cmp r3, r4
	bhs _020BEC14
	ldrh lr, [r5, #6]
	ldrh r4, [r5, lr]
	add lr, r5, lr
	add lr, lr, #4
	mla r3, r4, r3, lr
	b _020BEC20
_020BEC14:
	mov r3, #0
	b _020BEC20
_020BEC1C:
	mov r3, #0
_020BEC20:
	cmp r1, #0
	beq _020BEC4C
	ldrb r4, [r1, #1]
	cmp r2, r4
	bhs _020BEC4C
	ldrh r4, [r1, #6]
	ldrh lr, [r1, r4]
	add r1, r1, r4
	add r1, r1, #4
	mla r1, lr, r2, r1
	b _020BEC50
_020BEC4C:
	mov r1, #0
_020BEC50:
	cmp r1, #0
	beq _020BEC74
	ldrb r2, [r1, #3]
	tst r2, #1
	bne _020BEC74
	mov r2, ip
	bl sub_020BE9CC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020BEC74:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BEBB4

	arm_func_start sub_020BEC7C
sub_020BEC7C: ; 0x020BEC7C
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov ip, #0
	cmpne r1, #0
	addne r1, r0, r1
	moveq r1, #0
	ldrh r0, [r1, #2]
	add r3, r1, r0
	ldrb r0, [r3, #1]
	cmp r0, #0
	bxls lr
	mov r1, ip
_020BECAC:
	cmp r3, #0
	beq _020BECD8
	ldrb r0, [r3, #1]
	cmp ip, r0
	bhs _020BECD8
	ldrh r2, [r3, #6]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r2, r0, ip, r2
	b _020BECDC
_020BECD8:
	mov r2, r1
_020BECDC:
	ldrb r0, [r2, #3]
	add ip, ip, #1
	tst r0, #1
	bicne r0, r0, #1
	strneb r0, [r2, #3]
	ldrb r0, [r3, #1]
	cmp ip, r0
	blo _020BECAC
	bx lr
	arm_func_end sub_020BEC7C

	arm_func_start sub_020BED00
sub_020BED00: ; 0x020BED00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #9]
	mov sb, r1
	mov r7, #1
	cmp r0, #0
	mov r6, #0
	bls _020BEDA8
	add r5, sl, #8
	mov r4, r6
	mov fp, r6
_020BED2C:
	cmp sl, #0
	beq _020BED74
	cmp r5, #0
	beq _020BED60
	ldrb r0, [sl, #9]
	cmp r6, r0
	bhs _020BED60
	ldrh r1, [sl, #0xe]
	ldrh r0, [r5, r1]
	add r1, r5, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020BED64
_020BED60:
	mov r1, r4
_020BED64:
	cmp r1, #0
	ldrne r0, [r1]
	addne r8, sl, r0
	bne _020BED78
_020BED74:
	mov r8, fp
_020BED78:
	mov r0, r8
	mov r1, sb
	bl sub_020BE790
	and r7, r7, r0
	mov r0, r8
	mov r1, sb
	bl sub_020BEAAC
	ldrb r1, [sl, #9]
	add r6, r6, #1
	and r7, r7, r0
	cmp r6, r1
	blo _020BED2C
_020BEDA8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BED00

	arm_func_start sub_020BEDB0
sub_020BEDB0: ; 0x020BEDB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	ldrb r0, [r6, #9]
	mov r5, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r4, r6, #8
	mov r8, r5
	mov r7, r5
_020BEDD4:
	cmp r6, #0
	beq _020BEE1C
	cmp r4, #0
	beq _020BEE08
	ldrb r0, [r6, #9]
	cmp r5, r0
	bhs _020BEE08
	ldrh r1, [r6, #0xe]
	ldrh r0, [r4, r1]
	add r1, r4, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020BEE0C
_020BEE08:
	mov r1, r8
_020BEE0C:
	cmp r1, #0
	ldrne r0, [r1]
	addne sb, r6, r0
	bne _020BEE20
_020BEE1C:
	mov sb, r7
_020BEE20:
	mov r0, sb
	bl sub_020BE940
	mov r0, sb
	bl sub_020BEC7C
	ldrb r0, [r6, #9]
	add r5, r5, #1
	cmp r5, r0
	blo _020BEDD4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020BEDB0

	arm_func_start sub_020BEE44
sub_020BEE44: ; 0x020BEE44
	stmdb sp!, {r3, lr}
	ldr r2, _020BEF58 ; =0x17101610
	ldr r1, _020BEF5C ; =0x021DA49C
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	mov r2, #2
	ldr r0, _020BEF60 ; =0x32323232
	str r2, [r1, #0x48]
	ldr r2, _020BEF64 ; =0x60293130
	str r0, [r1, #0x7c]
	ldr r0, _020BEF68 ; =0x33333333
	str r2, [r1, #0x90]
	ldr r2, _020BEF6C ; =0x002A1B19
	str r0, [r1, #0xa4]
	ldr r0, _020BEF70 ; =0x021DA4E8
	str r2, [r1, #0xb8]
	bl sub_020CB6AC
	ldr r0, _020BEF74 ; =0x021DA4A4
	bl sub_020CC044
	ldr ip, _020BEF78 ; =0x40000200
	ldr r3, _020BEF7C ; =0xC0080000
	ldr r2, _020BEF80 ; =0x2D8B62D8
	ldr r1, _020BEF5C ; =0x021DA49C
	sub r0, ip, #0xc0000001
	str r2, [r1, #0x80]
	str ip, [r1, #0x84]
	str r0, [r1, #0x88]
	ldr r2, _020BEF84 ; =0x4210C210
	str r3, [r1, #0x8c]
	str r2, [r1, #0x94]
	ldr r0, _020BEF88 ; =0x001F008F
	str r2, [r1, #0x98]
	str r0, [r1, #0x9c]
	sub r2, r3, #0x90000
	ldr r0, _020BEF8C ; =0x00007FFF
	str r2, [r1, #0xa0]
	str r0, [r1, #0xa8]
	mov r2, #0x4000001f
	ldr r0, _020BEF90 ; =0x800003E0
	str r2, [r1, #0xac]
	str r0, [r1, #0xb0]
	rsb r0, ip, #0x7e00
	str r0, [r1, #0xb4]
	mov r2, #0
	str r2, [r1, #0xe0]
	str r2, [r1, #0xe4]
	ldr r0, _020BEF94 ; =0x021DA558
	str r2, [r1, #0xe8]
	bl sub_020CAFEC
	mov r1, #0
	ldr r0, _020BEF5C ; =0x021DA49C
	mov r2, #0x1000
	str r2, [r0, #0xec]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xf4]
	str r1, [r0, #0xf8]
	str r1, [r0, #0xfc]
	str r1, [r0, #0x248]
	str r1, [r0, #0x244]
	str r1, [r0, #0x240]
	str r1, [r0, #0x254]
	str r1, [r0, #0x24c]
	str r2, [r0, #0x250]
	str r1, [r0, #0x25c]
	str r1, [r0, #0x258]
	sub r1, r1, #0x1000
	str r1, [r0, #0x260]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BEF58: .word 0x17101610
_020BEF5C: .word 0x021DA49C
_020BEF60: .word 0x32323232
_020BEF64: .word 0x60293130
_020BEF68: .word 0x33333333
_020BEF6C: .word 0x002A1B19
_020BEF70: .word 0x021DA4E8
_020BEF74: .word 0x021DA4A4
_020BEF78: .word 0x40000200
_020BEF7C: .word 0xC0080000
_020BEF80: .word 0x2D8B62D8
_020BEF84: .word 0x4210C210
_020BEF88: .word 0x001F008F
_020BEF8C: .word 0x00007FFF
_020BEF90: .word 0x800003E0
_020BEF94: .word 0x021DA558
	arm_func_end sub_020BEE44

	arm_func_start sub_020BEF98
sub_020BEF98: ; 0x020BEF98
	stmdb sp!, {r3, lr}
	ldr r0, _020BEFCC ; =0x021DA49C
	ldr r1, _020BEFD0 ; =0x021DA49C
	ldr r0, [r0]
	add r1, r1, #4
	mov r2, #0x3e
	bl sub_020C2528
	ldr r0, _020BEFCC ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	bic r1, r1, #1
	bic r1, r1, #2
	str r1, [r0, #0xfc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BEFCC: .word 0x021DA49C
_020BEFD0: .word 0x021DA49C
	arm_func_end sub_020BEF98

	arm_func_start sub_020BEFD4
sub_020BEFD4: ; 0x020BEFD4
	cmp r0, #0
	bxeq lr
	ldr r3, _020BEFFC ; =0x021DA57C
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, _020BF000 ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0xa4
	str r1, [r0, #0xfc]
	bx lr
	.align 2, 0
_020BEFFC: .word 0x021DA57C
_020BF000: .word 0x021DA49C
	arm_func_end sub_020BEFD4

	arm_func_start sub_020BF004
sub_020BF004: ; 0x020BF004
	cmp r0, #0
	bxeq lr
	ldr r3, _020BF02C ; =0x021DA588
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, _020BF030 ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0xa4
	str r1, [r0, #0xfc]
	bx lr
	.align 2, 0
_020BF02C: .word 0x021DA588
_020BF030: .word 0x021DA49C
	arm_func_end sub_020BF004

	arm_func_start sub_020BF034
sub_020BF034: ; 0x020BF034
	stmdb sp!, {r3, lr}
	ldr ip, _020BF068 ; =0x000003FF
	mov r2, r2, asr #3
	mov lr, r3, asr #3
	and r3, ip, r1, asr #3
	mov r1, r2, lsl #0x16
	mov r2, lr, lsl #0x16
	orr r1, r3, r1, lsr #12
	orr r2, r1, r2, lsr #2
	ldr r1, _020BF06C ; =0x021DA51C
	orr r2, r2, r0, lsl #30
	str r2, [r1, r0, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF068: .word 0x000003FF
_020BF06C: .word 0x021DA51C
	arm_func_end sub_020BF034

	arm_func_start sub_020BF070
sub_020BF070: ; 0x020BF070
	ldr r2, _020BF080 ; =0x021DA544
	orr r1, r1, r0, lsl #30
	str r1, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_020BF080: .word 0x021DA544
	arm_func_end sub_020BF070

	arm_func_start sub_020BF084
sub_020BF084: ; 0x020BF084
	cmp r2, #0
	movne r2, #1
	orr r1, r0, r1, lsl #16
	moveq r2, #0
	ldr r0, _020BF0A4 ; =0x021DA49C
	orr r1, r1, r2, lsl #15
	str r1, [r0, #0x94]
	bx lr
	.align 2, 0
_020BF0A4: .word 0x021DA49C
	arm_func_end sub_020BF084

	arm_func_start sub_020BF0A8
sub_020BF0A8: ; 0x020BF0A8
	cmp r2, #0
	movne r2, #1
	orr r1, r0, r1, lsl #16
	moveq r2, #0
	ldr r0, _020BF0C8 ; =0x021DA49C
	orr r1, r1, r2, lsl #15
	str r1, [r0, #0x98]
	bx lr
	.align 2, 0
_020BF0C8: .word 0x021DA49C
	arm_func_end sub_020BF0A8

	arm_func_start sub_020BF0CC
sub_020BF0CC: ; 0x020BF0CC
	orr r0, r0, r1, lsl #4
	ldr r1, [sp, #4]
	orr r0, r0, r2, lsl #6
	orr r0, r1, r0
	ldr r2, [sp]
	orr r1, r0, r3, lsl #24
	ldr r0, _020BF0F4 ; =0x021DA49C
	orr r1, r1, r2, lsl #16
	str r1, [r0, #0x9c]
	bx lr
	.align 2, 0
_020BF0F4: .word 0x021DA49C
	arm_func_end sub_020BF0CC

	arm_func_start sub_020BF0F8
sub_020BF0F8: ; 0x020BF0F8
	stmdb sp!, {r3, lr}
	ldr r0, _020BF130 ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #8
	bne _020BF128
	ldr r0, _020BF134 ; =0x021DA4E8
	ldr r1, _020BF138 ; =0x021DA59C
	bl sub_020CB83C
	ldr r0, _020BF130 ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	orr r1, r1, #8
	str r1, [r0, #0xfc]
_020BF128:
	ldr r0, _020BF138 ; =0x021DA59C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF130: .word 0x021DA49C
_020BF134: .word 0x021DA4E8
_020BF138: .word 0x021DA59C
	arm_func_end sub_020BF0F8

	arm_func_start sub_020BF13C
sub_020BF13C: ; 0x020BF13C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	str r1, [sp]
	add r1, sp, #8
	bl sub_020D4968
	ldr r0, [sp]
	bl sub_020CC044
	mov fp, #0
_020BF15C:
	mov r3, fp
	mov r1, fp
	cmp fp, #4
	mov r2, #0
	bge _020BF19C
	add r0, sp, #8
	add r0, r0, fp, lsl #2
_020BF178:
	ldr r4, [r0, r1, lsl #4]
	cmp r4, #0
	rsblt r4, r4, #0
	cmp r4, r2
	movgt r3, r1
	add r1, r1, #1
	movgt r2, r4
	cmp r1, #4
	blt _020BF178
_020BF19C:
	cmp r2, #0
	addeq sp, sp, #0x48
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r3, fp
	beq _020BF1FC
	ldr r1, [sp]
	add r2, sp, #8
	mov r0, #0
	add r4, r1, fp, lsl #4
	add r6, r2, fp, lsl #4
	add r5, r2, r3, lsl #4
	add r2, r1, r3, lsl #4
_020BF1D0:
	ldr r3, [r6, r0, lsl #2]
	ldr r1, [r5, r0, lsl #2]
	str r1, [r6, r0, lsl #2]
	str r3, [r5, r0, lsl #2]
	ldr r3, [r4, r0, lsl #2]
	ldr r1, [r2, r0, lsl #2]
	str r1, [r4, r0, lsl #2]
	str r3, [r2, r0, lsl #2]
	add r0, r0, #1
	cmp r0, #4
	blt _020BF1D0
_020BF1FC:
	add r0, sp, #8
	add r0, r0, fp, lsl #4
	ldr r0, [r0, fp, lsl #2]
	bl sub_020CCBC0
	ldr r2, [sp]
	mov r3, #0
	mov lr, #0x80000000
	add r4, sp, #8
	add sb, r2, fp, lsl #4
	add r2, r4, fp, lsl #4
	mov r4, r3
	mov r6, r3
	mov r5, lr
_020BF230:
	ldr r8, [r2, r3, lsl #2]
	mov r7, r8, asr #0x1f
	umull ip, sl, r0, r8
	adds ip, ip, lr
	mla sl, r0, r7, sl
	mla sl, r1, r8, sl
	adc r7, sl, r4
	str r7, [r2, r3, lsl #2]
	ldr r8, [sb, r3, lsl #2]
	mov r7, r8, asr #0x1f
	umull ip, sl, r0, r8
	adds ip, ip, r5
	mla sl, r0, r7, sl
	mla sl, r1, r8, sl
	adc r7, sl, r6
	str r7, [sb, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #4
	blt _020BF230
	ldr r0, [sp]
	add r1, sp, #8
	add r6, r0, fp, lsl #4
	add r0, sp, #8
	add r1, r1, fp, lsl #2
	mov ip, #0
	add r0, r0, fp, lsl #4
	str r1, [sp, #4]
_020BF29C:
	cmp ip, fp
	beq _020BF320
	ldr r1, [sp, #4]
	ldr r4, [sp]
	ldr r3, [r1, ip, lsl #4]
	add r1, sp, #8
	mov lr, #0
	mov r2, r3, asr #0x1f
	add r1, r1, ip, lsl #4
	add sl, r4, ip, lsl #4
_020BF2C4:
	ldr r5, [r0, lr, lsl #2]
	ldr sb, [r1, lr, lsl #2]
	mov r4, r5, asr #0x1f
	umull r8, r7, r3, r5
	mla r7, r3, r4, r7
	mla r7, r2, r5, r7
	mov r4, r8, lsr #0xc
	orr r4, r4, r7, lsl #20
	sub r4, sb, r4
	str r4, [r1, lr, lsl #2]
	ldr sb, [sl, lr, lsl #2]
	ldr r5, [r6, lr, lsl #2]
	mov r4, r5, asr #0x1f
	umull r8, r7, r3, r5
	mla r7, r3, r4, r7
	mla r7, r2, r5, r7
	mov r4, r8, lsr #0xc
	orr r4, r4, r7, lsl #20
	sub r4, sb, r4
	str r4, [sl, lr, lsl #2]
	add lr, lr, #1
	cmp lr, #4
	blt _020BF2C4
_020BF320:
	add ip, ip, #1
	cmp ip, #4
	blt _020BF29C
	add fp, fp, #1
	cmp fp, #4
	blt _020BF15C
	mov r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BF13C

	arm_func_start sub_020BF344
sub_020BF344: ; 0x020BF344
	stmdb sp!, {r3, lr}
	ldr r0, _020BF37C ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #0x10
	bne _020BF374
	ldr r0, _020BF380 ; =0x021DA4A4
	ldr r1, _020BF384 ; =0x021DA65C
	bl sub_020BF13C
	ldr r0, _020BF37C ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_020BF374:
	ldr r0, _020BF384 ; =0x021DA65C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF37C: .word 0x021DA49C
_020BF380: .word 0x021DA4A4
_020BF384: .word 0x021DA65C
	arm_func_end sub_020BF344

	arm_func_start sub_020BF388
sub_020BF388: ; 0x020BF388
	stmdb sp!, {r3, lr}
	ldr r0, _020BF3CC ; =0x021DA558
	ldr r1, _020BF3D0 ; =0x021DA4E8
	ldr r2, _020BF3D4 ; =0x021DA5CC
	bl sub_020CBBC8
	ldr r3, _020BF3D8 ; =0x021DA49C
	ldr r0, _020BF3D4 ; =0x021DA5CC
	ldr r2, [r3, #0xf4]
	mov r1, r0
	str r2, [sp]
	ldr r2, [r3, #0xec]
	ldr r3, [r3, #0xf0]
	bl sub_020CB7CC
	ldr r0, _020BF3D4 ; =0x021DA5CC
	ldr r1, _020BF3DC ; =0x021DA5FC
	bl sub_020CB83C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF3CC: .word 0x021DA558
_020BF3D0: .word 0x021DA4E8
_020BF3D4: .word 0x021DA5CC
_020BF3D8: .word 0x021DA49C
_020BF3DC: .word 0x021DA5FC
	arm_func_end sub_020BF388

	arm_func_start sub_020BF3E0
sub_020BF3E0: ; 0x020BF3E0
	stmdb sp!, {r3, lr}
	ldr r0, _020BF410 ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #0x80
	bne _020BF408
	bl sub_020BF388
	ldr r0, _020BF410 ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x80
	str r1, [r0, #0xfc]
_020BF408:
	ldr r0, _020BF414 ; =0x021DA5CC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF410: .word 0x021DA49C
_020BF414: .word 0x021DA5CC
	arm_func_end sub_020BF3E0

	arm_func_start sub_020BF418
sub_020BF418: ; 0x020BF418
	stmdb sp!, {r3, lr}
	ldr r0, _020BF448 ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #0x80
	bne _020BF440
	bl sub_020BF388
	ldr r0, _020BF448 ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x80
	str r1, [r0, #0xfc]
_020BF440:
	ldr r0, _020BF44C ; =0x021DA5FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF448: .word 0x021DA49C
_020BF44C: .word 0x021DA5FC
	arm_func_end sub_020BF418

	arm_func_start sub_020BF450
sub_020BF450: ; 0x020BF450
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	ldr r0, _020BF4B0 ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #0x40
	bne _020BF4A4
	bl sub_020BF0F8
	mov r5, r0
	bl sub_020BF344
	mov r4, r0
	add r1, sp, #0
	mov r0, r5
	bl sub_020CB6D4
	ldr r2, _020BF4B4 ; =0x021DA69C
	add r1, sp, #0
	mov r0, r4
	bl sub_020CC1E8
	ldr r0, _020BF4B0 ; =0x021DA49C
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x40
	str r1, [r0, #0xfc]
_020BF4A4:
	ldr r0, _020BF4B4 ; =0x021DA69C
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BF4B0: .word 0x021DA49C
_020BF4B4: .word 0x021DA69C
	arm_func_end sub_020BF450

	arm_func_start sub_020BF4B8
sub_020BF4B8: ; 0x020BF4B8
	cmp r0, #0
	beq _020BF4D0
	ldr ip, _020BF528 ; =0x021DA49C
	ldr ip, [ip, #0xa0]
	and ip, ip, #0xff
	str ip, [r0]
_020BF4D0:
	cmp r1, #0
	beq _020BF4EC
	ldr r0, _020BF528 ; =0x021DA49C
	ldr r0, [r0, #0xa0]
	mov r0, r0, lsr #8
	and r0, r0, #0xff
	str r0, [r1]
_020BF4EC:
	cmp r2, #0
	beq _020BF508
	ldr r0, _020BF528 ; =0x021DA49C
	ldr r0, [r0, #0xa0]
	mov r0, r0, lsr #0x10
	and r0, r0, #0xff
	str r0, [r2]
_020BF508:
	cmp r3, #0
	bxeq lr
	ldr r0, _020BF528 ; =0x021DA49C
	ldr r0, [r0, #0xa0]
	mov r0, r0, lsr #0x18
	and r0, r0, #0xff
	str r0, [r3]
	bx lr
	.align 2, 0
_020BF528: .word 0x021DA49C
	arm_func_end sub_020BF4B8

	arm_func_start sub_020BF52C
sub_020BF52C: ; 0x020BF52C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	movs r5, r1
	mov r4, r2
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r7, #1
_020BF548:
	ldrb r1, [r5, #0x19]
	cmp r4, r1
	bhs _020BF588
	add r1, r5, r4, lsl #1
	ldrh r2, [r1, #0x1a]
	and r1, r2, #0x300
	cmp r1, #0x100
	bne _020BF588
	ldr r3, [r5, #0xc]
	cmp r3, #0
	beq _020BF588
	mov r0, r6
	mov r1, r5
	and r2, r2, #0xff
	blx r3
	mov r0, r7
_020BF588:
	ldr r5, [r5, #0x10]
	cmp r5, #0
	bne _020BF548
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020BF52C

	arm_func_start sub_020BF598
sub_020BF598: ; 0x020BF598
	cmp r3, #0
	beq _020BF5C8
	ldr r1, [r0]
	add r1, r1, r2
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #8]
	bx lr
_020BF5C8:
	ldr r3, [r1]
	ldr ip, [r0]
	mul r3, r2, r3
	add r3, ip, r3, asr #12
	str r3, [r0]
	ldr r3, [r1, #4]
	ldr ip, [r0, #4]
	mul r3, r2, r3
	add r3, ip, r3, asr #12
	str r3, [r0, #4]
	ldr r1, [r1, #8]
	ldr r3, [r0, #8]
	mul r1, r2, r1
	add r1, r3, r1, asr #12
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_020BF598

	arm_func_start sub_020BF608
sub_020BF608: ; 0x020BF608
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x70
	movs sb, r1
	mov sl, r0
	mov r8, r2
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [sb, #0x10]
	cmp r2, #0
	bne _020BF694
	ldrb r2, [sb, #0x19]
	cmp r8, r2
	bhs _020BF688
	add r2, sb, r8, lsl #1
	ldrh r4, [r2, #0x1a]
	and r2, r4, #0x300
	cmp r2, #0x100
	bne _020BF67C
	ldr r3, [sb, #0xc]
	cmp r3, #0
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	and r2, r4, #0xff
	blx r3
	add sp, sp, #0x70
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF67C:
	add sp, sp, #0x70
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF688:
	add sp, sp, #0x70
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF694:
	mov r5, #0
	mov r3, r5
	mov r6, r5
	mov r2, sb
_020BF6A4:
	ldrb r0, [r2, #0x19]
	cmp r8, r0
	bhs _020BF6E4
	add r0, r2, r8, lsl #1
	ldrh r0, [r0, #0x1a]
	and r0, r0, #0x300
	cmp r0, #0x100
	bne _020BF6E4
	ldr r0, [r2, #4]
	cmp r0, #0x1000
	addgt r5, r5, #0x1000
	bgt _020BF6DC
	cmp r0, #0
	addgt r5, r5, r0
_020BF6DC:
	mov r1, r2
	add r3, r3, #1
_020BF6E4:
	ldr r2, [r2, #0x10]
	cmp r2, #0
	bne _020BF6A4
	cmp r5, #0
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r3, #1
	bne _020BF73C
	ldr r3, [r1, #0xc]
	add r0, r1, r8, lsl #1
	cmp r3, #0
	ldrh r2, [r0, #0x1a]
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	and r2, r2, #0xff
	blx r3
	add sp, sp, #0x70
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF73C:
	mov r1, sl
	mov r0, #0
	mov r2, #0x58
	bl sub_020D4858
	mvn r0, #0
	str r0, [sl]
	add fp, sp, #0x40
	add r4, sp, #0x18
_020BF75C:
	ldrb r0, [sb, #0x19]
	cmp r8, r0
	bhs _020BF940
	add r0, sb, r8, lsl #1
	ldrh r1, [r0, #0x1a]
	and r0, r1, #0x300
	cmp r0, #0x100
	bne _020BF940
	ldr r0, [sb, #4]
	cmp r0, #0
	ble _020BF940
	ldr r3, [sb, #0xc]
	cmp r3, #0
	beq _020BF940
	and r2, r1, #0xff
	mov r0, r4
	mov r1, sb
	blx r3
	cmp r6, #0
	bne _020BF7CC
	mov r0, fp
	add r1, sp, #0xc
	mov r2, #0xc
	bl sub_020D4808
	add r0, sp, #0x58
	add r1, sp, #0
	mov r2, #0xc
	bl sub_020D4808
_020BF7CC:
	cmp r5, #0x1000
	ldreq r7, [sb, #4]
	beq _020BF7E8
	ldr r0, [sb, #4]
	mov r1, r5
	bl sub_020CCBA0
	mov r7, r0
_020BF7E8:
	ldr r3, [sp, #0x18]
	add r0, sl, #4
	add r1, sp, #0x1c
	mov r2, r7
	and r3, r3, #1
	bl sub_020BF598
	ldr r3, [sp, #0x18]
	add r0, sl, #0x10
	add r1, sp, #0x28
	mov r2, r7
	and r3, r3, #8
	bl sub_020BF598
	ldr r3, [sp, #0x18]
	add r0, sl, #0x1c
	add r1, sp, #0x34
	mov r2, r7
	and r3, r3, #0x10
	bl sub_020BF598
	ldr r0, [sp, #0x18]
	tst r0, #4
	bne _020BF890
	ldr r2, [sl, #0x4c]
	ldr r0, [sp, #0x64]
	smull r1, r0, r7, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r2, r1
	str r0, [sl, #0x4c]
	ldr r2, [sl, #0x50]
	ldr r0, [sp, #0x68]
	smull r1, r0, r7, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r2, r1
	str r0, [sl, #0x50]
	ldr r2, [sl, #0x54]
	ldr r0, [sp, #0x6c]
	smull r1, r0, r7, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r2, r1
	str r0, [sl, #0x54]
_020BF890:
	ldr r0, [sp, #0x18]
	tst r0, #2
	bne _020BF918
	ldr r1, [sl, #0x28]
	ldr r0, [sp, #0x40]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x28]
	ldr r1, [sl, #0x2c]
	ldr r0, [sp, #0x44]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x2c]
	ldr r1, [sl, #0x30]
	ldr r0, [sp, #0x48]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x30]
	ldr r1, [sl, #0x34]
	ldr r0, [sp, #0x4c]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x34]
	ldr r1, [sl, #0x38]
	ldr r0, [sp, #0x50]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x38]
	ldr r1, [sl, #0x3c]
	ldr r0, [sp, #0x54]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x3c]
	b _020BF930
_020BF918:
	ldr r0, [sl, #0x28]
	add r0, r0, r7
	str r0, [sl, #0x28]
	ldr r0, [sl, #0x38]
	add r0, r0, r7
	str r0, [sl, #0x38]
_020BF930:
	ldr r1, [sl]
	ldr r0, [sp, #0x18]
	and r0, r1, r0
	str r0, [sl]
_020BF940:
	ldr sb, [sb, #0x10]
	add r6, r6, #1
	cmp sb, #0
	bne _020BF75C
	add r0, sl, #0x28
	add r1, sl, #0x34
	add r2, sl, #0x40
	bl sub_020CCE94
	ldr r0, [sl, #0x28]
	cmp r0, #0
	ldreq r0, [sl, #0x2c]
	cmpeq r0, #0
	ldreq r0, [sl, #0x30]
	cmpeq r0, #0
	bne _020BF990
	add r0, sp, #0xc
	add r1, sl, #0x28
	mov r2, #0xc
	bl sub_020D4808
	b _020BF99C
_020BF990:
	add r0, sl, #0x28
	mov r1, r0
	bl sub_020CCFE0
_020BF99C:
	ldr r0, [sl, #0x40]
	cmp r0, #0
	ldreq r0, [sl, #0x44]
	cmpeq r0, #0
	ldreq r0, [sl, #0x48]
	cmpeq r0, #0
	bne _020BF9CC
	add r0, sp, #0
	add r1, sl, #0x40
	mov r2, #0xc
	bl sub_020D4808
	b _020BF9D8
_020BF9CC:
	add r0, sl, #0x40
	mov r1, r0
	bl sub_020CCFE0
_020BF9D8:
	add r0, sl, #0x40
	add r1, sl, #0x28
	add r2, sl, #0x34
	bl sub_020CCE94
	mov r0, #1
	add sp, sp, #0x70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020BF608

	arm_func_start sub_020BF9F4
sub_020BF9F4: ; 0x020BF9F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r0
	mov r0, #0
	mov r6, r1
	mov r5, r2
	str r0, [r7]
	add r4, sp, #0
	mov r8, #1
_020BFA18:
	ldrb r1, [r6, #0x19]
	cmp r5, r1
	bhs _020BFA68
	add r1, r6, r5, lsl #1
	ldrh r2, [r1, #0x1a]
	and r1, r2, #0x300
	cmp r1, #0x100
	bne _020BFA68
	ldr r3, [r6, #0xc]
	cmp r3, #0
	beq _020BFA68
	mov r0, r4
	mov r1, r6
	and r2, r2, #0xff
	blx r3
	ldr r2, [r7]
	ldr r1, [sp]
	mov r0, r8
	orr r1, r2, r1
	str r1, [r7]
_020BFA68:
	ldr r6, [r6, #0x10]
	cmp r6, #0
	bne _020BFA18
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020BF9F4

	arm_func_start sub_020BFA7C
sub_020BFA7C: ; 0x020BFA7C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _020BFAC0 ; =_02110B9C
	mov r4, r0
_020BFA88:
	ldr r1, [r4, #8]
	mov r0, r4
	bic r1, r1, #0x40
	str r1, [r4, #8]
	ldr r1, [r4]
	ldrb r3, [r1]
	and r1, r3, #0x1f
	ldr r2, [r5, r1, lsl #2]
	and r1, r3, #0xe0
	blx r2
	ldr r0, [r4, #8]
	tst r0, #0x20
	beq _020BFA88
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BFAC0: .word _02110B9C
	arm_func_end sub_020BFA7C

	arm_func_start sub_020BFAC4
sub_020BFAC4: ; 0x020BFAC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x188
	bl sub_020D4858
	mov r0, #1
	str r0, [r5, #0xc4]
	str r0, [r5, #8]
	ldr r0, [r4, #0x30]
	ldr r2, _020BFC54 ; =_02110A80
	cmp r0, #0
	ldreq r1, [r4, #4]
	ldreq r0, [r1, #4]
	addeq r0, r1, r0
	str r0, [r5]
	str r4, [r5, #4]
	ldr r0, [r4, #4]
	cmp r0, #0
	addne r0, r0, #0x40
	moveq r0, #0
	str r0, [r5, #0xd4]
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r1, #8]
	cmpne r0, #0
	addne r0, r1, r0
	moveq r0, #0
	str r0, [r5, #0xd8]
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r1, #0xc]
	cmpne r0, #0
	addne r0, r1, r0
	moveq r0, #0
	str r0, [r5, #0xdc]
	ldr r0, [r4, #4]
	ldr r1, _020BFC58 ; =_02110A74
	ldrb r3, [r0, #0x15]
	ldr r0, _020BFC5C ; =_02110A8C
	ldr r2, [r2, r3, lsl #2]
	str r2, [r5, #0xe8]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x15]
	ldr r1, [r1, r2, lsl #2]
	str r1, [r5, #0xec]
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	ldr r0, [r0, r1, lsl #2]
	str r0, [r5, #0xf0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x1c]
	str r0, [r5, #0xe0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	str r0, [r5, #0xe4]
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _020BFBD8
	ldrb r0, [r4, #0x24]
	cmp r0, #0x20
	bhs _020BFBD8
	add r0, r5, r0, lsl #2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0x24]
	ldrb r1, [r4, #0x25]
	add r0, r5, r0
	strb r1, [r0, #0x8c]
_020BFBD8:
	ldr r0, [r4]
	tst r0, #1
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x80
	strne r0, [r5, #8]
	ldr r0, [r4]
	tst r0, #2
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x100
	strne r0, [r5, #8]
	ldr r0, [r4]
	tst r0, #4
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x200
	strne r0, [r5, #8]
	ldr r0, [r4]
	tst r0, #8
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x400
	strne r0, [r5, #8]
	ldr r1, [r4, #0x28]
	cmp r1, #0
	beq _020BFC3C
	mov r0, r5
	blx r1
_020BFC3C:
	mov r0, r5
	bl sub_020BFA7C
	ldr r0, [r4]
	bic r0, r0, #1
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BFC54: .word _02110A80
_020BFC58: .word _02110A74
_020BFC5C: .word _02110A8C
	arm_func_end sub_020BFAC4

	arm_func_start sub_020BFC60
sub_020BFC60: ; 0x020BFC60
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #1
	mov r4, #0
_020BFC74:
	ldrb r2, [r1, #0x19]
	mov r5, r4
	cmp r2, #0
	ble _020BFCB8
_020BFC84:
	add r2, r1, r5, lsl #1
	ldrh r2, [r2, #0x1a]
	tst r2, #0x100
	beq _020BFCA8
	mov lr, r5, asr #5
	ldr ip, [r0, lr, lsl #2]
	and r2, r5, #0x1f
	orr r2, ip, r3, lsl r2
	str r2, [r0, lr, lsl #2]
_020BFCA8:
	ldrb r2, [r1, #0x19]
	add r5, r5, #1
	cmp r5, r2
	blt _020BFC84
_020BFCB8:
	ldr r1, [r1, #0x10]
	cmp r1, #0
	bne _020BFC74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BFC60

	arm_func_start sub_020BFCC8
sub_020BFCC8: ; 0x020BFCC8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x188
	mov r4, r0
	ldr r0, [r4]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _020BFD5C
	add r1, r4, #0x3c
	mov r0, #0
	mov r2, #8
	bl sub_020D47EC
	add r1, r4, #0x44
	mov r0, #0
	mov r2, #8
	bl sub_020D47EC
	add r1, r4, #0x4c
	mov r0, #0
	mov r2, #8
	bl sub_020D47EC
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _020BFD28
	add r0, r4, #0x3c
	bl sub_020BFC60
_020BFD28:
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _020BFD3C
	add r0, r4, #0x44
	bl sub_020BFC60
_020BFD3C:
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _020BFD50
	add r0, r4, #0x4c
	bl sub_020BFC60
_020BFD50:
	ldr r0, [r4]
	bic r0, r0, #0x10
	str r0, [r4]
_020BFD5C:
	ldr r2, _020BFDA0 ; =0x021DA700
	ldr r0, [r2]
	cmp r0, #0
	beq _020BFD7C
	mov r1, r4
	bl sub_020BFAC4
	add sp, sp, #0x188
	ldmia sp!, {r4, pc}
_020BFD7C:
	add r0, sp, #0
	mov r1, r4
	str r0, [r2]
	bl sub_020BFAC4
	ldr r0, _020BFDA0 ; =0x021DA700
	mov r1, #0
	str r1, [r0]
	add sp, sp, #0x188
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BFDA0: .word 0x021DA700
	arm_func_end sub_020BFCC8

	arm_func_start sub_020BFDA4
sub_020BFDA4: ; 0x020BFDA4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _020BFDBC
	blx r1
_020BFDBC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020BFDA4

	arm_func_start sub_020BFDCC
sub_020BFDCC: ; 0x020BFDCC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _020BFDE4
	blx r1
_020BFDE4:
	ldr r0, [r4, #8]
	orr r0, r0, #0x20
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020BFDCC

	arm_func_start sub_020BFDF4
sub_020BFDF4: ; 0x020BFDF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #8]
	tst r0, #0x200
	bne _020BFF60
	ldr r1, [r6]
	add r0, r6, #0x184
	ldrb r4, [r1, #1]
	strb r4, [r6, #0xac]
	ldr r1, [r6, #8]
	orr r1, r1, #4
	str r1, [r6, #8]
	str r0, [r6, #0xb8]
	ldr r0, [r6, #0x14]
	cmp r0, #0
	ldrneb r5, [r6, #0x8e]
	moveq r5, #0
	cmp r5, #1
	bne _020BFE74
	ldr r1, [r6, #8]
	mov r0, r6
	bic r1, r1, #0x40
	str r1, [r6, #8]
	ldr r1, [r6, #0x14]
	blx r1
	ldr r0, [r6, #0x14]
	cmp r0, #0
	ldrneb r5, [r6, #0x8e]
	ldr r0, [r6, #8]
	moveq r5, #0
	and r0, r0, #0x40
	b _020BFE78
_020BFE74:
	mov r0, #0
_020BFE78:
	cmp r0, #0
	bne _020BFED8
	ldr ip, [r6, #4]
	ldr r1, [ip, #0x18]
	cmp r1, #0
	beq _020BFEC4
	mov r0, r4, lsr #5
	add r0, ip, r0, lsl #2
	ldr r0, [r0, #0x4c]
	and r2, r4, #0x1f
	mov r3, #1
	tst r0, r3, lsl r2
	beq _020BFEC4
	ldr r0, [r6, #0xb8]
	ldr r3, [ip, #0x1c]
	mov r2, r4
	blx r3
	cmp r0, #0
	bne _020BFED8
_020BFEC4:
	ldr r1, [r6]
	ldr r0, [r6, #0xb8]
	ldrb r1, [r1, #2]
	and r1, r1, #1
	str r1, [r0]
_020BFED8:
	cmp r5, #2
	bne _020BFF14
	ldr r1, [r6, #8]
	mov r0, r6
	bic r1, r1, #0x40
	str r1, [r6, #8]
	ldr r1, [r6, #0x14]
	blx r1
	ldr r0, [r6, #0x14]
	cmp r0, #0
	ldrneb r5, [r6, #0x8e]
	ldr r0, [r6, #8]
	moveq r5, #0
	and r0, r0, #0x40
	b _020BFF18
_020BFF14:
	mov r0, #0
_020BFF18:
	cmp r0, #0
	bne _020BFF40
	ldr r0, [r6, #0xb8]
	ldr r0, [r0]
	cmp r0, #0
	ldr r0, [r6, #8]
	orrne r0, r0, #1
	strne r0, [r6, #8]
	biceq r0, r0, #1
	streq r0, [r6, #8]
_020BFF40:
	cmp r5, #3
	bne _020BFF60
	ldr r1, [r6, #8]
	mov r0, r6
	bic r1, r1, #0x40
	str r1, [r6, #8]
	ldr r1, [r6, #0x14]
	blx r1
_020BFF60:
	ldr r0, [r6]
	add r0, r0, #3
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020BFDF4

	arm_func_start sub_020BFF70
sub_020BFF70: ; 0x020BFF70
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	tst r0, #0x200
	bne _020C002C
	tst r0, #1
	beq _020C002C
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldrneb r5, [r4, #0x8f]
	moveq r5, #0
	cmp r5, #1
	bne _020BFFD8
	ldr r1, [r4, #8]
	mov r0, r4
	bic r1, r1, #0x40
	str r1, [r4, #8]
	ldr r1, [r4, #0x18]
	blx r1
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldrneb r5, [r4, #0x8f]
	ldr r0, [r4, #8]
	moveq r5, #0
	and r0, r0, #0x40
	b _020BFFDC
_020BFFD8:
	mov r0, #0
_020BFFDC:
	cmp r0, #0
	bne _020C000C
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	str r0, [sp]
	ldr r0, [r4, #8]
	tst r0, #0x100
	bne _020C000C
	add r1, sp, #0
	mov r0, #0x14
	mov r2, #1
	bl sub_020C2528
_020C000C:
	cmp r5, #3
	bne _020C002C
	ldr r1, [r4, #8]
	mov r0, r4
	bic r1, r1, #0x40
	str r1, [r4, #8]
	ldr r1, [r4, #0x18]
	blx r1
_020C002C:
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020BFF70

	arm_func_start sub_020C003C
sub_020C003C: ; 0x020C003C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r7, r0
	mov r5, r3
	strb r5, [r7, #0xad]
	ldr r3, [r7, #8]
	add r0, r7, #0xf4
	orr r3, r3, #8
	str r3, [r7, #8]
	str r0, [r7, #0xb0]
	ldr r0, [r7, #0x1c]
	mov r8, r1
	cmp r0, #0
	ldrneb r4, [r7, #0x90]
	mov r6, r2
	moveq r4, #0
	cmp r4, #1
	bne _020C00B8
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x1c]
	blx r1
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	ldrneb r4, [r7, #0x90]
	ldr r0, [r7, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C00BC
_020C00B8:
	mov r0, #0
_020C00BC:
	cmp r0, #0
	bne _020C039C
	ldr r0, [r7, #4]
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _020C00E8
	ldr r1, [r7, #8]
	tst r1, #0x80
	moveq r1, #0x38
	mlaeq r8, r5, r1, r0
	beq _020C0398
_020C00E8:
	cmp r8, #0x20
	cmpne r8, #0x40
	bne _020C0130
	mov r1, r5, lsr #5
	add r1, r7, r1, lsl #2
	ldr r1, [r1, #0xbc]
	and r2, r5, #0x1f
	mov r3, #1
	tst r1, r3, lsl r2
	beq _020C0130
	cmp r0, #0
	movne r1, #0x38
	mlane r8, r5, r1, r0
	bne _020C0398
	ldr r1, _020C04B0 ; =0x021DA704
	mov r0, #0x38
	mla r8, r5, r0, r1
	b _020C0398
_020C0130:
	cmp r0, #0
	beq _020C0168
	add r8, r7, #0xbc
	mov r3, r5, lsr #5
	ldr r2, [r8, r3, lsl #2]
	and r0, r5, #0x1f
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [r8, r3, lsl #2]
	ldr r1, [r7, #4]
	mov r0, #0x38
	ldr r1, [r1, #0x38]
	mla r8, r5, r0, r1
	b _020C019C
_020C0168:
	cmp r8, #0x40
	addne r8, r7, #0xf4
	bne _020C019C
	add lr, r7, #0xbc
	mov ip, r5, lsr #5
	ldr r1, _020C04B0 ; =0x021DA704
	ldr r8, [lr, ip, lsl #2]
	mov r0, #0x38
	and r2, r5, #0x1f
	mov r3, #1
	orr r2, r8, r3, lsl r2
	mla r8, r5, r0, r1
	str r2, [lr, ip, lsl #2]
_020C019C:
	mov r0, #0
	str r0, [r8]
	ldr r3, [r7, #0xd8]
	cmp r3, #0
	beq _020C01F0
	adds r2, r3, #4
	beq _020C01DC
	ldrb r0, [r3, #5]
	cmp r5, r0
	bhs _020C01DC
	ldrh r1, [r3, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020C01E0
_020C01DC:
	mov r1, #0
_020C01E0:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, r3, r0
	bne _020C01F4
_020C01F0:
	mov r0, #0
_020C01F4:
	ldrh r0, [r0, #0x1e]
	ldr r1, _020C04B4 ; =0x021DA49C
	tst r0, #0x20
	ldrne r0, [r8]
	orrne r0, r0, #0x20
	strne r0, [r8]
	ldrh r2, [r6, #0x1e]
	ldr r0, _020C04B8 ; =0x02109474
	ldr ip, [r1, #0x94]
	mov r2, r2, asr #6
	and r2, r2, #7
	ldr lr, [r0, r2, lsl #2]
	ldr r2, [r6, #4]
	mvn r3, lr
	and r3, ip, r3
	and r2, r2, lr
	orr r2, r3, r2
	str r2, [r8, #4]
	ldrh ip, [r6, #0x1e]
	ldr r3, [r1, #0x98]
	ldr r2, [r6, #8]
	mov ip, ip, asr #9
	and ip, ip, #7
	ldr ip, [r0, ip, lsl #2]
	mvn r0, ip
	and r3, r3, r0
	and r0, r2, ip
	orr r0, r3, r0
	str r0, [r8, #8]
	ldr r3, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r2, [r1, #0x9c]
	mvn r1, r3
	and r1, r2, r1
	and r0, r0, r3
	orr r0, r1, r0
	str r0, [r8, #0xc]
	ldr r0, [r6, #0x14]
	str r0, [r8, #0x10]
	ldrh r0, [r6, #0x1c]
	str r0, [r8, #0x14]
	ldrh r0, [r6, #0x1e]
	tst r0, #1
	beq _020C0330
	tst r0, #2
	ldrne r1, [r8]
	add r0, r6, #0x2c
	orrne r1, r1, #1
	strne r1, [r8]
	bne _020C02D0
	ldr r1, [r0]
	str r1, [r8, #0x18]
	ldr r1, [r0, #4]
	add r0, r0, #8
	str r1, [r8, #0x1c]
_020C02D0:
	ldrh r1, [r6, #0x1e]
	tst r1, #4
	ldrne r1, [r8]
	orrne r1, r1, #2
	strne r1, [r8]
	bne _020C02FC
	ldrsh r1, [r0]
	strh r1, [r8, #0x20]
	ldrsh r1, [r0, #2]
	add r0, r0, #4
	strh r1, [r8, #0x22]
_020C02FC:
	ldrh r1, [r6, #0x1e]
	tst r1, #8
	ldrne r0, [r8]
	orrne r0, r0, #4
	strne r0, [r8]
	bne _020C0324
	ldr r1, [r0]
	str r1, [r8, #0x24]
	ldr r0, [r0, #4]
	str r0, [r8, #0x28]
_020C0324:
	ldr r0, [r8]
	orr r0, r0, #8
	str r0, [r8]
_020C0330:
	ldr ip, [r7, #4]
	ldr r1, [ip, #8]
	cmp r1, #0
	beq _020C036C
	mov r0, r5, lsr #5
	add r0, ip, r0, lsl #2
	ldr r0, [r0, #0x3c]
	and r2, r5, #0x1f
	mov r3, #1
	tst r0, r3, lsl r2
	beq _020C036C
	ldr r3, [ip, #0xc]
	mov r0, r8
	mov r2, r5
	blx r3
_020C036C:
	ldr r0, [r8]
	tst r0, #0x18
	beq _020C0398
	ldrh r0, [r6, #0x20]
	strh r0, [r8, #0x2c]
	ldrh r0, [r6, #0x22]
	strh r0, [r8, #0x2e]
	ldr r0, [r6, #0x24]
	str r0, [r8, #0x30]
	ldr r0, [r6, #0x28]
	str r0, [r8, #0x34]
_020C0398:
	str r8, [r7, #0xb0]
_020C039C:
	cmp r4, #2
	bne _020C03D8
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x1c]
	blx r1
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	ldrneb r4, [r7, #0x90]
	ldr r0, [r7, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C03DC
_020C03D8:
	mov r0, #0
_020C03DC:
	cmp r0, #0
	bne _020C0484
	ldr r5, [r7, #0xb0]
	ldr r1, [r5, #0xc]
	tst r1, #0x1f0000
	beq _020C0478
	ldr r0, [r5]
	tst r0, #0x20
	bicne r0, r1, #0x1f0000
	strne r0, [r5, #0xc]
	ldr r0, [r7, #8]
	bic r0, r0, #2
	str r0, [r7, #8]
	tst r0, #0x100
	bne _020C0484
	ldr r0, _020C04BC ; =0x00293130
	ldr r3, _020C04C0 ; =0x00002B2A
	str r0, [sp]
	ldr r2, [r5, #4]
	add r1, sp, #4
	str r2, [sp, #4]
	ldr r6, [r5, #8]
	mov r2, #6
	str r6, [sp, #8]
	ldr r6, [r5, #0xc]
	str r6, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r3, [r5, #0x10]
	str r3, [sp, #0x14]
	ldr r3, [r5, #0x14]
	str r3, [sp, #0x18]
	bl sub_020C2528
	ldr r0, [r5]
	tst r0, #0x18
	beq _020C0484
	ldr r1, [r7, #0xf0]
	mov r0, r5
	blx r1
	b _020C0484
_020C0478:
	ldr r0, [r7, #8]
	orr r0, r0, #2
	str r0, [r7, #8]
_020C0484:
	cmp r4, #3
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x1c]
	blx r1
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C04B0: .word 0x021DA704
_020C04B4: .word 0x021DA49C
_020C04B8: .word 0x02109474
_020C04BC: .word 0x00293130
_020C04C0: .word 0x00002B2A
	arm_func_end sub_020C003C

	arm_func_start sub_020C04C4
sub_020C04C4: ; 0x020C04C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #8]
	tst r2, #0x200
	bne _020C0560
	ldr r0, [r4]
	tst r2, #1
	ldrb r3, [r0, #1]
	bne _020C04FC
	tst r2, #8
	beq _020C04FC
	ldrb r0, [r4, #0xad]
	cmp r3, r0
	beq _020C0560
_020C04FC:
	ldr lr, [r4, #0xd8]
	cmp lr, #0
	beq _020C0548
	adds ip, lr, #4
	beq _020C0534
	ldrb r0, [lr, #5]
	cmp r3, r0
	bhs _020C0534
	ldrh r2, [lr, #0xa]
	ldrh r0, [ip, r2]
	add r2, ip, r2
	add r2, r2, #4
	mla r2, r0, r3, r2
	b _020C0538
_020C0534:
	mov r2, #0
_020C0538:
	cmp r2, #0
	ldrne r0, [r2]
	addne r2, lr, r0
	bne _020C054C
_020C0548:
	mov r2, #0
_020C054C:
	ldrh lr, [r2]
	ldr ip, _020C0570 ; =_02110AAC
	mov r0, r4
	ldr ip, [ip, lr, lsl #2]
	blx ip
_020C0560:
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C0570: .word _02110AAC
	arm_func_end sub_020C04C4

	arm_func_start sub_020C0574
sub_020C0574: ; 0x020C0574
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #0x20]
	mov r4, r2
	cmp r0, #0
	ldrneb r6, [r5, #0x91]
	moveq r6, #0
	cmp r6, #1
	bne _020C05CC
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x20]
	blx r1
	ldr r0, [r5, #0x20]
	cmp r0, #0
	ldrneb r6, [r5, #0x91]
	ldr r0, [r5, #8]
	moveq r6, #0
	and r0, r0, #0x40
	b _020C05D0
_020C05CC:
	mov r0, #0
_020C05D0:
	cmp r0, #0
	bne _020C05F4
	ldr r0, [r5, #8]
	tst r0, #0x100
	bne _020C05F4
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r0, r4, r0
	bl sub_020C2474
_020C05F4:
	cmp r6, #2
	bne _020C0624
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x20]
	blx r1
	ldr r0, [r5, #0x20]
	cmp r0, #0
	ldrneb r6, [r5, #0x91]
	moveq r6, #0
_020C0624:
	cmp r6, #3
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x20]
	blx r1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C0574

	arm_func_start sub_020C0648
sub_020C0648: ; 0x020C0648
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	tst r0, #0x200
	bne _020C06D4
	tst r0, #1
	beq _020C06D4
	tst r0, #2
	bne _020C06D4
	ldr r0, [r4]
	ldr ip, [r4, #0xdc]
	ldrb r3, [r0, #1]
	cmp ip, #0
	beq _020C06BC
	beq _020C06A8
	ldrb r0, [ip, #1]
	cmp r3, r0
	bhs _020C06A8
	ldrh r2, [ip, #6]
	ldrh r0, [ip, r2]
	add r2, ip, r2
	add r2, r2, #4
	mla r2, r0, r3, r2
	b _020C06AC
_020C06A8:
	mov r2, #0
_020C06AC:
	cmp r2, #0
	ldrne r0, [r2]
	addne r2, ip, r0
	bne _020C06C0
_020C06BC:
	mov r2, #0
_020C06C0:
	ldrh lr, [r2]
	ldr ip, _020C06E4 ; =_02110ABC
	mov r0, r4
	ldr ip, [ip, lr, lsl #2]
	blx ip
_020C06D4:
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C06E4: .word _02110ABC
	arm_func_end sub_020C0648

	arm_func_start sub_020C06E8
sub_020C06E8: ; 0x020C06E8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	ldr r0, [sl]
	mov sb, r1
	ldrb r6, [r0, #1]
	mov r4, #4
	strb r6, [sl, #0xae]
	ldr r0, [sl, #8]
	orr r0, r0, #0x10
	str r0, [sl, #8]
	tst r0, #0x400
	beq _020C0770
	cmp sb, #0x40
	cmpne sb, #0x60
	addeq r4, r4, #1
	cmp sb, #0x20
	cmpne sb, #0x60
	bne _020C075C
	tst r0, #0x100
	add r4, r4, #1
	bne _020C075C
	ldr r0, [sl]
	add r1, sp, #0x10
	ldrb r3, [r0, #4]
	mov r0, #0x14
	mov r2, #1
	str r3, [sp, #0x10]
	bl sub_020C2528
_020C075C:
	ldr r0, [sl]
	add sp, sp, #0x14
	add r0, r0, r4
	str r0, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C0770:
	cmp sb, #0x40
	cmpne sb, #0x60
	bne _020C07B4
	ldr r0, [sl]
	cmp sb, #0x40
	ldreqb r0, [r0, #4]
	add r4, r4, #1
	streq r0, [sp, #0xc]
	ldrneb r0, [r0, #5]
	strne r0, [sp, #0xc]
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C07B4
	add r1, sp, #0xc
	mov r0, #0x14
	mov r2, #1
	bl sub_020C2528
_020C07B4:
	add r0, sl, #0x12c
	str r0, [sl, #0xb4]
	ldr r0, [sl, #0x24]
	cmp r0, #0
	ldrneb r8, [sl, #0x92]
	moveq r8, #0
	cmp r8, #1
	bne _020C0808
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x24]
	blx r1
	ldr r0, [sl, #0x24]
	cmp r0, #0
	ldrneb r8, [sl, #0x92]
	ldr r0, [sl, #8]
	moveq r8, #0
	and r0, r0, #0x40
	b _020C080C
_020C0808:
	mov r0, #0
_020C080C:
	cmp r0, #0
	bne _020C0A54
	ldr r0, [sl, #4]
	ldr r1, [r0, #0x34]
	cmp r1, #0
	beq _020C0840
	mov r0, #0x58
	mla r5, r6, r0, r1
	ldr r0, [sl, #8]
	tst r0, #0x80
	moveq r0, #1
	movne r0, #0
	b _020C0848
_020C0840:
	add r5, sl, #0x12c
	mov r0, #0
_020C0848:
	cmp r0, #0
	bne _020C0A50
	mov r0, #0
	str r0, [r5]
	ldr r0, [sl, #4]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _020C0880
	ldr r3, [r0, #0x14]
	mov r0, r5
	mov r2, r6
	blx r3
	cmp r0, #0
	bne _020C0A50
_020C0880:
	ldr r2, [sl, #0xd4]
	cmp r2, #0
	beq _020C08C8
	beq _020C08B4
	ldrb r0, [r2, #1]
	cmp r6, r0
	bhs _020C08B4
	ldrh r1, [r2, #6]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020C08B8
_020C08B4:
	mov r1, #0
_020C08B8:
	cmp r1, #0
	ldrne r0, [r1]
	addne r7, r2, r0
	bne _020C08CC
_020C08C8:
	mov r7, #0
_020C08CC:
	ldrh r0, [r7]
	add r6, r7, #4
	tst r0, #1
	beq _020C08EC
	ldr r0, [r5]
	orr r0, r0, #4
	str r0, [r5]
	b _020C0908
_020C08EC:
	ldr r0, [r6]
	str r0, [r5, #0x4c]
	ldr r0, [r6, #4]
	str r0, [r5, #0x50]
	ldr r0, [r6, #8]
	add r6, r6, #0xc
	str r0, [r5, #0x54]
_020C0908:
	ldrh r0, [r7]
	tst r0, #2
	beq _020C0924
	ldr r0, [r5]
	orr r0, r0, #2
	str r0, [r5]
	b _020C0A38
_020C0924:
	tst r0, #8
	beq _020C09EC
	and r1, r0, #0xf0
	mov fp, r1, asr #4
	ldrsh r1, [r6]
	add r0, r5, #0x28
	str r1, [sp]
	ldrsh r1, [r6, #2]
	str r1, [sp, #4]
	bl sub_020D4BD0
	ldrh r0, [r7]
	ldr r2, _020C0B38 ; =0x02109494
	ldr r1, _020C0B3C ; =0x02109495
	tst r0, #0x100
	mov r0, #0x1000
	ldrb r2, [r2, fp, lsl #2]
	ldrb r1, [r1, fp, lsl #2]
	rsbne r0, r0, #0
	add r3, r5, fp, lsl #2
	str r0, [r3, #0x28]
	ldr r0, [sp]
	add r2, r5, r2, lsl #2
	str r0, [r2, #0x28]
	ldr r0, [sp, #4]
	add r1, r5, r1, lsl #2
	str r0, [r1, #0x28]
	ldrh r0, [r7]
	tst r0, #0x200
	beq _020C09A4
	ldr r0, [sp, #4]
	rsb r0, r0, #0
	str r0, [sp, #4]
_020C09A4:
	ldr r0, _020C0B40 ; =0x02109496
	ldrb r0, [r0, fp, lsl #2]
	add r1, r5, r0, lsl #2
	ldr r0, [sp, #4]
	str r0, [r1, #0x28]
	ldrh r0, [r7]
	tst r0, #0x400
	beq _020C09D0
	ldr r0, [sp]
	rsb r0, r0, #0
	str r0, [sp]
_020C09D0:
	ldr r0, _020C0B44 ; =0x02109497
	add r6, r6, #4
	ldrb r0, [r0, fp, lsl #2]
	add r1, r5, r0, lsl #2
	ldr r0, [sp]
	str r0, [r1, #0x28]
	b _020C0A38
_020C09EC:
	ldrsh r0, [r7, #2]
	str r0, [r5, #0x28]
	ldrsh r0, [r6]
	str r0, [r5, #0x2c]
	ldrsh r0, [r6, #2]
	str r0, [r5, #0x30]
	ldrsh r0, [r6, #4]
	str r0, [r5, #0x34]
	ldrsh r0, [r6, #6]
	str r0, [r5, #0x38]
	ldrsh r0, [r6, #8]
	str r0, [r5, #0x3c]
	ldrsh r0, [r6, #0xa]
	str r0, [r5, #0x40]
	ldrsh r0, [r6, #0xc]
	str r0, [r5, #0x44]
	ldrsh r0, [r6, #0xe]
	add r6, r6, #0x10
	str r0, [r5, #0x48]
_020C0A38:
	ldrh r3, [r7]
	ldr r2, [sl]
	ldr r7, [sl, #0xe8]
	mov r0, r5
	mov r1, r6
	blx r7
_020C0A50:
	str r5, [sl, #0xb4]
_020C0A54:
	cmp r8, #2
	bne _020C0A90
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x24]
	blx r1
	ldr r0, [sl, #0x24]
	cmp r0, #0
	ldrneb r8, [sl, #0x92]
	ldr r0, [sl, #8]
	moveq r8, #0
	and r0, r0, #0x40
	b _020C0A94
_020C0A90:
	mov r0, #0
_020C0A94:
	cmp r0, #0
	bne _020C0AB4
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C0AB4
	ldr r0, [sl, #0xb4]
	ldr r1, [sl, #0xec]
	blx r1
_020C0AB4:
	mov r0, #0
	str r0, [sl, #0xb4]
	cmp r8, #3
	bne _020C0AE4
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x24]
	blx r1
	ldr r0, [sl, #8]
	and r0, r0, #0x40
_020C0AE4:
	cmp sb, #0x20
	cmpne sb, #0x60
	bne _020C0B24
	cmp r0, #0
	add r4, r4, #1
	bne _020C0B24
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C0B24
	ldr r0, [sl]
	add r1, sp, #8
	ldrb r3, [r0, #4]
	mov r0, #0x13
	mov r2, #1
	str r3, [sp, #8]
	bl sub_020C2528
_020C0B24:
	ldr r0, [sl]
	add r0, r0, r4
	str r0, [sl]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C0B38: .word 0x02109494
_020C0B3C: .word 0x02109495
_020C0B40: .word 0x02109496
_020C0B44: .word 0x02109497
	arm_func_end sub_020C06E8

	arm_func_start sub_020C0B48
sub_020C0B48: ; 0x020C0B48
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc8
	mov sb, r0
	ldr r0, [sb, #8]
	mov r8, r1
	tst r0, #0x200
	mov r4, #2
	ldr r5, _020C0E24 ; =_02110B3C
	ldr r6, _020C0E28 ; =_02110B48
	beq _020C0B9C
	cmp r8, #0x40
	cmpne r8, #0x60
	addeq r4, r4, #1
	cmp r8, #0x20
	cmpne r8, #0x60
	ldr r0, [sb]
	addeq r4, r4, #1
	add r0, r0, r4
	add sp, sp, #0xc8
	str r0, [sb]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C0B9C:
	cmp r8, #0x40
	cmpne r8, #0x60
	bne _020C0BDC
	tst r0, #0x100
	add r4, r4, #1
	bne _020C0BDC
	ldr r0, [sb]
	cmp r8, #0x40
	ldreqb r0, [r0, #2]
	add r1, sp, #4
	mov r2, #1
	streq r0, [sp, #4]
	ldrneb r0, [r0, #3]
	strne r0, [sp, #4]
	mov r0, #0x14
	bl sub_020C2528
_020C0BDC:
	ldr r0, [sb, #0x28]
	cmp r0, #0
	ldrneb r7, [sb, #0x93]
	moveq r7, #0
	cmp r7, #1
	bne _020C0C28
	ldr r1, [sb, #8]
	mov r0, sb
	bic r1, r1, #0x40
	str r1, [sb, #8]
	ldr r1, [sb, #0x28]
	blx r1
	ldr r0, [sb, #0x28]
	cmp r0, #0
	ldrneb r7, [sb, #0x93]
	ldr r0, [sb, #8]
	moveq r7, #0
	and r1, r0, #0x40
	b _020C0C2C
_020C0C28:
	mov r1, #0
_020C0C2C:
	ldr r0, [sb, #8]
	tst r0, #0x100
	cmpeq r1, #0
	bne _020C0DA4
	bl sub_020C23F4
	ldr r2, _020C0E2C ; =0x00151110
	ldr r1, _020C0E30 ; =0x04000400
	mov r0, #0
	str r2, [r1]
	str r0, [r1]
	str r0, [r1]
	add sl, sp, #0x88
_020C0C5C:
	mov r0, sl
	bl sub_020CF884
	cmp r0, #0
	bne _020C0C5C
	ldr r0, _020C0E34 ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C0C9C
	bl sub_020BF3E0
	add r1, sp, #0x48
	bl sub_020CB6D4
	add r0, sp, #0x88
	add r1, sp, #0x48
	mov r2, r0
	bl sub_020CC1E8
	b _020C0CC0
_020C0C9C:
	tst r0, #2
	beq _020C0CC0
	ldr r0, _020C0E38 ; =0x021DA4E8
	add r1, sp, #8
	bl sub_020CB6D4
	add r0, sp, #0x88
	add r1, sp, #8
	mov r2, r0
	bl sub_020CC1E8
_020C0CC0:
	ldr r3, [sp, #0xb8]
	ldr r2, [sp, #0xbc]
	ldr r1, [sp, #0xc0]
	add r0, sp, #0x88
	str r3, [r5]
	str r2, [r5, #4]
	str r1, [r5, #8]
	bl sub_020CCF80
	str r0, [r6]
	add r0, sp, #0x98
	bl sub_020CCF80
	str r0, [r6, #4]
	add r0, sp, #0xa8
	bl sub_020CCF80
	ldr r1, _020C0E34 ; =0x021DA49C
	str r0, [r6, #8]
	ldr r0, [r1, #0xfc]
	ldr r1, _020C0E30 ; =0x04000400
	tst r0, #1
	beq _020C0D50
	ldr r3, _020C0E3C ; =0x00171012
	ldr r0, _020C0E40 ; =_02110B10
	mov r2, #8
	str r3, [r1]
	bl sub_020D4830
	bl sub_020BF418
	ldr r1, _020C0E30 ; =0x04000400
	mov r2, #0x30
	bl sub_020D4830
	ldr r2, _020C0E44 ; =0x00001B19
	ldr r1, _020C0E30 ; =0x04000400
	ldr r0, _020C0E48 ; =_02110B18
	str r2, [r1]
	mov r2, #0x3c
	bl sub_020D4830
	b _020C0DA4
_020C0D50:
	tst r0, #2
	beq _020C0D98
	ldr r3, _020C0E3C ; =0x00171012
	ldr r0, _020C0E40 ; =_02110B10
	mov r2, #8
	str r3, [r1]
	bl sub_020D4830
	bl sub_020BF0F8
	ldr r1, _020C0E30 ; =0x04000400
	mov r2, #0x30
	bl sub_020D4830
	ldr r2, _020C0E44 ; =0x00001B19
	ldr r1, _020C0E30 ; =0x04000400
	ldr r0, _020C0E48 ; =_02110B18
	str r2, [r1]
	mov r2, #0x3c
	bl sub_020D4830
	b _020C0DA4
_020C0D98:
	ldr r0, _020C0E4C ; =_02110B0C
	mov r2, #0x48
	bl sub_020D4830
_020C0DA4:
	cmp r7, #3
	movne r0, #0
	bne _020C0DD0
	ldr r1, [sb, #8]
	mov r0, sb
	bic r1, r1, #0x40
	str r1, [sb, #8]
	ldr r1, [sb, #0x28]
	blx r1
	ldr r0, [sb, #8]
	and r0, r0, #0x40
_020C0DD0:
	cmp r8, #0x20
	cmpne r8, #0x60
	bne _020C0E10
	cmp r0, #0
	add r4, r4, #1
	bne _020C0E10
	ldr r0, [sb, #8]
	tst r0, #0x100
	bne _020C0E10
	ldr r0, [sb]
	add r1, sp, #0
	ldrb r3, [r0, #2]
	mov r0, #0x13
	mov r2, #1
	str r3, [sp]
	bl sub_020C2528
_020C0E10:
	ldr r0, [sb]
	add r0, r0, r4
	str r0, [sb]
	add sp, sp, #0xc8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020C0E24: .word _02110B3C
_020C0E28: .word _02110B48
_020C0E2C: .word 0x00151110
_020C0E30: .word 0x04000400
_020C0E34: .word 0x021DA49C
_020C0E38: .word 0x021DA4E8
_020C0E3C: .word 0x00171012
_020C0E40: .word _02110B10
_020C0E44: .word 0x00001B19
_020C0E48: .word _02110B18
_020C0E4C: .word _02110B0C
	arm_func_end sub_020C0B48

	arm_func_start sub_020C0E50
sub_020C0E50: ; 0x020C0E50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	mov sl, r0
	ldr r0, [sl, #8]
	mov sb, r1
	tst r0, #0x200
	mov r5, #2
	ldr fp, _020C1188 ; =_02110B84
	ldr r6, _020C118C ; =_02110B90
	ldr r7, _020C1190 ; =_02110B60
	beq _020C0EA8
	cmp sb, #0x40
	cmpne sb, #0x60
	addeq r5, r5, #1
	cmp sb, #0x20
	cmpne sb, #0x60
	ldr r0, [sl]
	addeq r5, r5, #1
	add r0, r0, r5
	add sp, sp, #0xc8
	str r0, [sl]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C0EA8:
	cmp sb, #0x40
	cmpne sb, #0x60
	bne _020C0EE8
	tst r0, #0x100
	add r5, r5, #1
	bne _020C0EE8
	ldr r0, [sl]
	cmp sb, #0x40
	ldreqb r0, [r0, #2]
	add r1, sp, #4
	mov r2, #1
	streq r0, [sp, #4]
	ldrneb r0, [r0, #3]
	strne r0, [sp, #4]
	mov r0, #0x14
	bl sub_020C2528
_020C0EE8:
	ldr r0, [sl, #0x2c]
	cmp r0, #0
	ldrneb r8, [sl, #0x94]
	moveq r8, #0
	cmp r8, #1
	bne _020C0F34
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x2c]
	blx r1
	ldr r0, [sl, #0x2c]
	cmp r0, #0
	ldrneb r8, [sl, #0x94]
	ldr r0, [sl, #8]
	moveq r8, #0
	and r1, r0, #0x40
	b _020C0F38
_020C0F34:
	mov r1, #0
_020C0F38:
	ldr r0, [sl, #8]
	tst r0, #0x100
	cmpeq r1, #0
	bne _020C1108
	bl sub_020C23F4
	ldr r2, _020C1194 ; =0x00151110
	ldr r1, _020C1198 ; =0x04000400
	mov r0, #0
	str r2, [r1]
	str r0, [r1]
	str r0, [r1]
	add r4, sp, #0x88
_020C0F68:
	mov r0, r4
	bl sub_020CF884
	cmp r0, #0
	bne _020C0F68
	ldr r0, _020C119C ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C0FA8
	bl sub_020BF3E0
	add r1, sp, #0x48
	bl sub_020CB6D4
	add r0, sp, #0x88
	add r1, sp, #0x48
	mov r2, r0
	bl sub_020CC1E8
	b _020C0FCC
_020C0FA8:
	tst r0, #2
	beq _020C0FCC
	ldr r0, _020C11A0 ; =0x021DA4E8
	add r1, sp, #8
	bl sub_020CB6D4
	add r0, sp, #0x88
	add r1, sp, #8
	mov r2, r0
	bl sub_020CC1E8
_020C0FCC:
	ldr r3, [sp, #0xb8]
	ldr r2, [sp, #0xbc]
	ldr r1, [sp, #0xc0]
	add r0, sp, #0x88
	str r3, [fp]
	str r2, [fp, #4]
	str r1, [fp, #8]
	bl sub_020CCF80
	str r0, [r6]
	add r0, sp, #0x98
	bl sub_020CCF80
	str r0, [r6, #4]
	add r0, sp, #0xa8
	bl sub_020CCF80
	ldr r1, [sp, #0x9c]
	str r0, [r6, #8]
	cmp r1, #0
	ldreq r0, [sp, #0xa0]
	cmpeq r0, #0
	beq _020C1040
	add r0, sp, #0x98
	add r1, r7, #0xc
	bl sub_020CCFE0
	ldr r1, [r7, #0x14]
	ldr r0, [r7, #0x10]
	rsb r1, r1, #0
	str r1, [r7, #0x1c]
	str r0, [r7, #0x20]
	b _020C1060
_020C1040:
	add r0, sp, #0xa8
	add r1, r7, #0x18
	bl sub_020CCFE0
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x20]
	rsb r1, r1, #0
	str r1, [r7, #0x14]
	str r0, [r7, #0x10]
_020C1060:
	ldr r0, _020C119C ; =0x021DA49C
	ldr r1, _020C1198 ; =0x04000400
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C10B4
	ldr r3, _020C11A4 ; =0x00171012
	ldr r0, _020C11A8 ; =_02110B58
	mov r2, #8
	str r3, [r1]
	bl sub_020D4830
	bl sub_020BF418
	ldr r1, _020C1198 ; =0x04000400
	mov r2, #0x30
	bl sub_020D4830
	ldr r2, _020C11AC ; =0x00001B19
	ldr r1, _020C1198 ; =0x04000400
	ldr r0, _020C1190 ; =_02110B60
	str r2, [r1]
	mov r2, #0x3c
	bl sub_020D4830
	b _020C1108
_020C10B4:
	tst r0, #2
	beq _020C10FC
	ldr r3, _020C11A4 ; =0x00171012
	ldr r0, _020C11A8 ; =_02110B58
	mov r2, #8
	str r3, [r1]
	bl sub_020D4830
	bl sub_020BF0F8
	ldr r1, _020C1198 ; =0x04000400
	mov r2, #0x30
	bl sub_020D4830
	ldr r2, _020C11AC ; =0x00001B19
	ldr r1, _020C1198 ; =0x04000400
	ldr r0, _020C1190 ; =_02110B60
	str r2, [r1]
	mov r2, #0x3c
	bl sub_020D4830
	b _020C1108
_020C10FC:
	ldr r0, _020C11B0 ; =_02110B54
	mov r2, #0x48
	bl sub_020D4830
_020C1108:
	cmp r8, #3
	movne r0, #0
	bne _020C1134
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x2c]
	blx r1
	ldr r0, [sl, #8]
	and r0, r0, #0x40
_020C1134:
	cmp sb, #0x20
	cmpne sb, #0x60
	bne _020C1174
	cmp r0, #0
	add r5, r5, #1
	bne _020C1174
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C1174
	ldr r0, [sl]
	add r1, sp, #0
	ldrb r3, [r0, #2]
	mov r0, #0x13
	mov r2, #1
	str r3, [sp]
	bl sub_020C2528
_020C1174:
	ldr r0, [sl]
	add r0, r0, r5
	str r0, [sl]
	add sp, sp, #0xc8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C1188: .word _02110B84
_020C118C: .word _02110B90
_020C1190: .word _02110B60
_020C1194: .word 0x00151110
_020C1198: .word 0x04000400
_020C119C: .word 0x021DA49C
_020C11A0: .word 0x021DA4E8
_020C11A4: .word 0x00171012
_020C11A8: .word _02110B58
_020C11AC: .word 0x00001B19
_020C11B0: .word _02110B54
	arm_func_end sub_020C0E50

	arm_func_start sub_020C11B4
sub_020C11B4: ; 0x020C11B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	ldr r1, [r0, #4]
	ldr r6, [r0]
	ldr r7, [r1, #4]
	ldrb r2, [r6, #2]
	ldr r3, [r7, #0x10]
	mov r5, #0
	str r0, [sp]
	str r2, [sp, #0x10]
	add r3, r7, r3
	add r1, sp, #0xb0
	mov r0, r5
	mov r2, #0x54
	mov r4, r5
	str r3, [sp, #0x14]
	add r6, r6, #3
	bl sub_020D4858
	bl sub_020C23F4
	mov r0, r5
	ldr r1, _020C1900 ; =0x04000440
	str r0, [sp, #0xc]
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #0xc]
	ldr r0, [sp, #0xc]
	str r0, [r1, #0x14]
	mov r0, #2
	str r0, [r1]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bls _020C16A4
_020C1234:
	ldrb fp, [r6, #1]
	mov r1, #0x64
	ldr r0, [sp]
	smulbb r1, fp, r1
	mov r2, fp, lsr #5
	str r1, [sp, #4]
	add r0, r0, r2, lsl #2
	ldr r3, _020C1904 ; =0x021DBB04
	ldr r2, [sp, #4]
	ldr sb, [r0, #0xcc]
	add r7, r3, r2
	and r1, fp, #0x1f
	mov r2, #1
	ands r3, sb, r2, lsl r1
	str r3, [sp, #8]
	bne _020C12A0
	ldr sb, [r0, #0xcc]
	ldr r3, _020C1908 ; =0x04000450
	orr r1, sb, r2, lsl r1
	str r1, [r0, #0xcc]
	ldr r0, [sp, #0x14]
	mov r1, #0x54
	mla r0, fp, r1, r0
	ldrb sb, [r6]
	str sb, [r3]
	str r2, [r3, #-0x10]
	bl sub_020CF52C
_020C12A0:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _020C14C8
	ldr r0, [sp, #0xe0]
	ldmia r8, {sb, lr}
	str r0, [sp, #0x18]
	mov r0, sb, asr #0x1f
	str r0, [sp, #0x20]
	ldr r0, [sp, #0xe4]
	ldr ip, [r8, #8]
	str r0, [sp, #0x24]
	mov r0, lr, asr #0x1f
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xe8]
	ldr r3, [r8, #0xc]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0xec]
	ldr r2, [r8, #0x10]
	str r0, [sp, #0x34]
	mov r0, ip, asr #0x1f
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xf0]
	ldr r1, [r8, #0x14]
	str r0, [sp, #0x3c]
	mov r0, r3, asr #0x1f
	str r0, [sp, #0x38]
	ldr r0, [sp, #0xf4]
	str r0, [sp, #0x44]
	mov r0, r2, asr #0x1f
	str r0, [sp, #0x40]
	ldr r0, [sp, #0xf8]
	str r0, [sp, #0x4c]
	mov r0, r1, asr #0x1f
	str r0, [sp, #0x48]
	ldr r0, [r8, #0x18]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0xfc]
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x50]
	mov r0, r0, asr #0x1f
	str r0, [sp, #0x54]
	ldr r0, [r8, #0x1c]
	str r0, [sp, #0xa8]
	ldr r0, [r8, #0x20]
	ldr r8, [sp, #0xa8]
	mov r8, r8, asr #0x1f
	str r8, [sp, #0x5c]
	ldr r8, [sp, #0x100]
	str r8, [sp, #0x60]
	mov r8, r0, asr #0x1f
	str r8, [sp, #0x64]
	umull sl, r8, r5, sb
	str sl, [sp, #0x1c]
	ldr sl, [sp, #0x20]
	mla r8, r5, sl, r8
	mla r8, r4, sb, r8
	ldr sb, [sp, #0x1c]
	mov sb, sb, lsr #0xc
	orr sb, sb, r8, lsl #20
	ldr r8, [sp, #0x18]
	adds r8, r8, sb
	str r8, [sp, #0xe0]
	umull sl, sb, r5, lr
	ldr r8, [sp, #0x28]
	mov sl, sl, lsr #0xc
	mla sb, r5, r8, sb
	mla sb, r4, lr, sb
	ldr r8, [sp, #0x24]
	orr sl, sl, sb, lsl #20
	adds r8, r8, sl
	str r8, [sp, #0xe4]
	umull sl, sb, r5, ip
	ldr r8, [sp, #0x30]
	mov sl, sl, lsr #0xc
	mla sb, r5, r8, sb
	mla sb, r4, ip, sb
	ldr r8, [sp, #0x2c]
	orr sl, sl, sb, lsl #20
	adds r8, r8, sl
	str r8, [sp, #0xe8]
	ldr r8, [sp, #0x38]
	umull sl, sb, r5, r3
	mla sb, r5, r8, sb
	mla sb, r4, r3, sb
	mov r8, sl, lsr #0xc
	ldr r3, [sp, #0x34]
	orr r8, r8, sb, lsl #20
	adds r3, r3, r8
	str r3, [sp, #0xec]
	ldr r3, [sp, #0x40]
	umull sb, r8, r5, r2
	mla r8, r5, r3, r8
	mla r8, r4, r2, r8
	mov r3, sb, lsr #0xc
	ldr r2, [sp, #0x3c]
	orr r3, r3, r8, lsl #20
	adds r2, r2, r3
	str r2, [sp, #0xf0]
	ldr r2, [sp, #0x48]
	umull r8, r3, r5, r1
	mla r3, r5, r2, r3
	mla r3, r4, r1, r3
	mov r2, r8, lsr #0xc
	ldr r1, [sp, #0x44]
	orr r2, r2, r3, lsl #20
	adds r1, r1, r2
	str r1, [sp, #0xf4]
	ldr r1, [sp, #0x50]
	umull r3, r2, r5, r1
	ldr r1, [sp, #0x54]
	mov r3, r3, lsr #0xc
	mla r2, r5, r1, r2
	ldr r1, [sp, #0x50]
	mla r2, r4, r1, r2
	ldr r1, [sp, #0x4c]
	orr r3, r3, r2, lsl #20
	adds r1, r1, r3
	str r1, [sp, #0xf8]
	ldr r1, [sp, #0xa8]
	umull r3, r2, r5, r1
	ldr r1, [sp, #0x5c]
	mov r3, r3, lsr #0xc
	mla r2, r5, r1, r2
	ldr r1, [sp, #0xa8]
	mla r2, r4, r1, r2
	ldr r1, [sp, #0x58]
	orr r3, r3, r2, lsl #20
	adds r1, r1, r3
	str r1, [sp, #0xfc]
	ldr r1, [sp, #0x64]
	umull r3, r2, r5, r0
	mla r2, r5, r1, r2
	mla r2, r4, r0, r2
	mov r1, r3, lsr #0xc
	ldr r0, [sp, #0x60]
	orr r1, r1, r2, lsl #20
	adds r0, r0, r1
	str r0, [sp, #0x100]
_020C14C8:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _020C1504
_020C14D4:
	mov r0, r7
	bl sub_020CF884
	cmp r0, #0
	bne _020C14D4
	ldr r0, [sp, #0x14]
	mov r1, #0x54
	mla r0, fp, r1, r0
	ldr r1, _020C1900 ; =0x04000440
	mov r2, #2
	add r0, r0, #0x30
	str r2, [r1]
	bl sub_020CF548
_020C1504:
	ldrb r0, [r6, #2]
	ldr r2, [r7]
	ldr r1, [r7, #4]
	mov r5, r0, lsl #4
	ldr r0, [r7, #8]
	ldr r4, [r7, #0x10]
	ldr r3, [r7, #0x14]
	smull r2, r8, r5, r2
	mov r2, r2, lsr #0xc
	orr r2, r2, r8, lsl #20
	smull r1, r8, r5, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, r8, lsl #20
	smull r0, r8, r5, r0
	mov r0, r0, lsr #0xc
	orr r0, r0, r8, lsl #20
	smull r8, r4, r5, r4
	mov sb, r8, lsr #0xc
	orr sb, sb, r4, lsl #20
	smull r4, r3, r5, r3
	mov r8, r4, lsr #0xc
	orr r8, r8, r3, lsl #20
	mov r4, r5, asr #0x1f
	ldr sl, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	adds r2, sl, r2
	adds r1, r3, r1
	str r2, [sp, #0xb0]
	str r1, [sp, #0xb4]
	ldr r2, [sp, #0xb8]
	ldr r1, [sp, #0xbc]
	adds r2, r2, r0
	adds r0, r1, sb
	str r2, [sp, #0xb8]
	str r0, [sp, #0xbc]
	ldr r0, [sp, #0xc0]
	ldr r2, [sp, #0xc4]
	adds r0, r0, r8
	str r0, [sp, #0xc0]
	ldr r0, [r7, #0x18]
	ldr r3, [sp, #0xc8]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r2, r1
	str r0, [sp, #0xc4]
	ldr r0, [r7, #0x20]
	ldr r2, [sp, #0xcc]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r3, r1
	str r0, [sp, #0xc8]
	ldr r0, [r7, #0x24]
	ldr r3, [sp, #0xd0]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r2, r1
	str r0, [sp, #0xcc]
	ldr r0, [r7, #0x28]
	ldr r2, [sp, #0xd4]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r3, r1
	str r0, [sp, #0xd0]
	ldr r0, [r7, #0x30]
	ldr r3, [sp, #0xd8]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r2, r1
	str r0, [sp, #0xd4]
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x38]
	smull r2, r1, r5, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	adds r1, r3, r2
	str r1, [sp, #0xd8]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [sp, #0xdc]
	adds r0, r0, r1
	str r0, [sp, #0xdc]
	ldr r1, _020C190C ; =0x021DBB44
	ldr r0, [sp, #8]
	cmp r0, #0
	add r6, r6, #3
	ldr r0, [sp, #4]
	add r8, r1, r0
	bne _020C168C
_020C167C:
	mov r0, r8
	bl sub_020CF8B4
	cmp r0, #0
	bne _020C167C
_020C168C:
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	cmp r1, r0
	blo _020C1234
_020C16A4:
	ldmia r8, {r0, fp}
	ldr sl, [r8, #8]
	ldr sb, [r8, #0xc]
	ldr r7, [r8, #0x10]
	ldr r6, [r8, #0x14]
	ldr r3, [r8, #0x18]
	ldr r2, [r8, #0x1c]
	ldr r1, [r8, #0x20]
	umull ip, r8, r5, r0
	mov lr, ip, lsr #0xc
	ldr ip, [sp, #0xe0]
	str ip, [sp, #0x68]
	mov ip, r0, asr #0x1f
	mla r8, r5, ip, r8
	mla r8, r4, r0, r8
	orr lr, lr, r8, lsl #20
	umull ip, r8, r5, fp
	ldr r0, [sp, #0x68]
	str ip, [sp, #0x6c]
	adds r0, r0, lr
	str r0, [sp, #0xe0]
	mov r0, fp, asr #0x1f
	str r0, [sp, #0xac]
	ldr ip, [sp, #0xac]
	ldr r0, [sp, #0xe8]
	mla r8, r5, ip, r8
	mla r8, r4, fp, r8
	ldr fp, [sp, #0x6c]
	str r0, [sp, #0x70]
	mov fp, fp, lsr #0xc
	mov r0, sl, asr #0x1f
	str r0, [sp, #0x74]
	ldr r0, [sp, #0xec]
	ldr lr, [sp, #0xe4]
	orr fp, fp, r8, lsl #20
	adds r8, lr, fp
	str r8, [sp, #0xe4]
	str r0, [sp, #0x78]
	mov r0, sb, asr #0x1f
	str r0, [sp, #0x7c]
	ldr r0, [sp, #0xf0]
	ldr r8, [sp, #0x74]
	umull ip, fp, r5, sl
	mla fp, r5, r8, fp
	mla fp, r4, sl, fp
	mov sl, ip, lsr #0xc
	str r0, [sp, #0x80]
	mov r0, r7, asr #0x1f
	str r0, [sp, #0x84]
	ldr r0, [sp, #0xf4]
	ldr r8, [sp, #0x70]
	orr sl, sl, fp, lsl #20
	adds r8, r8, sl
	str r8, [sp, #0xe8]
	str r0, [sp, #0x88]
	mov r0, r6, asr #0x1f
	str r0, [sp, #0x8c]
	ldr r0, [sp, #0xf8]
	ldr r8, [sp, #0x7c]
	umull fp, sl, r5, sb
	mla sl, r5, r8, sl
	mla sl, r4, sb, sl
	mov sb, fp, lsr #0xc
	str r0, [sp, #0x90]
	mov r0, r3, asr #0x1f
	str r0, [sp, #0x94]
	ldr r0, [sp, #0xfc]
	ldr r8, [sp, #0x78]
	orr sb, sb, sl, lsl #20
	adds r8, r8, sb
	str r8, [sp, #0xec]
	str r0, [sp, #0x98]
	mov r0, r2, asr #0x1f
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0x100]
	ldr r8, [sp, #0x84]
	umull sl, sb, r5, r7
	mla sb, r5, r8, sb
	mla sb, r4, r7, sb
	mov r8, sl, lsr #0xc
	str r0, [sp, #0xa0]
	mov r0, r1, asr #0x1f
	str r0, [sp, #0xa4]
	ldr r7, [sp, #0x80]
	orr r8, r8, sb, lsl #20
	adds r7, r7, r8
	str r7, [sp, #0xf0]
	ldr r7, [sp, #0x8c]
	umull sb, r8, r5, r6
	mla r8, r5, r7, r8
	mla r8, r4, r6, r8
	mov r7, sb, lsr #0xc
	ldr r6, [sp, #0x88]
	orr r7, r7, r8, lsl #20
	adds r6, r6, r7
	str r6, [sp, #0xf4]
	ldr r6, [sp, #0x94]
	umull r8, r7, r5, r3
	mla r7, r5, r6, r7
	mla r7, r4, r3, r7
	mov r6, r8, lsr #0xc
	ldr r3, [sp, #0x90]
	orr r6, r6, r7, lsl #20
	adds r3, r3, r6
	str r3, [sp, #0xf8]
	ldr r3, [sp, #0x9c]
	umull r7, r6, r5, r2
	mla r6, r5, r3, r6
	mla r6, r4, r2, r6
	mov r3, r7, lsr #0xc
	ldr r2, [sp, #0x98]
	orr r3, r3, r6, lsl #20
	adds r2, r2, r3
	str r2, [sp, #0xfc]
	ldr r2, [sp, #0xa4]
	umull r6, r3, r5, r1
	mla r3, r5, r2, r3
	mla r3, r4, r1, r3
	mov r2, r6, lsr #0xc
	ldr r1, [sp, #0xa0]
	orr r2, r2, r3, lsl #20
	adds r1, r1, r2
	add r0, sp, #0xe0
	str r1, [sp, #0x100]
	bl sub_020CF510
	ldr r1, _020C1900 ; =0x04000440
	mov r2, #1
	add r0, sp, #0xb0
	str r2, [r1]
	bl sub_020CF510
	ldr r1, _020C1900 ; =0x04000440
	mov r2, #0
	mov r0, #1
	str r2, [r1]
	str r0, [r1, #0x10]
	mov r0, #2
	str r0, [r1]
	ldr r0, [sp]
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	str r0, [r1, #0xc]
	ldr r0, [sp]
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	add r0, r0, #1
	add r0, r0, r0, lsl #1
	add r1, r1, r0
	ldr r0, [sp]
	str r1, [r0]
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C1900: .word 0x04000440
_020C1904: .word 0x021DBB04
_020C1908: .word 0x04000450
_020C190C: .word 0x021DBB44
	arm_func_end sub_020C11B4

	arm_func_start sub_020C1910
sub_020C1910: ; 0x020C1910
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #0x34]
	cmp r0, #0
	ldrneb r4, [r5, #0x96]
	moveq r4, #0
	cmp r4, #1
	bne _020C1964
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x34]
	blx r1
	ldr r0, [r5, #0x34]
	cmp r0, #0
	ldrneb r4, [r5, #0x96]
	ldr r0, [r5, #8]
	moveq r4, #0
	and r1, r0, #0x40
	b _020C1968
_020C1964:
	mov r1, #0
_020C1968:
	ldr r0, [r5, #8]
	tst r0, #0x100
	cmpeq r1, #0
	bne _020C19BC
	ldr r0, [r5]
	ldrb ip, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb r2, [r0, #5]
	ldrb r1, [r0, #6]
	orr r3, ip, r3, lsl #8
	ldrb r6, [r0, #4]
	orr ip, r3, lr, lsl #16
	ldrb r3, [r0, #7]
	orr r1, r2, r1, lsl #8
	orr r6, ip, r6, lsl #24
	ldrb r2, [r0, #8]
	orr r1, r1, r3, lsl #16
	add r0, r0, r6
	orr r1, r1, r2, lsl #24
	bl sub_020C2474
_020C19BC:
	cmp r4, #3
	bne _020C19DC
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x34]
	blx r1
_020C19DC:
	ldr r0, [r5]
	add r0, r0, #9
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C1910

	arm_func_start sub_020C19EC
sub_020C19EC: ; 0x020C19EC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	ldr r0, [r4, #8]
	tst r0, #0x100
	bne _020C1A48
	tst r0, #0x200
	bne _020C1A48
	cmp r1, #0
	bne _020C1A28
	ldr r0, [r4, #0xe0]
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
	b _020C1A38
_020C1A28:
	ldr r0, [r4, #0xe4]
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
_020C1A38:
	add r1, sp, #0
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
_020C1A48:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020C19EC

	arm_func_start sub_020C1A5C
sub_020C1A5C: ; 0x020C1A5C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r7, r0
	ldr r0, [r7, #8]
	tst r0, #0x200
	bne _020C1D78
	tst r0, #1
	beq _020C1D78
	ldr r2, [r7, #0xb0]
	ldr r0, [r2, #0x10]
	and r1, r0, #0xc0000000
	cmp r1, #0x80000000
	beq _020C1AC8
	bic r0, r0, #0xc0000000
	str r0, [r2, #0x10]
	ldr r3, [r7, #0xb0]
	ldr r0, _020C1D8C ; =_02110A9C
	ldr r2, [r3, #0x10]
	ldr r1, _020C1D90 ; =_02110AA8
	orr r2, r2, #0x80000000
	str r2, [r3, #0x10]
	ldr r3, [r7, #0xb0]
	mov r2, #1
	ldr r3, [r3, #0x10]
	str r3, [r0, #0xc]
	ldr r0, [r0, #8]
	bl sub_020C2528
_020C1AC8:
	mov r0, #3
	str r0, [sp, #0x10]
	add r1, sp, #0x10
	mov r0, #0x10
	mov r2, #1
	bl sub_020C2528
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ldrneb r6, [r7, #0x98]
	moveq r6, #0
	cmp r6, #1
	bne _020C1B2C
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x3c]
	blx r1
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ldrneb r6, [r7, #0x98]
	ldr r0, [r7, #8]
	moveq r6, #0
	and r0, r0, #0x40
	b _020C1B30
_020C1B2C:
	mov r0, #0
_020C1B30:
	cmp r0, #0
	bne _020C1BA8
	ldr r0, [r7, #0xb0]
	add r1, sp, #0x14
	ldrh r5, [r0, #0x2e]
	ldrh r4, [r0, #0x2c]
	mov r3, #0x10000
	rsb r0, r5, #0
	mov ip, r0, lsl #0xf
	mov lr, r4, lsl #0xf
	mov r0, #0x1b
	mov r2, #3
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl sub_020C2528
	mov r0, r5, lsl #0x13
	mov r1, r0, asr #0x10
	mov r0, r4, lsl #0x13
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	orr r3, r1, r0, lsr #16
	add r1, sp, #0xc
	mov r0, #0x22
	mov r2, #1
	str r3, [sp, #0xc]
	bl sub_020C2528
_020C1BA8:
	cmp r6, #2
	bne _020C1BE4
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x3c]
	blx r1
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ldrneb r6, [r7, #0x98]
	ldr r0, [r7, #8]
	moveq r6, #0
	and r0, r0, #0x40
	b _020C1BE8
_020C1BE4:
	mov r0, #0
_020C1BE8:
	cmp r0, #0
	bne _020C1C7C
	ldr r0, [r7]
	ldr r4, [r7, #0xd8]
	ldrb r3, [r0, #1]
	cmp r4, #0
	beq _020C1C44
	adds r2, r4, #4
	beq _020C1C30
	ldrb r0, [r4, #5]
	cmp r3, r0
	bhs _020C1C30
	ldrh r1, [r4, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r3, r1
	b _020C1C34
_020C1C30:
	mov r1, #0
_020C1C34:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, r4, r0
	bne _020C1C48
_020C1C44:
	mov r0, #0
_020C1C48:
	ldrh r2, [r0, #0x1e]
	tst r2, #0x2000
	beq _020C1C7C
	add r1, r0, #0x2c
	tst r2, #2
	addeq r1, r1, #8
	tst r2, #4
	addeq r1, r1, #4
	tst r2, #8
	addeq r1, r1, #8
	mov r0, #0x18
	mov r2, #0x10
	bl sub_020C2528
_020C1C7C:
	cmp r6, #3
	movne r0, #0
	bne _020C1CA8
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x3c]
	blx r1
	ldr r0, [r7, #8]
	and r0, r0, #0x40
_020C1CA8:
	cmp r0, #0
	bne _020C1D60
	mov r3, #2
	add r1, sp, #8
	mov r0, #0x10
	mov r2, #1
	str r3, [sp, #8]
	bl sub_020C2528
	add r1, sp, #0x20
	mov r0, #0
	bl sub_020C260C
	mov r3, #3
	add r1, sp, #4
	mov r0, #0x10
	mov r2, #1
	str r3, [sp, #4]
	bl sub_020C2528
	ldr r0, _020C1D94 ; =0x021DA49C
	mov r2, #9
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C1D30
	ldr r1, _020C1D98 ; =0x021DA4E8
	mov r0, #0x1a
	bl sub_020C2528
	ldr r1, _020C1D9C ; =0x021DA558
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
	add r1, sp, #0x20
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
	b _020C1D60
_020C1D30:
	tst r0, #2
	mov r0, #0x1a
	beq _020C1D58
	ldr r1, _020C1D98 ; =0x021DA4E8
	bl sub_020C2528
	add r1, sp, #0x20
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
	b _020C1D60
_020C1D58:
	add r1, sp, #0x20
	bl sub_020C2528
_020C1D60:
	mov r3, #2
	add r1, sp, #0
	mov r0, #0x10
	mov r2, #1
	str r3, [sp]
	bl sub_020C2528
_020C1D78:
	ldr r0, [r7]
	add r0, r0, #3
	str r0, [r7]
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020C1D8C: .word _02110A9C
_020C1D90: .word _02110AA8
_020C1D94: .word 0x021DA49C
_020C1D98: .word 0x021DA4E8
_020C1D9C: .word 0x021DA558
	arm_func_end sub_020C1A5C

	arm_func_start sub_020C1DA0
sub_020C1DA0: ; 0x020C1DA0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r5, r0
	ldr r0, [r5, #8]
	tst r0, #0x200
	bne _020C211C
	tst r0, #1
	beq _020C211C
	add r0, sp, #0x50
	mov r1, #0
	bl sub_020C260C
	mov r0, #0x1e
	str r0, [sp, #0xc]
	add r1, sp, #0xc
	mov r0, #0x13
	mov r2, #1
	bl sub_020C2528
	ldr r2, [r5, #0xb0]
	ldr r0, [r2, #0x10]
	and r1, r0, #0xc0000000
	cmp r1, #0xc0000000
	beq _020C1E30
	bic r0, r0, #0xc0000000
	str r0, [r2, #0x10]
	ldr r3, [r5, #0xb0]
	ldr r0, _020C2130 ; =_02110A9C
	ldr r2, [r3, #0x10]
	ldr r1, _020C2134 ; =_02110AA0
	orr r2, r2, #0xc0000000
	str r2, [r3, #0x10]
	ldr r3, [r5, #0xb0]
	mov r2, #1
	ldr r3, [r3, #0x10]
	str r3, [r0, #4]
	ldr r0, [r0]
	bl sub_020C2528
_020C1E30:
	ldr r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r4, [r5, #0x99]
	moveq r4, #0
	cmp r4, #1
	bne _020C1E7C
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x40]
	blx r1
	ldr r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r4, [r5, #0x99]
	ldr r0, [r5, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C1E80
_020C1E7C:
	mov r0, #0
_020C1E80:
	cmp r0, #0
	bne _020C1EC8
	ldr r0, [r5, #0xb0]
	ldr r3, _020C2130 ; =_02110A9C
	ldrh ip, [r0, #0x2e]
	ldrh r2, [r0, #0x2c]
	ldr r1, _020C2138 ; =_02110ACC
	rsb r0, ip, #0
	mov r2, r2, lsl #0xf
	str r2, [r3, #0x30]
	mov r0, r0, lsl #0xf
	str r0, [r3, #0x44]
	str r2, [r3, #0x60]
	mov ip, ip, lsl #0xf
	mov r0, #0x16
	mov r2, #0x10
	str ip, [r3, #0x64]
	bl sub_020C2528
_020C1EC8:
	cmp r4, #2
	bne _020C1F04
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x40]
	blx r1
	ldr r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r4, [r5, #0x99]
	ldr r0, [r5, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C1F08
_020C1F04:
	mov r0, #0
_020C1F08:
	cmp r0, #0
	bne _020C1F9C
	ldr r0, [r5]
	ldr ip, [r5, #0xd8]
	ldrb r3, [r0, #1]
	cmp ip, #0
	beq _020C1F64
	adds r2, ip, #4
	beq _020C1F50
	ldrb r0, [ip, #5]
	cmp r3, r0
	bhs _020C1F50
	ldrh r1, [ip, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r3, r1
	b _020C1F54
_020C1F50:
	mov r1, #0
_020C1F54:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bne _020C1F68
_020C1F64:
	mov r0, #0
_020C1F68:
	ldrh r2, [r0, #0x1e]
	tst r2, #0x2000
	beq _020C1F9C
	add r1, r0, #0x2c
	tst r2, #2
	addeq r1, r1, #8
	tst r2, #4
	addeq r1, r1, #4
	tst r2, #8
	addeq r1, r1, #8
	mov r0, #0x18
	mov r2, #0x10
	bl sub_020C2528
_020C1F9C:
	cmp r4, #3
	movne r0, #0
	bne _020C1FC8
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x40]
	blx r1
	ldr r0, [r5, #8]
	and r0, r0, #0x40
_020C1FC8:
	cmp r0, #0
	bne _020C20EC
	ldr r0, _020C213C ; =0x021DA49C
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C2014
	ldr r1, _020C2140 ; =0x021DA57C
	mov r0, #0x1c
	mov r2, #3
	bl sub_020C2528
	ldr r1, _020C2144 ; =0x021DA558
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
	add r1, sp, #0x50
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
	b _020C2054
_020C2014:
	tst r0, #2
	beq _020C2030
	add r1, sp, #0x50
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
	b _020C2054
_020C2030:
	bl sub_020BF0F8
	mov r1, r0
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
	add r1, sp, #0x50
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
_020C2054:
	bl sub_020C23F4
	ldr r0, _020C2148 ; =0x04000440
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	add r4, sp, #0x10
_020C2070:
	mov r0, r4
	bl sub_020CF884
	cmp r0, #0
	bne _020C2070
	ldr r2, _020C214C ; =0x04000448
	mov r0, #1
	str r0, [r2]
	mov r0, #3
	str r0, [r2, #-8]
	add r1, sp, #0x10
	mov r0, #0x16
	mov r2, #0x10
	bl sub_020C2528
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x40]
	mov r0, r0, asr #4
	mov r0, r0, lsl #8
	mov r2, r1, asr #4
	mov r1, r0, asr #0x10
	mov r0, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	orr r3, r1, r0, lsr #16
	add r1, sp, #8
	mov r0, #0x22
	mov r2, #1
	str r3, [sp, #8]
	bl sub_020C2528
_020C20EC:
	mov r3, #2
	add r1, sp, #4
	mov r0, #0x10
	mov r2, #1
	str r3, [sp, #4]
	bl sub_020C2528
	mov r3, #0x1e
	add r1, sp, #0
	mov r0, #0x14
	mov r2, #1
	str r3, [sp]
	bl sub_020C2528
_020C211C:
	ldr r0, [r5]
	add r0, r0, #3
	str r0, [r5]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C2130: .word _02110A9C
_020C2134: .word _02110AA0
_020C2138: .word _02110ACC
_020C213C: .word 0x021DA49C
_020C2140: .word 0x021DA57C
_020C2144: .word 0x021DA558
_020C2148: .word 0x04000440
_020C214C: .word 0x04000448
	arm_func_end sub_020C1DA0

	arm_func_start sub_020C2150
sub_020C2150: ; 0x020C2150
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x6c
	mov r6, r0
	ldr ip, [r6, #0x1c]
	mov r4, r1
	mov r5, r2
	mov r7, r3
	cmp ip, #0x1000
	beq _020C2190
	add r1, sp, #0xc
	mov r0, #0x1b
	mov r2, #3
	str ip, [sp, #0xc]
	str ip, [sp, #0x10]
	str ip, [sp, #0x14]
	bl sub_020C2528
_020C2190:
	cmp r7, #0
	beq _020C233C
	ldrb r0, [r6, #0x18]
	cmp r4, r0
	bhs _020C233C
	cmp r6, #0
	ldrne r0, [r6, #8]
	cmpne r0, #0
	addne r3, r6, r0
	moveq r3, #0
	cmp r3, #0
	beq _020C2200
	adds r2, r3, #4
	beq _020C21EC
	ldrb r0, [r3, #5]
	cmp r4, r0
	bhs _020C21EC
	ldrh r1, [r3, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r4, r1
	b _020C21F0
_020C21EC:
	mov r1, #0
_020C21F0:
	cmp r1, #0
	ldrne r0, [r1]
	addne r4, r3, r0
	bne _020C2204
_020C2200:
	mov r4, #0
_020C2204:
	ldr r0, [r4, #0xc]
	tst r0, #0x1f0000
	addeq sp, sp, #0x6c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, _020C23E8 ; =0x00293130
	str r0, [sp, #0x50]
	ldr r0, [r4, #4]
	str r0, [sp, #0x54]
	ldr r0, [r4, #8]
	str r0, [sp, #0x58]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x5c]
	ldrh r0, [r4, #0x1e]
	tst r0, #0x20
	bicne r0, r1, #0x1f0000
	ldr r1, _020C23EC ; =0x00002B2A
	strne r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r2, [r4, #0x14]
	ldr r0, [sp, #0x50]
	str r2, [sp, #0x64]
	ldrh r3, [r4, #0x1c]
	add r1, sp, #0x54
	mov r2, #6
	str r3, [sp, #0x68]
	bl sub_020C2528
	ldrh r0, [r4, #0x1e]
	tst r0, #1
	beq _020C233C
	mov r2, #8
	str r2, [sp, #0x18]
	ldrh r1, [r4, #0x20]
	add r0, r4, #0x2c
	strh r1, [sp, #0x44]
	ldrh r1, [r4, #0x22]
	strh r1, [sp, #0x46]
	ldr r1, [r4, #0x24]
	str r1, [sp, #0x48]
	ldr r1, [r4, #0x28]
	str r1, [sp, #0x4c]
	ldrh r1, [r4, #0x1e]
	tst r1, #2
	orrne r1, r2, #1
	strne r1, [sp, #0x18]
	bne _020C22CC
	ldr r1, [r0]
	str r1, [sp, #0x30]
	ldr r1, [r0, #4]
	add r0, r0, #8
	str r1, [sp, #0x34]
_020C22CC:
	ldrh r1, [r4, #0x1e]
	tst r1, #4
	ldrne r1, [sp, #0x18]
	orrne r1, r1, #2
	strne r1, [sp, #0x18]
	bne _020C22F8
	ldrsh r1, [r0]
	strh r1, [sp, #0x38]
	ldrsh r1, [r0, #2]
	add r0, r0, #4
	strh r1, [sp, #0x3a]
_020C22F8:
	ldrh r1, [r4, #0x1e]
	tst r1, #8
	ldrne r0, [sp, #0x18]
	orrne r0, r0, #4
	strne r0, [sp, #0x18]
	bne _020C2320
	ldr r1, [r0]
	str r1, [sp, #0x3c]
	ldr r0, [r0, #4]
	str r0, [sp, #0x40]
_020C2320:
	ldrb r1, [r6, #0x16]
	ldr r0, _020C23F0 ; =_02110A8C
	ldr r1, [r0, r1, lsl #2]
	cmp r1, #0
	beq _020C233C
	add r0, sp, #0x18
	blx r1
_020C233C:
	ldrb r0, [r6, #0x19]
	cmp r5, r0
	bhs _020C23B4
	cmp r6, #0
	ldrne r0, [r6, #0xc]
	cmpne r0, #0
	addne r2, r6, r0
	moveq r2, #0
	cmp r2, #0
	beq _020C23A0
	beq _020C238C
	ldrb r0, [r2, #1]
	cmp r5, r0
	bhs _020C238C
	ldrh r1, [r2, #6]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020C2390
_020C238C:
	mov r1, #0
_020C2390:
	cmp r1, #0
	ldrne r0, [r1]
	addne r2, r2, r0
	bne _020C23A4
_020C23A0:
	mov r2, #0
_020C23A4:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	add r0, r2, r0
	bl sub_020C2474
_020C23B4:
	ldr r3, [r6, #0x20]
	cmp r3, #0x1000
	addeq sp, sp, #0x6c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	add r1, sp, #0
	mov r0, #0x1b
	mov r2, #3
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	bl sub_020C2528
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020C23E8: .word 0x00293130
_020C23EC: .word 0x00002B2A
_020C23F0: .word _02110A8C
	arm_func_end sub_020C2150

	arm_func_start sub_020C23F4
sub_020C23F4: ; 0x020C23F4
	stmdb sp!, {r3, lr}
	ldr r0, _020C2448 ; =0x021DD404
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020C240C
	bl sub_020C2450
_020C240C:
	ldr r0, _020C2448 ; =0x021DD404
	ldr r0, [r0]
	cmp r0, #0
	ldrne r2, [r0]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _020C244C ; =0x04000400
	add r0, r0, #4
	mov r2, r2, lsl #2
	bl sub_020D4830
	ldr r0, _020C2448 ; =0x021DD404
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C2448: .word 0x021DD404
_020C244C: .word 0x04000400
	arm_func_end sub_020C23F4

	arm_func_start sub_020C2450
sub_020C2450: ; 0x020C2450
	ldr r0, _020C2464 ; =0x021DD404
_020C2454:
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _020C2454
	bx lr
	.align 2, 0
_020C2464: .word 0x021DD404
	arm_func_end sub_020C2450

	arm_func_start sub_020C2468
sub_020C2468: ; 0x020C2468
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_020C2468

	arm_func_start sub_020C2474
sub_020C2474: ; 0x020C2474
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #0x100
	blo _020C249C
	ldr r1, _020C2518 ; =_02110C80
	mvn r0, #0
	ldr r1, [r1]
	cmp r1, r0
	bne _020C24B4
_020C249C:
	mov r2, r4, lsr #2
	ldr r0, [r5]
	add r1, r5, #4
	sub r2, r2, #1
	bl sub_020C2528
	ldmia sp!, {r3, r4, r5, pc}
_020C24B4:
	bl sub_020C23F4
	ldr r0, _020C251C ; =0x021DD404
	mov r1, #1
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020C24F4
	ldr r1, _020C2520 ; =0x021DD408
	ldr r0, _020C2518 ; =_02110C80
	str r1, [sp]
	ldr r0, [r0]
	ldr r3, _020C2524 ; =sub_020C2468
	mov r1, r5
	mov r2, r4
	bl sub_020D46AC
	ldmia sp!, {r3, r4, r5, pc}
_020C24F4:
	ldr r1, _020C2520 ; =0x021DD408
	ldr r0, _020C2518 ; =_02110C80
	str r1, [sp]
	ldr r0, [r0]
	ldr r3, _020C2524 ; =sub_020C2468
	mov r1, r5
	mov r2, r4
	bl sub_020D44A8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C2518: .word _02110C80
_020C251C: .word 0x021DD404
_020C2520: .word 0x021DD408
_020C2524: .word sub_020C2468
	arm_func_end sub_020C2474

	arm_func_start sub_020C2528
sub_020C2528: ; 0x020C2528
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020C2604 ; =0x021DD404
	mov r6, r0
	ldr ip, [r3]
	mov r5, r1
	mov r4, r2
	cmp ip, #0
	beq _020C25DC
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _020C25B0
	ldr r2, [ip]
	add r0, r2, #1
	add r1, r0, r4
	cmp r1, #0xc0
	bhi _020C25B0
	str r0, [ip]
	ldr r0, [r3]
	cmp r4, #0
	add r0, r0, r2, lsl #2
	str r6, [r0, #4]
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, [r3]
	mov r0, r5
	ldr r1, [r2], #4
	add r1, r2, r1, lsl #2
	mov r2, r4, lsl #2
	bl sub_020D48B4
	ldr r0, _020C2604 ; =0x021DD404
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, r4
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, pc}
_020C25B0:
	ldr r0, [ip]
	cmp r0, #0
	beq _020C25C4
	bl sub_020C23F4
	b _020C25EC
_020C25C4:
	ldr r0, _020C2604 ; =0x021DD404
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020C25EC
	bl sub_020C2450
	b _020C25EC
_020C25DC:
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _020C25EC
	bl sub_020C2450
_020C25EC:
	ldr r1, _020C2608 ; =0x04000400
	mov r0, r5
	mov r2, r4, lsl #2
	str r6, [r1]
	bl sub_020D4830
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C2604: .word 0x021DD404
_020C2608: .word 0x04000400
	arm_func_end sub_020C2528

	arm_func_start sub_020C260C
sub_020C260C: ; 0x020C260C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	mov r6, r0
	mov r5, r1
	bl sub_020C23F4
	ldr r0, _020C2690 ; =0x04000440
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	cmp r6, #0
	beq _020C265C
	add r4, sp, #0
_020C2640:
	mov r0, r4
	bl sub_020CF884
	cmp r0, #0
	bne _020C2640
	add r0, sp, #0
	mov r1, r6
	bl sub_020CC070
_020C265C:
	cmp r5, #0
	beq _020C2674
_020C2664:
	mov r0, r5
	bl sub_020CF8B4
	cmp r0, #0
	bne _020C2664
_020C2674:
	ldr r1, _020C2694 ; =0x04000448
	mov r0, #1
	str r0, [r1]
	mov r0, #2
	str r0, [r1, #-8]
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C2690: .word 0x04000440
_020C2694: .word 0x04000448
	arm_func_end sub_020C260C

	arm_func_start sub_020C2698
sub_020C2698: ; 0x020C2698
	stmdb sp!, {r3, lr}
	bl sub_020CF564
	bl sub_020BEE44
	ldr r1, _020C26BC ; =0x04000600
	ldr r0, [r1]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x80000000
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C26BC: .word 0x04000600
	arm_func_end sub_020C2698

	arm_func_start sub_020C26C0
sub_020C26C0: ; 0x020C26C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r2, [sl]
	ldr r1, _020C28DC ; =0x30415642
	cmp r2, r1
	bhi _020C270C
	bhs _020C28CC
	sub r0, r1, #0x900
	cmp r2, r0
	bhi _020C26FC
	bhs _020C28CC
	sub r0, r1, #0x1300
	cmp r2, r0
	beq _020C28CC
	b _020C28D4
_020C26FC:
	sub r0, r1, #0x200
	cmp r2, r0
	beq _020C28CC
	b _020C28D4
_020C270C:
	ldr r0, _020C28E0 ; =0x30505442
	cmp r2, r0
	bhi _020C272C
	bhs _020C28CC
	ldr r0, _020C28E4 ; =0x30444D42
	cmp r2, r0
	beq _020C2738
	b _020C28D4
_020C272C:
	add r0, r0, #0x80000
	cmp r2, r0
	bne _020C28D4
_020C2738:
	mov r5, #1
	mov r0, sl
	mov r6, r5
	mov r7, r5
	bl sub_020C3B50
	movs r4, r0
	beq _020C289C
	bl sub_020BE3DC
	mov sb, r0
	mov r0, r4
	bl sub_020BE3F0
	mov r8, r0
	mov r0, r4
	bl sub_020BE51C
	str r0, [sp]
	cmp sb, #0
	beq _020C27A0
	ldr r0, _020C28E8 ; =_02110924
	mov r1, #0
	ldr r3, [r0]
	mov r0, sb
	mov r2, r1
	blx r3
	movs fp, r0
	moveq r5, #0
	b _020C27A4
_020C27A0:
	mov fp, #0
_020C27A4:
	cmp r8, #0
	beq _020C27D0
	ldr r1, _020C28E8 ; =_02110924
	mov r0, r8
	ldr r3, [r1]
	mov r1, #1
	mov r2, #0
	blx r3
	movs r8, r0
	moveq r6, #0
	b _020C27D4
_020C27D0:
	mov r8, #0
_020C27D4:
	ldr r0, [sp]
	cmp r0, #0
	beq _020C2804
	ldr r1, _020C28EC ; =_0211092C
	ldrh r2, [r4, #0x20]
	ldr r3, [r1]
	and r1, r2, #0x8000
	mov r2, #0
	blx r3
	movs sb, r0
	moveq r7, #0
	b _020C2808
_020C2804:
	mov sb, #0
_020C2808:
	cmp r5, #0
	cmpne r6, #0
	cmpne r7, #0
	bne _020C2868
	cmp r7, #0
	beq _020C2830
	ldr r1, _020C28F0 ; =_02110930
	mov r0, sb
	ldr r1, [r1]
	blx r1
_020C2830:
	cmp r6, #0
	beq _020C2848
	ldr r1, _020C28F4 ; =_02110928
	mov r0, r8
	ldr r1, [r1]
	blx r1
_020C2848:
	cmp r5, #0
	beq _020C2860
	ldr r1, _020C28F4 ; =_02110928
	mov r0, fp
	ldr r1, [r1]
	blx r1
_020C2860:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C2868:
	mov r0, r4
	mov r1, fp
	mov r2, r8
	bl sub_020BE404
	mov r0, r4
	mov r1, sb
	bl sub_020BE530
	mov r0, r4
	mov r1, #1
	bl sub_020BE418
	mov r0, r4
	mov r1, #1
	bl sub_020BE538
_020C289C:
	ldr r1, [sl]
	ldr r0, _020C28E4 ; =0x30444D42
	cmp r1, r0
	bne _020C28C4
	mov r0, sl
	bl sub_020C3B40
	cmp r4, #0
	beq _020C28C4
	mov r1, r4
	bl sub_020BED00
_020C28C4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C28CC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C28D4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C28DC: .word 0x30415642
_020C28E0: .word 0x30505442
_020C28E4: .word 0x30444D42
_020C28E8: .word _02110924
_020C28EC: .word _0211092C
_020C28F0: .word _02110930
_020C28F4: .word _02110928
	arm_func_end sub_020C26C0

	arm_func_start sub_020C28F8
sub_020C28F8: ; 0x020C28F8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r7, r0
	mov r6, r1
	mov fp, r2
	mov r4, r3
	add r0, sp, #0x20
	add r1, sp, #0x1c
	add r2, sp, #0x18
	add r3, sp, #0x14
	bl sub_020BF4B8
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	sub r5, r1, r0
	ldr r1, [sp, #0x18]
	sub r0, r7, r2
	sub r1, r1, r2
	mov r0, r0, lsl #0xc
	mov r1, r1, lsl #0xc
	bl sub_020CCBA0
	rsb r1, r5, #0
	mov r5, r0
	ldr r0, [sp, #0x1c]
	mov r1, r1, lsl #0xc
	add r0, r6, r0
	sub r0, r0, #0xbf
	mov r0, r0, lsl #0xc
	bl sub_020CCBA0
	cmp r5, #0
	cmpge r0, #0
	blt _020C2984
	cmp r5, #0x1000
	cmple r0, #0x1000
	ble _020C2990
_020C2984:
	mvn r1, #0
	str r1, [sp, #0x10]
	b _020C2998
_020C2990:
	mov r1, #0
	str r1, [sp, #0x10]
_020C2998:
	sub r1, r5, #0x800
	sub r0, r0, #0x800
	mov r8, r1, lsl #1
	mov sl, r0, lsl #1
	bl sub_020BF450
	mov r5, r0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0xc]
	smull r2, r0, sl, r0
	smlal r2, r0, r8, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x2c]
	add r0, r0, r2
	str r0, [sp, #0xc]
	sub r0, r0, r1
	bl sub_020CCC7C
	ldr r0, [r5, #0x10]
	ldr r2, [r5]
	smull r3, r0, sl, r0
	smlal r3, r0, r8, r2
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	ldr r6, [r5, #0x30]
	ldr r3, [r5, #4]
	add r6, r6, r2
	ldr r2, [r5, #0x14]
	ldr r1, [r5, #0x34]
	smull r7, r2, sl, r2
	smlal r7, r2, r8, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r7, r1, r3
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #8]
	smull r3, r1, sl, r1
	smlal r3, r1, r8, r2
	mov r2, r3, lsr #0xc
	ldr r0, [r5, #0x38]
	orr r2, r2, r1, lsl #20
	cmp r4, #0
	add r8, r0, r2
	beq _020C2A78
	ldr r0, [r5, #0x20]
	ldr r3, [r5, #0x24]
	add r0, r6, r0
	str r0, [sp, #4]
	add r0, r7, r3
	str r0, [sp]
	ldr r2, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #0xc]
	add sb, r8, r2
	add r0, r0, r1
	str r0, [sp, #8]
_020C2A78:
	ldr r2, [r5, #0x20]
	ldr r1, [r5, #0x24]
	ldr r0, [r5, #0x28]
	sub r6, r6, r2
	sub r7, r7, r1
	sub r8, r8, r0
	bl sub_020CCC20
	mov r5, r0
	mov sl, r1
	cmp r4, #0
	beq _020C2AAC
	ldr r0, [sp, #8]
	bl sub_020CCC7C
_020C2AAC:
	mov r0, r6, asr #0x1f
	umull r2, r1, r5, r6
	adds r2, r2, #0x80000000
	mla r1, r5, r0, r1
	mla r1, sl, r6, r1
	adc r2, r1, #0
	umull r0, r1, r5, r7
	str r2, [fp]
	adds r0, r0, #0x80000000
	mov r0, r7, asr #0x1f
	mla r1, r5, r0, r1
	mla r1, sl, r7, r1
	adc r0, r1, #0
	str r0, [fp, #4]
	umull r0, r1, r5, r8
	adds r0, r0, #0x80000000
	mov r0, r8, asr #0x1f
	mla r1, r5, r0, r1
	mla r1, sl, r8, r1
	adc r0, r1, #0
	str r0, [fp, #8]
	cmp r4, #0
	beq _020C2B70
	bl sub_020CCC20
	ldr r2, [sp, #4]
	umull r6, r5, r0, r2
	mov r2, r2, asr #0x1f
	mla r5, r0, r2, r5
	ldr r2, [sp]
	adds r6, r6, #0x80000000
	mov r7, r2, asr #0x1f
	umull r3, r2, r0, r2
	mla r2, r0, r7, r2
	mov r7, sb, asr #0x1f
	umull r8, r6, r0, sb
	mla r6, r0, r7, r6
	ldr r0, [sp, #4]
	mla r6, r1, sb, r6
	mla r5, r1, r0, r5
	adc r0, r5, #0
	str r0, [r4]
	ldr r0, [sp]
	mla r2, r1, r0, r2
	adds r0, r3, #0x80000000
	adc r2, r2, #0
	adds r0, r8, #0x80000000
	str r2, [r4, #4]
	adc r0, r6, #0
	str r0, [r4, #8]
_020C2B70:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C28F8

	arm_func_start sub_020C2B7C
sub_020C2B7C: ; 0x020C2B7C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	bl sub_020BDFA8
	mov r1, r0
	mov r0, r4
	bl sub_020B597C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C2B7C

	arm_func_start sub_020C2BA0
sub_020C2BA0: ; 0x020C2BA0
	ldr ip, _020C2BA8 ; =sub_020B5990
	bx ip
	.align 2, 0
_020C2BA8: .word sub_020B5990
	arm_func_end sub_020C2BA0

	arm_func_start sub_020C2BAC
sub_020C2BAC: ; 0x020C2BAC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r0, #0
	ldrne r4, [r0, #8]
	ldrb r3, [r0, #0x18]
	cmpne r4, #0
	addne lr, r0, r4
	moveq lr, #0
	cmp r3, #0
	mov ip, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mvn r4, r2
	add r0, lr, #4
	mov r7, ip
	mov r6, ip
_020C2BE4:
	cmp lr, #0
	beq _020C2C2C
	cmp r0, #0
	beq _020C2C18
	ldrb r5, [lr, #5]
	cmp ip, r5
	bhs _020C2C18
	ldrh r8, [lr, #0xa]
	ldrh r5, [r0, r8]
	add r8, r0, r8
	add r8, r8, #4
	mla r8, r5, ip, r8
	b _020C2C1C
_020C2C18:
	mov r8, r7
_020C2C1C:
	cmp r8, #0
	ldrne r5, [r8]
	addne r8, lr, r5
	bne _020C2C30
_020C2C2C:
	mov r8, r6
_020C2C30:
	ldrh r5, [r8, #0x1e]
	cmp r1, #0
	add ip, ip, #1
	orrne r5, r5, r2
	andeq r5, r5, r4
	strh r5, [r8, #0x1e]
	cmp ip, r3
	blo _020C2BE4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020C2BAC

	arm_func_start sub_020C2C54
sub_020C2C54: ; 0x020C2C54
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r0, #0
	ldrne r4, [r0, #8]
	ldrb r3, [r0, #0x18]
	cmpne r4, #0
	addne lr, r0, r4
	moveq lr, #0
	cmp r3, #0
	mov ip, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mvn r4, r2
	add r0, lr, #4
	mov r7, ip
	mov r6, ip
_020C2C8C:
	cmp lr, #0
	beq _020C2CD4
	cmp r0, #0
	beq _020C2CC0
	ldrb r5, [lr, #5]
	cmp ip, r5
	bhs _020C2CC0
	ldrh r8, [lr, #0xa]
	ldrh r5, [r0, r8]
	add r8, r0, r8
	add r8, r8, #4
	mla r8, r5, ip, r8
	b _020C2CC4
_020C2CC0:
	mov r8, r7
_020C2CC4:
	cmp r8, #0
	ldrne r5, [r8]
	addne r8, lr, r5
	bne _020C2CD8
_020C2CD4:
	mov r8, r6
_020C2CD8:
	ldr r5, [r8, #0x10]
	cmp r1, #0
	orrne r5, r5, r2
	andeq r5, r5, r4
	add ip, ip, #1
	str r5, [r8, #0x10]
	cmp ip, r3
	blo _020C2C8C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020C2C54

	arm_func_start sub_020C2CFC
sub_020C2CFC: ; 0x020C2CFC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2D5C
	adds ip, lr, #4
	beq _020C2D48
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2D48
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2D4C
_020C2D48:
	mov r1, #0
_020C2D4C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2D60
_020C2D5C:
	mov r3, #0
_020C2D60:
	mov r0, #0x8000
	ldr r1, [r3, #4]
	rsb r0, r0, #0
	and r0, r1, r0
	orr r0, r0, r2
	str r0, [r3, #4]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C2CFC

	arm_func_start sub_020C2D7C
sub_020C2D7C: ; 0x020C2D7C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2DDC
	adds ip, lr, #4
	beq _020C2DC8
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2DC8
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2DCC
_020C2DC8:
	mov r1, #0
_020C2DCC:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2DE0
_020C2DDC:
	mov r3, #0
_020C2DE0:
	ldr r1, [r3, #4]
	ldr r0, _020C2DF8 ; =0x8000FFFF
	and r0, r1, r0
	orr r0, r0, r2, lsl #16
	str r0, [r3, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C2DF8: .word 0x8000FFFF
	arm_func_end sub_020C2D7C

	arm_func_start sub_020C2DFC
sub_020C2DFC: ; 0x020C2DFC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2E5C
	adds ip, lr, #4
	beq _020C2E48
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2E48
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2E4C
_020C2E48:
	mov r1, #0
_020C2E4C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2E60
_020C2E5C:
	mov r3, #0
_020C2E60:
	mov r0, #0x8000
	ldr r1, [r3, #8]
	rsb r0, r0, #0
	and r0, r1, r0
	orr r0, r0, r2
	str r0, [r3, #8]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C2DFC

	arm_func_start sub_020C2E7C
sub_020C2E7C: ; 0x020C2E7C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2EDC
	adds ip, lr, #4
	beq _020C2EC8
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2EC8
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2ECC
_020C2EC8:
	mov r1, #0
_020C2ECC:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2EE0
_020C2EDC:
	mov r3, #0
_020C2EE0:
	ldr r1, [r3, #8]
	ldr r0, _020C2EF8 ; =0x8000FFFF
	and r0, r1, r0
	orr r0, r0, r2, lsl #16
	str r0, [r3, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C2EF8: .word 0x8000FFFF
	arm_func_end sub_020C2E7C

	arm_func_start sub_020C2EFC
sub_020C2EFC: ; 0x020C2EFC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2F5C
	adds ip, lr, #4
	beq _020C2F48
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2F48
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2F4C
_020C2F48:
	mov r1, #0
_020C2F4C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C2F60
_020C2F5C:
	mov r1, #0
_020C2F60:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0xf
	orr r0, r0, r2
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C2EFC

	arm_func_start sub_020C2F74
sub_020C2F74: ; 0x020C2F74
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2FD4
	adds ip, lr, #4
	beq _020C2FC0
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2FC0
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2FC4
_020C2FC0:
	mov r1, #0
_020C2FC4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C2FD8
_020C2FD4:
	mov r1, #0
_020C2FD8:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0x30
	orr r0, r0, r2, lsl #4
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C2F74

	arm_func_start sub_020C2FEC
sub_020C2FEC: ; 0x020C2FEC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C304C
	adds ip, lr, #4
	beq _020C3038
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3038
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C303C
_020C3038:
	mov r1, #0
_020C303C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C3050
_020C304C:
	mov r1, #0
_020C3050:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0xc0
	orr r0, r0, r2, lsl #6
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C2FEC

	arm_func_start sub_020C3064
sub_020C3064: ; 0x020C3064
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C30C4
	adds ip, lr, #4
	beq _020C30B0
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C30B0
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C30B4
_020C30B0:
	mov r1, #0
_020C30B4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C30C8
_020C30C4:
	mov r1, #0
_020C30C8:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0x3f000000
	orr r0, r0, r2, lsl #24
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C3064

	arm_func_start sub_020C30DC
sub_020C30DC: ; 0x020C30DC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C313C
	adds ip, lr, #4
	beq _020C3128
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3128
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C312C
_020C3128:
	mov r1, #0
_020C312C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C3140
_020C313C:
	mov r1, #0
_020C3140:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0x1f0000
	orr r0, r0, r2, lsl #16
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C30DC

	arm_func_start sub_020C3154
sub_020C3154: ; 0x020C3154
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C31B4
	adds ip, lr, #4
	beq _020C31A0
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C31A0
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C31A4
_020C31A0:
	mov r1, #0
_020C31A4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C31B8
_020C31B4:
	mov r1, #0
_020C31B8:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x8000
	biceq r0, r0, #0x8000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C3154

	arm_func_start sub_020C31D0
sub_020C31D0: ; 0x020C31D0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C3230
	adds ip, lr, #4
	beq _020C321C
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C321C
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C3220
_020C321C:
	mov r1, #0
_020C3220:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C3234
_020C3230:
	mov r1, #0
_020C3234:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x4000
	biceq r0, r0, #0x4000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C31D0

	arm_func_start sub_020C324C
sub_020C324C: ; 0x020C324C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C32AC
	adds ip, lr, #4
	beq _020C3298
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3298
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C329C
_020C3298:
	mov r1, #0
_020C329C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C32B0
_020C32AC:
	mov r1, #0
_020C32B0:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x2000
	biceq r0, r0, #0x2000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C324C

	arm_func_start sub_020C32C8
sub_020C32C8: ; 0x020C32C8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C3328
	adds ip, lr, #4
	beq _020C3314
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3314
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C3318
_020C3314:
	mov r1, #0
_020C3318:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C332C
_020C3328:
	mov r1, #0
_020C332C:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x1000
	biceq r0, r0, #0x1000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C32C8

	arm_func_start sub_020C3344
sub_020C3344: ; 0x020C3344
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C33A4
	adds ip, lr, #4
	beq _020C3390
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3390
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C3394
_020C3390:
	mov r1, #0
_020C3394:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C33A8
_020C33A4:
	mov r1, #0
_020C33A8:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x800
	biceq r0, r0, #0x800
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C3344

	arm_func_start sub_020C33C0
sub_020C33C0: ; 0x020C33C0
	cmp r0, #0
	ldrne r2, [r0, #8]
	cmpne r2, #0
	addne ip, r0, r2
	moveq ip, #0
	cmp ip, #0
	beq _020C341C
	adds r3, ip, #4
	beq _020C3408
	ldrb r0, [ip, #5]
	cmp r1, r0
	bhs _020C3408
	ldrh r2, [ip, #0xa]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r1, r0, r1, r2
	b _020C340C
_020C3408:
	mov r1, #0
_020C340C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bne _020C3420
_020C341C:
	mov r0, #0
_020C3420:
	ldr r0, [r0, #0xc]
	and r0, r0, #0xf
	bx lr
	arm_func_end sub_020C33C0

	arm_func_start sub_020C342C
sub_020C342C: ; 0x020C342C
	cmp r0, #0
	ldrne r2, [r0, #8]
	cmpne r2, #0
	addne ip, r0, r2
	moveq ip, #0
	cmp ip, #0
	beq _020C3488
	adds r3, ip, #4
	beq _020C3474
	ldrb r0, [ip, #5]
	cmp r1, r0
	bhs _020C3474
	ldrh r2, [ip, #0xa]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r1, r0, r1, r2
	b _020C3478
_020C3474:
	mov r1, #0
_020C3478:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bne _020C348C
_020C3488:
	mov r0, #0
_020C348C:
	ldr r0, [r0, #0xc]
	and r0, r0, #0x8000
	bx lr
	arm_func_end sub_020C342C

	arm_func_start sub_020C3498
sub_020C3498: ; 0x020C3498
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C34B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2CFC
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C34B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3498

	arm_func_start sub_020C34D8
sub_020C34D8: ; 0x020C34D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C34F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2D7C
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C34F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C34D8

	arm_func_start sub_020C3518
sub_020C3518: ; 0x020C3518
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3534:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2DFC
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3534
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3518

	arm_func_start sub_020C3558
sub_020C3558: ; 0x020C3558
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3574:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2E7C
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3574
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3558

	arm_func_start sub_020C3598
sub_020C3598: ; 0x020C3598
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C35B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2EFC
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C35B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3598

	arm_func_start sub_020C35D8
sub_020C35D8: ; 0x020C35D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C35F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2F74
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C35F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C35D8

	arm_func_start sub_020C3618
sub_020C3618: ; 0x020C3618
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3634:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C2FEC
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3634
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3618

	arm_func_start sub_020C3658
sub_020C3658: ; 0x020C3658
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3674:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C3064
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3674
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3658

	arm_func_start sub_020C3698
sub_020C3698: ; 0x020C3698
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C36B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C30DC
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C36B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3698

	arm_func_start sub_020C36D8
sub_020C36D8: ; 0x020C36D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C36F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C3154
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C36F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C36D8

	arm_func_start sub_020C3718
sub_020C3718: ; 0x020C3718
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3734:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C31D0
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3734
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3718

	arm_func_start sub_020C3758
sub_020C3758: ; 0x020C3758
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3774:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C324C
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3774
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3758

	arm_func_start sub_020C3798
sub_020C3798: ; 0x020C3798
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C37B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C32C8
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C37B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C3798

	arm_func_start sub_020C37D8
sub_020C37D8: ; 0x020C37D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C37F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl sub_020C3344
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C37F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C37D8

	arm_func_start sub_020C3818
sub_020C3818: ; 0x020C3818
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r5, [r0, #1]
	cmp r5, #0x10
	bhs _020C38E8
	ldmia r1, {r2, r3, ip, lr}
	cmp r5, #0
	mov r1, #0
	bls _020C39D0
	mov r4, r1
	mov r7, r1
_020C384C:
	cmp r0, #0
	beq _020C3878
	ldrb r6, [r0, #1]
	cmp r1, r6
	bhs _020C3878
	ldrh r6, [r0, #6]
	add r8, r0, r6
	ldrh r6, [r8, #2]
	add r6, r8, r6
	add r8, r6, r4
	b _020C387C
_020C3878:
	mov r8, r7
_020C387C:
	ldr r6, [r8]
	cmp r6, r2
	ldreq r6, [r8, #4]
	cmpeq r6, r3
	ldreq r6, [r8, #8]
	cmpeq r6, ip
	ldreq r6, [r8, #0xc]
	cmpeq r6, lr
	bne _020C38D0
	cmp r0, #0
	beq _020C38C8
	cmp r1, r5
	bhs _020C38C8
	ldrh r3, [r0, #6]
	ldrh r2, [r0, r3]
	add r0, r0, r3
	add r0, r0, #4
	mla r0, r2, r1, r0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C38C8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C38D0:
	ldrb r6, [r0, #1]
	add r1, r1, #1
	add r4, r4, #0x10
	cmp r1, r6
	blo _020C384C
	b _020C39D0
_020C38E8:
	add r4, r0, #8
	ldrb r3, [r4, #1]
	cmp r3, #0
	beq _020C39D0
	ldrb r7, [r4, r3, lsl #2]
	ldrb r2, [r4]
	add r6, r4, r3, lsl #2
	cmp r2, r7
	bls _020C393C
_020C390C:
	mov r2, r7, asr #5
	ldr r3, [r1, r2, lsl #2]
	and r2, r7, #0x1f
	mov r2, r3, lsr r2
	and r2, r2, #1
	add r2, r6, r2
	ldrb r3, [r2, #1]
	ldrb r2, [r6]
	ldrb r7, [r4, r3, lsl #2]
	add r6, r4, r3, lsl #2
	cmp r2, r7
	bhi _020C390C
_020C393C:
	cmp r0, #0
	ldrb r2, [r6, #3]
	beq _020C3968
	cmp r2, r5
	bhs _020C3968
	ldrh r3, [r0, #6]
	add r4, r0, r3
	ldrh r3, [r4, #2]
	add r3, r4, r3
	add r6, r3, r2, lsl #4
	b _020C396C
_020C3968:
	mov r6, #0
_020C396C:
	ldr r4, [r6]
	ldr r3, [r1]
	cmp r4, r3
	ldreq r4, [r6, #4]
	ldreq r3, [r1, #4]
	cmpeq r4, r3
	ldreq r4, [r6, #8]
	ldreq r3, [r1, #8]
	cmpeq r4, r3
	ldreq r3, [r6, #0xc]
	ldreq r1, [r1, #0xc]
	cmpeq r3, r1
	bne _020C39D0
	cmp r0, #0
	beq _020C39C8
	cmp r2, r5
	bhs _020C39C8
	ldrh r3, [r0, #6]
	ldrh r1, [r0, r3]
	add r0, r0, r3
	add r0, r0, #4
	mla r0, r1, r2, r0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C39C8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C39D0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020C3818

	arm_func_start sub_020C39D8
sub_020C39D8: ; 0x020C39D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	cmp r1, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r0, #1]
	cmp r2, #0x10
	bhs _020C3A7C
	cmp r2, #0
	ldmia r1, {r2, r3, ip, lr}
	mov r1, #0
	bls _020C3B38
	mov r4, r1
	mov r6, r1
_020C3A0C:
	cmp r0, #0
	beq _020C3A38
	ldrb r5, [r0, #1]
	cmp r1, r5
	bhs _020C3A38
	ldrh r5, [r0, #6]
	add r7, r0, r5
	ldrh r5, [r7, #2]
	add r5, r7, r5
	add r7, r5, r4
	b _020C3A3C
_020C3A38:
	mov r7, r6
_020C3A3C:
	ldr r5, [r7]
	cmp r5, r2
	ldreq r5, [r7, #4]
	cmpeq r5, r3
	ldreq r5, [r7, #8]
	cmpeq r5, ip
	ldreq r5, [r7, #0xc]
	cmpeq r5, lr
	moveq r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r5, [r0, #1]
	add r1, r1, #1
	add r4, r4, #0x10
	cmp r1, r5
	blo _020C3A0C
	b _020C3B38
_020C3A7C:
	add r5, r0, #8
	ldrb r4, [r5, #1]
	cmp r4, #0
	beq _020C3B38
	ldrb r7, [r5, r4, lsl #2]
	ldrb r3, [r5]
	add r6, r5, r4, lsl #2
	cmp r3, r7
	bls _020C3AD0
_020C3AA0:
	mov r3, r7, asr #5
	ldr r4, [r1, r3, lsl #2]
	and r3, r7, #0x1f
	mov r3, r4, lsr r3
	and r3, r3, #1
	add r3, r6, r3
	ldrb r4, [r3, #1]
	ldrb r3, [r6]
	ldrb r7, [r5, r4, lsl #2]
	add r6, r5, r4, lsl #2
	cmp r3, r7
	bhi _020C3AA0
_020C3AD0:
	cmp r0, #0
	ldrb r3, [r6, #3]
	beq _020C3AFC
	cmp r3, r2
	bhs _020C3AFC
	ldrh r2, [r0, #6]
	add r2, r0, r2
	ldrh r0, [r2, #2]
	add r0, r2, r0
	add r4, r0, r3, lsl #4
	b _020C3B00
_020C3AFC:
	mov r4, #0
_020C3B00:
	ldr r2, [r4]
	ldr r0, [r1]
	cmp r2, r0
	ldreq r2, [r4, #4]
	ldreq r0, [r1, #4]
	cmpeq r2, r0
	ldreq r2, [r4, #8]
	ldreq r0, [r1, #8]
	cmpeq r2, r0
	ldreq r2, [r4, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020C3B38:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C39D8

	arm_func_start sub_020C3B40
sub_020C3B40: ; 0x020C3B40
	ldrh r1, [r0, #0xc]
	ldr r1, [r0, r1]
	add r0, r0, r1
	bx lr
	arm_func_end sub_020C3B40

	arm_func_start sub_020C3B50
sub_020C3B50: ; 0x020C3B50
	ldrh r2, [r0, #0xc]
	ldrh r1, [r0, #0xe]
	add r3, r0, r2
	cmp r1, #1
	bne _020C3B80
	ldr r2, [r0]
	ldr r1, _020C3B8C ; =0x30585442
	cmp r2, r1
	ldreq r1, [r3]
	addeq r0, r0, r1
	movne r0, #0
	bx lr
_020C3B80:
	ldr r1, [r3, #4]
	add r0, r0, r1
	bx lr
	.align 2, 0
_020C3B8C: .word 0x30585442
	arm_func_end sub_020C3B50

	arm_func_start sub_020C3B90
sub_020C3B90: ; 0x020C3B90
	cmp r0, #0
	beq _020C3BE4
	ldrh r2, [r0, #0xc]
	ldr r2, [r0, r2]
	add ip, r0, r2
	adds r3, ip, #8
	beq _020C3BD0
	ldrb r0, [ip, #9]
	cmp r1, r0
	bhs _020C3BD0
	ldrh r2, [ip, #0xe]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r1, r0, r1, r2
	b _020C3BD4
_020C3BD0:
	mov r1, #0
_020C3BD4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bxne lr
_020C3BE4:
	mov r0, #0
	bx lr
	arm_func_end sub_020C3B90

	arm_func_start sub_020C3BEC
sub_020C3BEC: ; 0x020C3BEC
	cmp r0, #0
	beq _020C3C10
	ldrb r2, [r0, #6]
	cmp r1, r2
	bhs _020C3C10
	ldrh r2, [r0, #8]
	add r0, r0, r2
	add r0, r0, r1, lsl #4
	bx lr
_020C3C10:
	mov r0, #0
	bx lr
	arm_func_end sub_020C3BEC

	arm_func_start sub_020C3C18
sub_020C3C18: ; 0x020C3C18
	cmp r0, #0
	beq _020C3C3C
	ldrb r2, [r0, #7]
	cmp r1, r2
	bhs _020C3C3C
	ldrh r2, [r0, #0xa]
	add r0, r0, r2
	add r0, r0, r1, lsl #4
	bx lr
_020C3C3C:
	mov r0, #0
	bx lr
	arm_func_end sub_020C3C18

	arm_func_start sub_020C3C44
sub_020C3C44: ; 0x020C3C44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl sub_020C3CB8
	ldrsh r1, [r0, #4]
	ldrh r3, [r0, #6]
	mul r2, r1, r4
	add r3, r5, r3
	mov r2, r2, lsr #0xc
	b _020C3C70
_020C3C6C:
	sub r2, r2, #1
_020C3C70:
	cmp r2, #0
	beq _020C3C88
	mov r1, r2, lsl #2
	ldrh r1, [r3, r1]
	cmp r1, r4
	bhs _020C3C6C
_020C3C88:
	ldrh r1, [r0]
	b _020C3C94
_020C3C90:
	add r2, r2, #1
_020C3C94:
	add r0, r2, #1
	cmp r0, r1
	bhs _020C3CB0
	add r0, r3, r2, lsl #2
	ldrh r0, [r0, #4]
	cmp r0, r4
	bls _020C3C90
_020C3CB0:
	add r0, r3, r2, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C3C44

	arm_func_start sub_020C3CB8
sub_020C3CB8: ; 0x020C3CB8
	adds r3, r0, #0xc
	beq _020C3CE4
	ldrb r2, [r0, #0xd]
	cmp r1, r2
	bhs _020C3CE4
	ldrh r0, [r0, #0x12]
	ldrh r2, [r3, r0]
	add r0, r3, r0
	add r0, r0, #4
	mla r0, r2, r1, r0
	bx lr
_020C3CE4:
	mov r0, #0
	bx lr
	arm_func_end sub_020C3CB8

	arm_func_start sub_020C3CEC
sub_020C3CEC: ; 0x020C3CEC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r0, _020C3D64 ; =_02110A08
	str r4, [r5, #8]
	ldr r0, [r0]
	add r1, r5, #0x1a
	str r0, [r5, #0xc]
	ldrb r2, [r2, #0x17]
	mov r0, #0
	strb r2, [r5, #0x19]
	mov r2, r2, lsl #1
	bl sub_020D4790
	ldrh r0, [r4, #6]
	add r3, r4, #0x14
	mov r2, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_020C3D34:
	mov r0, r2, lsl #1
	ldrh r1, [r3, r0]
	add r0, r5, r2, lsl #1
	add r2, r2, #1
	ldr r1, [r4, r1]
	mov r1, r1, lsr #0x18
	orr r1, r1, #0x100
	strh r1, [r0, #0x1a]
	ldrh r0, [r4, #6]
	cmp r2, r0
	blo _020C3D34
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C3D64: .word _02110A08
	arm_func_end sub_020C3CEC

	arm_func_start sub_020C3D68
sub_020C3D68: ; 0x020C3D68
	stmdb sp!, {r3, lr}
	mov r3, r0
	ldr r0, [r1, #8]
	ldr ip, [r1]
	ldrh r1, [r0, #4]
	cmp ip, r1, lsl #12
	mov r1, r1, lsl #0xc
	subge ip, r1, #1
	bge _020C3D94
	cmp ip, #0
	movlt ip, #0
_020C3D94:
	mov r1, r2
	mov r2, ip
	bl sub_020C404C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C3D68

	arm_func_start sub_020C3DA4
sub_020C3DA4: ; 0x020C3DA4
	ldr r1, _020C3E38 ; =0x021DA700
	ldr r2, [r1]
	ldr r1, [r2]
	ldr ip, [r2, #0xd4]
	ldrb r3, [r1, #1]
	cmp ip, #0
	beq _020C3DFC
	beq _020C3DE8
	ldrb r1, [ip, #1]
	cmp r3, r1
	bhs _020C3DE8
	ldrh r2, [ip, #6]
	ldrh r1, [ip, r2]
	add r2, ip, r2
	add r2, r2, #4
	mla r2, r1, r3, r2
	b _020C3DEC
_020C3DE8:
	mov r2, #0
_020C3DEC:
	cmp r2, #0
	ldrne r1, [r2]
	addne r2, ip, r1
	bne _020C3E00
_020C3DFC:
	mov r2, #0
_020C3E00:
	ldrh r1, [r2]
	tst r1, #1
	beq _020C3E1C
	ldr r1, [r0]
	orr r1, r1, #4
	str r1, [r0]
	bx lr
_020C3E1C:
	ldr r1, [r2, #4]
	str r1, [r0, #0x4c]
	ldr r1, [r2, #8]
	str r1, [r0, #0x50]
	ldr r1, [r2, #0xc]
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0
_020C3E38: .word 0x021DA700
	arm_func_end sub_020C3DA4

	arm_func_start sub_020C3E3C
sub_020C3E3C: ; 0x020C3E3C
	stmdb sp!, {r4, lr}
	ldr r1, _020C3EC8 ; =0x021DA700
	ldr ip, [r1]
	ldr r2, [ip]
	ldr r4, [ip, #0xd4]
	ldrb lr, [r2, #1]
	cmp r4, #0
	beq _020C3E98
	beq _020C3E84
	ldrb r1, [r4, #1]
	cmp lr, r1
	bhs _020C3E84
	ldrh r3, [r4, #6]
	ldrh r1, [r4, r3]
	add r3, r4, r3
	add r3, r3, #4
	mla r3, r1, lr, r3
	b _020C3E88
_020C3E84:
	mov r3, #0
_020C3E88:
	cmp r3, #0
	ldrne r1, [r3]
	addne r1, r4, r1
	bne _020C3E9C
_020C3E98:
	mov r1, #0
_020C3E9C:
	ldrh r3, [r1], #4
	tst r3, #1
	addeq r1, r1, #0xc
	tst r3, #2
	bne _020C3EBC
	tst r3, #8
	addne r1, r1, #4
	addeq r1, r1, #0x10
_020C3EBC:
	ldr ip, [ip, #0xe8]
	blx ip
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C3EC8: .word 0x021DA700
	arm_func_end sub_020C3E3C

	arm_func_start sub_020C3ECC
sub_020C3ECC: ; 0x020C3ECC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _020C4038 ; =0x021DA700
	mov r8, r0
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r3, [r1, #0xd4]
	ldrb r2, [r0, #1]
	cmp r3, #0
	beq _020C3F2C
	beq _020C3F18
	ldrb r0, [r3, #1]
	cmp r2, r0
	bhs _020C3F18
	ldrh r1, [r3, #6]
	ldrh r0, [r3, r1]
	add r1, r3, r1
	add r1, r1, #4
	mla r1, r0, r2, r1
	b _020C3F1C
_020C3F18:
	mov r1, #0
_020C3F1C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r5, r3, r0
	bne _020C3F30
_020C3F2C:
	mov r5, #0
_020C3F30:
	ldrh r0, [r5]
	add r1, r5, #4
	tst r0, #1
	addeq r1, r1, #0xc
	tst r0, #2
	bne _020C4028
	tst r0, #8
	beq _020C3FDC
	and r2, r0, #0xf0
	add r0, r8, #0x28
	mov r4, r2, asr #4
	ldrsh r7, [r1]
	ldrsh r6, [r1, #2]
	bl sub_020D4BD0
	ldrh r0, [r5]
	ldr r1, _020C403C ; =0x021094B8
	mov r3, #0x1000
	tst r0, #0x100
	ldr r0, _020C4040 ; =0x021094B9
	ldrb r1, [r1, r4, lsl #2]
	ldrb r0, [r0, r4, lsl #2]
	rsbne r3, r3, #0
	add r2, r8, r4, lsl #2
	str r3, [r2, #0x28]
	add r1, r8, r1, lsl #2
	str r7, [r1, #0x28]
	add r0, r8, r0, lsl #2
	str r6, [r0, #0x28]
	ldrh r0, [r5]
	tst r0, #0x200
	ldr r0, _020C4044 ; =0x021094BA
	rsbne r6, r6, #0
	ldrb r0, [r0, r4, lsl #2]
	add r0, r8, r0, lsl #2
	str r6, [r0, #0x28]
	ldrh r0, [r5]
	tst r0, #0x400
	ldr r0, _020C4048 ; =0x021094BB
	rsbne r7, r7, #0
	ldrb r0, [r0, r4, lsl #2]
	add r0, r8, r0, lsl #2
	str r7, [r0, #0x28]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C3FDC:
	ldrsh r0, [r5, #2]
	str r0, [r8, #0x28]
	ldrsh r0, [r1]
	str r0, [r8, #0x2c]
	ldrsh r0, [r1, #2]
	str r0, [r8, #0x30]
	ldrsh r0, [r1, #4]
	str r0, [r8, #0x34]
	ldrsh r0, [r1, #6]
	str r0, [r8, #0x38]
	ldrsh r0, [r1, #8]
	str r0, [r8, #0x3c]
	ldrsh r0, [r1, #0xa]
	str r0, [r8, #0x40]
	ldrsh r0, [r1, #0xc]
	str r0, [r8, #0x44]
	ldrsh r0, [r1, #0xe]
	str r0, [r8, #0x48]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C4028:
	ldr r0, [r8]
	orr r0, r0, #2
	str r0, [r8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C4038: .word 0x021DA700
_020C403C: .word 0x021094B8
_020C4040: .word 0x021094B9
_020C4044: .word 0x021094BA
_020C4048: .word 0x021094BB
	arm_func_end sub_020C3ECC

	arm_func_start sub_020C404C
sub_020C404C: ; 0x020C404C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r0
	add r0, sb, r1, lsl #1
	ldrh r0, [r0, #0x14]
	mov r7, r3
	mov r8, r2
	ldr r4, [sb, r0]
	add r1, sb, r0
	tst r4, #1
	movne r0, #7
	strne r0, [r7]
	bne _020C43C4
	ldr r0, _020C43F8 ; =0x00000FFF
	add r5, r1, #4
	tst r8, r0
	beq _020C40A0
	ldr r0, [sb, #8]
	tst r0, #1
	movne r6, #1
	bne _020C40A4
_020C40A0:
	mov r6, #0
_020C40A4:
	mov r0, #0
	str r0, [r7]
	tst r4, #6
	bne _020C4184
	tst r4, #8
	bne _020C40F0
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C40DC
	mov r3, sb
	add r0, r7, #0x4c
	bl sub_020C4560
	b _020C40E8
_020C40DC:
	mov r3, sb
	add r0, r7, #0x4c
	bl sub_020C4400
_020C40E8:
	add r5, r5, #8
	b _020C40F8
_020C40F0:
	ldr r0, [r5], #4
	str r0, [r7, #0x4c]
_020C40F8:
	tst r4, #0x10
	bne _020C4134
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C4120
	mov r3, sb
	add r0, r7, #0x50
	bl sub_020C4560
	b _020C412C
_020C4120:
	mov r3, sb
	add r0, r7, #0x50
	bl sub_020C4400
_020C412C:
	add r5, r5, #8
	b _020C413C
_020C4134:
	ldr r0, [r5], #4
	str r0, [r7, #0x50]
_020C413C:
	tst r4, #0x20
	bne _020C4178
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C4164
	mov r3, sb
	add r0, r7, #0x54
	bl sub_020C4560
	b _020C4170
_020C4164:
	mov r3, sb
	add r0, r7, #0x54
	bl sub_020C4400
_020C4170:
	add r5, r5, #8
	b _020C41A4
_020C4178:
	ldr r0, [r5], #4
	str r0, [r7, #0x54]
	b _020C41A4
_020C4184:
	tst r4, #2
	beq _020C419C
	ldr r0, [r7]
	orr r0, r0, #4
	str r0, [r7]
	b _020C41A4
_020C419C:
	mov r0, r7
	bl sub_020C3DA4
_020C41A4:
	tst r4, #0xc0
	bne _020C4268
	tst r4, #0x100
	bne _020C41E8
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C41D4
	mov r3, sb
	add r0, r7, #0x28
	bl sub_020C4E5C
	b _020C41E0
_020C41D4:
	mov r3, sb
	add r0, r7, #0x28
	bl sub_020C4A44
_020C41E0:
	add r5, r5, #8
	b _020C4288
_020C41E8:
	ldr r1, [sb, #0xc]
	ldr r2, [sb, #0x10]
	ldr r3, [r5]
	add r0, r7, #0x28
	add r1, sb, r1
	add r2, sb, r2
	bl sub_020C51A0
	cmp r0, #0
	beq _020C4260
	ldr ip, [r7, #0x3c]
	ldr r0, [r7, #0x2c]
	ldr r3, [r7, #0x28]
	ldr fp, [r7, #0x38]
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	mul sl, r0, ip
	mul lr, r1, fp
	sub sl, sl, lr
	mov sl, sl, asr #0xc
	mul lr, r1, r2
	mul r1, r3, ip
	sub r1, lr, r1
	mul fp, r3, fp
	mul r2, r0, r2
	sub r0, fp, r2
	str sl, [r7, #0x40]
	mov r1, r1, asr #0xc
	str r1, [r7, #0x44]
	mov r0, r0, asr #0xc
	str r0, [r7, #0x48]
_020C4260:
	add r5, r5, #4
	b _020C4288
_020C4268:
	tst r4, #0x40
	beq _020C4280
	ldr r0, [r7]
	orr r0, r0, #2
	str r0, [r7]
	b _020C4288
_020C4280:
	mov r0, r7
	bl sub_020C3ECC
_020C4288:
	tst r4, #0x600
	bne _020C439C
	tst r4, #0x800
	bne _020C42D8
	cmp r6, #0
	add r0, sp, #0x10
	mov r1, r8
	beq _020C42B8
	mov r2, r5
	mov r3, sb
	bl sub_020C48B0
	b _020C42C4
_020C42B8:
	mov r2, r5
	mov r3, sb
	bl sub_020C46BC
_020C42C4:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0x24]
	b _020C42E8
_020C42D8:
	ldr r0, [r5]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	str r0, [sp, #0x24]
_020C42E8:
	tst r4, #0x1000
	bne _020C4330
	cmp r6, #0
	add r0, sp, #8
	mov r1, r8
	beq _020C4310
	mov r3, sb
	add r2, r5, #8
	bl sub_020C48B0
	b _020C431C
_020C4310:
	mov r3, sb
	add r2, r5, #8
	bl sub_020C46BC
_020C431C:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x28]
	b _020C4340
_020C4330:
	ldr r0, [r5, #8]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0xc]
	str r0, [sp, #0x28]
_020C4340:
	tst r4, #0x2000
	bne _020C4388
	cmp r6, #0
	add r0, sp, #0
	mov r1, r8
	beq _020C4368
	mov r3, sb
	add r2, r5, #0x10
	bl sub_020C48B0
	b _020C4374
_020C4368:
	mov r3, sb
	add r2, r5, #0x10
	bl sub_020C46BC
_020C4374:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #0x20]
	str r0, [sp, #0x2c]
	b _020C43C4
_020C4388:
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x2c]
	b _020C43C4
_020C439C:
	tst r4, #0x200
	beq _020C43B4
	ldr r0, [r7]
	orr r0, r0, #1
	str r0, [r7]
	b _020C43C4
_020C43B4:
	mov r0, r7
	bl sub_020C3E3C
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C43C4:
	ldr r0, [r7]
	add r1, sp, #0x18
	tst r0, #1
	ldr r0, _020C43FC ; =0x021DA700
	movne r3, #4
	ldr r4, [r0]
	moveq r3, #0
	ldr r2, [r4]
	ldr r4, [r4, #0xe8]
	mov r0, r7
	blx r4
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C43F8: .word 0x00000FFF
_020C43FC: .word 0x021DA700
	arm_func_end sub_020C404C

	arm_func_start sub_020C4400
sub_020C4400: ; 0x020C4400
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r2, #4]
	ldr ip, [r2]
	mov r5, r1, asr #0xc
	tst ip, #0xc0000000
	add r1, r3, r4
	beq _020C453C
	ldr r2, _020C455C ; =0x1FFF0000
	tst ip, #0x40000000
	and r2, ip, r2
	mov r3, r2, lsr #0x10
	beq _020C4458
	tst r5, #1
	beq _020C4450
	cmp r5, r3
	movhi r2, r3, lsr #1
	addhi r5, r2, #1
	bhi _020C453C
	mov r4, r5, lsr #1
	b _020C44FC
_020C4450:
	mov r5, r5, lsr #1
	b _020C453C
_020C4458:
	ands r2, r5, #3
	beq _020C44F4
	cmp r5, r3
	addhi r5, r2, r3, lsr #2
	bhi _020C453C
	tst r5, #1
	beq _020C44EC
	tst r5, #2
	movne r5, r5, lsr #2
	addne r2, r5, #1
	moveq r2, r5, lsr #2
	addeq r5, r2, #1
	tst ip, #0x20000000
	beq _020C44B4
	mov r3, r2, lsl #1
	mov r2, r5, lsl #1
	ldrsh r3, [r1, r3]
	ldrsh r1, [r1, r2]
	add r2, r3, r3, lsl #1
	add r1, r2, r1
	mov r1, r1, asr #2
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C44B4:
	ldr ip, [r1, r2, lsl #2]
	mov r2, #3
	mov r3, #0
	umull r4, lr, ip, r2
	mla lr, ip, r3, lr
	mov r3, ip, asr #0x1f
	mla lr, r3, r2, lr
	ldr r1, [r1, r5, lsl #2]
	adds r2, r4, r1
	adc r1, lr, r1, asr #31
	mov r2, r2, lsr #2
	orr r2, r2, r1, lsl #30
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C44EC:
	mov r4, r5, lsr #2
	b _020C44FC
_020C44F4:
	mov r5, r5, lsr #2
	b _020C453C
_020C44FC:
	tst ip, #0x20000000
	beq _020C4520
	mov r3, r4, lsl #1
	add r2, r1, r4, lsl #1
	ldrsh r3, [r1, r3]
	ldrsh r1, [r2, #2]
	add r1, r3, r1
	mov r1, r1, asr #1
	b _020C4534
_020C4520:
	add r2, r1, r4, lsl #2
	ldr r2, [r2, #4]
	ldr r3, [r1, r4, lsl #2]
	mov r1, r2, asr #1
	add r1, r1, r3, asr #1
_020C4534:
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C453C:
	tst ip, #0x20000000
	ldreq r1, [r1, r5, lsl #2]
	streq r1, [r0]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, r5, lsl #1
	ldrsh r1, [r1, r2]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C455C: .word 0x1FFF0000
	arm_func_end sub_020C4400

	arm_func_start sub_020C4560
sub_020C4560: ; 0x020C4560
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r4, [r3, #4]
	ldr ip, [r2, #4]
	mov lr, r1, asr #0xc
	sub r4, r4, #1
	cmp r4, r1, asr #12
	add ip, r3, ip
	ldr r2, [r2]
	bne _020C45FC
	tst r2, #0xc0000000
	beq _020C45A0
	tst r2, #0x40000000
	andne r4, lr, #1
	addne lr, r4, lr, lsr #1
	andeq r4, lr, #3
	addeq lr, r4, lr, lsr #2
_020C45A0:
	ldr r3, [r3, #8]
	tst r3, #2
	beq _020C45E4
	ldr r3, _020C46B0 ; =0x00000FFF
	tst r2, #0x20000000
	and r2, r1, r3
	ldreq r3, [ip, lr, lsl #2]
	ldreq r1, [ip]
	beq _020C45D0
	mov r1, lr, lsl #1
	ldrsh r3, [ip, r1]
	ldrsh r1, [ip]
_020C45D0:
	sub r1, r1, r3
	mul r1, r2, r1
	add r1, r3, r1, asr #12
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C45E4:
	tst r2, #0x20000000
	movne r1, lr, lsl #1
	ldrnesh r1, [ip, r1]
	ldreq r1, [ip, lr, lsl #2]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C45FC:
	tst r2, #0xc0000000
	beq _020C4660
	ldr r3, _020C46B4 ; =0x1FFF0000
	tst r2, #0x40000000
	and r4, r2, r3
	mov r4, r4, lsr #0x10
	beq _020C4638
	cmp lr, r4
	movhs lr, r4, lsr #1
	bhs _020C4660
	mov lr, lr, lsr #1
	and r1, r1, r3, lsr #16
	mov r4, #2
	mov r5, #1
	b _020C4670
_020C4638:
	cmp lr, r4
	andhs r3, lr, #3
	addhs lr, r3, lr, lsr #2
	bhs _020C4660
	ldr r3, _020C46B8 ; =0x00003FFF
	mov lr, lr, lsr #2
	and r1, r1, r3
	mov r4, #4
	mov r5, #2
	b _020C4670
_020C4660:
	ldr r3, _020C46B0 ; =0x00000FFF
	mov r4, #1
	and r1, r1, r3
	mov r5, #0
_020C4670:
	tst r2, #0x20000000
	addeq r2, ip, lr, lsl #2
	ldreq ip, [ip, lr, lsl #2]
	ldreq r2, [r2, #4]
	beq _020C4694
	add r2, ip, lr, lsl #1
	mov r3, lr, lsl #1
	ldrsh ip, [ip, r3]
	ldrsh r2, [r2, #2]
_020C4694:
	sub r2, r2, ip
	mul r3, ip, r4
	mul r2, r1, r2
	add r1, r3, r2, asr #12
	mov r1, r1, asr r5
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C46B0: .word 0x00000FFF
_020C46B4: .word 0x1FFF0000
_020C46B8: .word 0x00003FFF
	arm_func_end sub_020C4560

	arm_func_start sub_020C46BC
sub_020C46BC: ; 0x020C46BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, [r2, #4]
	ldr r5, [r2]
	mov r6, r1, asr #0xc
	tst r5, #0xc0000000
	add r1, r3, r4
	beq _020C4808
	ldr r2, _020C48AC ; =0x1FFF0000
	tst r5, #0x40000000
	and r2, r5, r2
	mov r3, r2, lsr #0x10
	beq _020C4714
	tst r6, #1
	beq _020C470C
	cmp r6, r3
	movhi r2, r3, lsr #1
	addhi r6, r2, #1
	bhi _020C4808
	mov r4, r6, lsr #1
	b _020C4840
_020C470C:
	mov r6, r6, lsr #1
	b _020C4808
_020C4714:
	ands r2, r6, #3
	beq _020C4804
	cmp r6, r3
	addhi r6, r2, r3, lsr #2
	bhi _020C4808
	tst r6, #1
	beq _020C47FC
	tst r6, #2
	movne r3, r6, lsr #2
	addne r2, r3, #1
	moveq r2, r6, lsr #2
	addeq r3, r2, #1
	tst r5, #0x20000000
	beq _020C4790
	mov r5, r2, lsl #2
	mov r4, r3, lsl #2
	ldrsh r6, [r1, r5]
	ldrsh r5, [r1, r4]
	add r2, r1, r2, lsl #2
	add r4, r6, r6, lsl #1
	add r4, r5, r4
	mov r4, r4, asr #2
	str r4, [r0]
	add r1, r1, r3, lsl #2
	ldrsh r3, [r2, #2]
	ldrsh r2, [r1, #2]
	add r1, r3, r3, lsl #1
	add r1, r2, r1
	mov r1, r1, asr #2
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C4790:
	ldr r4, [r1, r2, lsl #3]
	mov ip, #3
	mov lr, #0
	umull r6, r5, r4, ip
	mla r5, r4, lr, r5
	mov r4, r4, asr #0x1f
	ldr r7, [r1, r3, lsl #3]
	add r2, r1, r2, lsl #3
	mla r5, r4, ip, r5
	adds r6, r6, r7
	adc r4, r5, r7, asr #31
	mov r5, r6, lsr #2
	orr r5, r5, r4, lsl #30
	str r5, [r0]
	add r1, r1, r3, lsl #3
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]
	umull r4, r3, r2, ip
	mla r3, r2, lr, r3
	mov r2, r2, asr #0x1f
	mla r3, r2, ip, r3
	adds r4, r4, r1
	adc r1, r3, r1, asr #31
	mov r2, r4, lsr #2
	orr r2, r2, r1, lsl #30
	str r2, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C47FC:
	mov r4, r6, lsr #2
	b _020C4840
_020C4804:
	mov r6, r6, lsr #2
_020C4808:
	tst r5, #0x20000000
	beq _020C4828
	mov r2, r6, lsl #2
	ldrsh r2, [r1, r2]
	add r1, r1, r6, lsl #2
	str r2, [r0]
	ldrsh r1, [r1, #2]
	b _020C4838
_020C4828:
	ldr r2, [r1, r6, lsl #3]
	add r1, r1, r6, lsl #3
	str r2, [r0]
	ldr r1, [r1, #4]
_020C4838:
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C4840:
	tst r5, #0x20000000
	beq _020C487C
	mov r2, r4, lsl #2
	add r3, r1, r4, lsl #2
	ldrsh r2, [r1, r2]
	ldrsh r1, [r3, #4]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0]
	ldrsh r2, [r3, #2]
	ldrsh r1, [r3, #6]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C487C:
	add r3, r1, r4, lsl #3
	ldr r2, [r1, r4, lsl #3]
	ldr r1, [r3, #8]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0]
	ldr r2, [r3, #4]
	ldr r1, [r3, #0xc]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C48AC: .word 0x1FFF0000
	arm_func_end sub_020C46BC

	arm_func_start sub_020C48B0
sub_020C48B0: ; 0x020C48B0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrh r4, [r3, #4]
	ldr r5, [r2, #4]
	mov lr, r1, asr #0xc
	sub r4, r4, #1
	cmp r4, r1, asr #12
	add ip, r3, r5
	ldr r2, [r2]
	bne _020C4938
	tst r2, #0xc0000000
	beq _020C48F0
	tst r2, #0x40000000
	andne r4, lr, #1
	addne lr, r4, lr, lsr #1
	andeq r4, lr, #3
	addeq lr, r4, lr, lsr #2
_020C48F0:
	ldr r3, [r3, #8]
	tst r3, #2
	movne r3, #0
	bne _020C49B4
	tst r2, #0x20000000
	beq _020C4920
	mov r1, lr, lsl #2
	ldrsh r2, [ip, r1]
	add r1, ip, lr, lsl #2
	str r2, [r0]
	ldrsh r1, [r1, #2]
	b _020C4930
_020C4920:
	ldr r2, [ip, lr, lsl #3]
	add r1, ip, lr, lsl #3
	str r2, [r0]
	ldr r1, [r1, #4]
_020C4930:
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C4938:
	tst r2, #0xc0000000
	beq _020C49B0
	ldr r4, _020C4A38 ; =0x1FFF0000
	tst r2, #0x40000000
	and r3, r2, r4
	mov r3, r3, lsr #0x10
	beq _020C497C
	cmp lr, r3
	movhs lr, r3, lsr #1
	addhs r3, lr, #1
	bhs _020C49B4
	mov lr, lr, lsr #1
	add r3, lr, #1
	and r1, r1, r4, lsr #16
	mov r4, #2
	mov r5, #1
	b _020C49C4
_020C497C:
	cmp lr, r3
	blo _020C4994
	and r3, lr, #3
	add lr, r3, lr, lsr #2
	add r3, lr, #1
	b _020C49B4
_020C4994:
	ldr r4, _020C4A3C ; =0x00003FFF
	mov lr, lr, lsr #2
	add r3, lr, #1
	and r1, r1, r4
	mov r4, #4
	mov r5, #2
	b _020C49C4
_020C49B0:
	add r3, lr, #1
_020C49B4:
	ldr r5, _020C4A40 ; =0x00000FFF
	mov r4, #1
	and r1, r1, r5
	mov r5, #0
_020C49C4:
	tst r2, #0x20000000
	beq _020C49F0
	mov r2, lr, lsl #2
	add r7, ip, lr, lsl #2
	mov r6, r3, lsl #2
	add r3, ip, r3, lsl #2
	ldrsh r2, [ip, r2]
	ldrsh lr, [r7, #2]
	ldrsh r7, [ip, r6]
	ldrsh r3, [r3, #2]
	b _020C4A04
_020C49F0:
	add r7, ip, lr, lsl #3
	ldmia r7, {r2, lr}
	add r6, ip, r3, lsl #3
	ldr r7, [ip, r3, lsl #3]
	ldr r3, [r6, #4]
_020C4A04:
	sub ip, r7, r2
	sub r3, r3, lr
	mul r6, r2, r4
	mul r2, r1, ip
	add r2, r6, r2, asr #12
	mov r6, r2, asr r5
	mul r4, lr, r4
	mul r2, r1, r3
	add r1, r4, r2, asr #12
	mov r1, r1, asr r5
	str r6, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C4A38: .word 0x1FFF0000
_020C4A3C: .word 0x00003FFF
_020C4A40: .word 0x00000FFF
	arm_func_end sub_020C48B0

	arm_func_start sub_020C4A44
sub_020C4A44: ; 0x020C4A44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x48
	ldr sb, [r2]
	mov r4, r3
	ldr r2, [r2, #4]
	mov r5, r0
	tst sb, #0xc0000000
	mov r3, r1, asr #0xc
	add r8, r4, r2
	ldr r7, [r4, #0xc]
	ldr r6, [r4, #0x10]
	beq _020C4DC8
	ldr r0, _020C4E58 ; =0x1FFF0000
	tst sb, #0x40000000
	and r0, sb, r0
	mov r1, r0, lsr #0x10
	beq _020C4AB0
	tst r3, #1
	beq _020C4AA8
	cmp r3, r1
	movhi r0, r1, lsr #1
	addhi r3, r0, #1
	bhi _020C4DC8
	mov sb, r3, lsr #1
	b _020C4C70
_020C4AA8:
	mov r3, r3, lsr #1
	b _020C4DC8
_020C4AB0:
	ands r0, r3, #3
	beq _020C4C68
	cmp r3, r1
	addhi r3, r0, r1, lsr #2
	bhi _020C4DC8
	tst r3, #1
	beq _020C4C60
	tst r3, #2
	movne sb, r3, lsr #2
	addne r0, sb, #1
	moveq r0, r3, lsr #2
	addeq sb, r0, #1
	mov r0, r0, lsl #1
	ldrh r3, [r8, r0]
	mov r0, r5
	add r1, r4, r7
	add r2, r4, r6
	mov sl, #0
	bl sub_020C51A0
	mov r1, sb, lsl #1
	ldrh r3, [r8, r1]
	orr sl, sl, r0
	add r0, sp, #0x24
	add r1, r4, r7
	add r2, r4, r6
	bl sub_020C51A0
	ldr r1, [r5]
	ldr r2, [sp, #0x24]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x28]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [sp, #0x2c]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [sp, #0x30]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5, #0xc]
	ldr r1, [r5, #0x10]
	orr sl, sl, r0
	ldr r2, [sp, #0x34]
	add r0, r1, r1, lsl #1
	add r0, r2, r0
	str r0, [r5, #0x10]
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0x38]
	add r0, r0, r0, lsl #1
	add r2, r1, r0
	mov r0, r5
	mov r1, r5
	str r2, [r5, #0x14]
	bl sub_020CCFE0
	add r0, r5, #0xc
	mov r1, r0
	bl sub_020CCFE0
	cmp sl, #0
	bne _020C4C04
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x3c]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x1c]
	ldr r1, [sp, #0x40]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x44]
	add r0, r0, r0, lsl #1
	add r2, r1, r0
	add r0, r5, #0x18
	mov r1, r0
	str r2, [r5, #0x20]
	bl sub_020CCFE0
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4C04:
	ldr sb, [r5, #0x14]
	ldr r6, [r5, #4]
	ldr r4, [r5, #0x10]
	ldr r2, [r5, #8]
	mul r1, r6, sb
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r7, [r5, #0xc]
	ldr r8, [r5]
	mov r3, r0, asr #0xc
	mul r1, r2, r7
	mul r0, r8, sb
	sub r2, r1, r0
	mul r1, r8, r4
	mul r0, r6, r7
	sub r0, r1, r0
	str r3, [r5, #0x18]
	mov r1, r2, asr #0xc
	str r1, [r5, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [r5, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4C60:
	mov sb, r3, lsr #2
	b _020C4C70
_020C4C68:
	mov r3, r3, lsr #2
	b _020C4DC8
_020C4C70:
	mov r0, sb, lsl #1
	ldrh r3, [r8, r0]
	mov r0, r5
	add r1, r4, r7
	add r2, r4, r6
	bl sub_020C51A0
	add r1, r8, sb, lsl #1
	ldrh r3, [r1, #2]
	orr r8, r0, #0
	add r0, sp, #0
	add r1, r4, r7
	add r2, r4, r6
	bl sub_020C51A0
	ldr r2, [r5]
	ldr r1, [sp]
	orr r8, r8, r0
	add r0, r2, r1
	str r0, [r5]
	ldr r2, [r5, #4]
	ldr r1, [sp, #4]
	mov r0, r5
	add r1, r2, r1
	str r1, [r5, #4]
	ldr r3, [r5, #8]
	ldr r2, [sp, #8]
	mov r1, r5
	add r2, r3, r2
	str r2, [r5, #8]
	ldr r3, [r5, #0xc]
	ldr r2, [sp, #0xc]
	add r2, r3, r2
	str r2, [r5, #0xc]
	ldr r3, [r5, #0x10]
	ldr r2, [sp, #0x10]
	add r2, r3, r2
	str r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	ldr r2, [sp, #0x14]
	add r2, r3, r2
	str r2, [r5, #0x14]
	bl sub_020CCFE0
	add r0, r5, #0xc
	mov r1, r0
	bl sub_020CCFE0
	cmp r8, #0
	bne _020C4D6C
	ldr r2, [r5, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0x18
	add r1, r2, r1
	str r1, [r5, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r2, [sp, #0x1c]
	mov r1, r0
	add r2, r3, r2
	str r2, [r5, #0x1c]
	ldr r3, [r5, #0x20]
	ldr r2, [sp, #0x20]
	add r2, r3, r2
	str r2, [r5, #0x20]
	bl sub_020CCFE0
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4D6C:
	ldr sb, [r5, #0x14]
	ldr r6, [r5, #4]
	ldr r4, [r5, #0x10]
	ldr r2, [r5, #8]
	mul r1, r6, sb
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r7, [r5, #0xc]
	ldr r8, [r5]
	mov r3, r0, asr #0xc
	mul r1, r2, r7
	mul r0, r8, sb
	sub r2, r1, r0
	mul r1, r8, r4
	mul r0, r6, r7
	sub r0, r1, r0
	str r3, [r5, #0x18]
	mov r1, r2, asr #0xc
	str r1, [r5, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [r5, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4DC8:
	mov r0, r3, lsl #1
	ldrh r3, [r8, r0]
	mov r0, r5
	add r1, r4, r7
	add r2, r4, r6
	bl sub_020C51A0
	cmp r0, #0
	beq _020C4E44
	ldr sb, [r5, #0x14]
	ldr r6, [r5, #4]
	ldr r4, [r5, #0x10]
	ldr r2, [r5, #8]
	mul r1, r6, sb
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r7, [r5, #0xc]
	ldr r8, [r5]
	mov r3, r0, asr #0xc
	mul r1, r2, r7
	mul r0, r8, sb
	sub r2, r1, r0
	mul r1, r8, r4
	mul r0, r6, r7
	sub r0, r1, r0
	str r3, [r5, #0x18]
	mov r1, r2, asr #0xc
	str r1, [r5, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [r5, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4E44:
	add r0, r5, #0x18
	mov r1, r0
	bl sub_020CCFE0
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020C4E58: .word 0x1FFF0000
	arm_func_end sub_020C4A44

	arm_func_start sub_020C4E5C
sub_020C4E5C: ; 0x020C4E5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	mov sb, r3
	ldrh r3, [sb, #4]
	ldr r4, [r2, #4]
	mov sl, r0
	sub r0, r3, #1
	cmp r0, r1, asr #12
	add r8, sb, r4
	mov r0, r1, asr #0xc
	ldr r4, [sb, #0xc]
	ldr fp, [sb, #0x10]
	ldr r3, [r2]
	bne _020C4F50
	tst r3, #0xc0000000
	beq _020C4EB0
	tst r3, #0x40000000
	andne r2, r0, #1
	addne r0, r2, r0, lsr #1
	andeq r2, r0, #3
	addeq r0, r2, r0, lsr #2
_020C4EB0:
	ldr r2, [sb, #8]
	tst r2, #2
	movne r5, #0
	bne _020C4FC4
	mov r0, r0, lsl #1
	ldrh r3, [r8, r0]
	mov r0, sl
	add r1, sb, r4
	add r2, sb, fp
	bl sub_020C51A0
	cmp r0, #0
	beq _020C4F3C
	ldr r8, [sl, #0x14]
	ldr r5, [sl, #4]
	ldr r4, [sl, #0x10]
	ldr r2, [sl, #8]
	mul r1, r5, r8
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r6, [sl, #0xc]
	ldr r7, [sl]
	mov r3, r0, asr #0xc
	mul r1, r2, r6
	mul r0, r7, r8
	sub r2, r1, r0
	mul r1, r7, r4
	mul r0, r5, r6
	sub r0, r1, r0
	str r3, [sl, #0x18]
	mov r1, r2, asr #0xc
	str r1, [sl, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [sl, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C4F3C:
	add r0, sl, #0x18
	mov r1, r0
	bl sub_020CCFE0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C4F50:
	tst r3, #0xc0000000
	beq _020C4FC0
	ldr r2, _020C5194 ; =0x1FFF0000
	tst r3, #0x40000000
	and r3, r3, r2
	mov r3, r3, lsr #0x10
	beq _020C4F90
	cmp r0, r3
	movhs r0, r3, lsr #1
	addhs r5, r0, #1
	bhs _020C4FC4
	mov r0, r0, lsr #1
	add r5, r0, #1
	and r6, r1, r2, lsr #16
	mov r7, #2
	b _020C4FD0
_020C4F90:
	cmp r0, r3
	blo _020C4FA8
	and r2, r0, #3
	add r0, r2, r0, lsr #2
	add r5, r0, #1
	b _020C4FC4
_020C4FA8:
	ldr r2, _020C5198 ; =0x00003FFF
	mov r0, r0, lsr #2
	add r5, r0, #1
	and r6, r1, r2
	mov r7, #4
	b _020C4FD0
_020C4FC0:
	add r5, r0, #1
_020C4FC4:
	ldr r2, _020C519C ; =0x00000FFF
	mov r7, #1
	and r6, r1, r2
_020C4FD0:
	mov r0, r0, lsl #1
	ldrh r3, [r8, r0]
	add r0, sp, #0x24
	add r1, sb, r4
	add r2, sb, fp
	bl sub_020C51A0
	mov r1, r5, lsl #1
	ldrh r3, [r8, r1]
	orr r5, r0, #0
	add r0, sp, #0
	add r1, sb, r4
	add r2, sb, fp
	bl sub_020C51A0
	ldr r3, [sp, #0x24]
	ldr r1, [sp]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl]
	ldr r3, [sp, #0x28]
	ldr r1, [sp, #4]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl, #4]
	ldr r3, [sp, #0x2c]
	ldr r1, [sp, #8]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl, #8]
	ldr r3, [sp, #0x30]
	ldr r1, [sp, #0xc]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl, #0xc]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x10]
	orr r5, r5, r0
	sub r0, r1, r2
	mul r1, r2, r7
	mul r0, r6, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x10]
	ldr r2, [sp, #0x38]
	ldr r0, [sp, #0x14]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r2, r1, r0, asr #12
	mov r0, sl
	mov r1, sl
	str r2, [sl, #0x14]
	bl sub_020CCFE0
	add r0, sl, #0xc
	mov r1, r0
	bl sub_020CCFE0
	cmp r5, #0
	bne _020C5138
	ldr r2, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x18]
	ldr r2, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x1c]
	ldr r2, [sp, #0x44]
	ldr r0, [sp, #0x20]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r2, r1, r0, asr #12
	add r0, sl, #0x18
	mov r1, r0
	str r2, [sl, #0x20]
	bl sub_020CCFE0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C5138:
	ldr r8, [sl, #0x14]
	ldr r5, [sl, #4]
	ldr r7, [sl]
	ldr r4, [sl, #0x10]
	ldr r2, [sl, #8]
	ldr r6, [sl, #0xc]
	mul r1, r5, r8
	mul r0, r2, r4
	sub r0, r1, r0
	mov r3, r0, asr #0xc
	mul r1, r2, r6
	mul r0, r7, r8
	sub r2, r1, r0
	mul r1, r7, r4
	mul r0, r5, r6
	sub r0, r1, r0
	str r3, [sl, #0x18]
	mov r1, r2, asr #0xc
	str r1, [sl, #0x1c]
	mov r0, r0, asr #0xc
	str r0, [sl, #0x20]
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5194: .word 0x1FFF0000
_020C5198: .word 0x00003FFF
_020C519C: .word 0x00000FFF
	arm_func_end sub_020C4E5C

	arm_func_start sub_020C51A0
sub_020C51A0: ; 0x020C51A0
	stmdb sp!, {r3, r4, r5, lr}
	tst r3, #0x8000
	beq _020C5258
	mov r4, #0
	str r4, [r0, #0x20]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	str r4, [r0, #0x14]
	str r4, [r0, #0x10]
	ldr r2, _020C52F8 ; =0x00007FFF
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	and r2, r3, r2
	add r3, r2, r2, lsl #1
	str r4, [r0, #4]
	add r2, r1, r3, lsl #1
	str r4, [r0]
	mov r3, r3, lsl #1
	ldrsh r1, [r1, r3]
	ldrsh ip, [r2, #2]
	ldrsh r3, [r2, #4]
	tst r1, #0x10
	subne r5, r4, #0x1000
	ldr r4, _020C52FC ; =0x021094B8
	and r1, r1, #0xf
	ldr lr, _020C5300 ; =0x021094B9
	moveq r5, #0x1000
	ldrb r4, [r4, r1, lsl #2]
	str r5, [r0, r1, lsl #2]
	ldrb lr, [lr, r1, lsl #2]
	str ip, [r0, r4, lsl #2]
	str r3, [r0, lr, lsl #2]
	ldrsh lr, [r2]
	tst lr, #0x20
	ldr lr, _020C5304 ; =0x021094BA
	rsbne r3, r3, #0
	ldrb lr, [lr, r1, lsl #2]
	str r3, [r0, lr, lsl #2]
	ldrsh r2, [r2]
	tst r2, #0x40
	ldr r2, _020C5308 ; =0x021094BB
	rsbne ip, ip, #0
	ldrb r1, [r2, r1, lsl #2]
	str ip, [r0, r1, lsl #2]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020C5258:
	ldr r1, _020C52F8 ; =0x00007FFF
	and r1, r3, r1
	add r3, r1, r1, lsl #2
	add r1, r2, r3, lsl #1
	ldrsh lr, [r1, #8]
	mov ip, r3, lsl #1
	mov r3, lr, asr #3
	str r3, [r0, #0x10]
	ldrsh ip, [r2, ip]
	and r2, lr, #7
	mov r2, r2, lsl #0x10
	mov r3, ip, asr #3
	str r3, [r0]
	ldrsh r3, [r1, #2]
	and ip, ip, #7
	orr lr, ip, r2, asr #13
	mov r2, r3, asr #3
	str r2, [r0, #4]
	ldrsh ip, [r1, #4]
	mov r2, lr, lsl #0x10
	and lr, r3, #7
	mov r3, ip, asr #3
	str r3, [r0, #8]
	ldrsh r3, [r1, #6]
	orr r1, lr, r2, asr #13
	mov r1, r1, lsl #0x10
	and r2, ip, #7
	orr r1, r2, r1, asr #13
	mov r1, r1, lsl #0x10
	and r2, r3, #7
	orr r1, r2, r1, asr #13
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, r3, asr #3
	mov r1, r1, lsl #0x13
	str r2, [r0, #0xc]
	mov r1, r1, asr #0x13
	str r1, [r0, #0x14]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C52F8: .word 0x00007FFF
_020C52FC: .word 0x021094B8
_020C5300: .word 0x021094B9
_020C5304: .word 0x021094BA
_020C5308: .word 0x021094BB
	arm_func_end sub_020C51A0

	arm_func_start sub_020C530C
sub_020C530C: ; 0x020C530C
	tst r1, #0x20000000
	movne r0, r1, lsl #0x10
	movne r0, r0, lsr #0x10
	bxne lr
	mov r3, r1, lsl #0x10
	tst r1, #0xc0000000
	add r0, r0, r3, lsr #16
	moveq r1, r2, lsl #1
	ldreqh r0, [r0, r1]
	bxeq lr
	ldr r3, _020C546C ; =0x1FFF0000
	tst r1, #0x40000000
	and r1, r1, r3
	mov r3, r1, lsr #0x10
	beq _020C537C
	tst r2, #1
	beq _020C5370
	cmp r2, r3
	bls _020C5368
	bic r1, r3, #1
	add r0, r0, r1
	ldrh r0, [r0, #2]
	bx lr
_020C5368:
	mov r1, r2, lsr #1
	b _020C5424
_020C5370:
	bic r1, r2, #1
	ldrh r0, [r0, r1]
	bx lr
_020C537C:
	ands r1, r2, #3
	beq _020C5414
	cmp r2, r3
	bls _020C53A0
	mov r2, r3, lsr #2
	mov r1, r1, lsl #1
	add r0, r0, r2, lsl #1
	ldrh r0, [r1, r0]
	bx lr
_020C53A0:
	tst r2, #1
	beq _020C540C
	tst r2, #2
	movne r3, r2, lsr #2
	addne r1, r3, #1
	moveq r1, r2, lsr #2
	mov r2, r1, lsl #1
	addeq r3, r1, #1
	mov r1, r3, lsl #1
	ldrh r2, [r0, r2]
	ldrh ip, [r0, r1]
	ldr r0, _020C5470 ; =0x00007C1F
	and r1, r2, #0x3e0
	and r3, r2, r0
	add r2, r1, r1, lsl #1
	and r1, ip, #0x3e0
	add r1, r2, r1
	add r3, r3, r3, lsl #1
	and r2, ip, r0
	add r2, r3, r2
	mov r1, r1, lsr #2
	and r2, r0, r2, lsr #2
	and r0, r1, #0x3e0
	orr r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
_020C540C:
	mov r1, r2, lsr #2
	b _020C5424
_020C5414:
	mov r1, r2, lsr #2
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bx lr
_020C5424:
	mov r2, r1, lsl #1
	add r1, r0, r1, lsl #1
	ldrh r3, [r0, r2]
	ldrh ip, [r1, #2]
	ldr r0, _020C5470 ; =0x00007C1F
	and r2, r3, #0x3e0
	and r1, ip, #0x3e0
	add r1, r2, r1
	mov r1, r1, lsr #1
	and r3, r3, r0
	and r2, ip, r0
	add r2, r3, r2
	and r2, r0, r2, lsr #1
	and r0, r1, #0x3e0
	orr r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020C546C: .word 0x1FFF0000
_020C5470: .word 0x00007C1F
	arm_func_end sub_020C530C

	arm_func_start sub_020C5474
sub_020C5474: ; 0x020C5474
	tst r1, #0x20000000
	movne r0, r1, lsl #0x10
	movne r0, r0, lsr #0x10
	bxne lr
	mov r3, r1, lsl #0x10
	add r3, r0, r3, lsr #16
	tst r1, #0xc0000000
	ldreqb r0, [r3, r2]
	bxeq lr
	ldr r0, _020C555C ; =0x1FFF0000
	tst r1, #0x40000000
	and r0, r1, r0
	mov r0, r0, lsr #0x10
	beq _020C54E8
	tst r2, #1
	beq _020C54E0
	cmp r2, r0
	addhi r0, r3, r0, lsr #1
	ldrhib r0, [r0, #1]
	bxhi lr
	add r0, r3, r2, lsr #1
	ldrb r1, [r3, r2, lsr #1]
	ldrb r0, [r0, #1]
	add r0, r1, r0
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bx lr
_020C54E0:
	ldrb r0, [r3, r2, lsr #1]
	bx lr
_020C54E8:
	ands r1, r2, #3
	beq _020C5554
	cmp r2, r0
	addhi r0, r3, r0, lsr #2
	ldrhib r0, [r1, r0]
	bxhi lr
	tst r2, #1
	beq _020C5538
	tst r2, #2
	movne r2, r2, lsr #2
	addne r0, r2, #1
	moveq r0, r2, lsr #2
	ldrb r1, [r3, r0]
	addeq r2, r0, #1
	ldrb r0, [r3, r2]
	add r1, r1, r1, lsl #1
	add r0, r1, r0
	mov r0, r0, lsl #0xe
	mov r0, r0, lsr #0x10
	bx lr
_020C5538:
	add r0, r3, r2, lsr #2
	ldrb r1, [r3, r2, lsr #2]
	ldrb r0, [r0, #1]
	add r0, r1, r0
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bx lr
_020C5554:
	ldrb r0, [r3, r2, lsr #2]
	bx lr
	.align 2, 0
_020C555C: .word 0x1FFF0000
	arm_func_end sub_020C5474

	arm_func_start sub_020C5560
sub_020C5560: ; 0x020C5560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	cmp r2, #0
	ldrne r0, [r2, #8]
	mov sb, r1
	cmpne r0, #0
	addne r7, r2, r0
	ldr r0, _020C5630 ; =_02110A14
	add r1, sl, #0x1a
	ldr r3, [r0]
	mov r0, #0
	str r3, [sl, #0xc]
	ldrb r2, [r2, #0x18]
	moveq r7, #0
	strb r2, [sl, #0x19]
	mov r2, r2, lsl #1
	bl sub_020D4790
	ldrb r0, [sb, #9]
	mov r6, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, r6
	add r5, sb, #8
	mov fp, r6
	mvn r4, #0
_020C55C4:
	cmp r5, #0
	beq _020C55F0
	ldrb r0, [sb, #9]
	cmp r6, r0
	bhs _020C55F0
	ldrh r0, [sb, #0xe]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, r8
	b _020C55F4
_020C55F0:
	mov r1, fp
_020C55F4:
	cmp r7, #0
	moveq r0, r4
	beq _020C5608
	add r0, r7, #4
	bl sub_020C39D8
_020C5608:
	cmp r0, #0
	orrge r1, r6, #0x100
	addge r0, sl, r0, lsl #1
	strgeh r1, [r0, #0x1a]
	ldrb r0, [sb, #9]
	add r6, r6, #1
	add r8, r8, #0x10
	cmp r6, r0
	blo _020C55C4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5630: .word _02110A14
	arm_func_end sub_020C5560

	arm_func_start sub_020C5634
sub_020C5634: ; 0x020C5634
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, [r1, #8]
	ldr r1, [r1]
	mov r7, r0
	mov r5, r1, asr #0xc
	adds r3, r4, #8
	beq _020C567C
	ldrb r1, [r4, #9]
	mov r0, r2, lsl #0x10
	mov r2, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bls _020C567C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r3, r1]
	add r1, r3, r1
	add r1, r1, #4
	mla r6, r0, r2, r1
	b _020C5680
_020C567C:
	mov r6, #0
_020C5680:
	ldr r1, [r6]
	mov r0, r4
	mov r2, r5
	bl sub_020C530C
	mov r8, r0
	ldr r1, [r6, #4]
	mov r0, r4
	mov r2, r5
	bl sub_020C530C
	ldr r1, [r7, #4]
	orr r0, r8, r0, lsl #16
	tst r1, #0x8000
	movne r1, #1
	moveq r1, #0
	orr r0, r0, r1, lsl #15
	str r0, [r7, #4]
	ldr r1, [r6, #0xc]
	mov r0, r4
	mov r2, r5
	bl sub_020C530C
	mov r8, r0
	ldr r1, [r6, #8]
	mov r0, r4
	mov r2, r5
	bl sub_020C530C
	ldr r1, [r7, #8]
	orr r0, r0, r8, lsl #16
	tst r1, #0x8000
	movne r1, #1
	moveq r1, #0
	orr r0, r0, r1, lsl #15
	str r0, [r7, #8]
	ldr r1, [r6, #0x10]
	mov r0, r4
	mov r2, r5
	bl sub_020C5474
	ldr r1, [r7, #0xc]
	bic r1, r1, #0x1f0000
	orr r0, r1, r0, lsl #16
	str r0, [r7, #0xc]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020C5634

	arm_func_start sub_020C5724
sub_020C5724: ; 0x020C5724
	tst r1, #0x20000000
	movne r0, r2
	bxne lr
	tst r1, #0xc0000000
	add r0, r0, r2
	beq _020C57E0
	mov r2, r1, lsl #0x10
	tst r1, #0x40000000
	mov ip, r2, lsr #0x10
	beq _020C5774
	tst r3, #1
	beq _020C576C
	cmp r3, ip
	movhi r2, ip, lsr #1
	addhi r3, r2, #1
	bhi _020C57E0
	mov r3, r3, lsr #1
	b _020C57F4
_020C576C:
	mov r3, r3, lsr #1
	b _020C57E0
_020C5774:
	ands r2, r3, #3
	beq _020C57DC
	cmp r3, ip
	addhi r3, r2, ip, lsr #2
	bhi _020C57E0
	tst r3, #1
	beq _020C57D4
	tst r3, #2
	movne r3, r3, lsr #2
	addne r2, r3, #1
	moveq r2, r3, lsr #2
	addeq r3, r2, #1
	tst r1, #0x10000000
	ldreq r2, [r0, r2, lsl #2]
	ldreq r1, [r0, r3, lsl #2]
	beq _020C57C4
	mov r2, r2, lsl #1
	mov r1, r3, lsl #1
	ldrsh r2, [r0, r2]
	ldrsh r1, [r0, r1]
_020C57C4:
	add r0, r2, r2, lsl #1
	add r0, r0, r1
	mov r0, r0, asr #2
	bx lr
_020C57D4:
	mov r3, r3, lsr #2
	b _020C57F4
_020C57DC:
	mov r3, r3, lsr #2
_020C57E0:
	tst r1, #0x10000000
	movne r1, r3, lsl #1
	ldrnesh r0, [r0, r1]
	ldreq r0, [r0, r3, lsl #2]
	bx lr
_020C57F4:
	tst r1, #0x10000000
	addeq r1, r0, r3, lsl #2
	ldreq r0, [r0, r3, lsl #2]
	ldreq r1, [r1, #4]
	beq _020C5818
	add r1, r0, r3, lsl #1
	mov r2, r3, lsl #1
	ldrsh r0, [r0, r2]
	ldrsh r1, [r1, #2]
_020C5818:
	add r0, r0, r1
	mov r0, r0, asr #1
	bx lr
	arm_func_end sub_020C5724

	arm_func_start sub_020C5824
sub_020C5824: ; 0x020C5824
	tst r1, #0x20000000
	movne r0, r2
	bxne lr
	tst r1, #0xc0000000
	add r0, r0, r2
	beq _020C58F4
	mov r2, r1, lsl #0x10
	tst r1, #0x40000000
	mov r2, r2, lsr #0x10
	beq _020C5874
	tst r3, #1
	beq _020C586C
	cmp r3, r2
	movhi r1, r2, lsr #1
	addhi r3, r1, #1
	bhi _020C58F4
	mov r1, r3, lsr #1
	b _020C58FC
_020C586C:
	mov r3, r3, lsr #1
	b _020C58F4
_020C5874:
	ands r1, r3, #3
	beq _020C58F0
	cmp r3, r2
	addhi r3, r1, r2, lsr #2
	bhi _020C58F4
	tst r3, #1
	beq _020C58E8
	tst r3, #2
	movne r3, r3, lsr #2
	addne r1, r3, #1
	moveq r1, r3, lsr #2
	add r2, r0, r1, lsl #2
	mov ip, r1, lsl #2
	addeq r3, r1, #1
	add r1, r0, r3, lsl #2
	ldrsh r2, [r2, #2]
	mov r3, r3, lsl #2
	ldrsh ip, [r0, ip]
	ldrsh r1, [r1, #2]
	ldrsh r3, [r0, r3]
	add r2, r2, r2, lsl #1
	add r0, r2, r1
	add ip, ip, ip, lsl #1
	mov r1, r0, asr #2
	add r2, ip, r3
	mov r0, r2, lsl #0xe
	mov r1, r1, lsl #0x10
	orr r0, r1, r0, lsr #16
	bx lr
_020C58E8:
	mov r1, r3, lsr #2
	b _020C58FC
_020C58F0:
	mov r3, r3, lsr #2
_020C58F4:
	ldr r0, [r0, r3, lsl #2]
	bx lr
_020C58FC:
	add r3, r0, r1, lsl #2
	mov ip, r1, lsl #2
	ldrsh r2, [r3, #2]
	ldrsh r1, [r3, #6]
	ldrsh ip, [r0, ip]
	ldrsh r3, [r3, #4]
	add r0, r2, r1
	mov r1, r0, asr #1
	add r0, ip, r3
	mov r0, r0, lsl #0xf
	mov r1, r1, lsl #0x10
	orr r0, r1, r0, lsr #16
	bx lr
	arm_func_end sub_020C5824

	arm_func_start sub_020C5930
sub_020C5930: ; 0x020C5930
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r2
	mov r5, r3
	adds r3, r7, #8
	beq _020C596C
	ldrb r0, [r7, #9]
	cmp r1, r0
	bhs _020C596C
	ldrh r2, [r7, #0xe]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r4, r0, r1, r2
	b _020C5970
_020C596C:
	mov r4, #0
_020C5970:
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	mov r0, r7
	mov r3, r6
	ldr r8, [r5]
	bl sub_020C5724
	mov sb, r0
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, r7
	mov r3, r6
	bl sub_020C5724
	cmp sb, #0
	cmpeq r0, #0
	strne sb, [r5, #0x24]
	strne r0, [r5, #0x28]
	orreq r8, r8, #4
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	bicne r8, r8, #4
	mov r0, r7
	mov r3, r6
	bl sub_020C5824
	cmp r0, #0x10000000
	orreq r8, r8, #2
	beq _020C59E8
	strh r0, [r5, #0x20]
	mov r0, r0, lsr #0x10
	strh r0, [r5, #0x22]
	bic r8, r8, #2
_020C59E8:
	mov r0, r7
	mov r3, r6
	ldmia r4, {r1, r2}
	bl sub_020C5724
	mov sb, r0
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	mov r0, r7
	mov r3, r6
	bl sub_020C5724
	cmp sb, #0x1000
	cmpeq r0, #0x1000
	orreq r8, r8, #1
	strne sb, [r5, #0x18]
	strne r0, [r5, #0x1c]
	bicne r8, r8, #1
	str r8, [r5]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020C5930

	arm_func_start sub_020C5A30
sub_020C5A30: ; 0x020C5A30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	cmp r2, #0
	ldrne r0, [r2, #8]
	mov sb, r1
	cmpne r0, #0
	addne r7, r2, r0
	ldr r0, _020C5B00 ; =_02110A0C
	add r1, sl, #0x1a
	ldr r3, [r0]
	mov r0, #0
	str r3, [sl, #0xc]
	ldrb r2, [r2, #0x18]
	moveq r7, #0
	strb r2, [sl, #0x19]
	mov r2, r2, lsl #1
	bl sub_020D4790
	ldrb r0, [sb, #9]
	mov r6, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, r6
	add r5, sb, #8
	mov fp, r6
	mvn r4, #0
_020C5A94:
	cmp r5, #0
	beq _020C5AC0
	ldrb r0, [sb, #9]
	cmp r6, r0
	bhs _020C5AC0
	ldrh r0, [sb, #0xe]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, r8
	b _020C5AC4
_020C5AC0:
	mov r1, fp
_020C5AC4:
	cmp r7, #0
	moveq r0, r4
	beq _020C5AD8
	add r0, r7, #4
	bl sub_020C39D8
_020C5AD8:
	cmp r0, #0
	orrge r1, r6, #0x100
	addge r0, sl, r0, lsl #1
	strgeh r1, [r0, #0x1a]
	ldrb r0, [sb, #9]
	add r6, r6, #1
	add r8, r8, #0x10
	cmp r6, r0
	blo _020C5A94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5B00: .word _02110A0C
	arm_func_end sub_020C5A30

	arm_func_start sub_020C5B04
sub_020C5B04: ; 0x020C5B04
	stmdb sp!, {r4, lr}
	ldr ip, [r1]
	mov r4, r0
	mov r2, r2, lsl #0x10
	ldr r0, [r1, #8]
	mov r1, r2, lsr #0x10
	mov r3, r4
	mov r2, ip, asr #0xc
	bl sub_020C5930
	ldr r0, [r4, #0x10]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x40000000
	str r0, [r4, #0x10]
	ldr r0, [r4]
	orr r0, r0, #8
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C5B04

	arm_func_start sub_020C5B48
sub_020C5B48: ; 0x020C5B48
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	cmp r2, #0
	ldrne r0, [r2, #8]
	mov sb, r1
	cmpne r0, #0
	addne r7, r2, r0
	ldr r0, _020C5C20 ; =_02110A10
	add r1, sl, #0x1a
	ldr r3, [r0]
	mov r0, #0
	str r3, [sl, #0xc]
	ldrb r2, [r2, #0x18]
	moveq r7, #0
	strb r2, [sl, #0x19]
	str sb, [sl, #8]
	ldrb r2, [sl, #0x19]
	mov r2, r2, lsl #1
	bl sub_020D4790
	ldrb r0, [sb, #0xd]
	mov r6, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, r6
	add r5, sb, #0xc
	mov fp, r6
	mvn r4, #0
_020C5BB4:
	cmp r5, #0
	beq _020C5BE0
	ldrb r0, [sb, #0xd]
	cmp r6, r0
	bhs _020C5BE0
	ldrh r0, [sb, #0x12]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, r8
	b _020C5BE4
_020C5BE0:
	mov r1, fp
_020C5BE4:
	cmp r7, #0
	moveq r0, r4
	beq _020C5BF8
	add r0, r7, #4
	bl sub_020C39D8
_020C5BF8:
	cmp r0, #0
	orrge r1, r6, #0x100
	addge r0, sl, r0, lsl #1
	strgeh r1, [r0, #0x1a]
	ldrb r0, [sb, #0xd]
	add r6, r6, #1
	add r8, r8, #0x10
	cmp r6, r0
	blo _020C5BB4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5C20: .word _02110A10
	arm_func_end sub_020C5B48

	arm_func_start sub_020C5C24
sub_020C5C24: ; 0x020C5C24
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r2
	moveq r0, #0
	beq _020C5C40
	add r0, r5, #0x3c
	bl sub_020C3818
_020C5C40:
	ldr r1, [r0]
	ldr r3, [r4, #0x10]
	and r1, r1, #0x1c000000
	cmp r1, #0x14000000
	ldrne r1, [r5, #8]
	ldr r2, _020C5CF4 ; =0x000007FF
	ldreq r1, [r5, #0x18]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bic r5, r1, #0xe0000000
	ldr r1, _020C5CF8 ; =0xC00F0000
	and r3, r3, r1
	str r3, [r4, #0x10]
	ldr r1, [r0]
	add r1, r1, r5
	orr r1, r3, r1
	str r1, [r4, #0x10]
	ldr r1, [r0, #4]
	and r1, r1, r2
	strh r1, [r4, #0x2c]
	ldr r1, [r0, #4]
	and r1, r1, r2, lsl #11
	mov r1, r1, lsr #0xb
	strh r1, [r4, #0x2e]
	ldr r0, [r0, #4]
	ldrh r1, [r4, #0x2c]
	and r3, r0, r2
	and r0, r0, r2, lsl #11
	cmp r3, r1
	mov r5, r0, lsr #0xb
	moveq r0, #0x1000
	beq _020C5CCC
	mov r0, r3, lsl #0xc
	mov r1, r1, lsl #0xc
	bl sub_020CCBA0
_020C5CCC:
	str r0, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	cmp r5, r1
	moveq r0, #0x1000
	beq _020C5CEC
	mov r0, r5, lsl #0xc
	mov r1, r1, lsl #0xc
	bl sub_020CCBA0
_020C5CEC:
	str r0, [r4, #0x34]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C5CF4: .word 0x000007FF
_020C5CF8: .word 0xC00F0000
	arm_func_end sub_020C5C24

	arm_func_start sub_020C5CFC
sub_020C5CFC: ; 0x020C5CFC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	ldrneh r0, [r5, #0x34]
	mov r4, r2
	cmpne r0, #0
	moveq r0, #0
	beq _020C5D20
	add r0, r5, r0
	bl sub_020C3818
_020C5D20:
	ldr r1, [r5, #0x2c]
	ldrh r2, [r0, #2]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bic r1, r1, #0xe0000000
	mov r1, r1, lsl #0x10
	tst r2, #1
	mov r1, r1, lsr #0x10
	ldrh r0, [r0]
	bne _020C5D58
	mov r0, r0, lsl #0xf
	mov r1, r1, lsl #0xf
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
_020C5D58:
	add r0, r0, r1
	str r0, [r4, #0x14]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C5CFC

	arm_func_start sub_020C5D64
sub_020C5D64: ; 0x020C5D64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r3, [r6]
	ldr r5, [r6, #8]
	mov r1, r2, lsl #0x10
	mov r2, r3, lsl #4
	mov r7, r0
	mov r0, r5
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	bl sub_020C3C44
	mov r4, r0
	ldrb r1, [r4, #2]
	mov r0, r5
	bl sub_020C3BEC
	mov r1, r0
	ldr r0, [r6, #0x14]
	mov r2, r7
	bl sub_020C5C24
	ldrb r1, [r4, #3]
	cmp r1, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl sub_020C3C18
	mov r1, r0
	ldr r0, [r6, #0x14]
	mov r2, r7
	bl sub_020C5CFC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C5D64

	arm_func_start sub_020C5DD8
sub_020C5DD8: ; 0x020C5DD8
	ldr r3, _020C5E20 ; =_02110A04
	mov ip, #0
	ldr r3, [r3]
	str r3, [r0, #0xc]
	ldrb r2, [r2, #0x17]
	strb r2, [r0, #0x19]
	str r1, [r0, #8]
	ldrb r1, [r0, #0x19]
	cmp r1, #0
	bxls lr
_020C5E00:
	orr r2, ip, #0x100
	add r1, r0, ip, lsl #1
	strh r2, [r1, #0x1a]
	ldrb r1, [r0, #0x19]
	add ip, ip, #1
	cmp ip, r1
	blo _020C5E00
	bx lr
	.align 2, 0
_020C5E20: .word _02110A04
	arm_func_end sub_020C5DD8

	arm_func_start sub_020C5E24
sub_020C5E24: ; 0x020C5E24
	stmdb sp!, {r3, lr}
	ldr lr, [r1, #8]
	ldr r3, [r1]
	ldrh r1, [lr, #6]
	mov ip, r3, asr #0xc
	mov r3, #1
	mla r2, ip, r1, r2
	mov r1, r2, lsr #5
	add r1, lr, r1, lsl #2
	ldr r1, [r1, #0xc]
	and r2, r2, #0x1f
	and r1, r1, r3, lsl r2
	str r1, [r0]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C5E24

	arm_func_start sub_020C5E5C
sub_020C5E5C: ; 0x020C5E5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	tst r0, #4
	bne _020C5EA0
	tst r0, #2
	bne _020C5E8C
	add r1, r4, #0x28
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
	b _020C5EB8
_020C5E8C:
	add r1, r4, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl sub_020C2528
	b _020C5EB8
_020C5EA0:
	tst r0, #2
	bne _020C5EB8
	add r1, r4, #0x28
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
_020C5EB8:
	ldr r0, [r4]
	tst r0, #1
	ldmneia sp!, {r4, pc}
	add r1, r4, #4
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C5E5C

	arm_func_start sub_020C5ED8
sub_020C5ED8: ; 0x020C5ED8
	tst r3, #4
	beq _020C5EF0
	ldr r1, [r0]
	orr r1, r1, #1
	str r1, [r0]
	b _020C5F08
_020C5EF0:
	ldr r2, [r1]
	str r2, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #8]
	ldr r1, [r1, #8]
	str r1, [r0, #0xc]
_020C5F08:
	ldr r1, [r0]
	orr r1, r1, #0x18
	str r1, [r0]
	bx lr
	arm_func_end sub_020C5ED8

	arm_func_start sub_020C5F18
sub_020C5F18: ; 0x020C5F18
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, #0
	tst r0, #4
	moveq r4, #1
	tst r0, #0x20
	beq _020C5F6C
	tst r0, #8
	bne _020C5F6C
	cmp r4, #0
	beq _020C5F5C
	add r1, r5, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl sub_020C2528
	mov r4, #0
_020C5F5C:
	add r1, r5, #0x10
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
_020C5F6C:
	ldr r0, [r5]
	tst r0, #2
	bne _020C5FA4
	cmp r4, #0
	add r1, r5, #0x28
	beq _020C5F94
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
	b _020C5FBC
_020C5F94:
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
	b _020C5FBC
_020C5FA4:
	cmp r4, #0
	beq _020C5FBC
	add r1, r5, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl sub_020C2528
_020C5FBC:
	ldr r0, [r5]
	tst r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	add r1, r5, #4
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C5F18

	arm_func_start sub_020C5FDC
sub_020C5FDC: ; 0x020C5FDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov ip, r0
	tst r3, #4
	ldrb r0, [r2, #3]
	beq _020C6030
	ldr r1, [ip]
	tst r0, #2
	orr r1, r1, #1
	str r1, [ip]
	beq _020C60A8
	ldr r1, _020C611C ; =0x021DA700
	ldrb r7, [r2, #1]
	ldr r1, [r1]
	mov r3, #1
	add r6, r1, #0xc4
	mov r5, r7, lsr #5
	ldr r4, [r6, r5, lsl #2]
	and r1, r7, #0x1f
	orr r1, r4, r3, lsl r1
	str r1, [r6, r5, lsl #2]
	b _020C60A8
_020C6030:
	ldr r3, [r1]
	tst r0, #2
	str r3, [ip, #4]
	ldr r3, [r1, #4]
	str r3, [ip, #8]
	ldr r3, [r1, #8]
	str r3, [ip, #0xc]
	beq _020C60A8
	ldr r3, _020C611C ; =0x021DA700
	ldrb r8, [r2, #1]
	ldr r4, [r3]
	mov r3, #0x18
	add r7, r4, #0xc4
	mov r6, r8, lsr #5
	and r4, r8, #0x1f
	mov r5, #1
	mvn r4, r5, lsl r4
	ldr lr, [r7, r6, lsl #2]
	smulbb r5, r8, r3
	and r3, lr, r4
	str r3, [r7, r6, lsl #2]
	ldr r4, [r1, #0xc]
	ldr r3, _020C6120 ; =0x021DB510
	ldr lr, _020C6124 ; =0x021DB514
	str r4, [r3, r5]
	ldr r4, [r1, #0x10]
	ldr r3, _020C6128 ; =0x021DB518
	str r4, [lr, r5]
	ldr r1, [r1, #0x14]
	str r1, [r3, r5]
_020C60A8:
	tst r0, #1
	beq _020C610C
	ldrb r3, [r2, #2]
	ldr r1, [ip]
	ldr r0, _020C611C ; =0x021DA700
	orr r1, r1, #0x20
	str r1, [ip]
	ldr r1, [r0]
	mov r0, r3, lsr #5
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0xc4]
	and r1, r3, #0x1f
	mov r2, #1
	tst r0, r2, lsl r1
	beq _020C60F4
	ldr r0, [ip]
	orr r0, r0, #8
	str r0, [ip]
	b _020C610C
_020C60F4:
	ldr r1, _020C6120 ; =0x021DB510
	mov r0, #0x18
	mla r0, r3, r0, r1
	add r3, ip, #0x10
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
_020C610C:
	ldr r0, [ip]
	orr r0, r0, #0x10
	str r0, [ip]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C611C: .word 0x021DA700
_020C6120: .word 0x021DB510
_020C6124: .word 0x021DB514
_020C6128: .word 0x021DB518
	arm_func_end sub_020C5FDC

	arm_func_start sub_020C612C
sub_020C612C: ; 0x020C612C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl sub_020CCCD8
	ldrsh r5, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r0, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r6, [sl]
	str r4, [sl, #0x14]
	bl sub_020CCC44
	mov r1, fp
	rsb r2, r5, #0
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl sub_020CCCD8
	sub r0, r5, r4
	add r1, r7, r6
	ldr r5, [sb, #0x18]
	ldrh r4, [sb, #0x2c]
	sub r2, r5, r1
	ldr r1, [sb, #0x24]
	mul r3, r4, r2
	smull r2, r1, r5, r1
	mov r2, r2, lsr #8
	orr r2, r2, r1, lsl #24
	mul r1, r4, r2
	rsb r1, r1, r3, lsl #3
	str r1, [sl, #0x30]
	ldr r4, [sb, #0x1c]
	ldrh r3, [sb, #0x2e]
	sub r0, r0, r4
	add r0, r0, #0x2000
	mul r2, r3, r0
	ldr r0, [sb, #0x28]
	smull r1, r0, r4, r0
	mov r1, r1, lsr #8
	orr r1, r1, r0, lsl #24
	mul r0, r3, r1
	add r0, r0, r2, lsl #3
	str r0, [sl, #0x34]
	bl sub_020CCC44
	mul r0, r7, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C612C

	arm_func_start sub_020C6234
sub_020C6234: ; 0x020C6234
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl sub_020CCCD8
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl sub_020CCC44
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	rsb r2, r2, #0
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl sub_020CCCD8
	ldrsh r2, [r5, #0x20]
	ldrsh r1, [r5, #0x22]
	ldrh r3, [r5, #0x2c]
	ldr r0, [r5, #0x24]
	add r1, r2, r1
	rsb r1, r1, #0
	add r2, r1, #0x1000
	mul r1, r0, r3
	mul r2, r3, r2
	mov r0, r1, lsl #4
	rsb r0, r0, r2, lsl #3
	str r0, [r6, #0x30]
	ldrsh r2, [r5, #0x20]
	ldrsh r1, [r5, #0x22]
	ldrh r3, [r5, #0x2e]
	ldr r0, [r5, #0x28]
	sub r1, r2, r1
	add r2, r1, #0x1000
	mul r1, r0, r3
	mul r2, r3, r2
	mov r0, r1, lsl #4
	add r0, r0, r2, lsl #3
	str r0, [r6, #0x34]
	bl sub_020CCC44
	ldrsh r1, [r5, #0x20]
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C6234

	arm_func_start sub_020C6304
sub_020C6304: ; 0x020C6304
	stmdb sp!, {r4, lr}
	ldr r3, [r1, #0x18]
	mov r2, #0
	str r3, [r0]
	ldr r3, [r1, #0x1c]
	str r3, [r0, #0x14]
	str r2, [r0, #4]
	ldr r4, [r1, #0x18]
	ldr r3, [r1, #0x24]
	ldrh lr, [r1, #0x2c]
	smull ip, r3, r4, r3
	mov r4, ip, lsr #8
	orr r4, r4, r3, lsl #24
	rsb r3, r4, #0
	mul r3, lr, r3
	str r3, [r0, #0x30]
	ldr r4, [r1, #0x1c]
	ldr ip, [r1, #0x28]
	mov r3, r4, lsl #1
	smull lr, ip, r4, ip
	rsb r4, r3, #0
	mov r3, lr, lsr #8
	ldrh lr, [r1, #0x2e]
	add r1, r4, #0x2000
	orr r3, r3, ip, lsl #24
	mul r4, lr, r1
	mul r1, lr, r3
	add r1, r1, r4, lsl #3
	str r1, [r0, #0x34]
	str r2, [r0, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C6304

	arm_func_start sub_020C6380
sub_020C6380: ; 0x020C6380
	mov r2, #0x1000
	str r2, [r0]
	str r2, [r0, #0x14]
	mov ip, #0
	str ip, [r0, #4]
	ldrh r2, [r1, #0x2c]
	ldr r3, [r1, #0x24]
	mul r2, r3, r2
	rsb r2, r2, #0
	mov r2, r2, lsl #4
	str r2, [r0, #0x30]
	ldrh r2, [r1, #0x2e]
	ldr r1, [r1, #0x28]
	mul r2, r1, r2
	mov r1, r2, lsl #4
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end sub_020C6380

	arm_func_start sub_020C63C8
sub_020C63C8: ; 0x020C63C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl sub_020CCCD8
	ldrsh r5, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r0, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r6, [sl]
	str r4, [sl, #0x14]
	bl sub_020CCC44
	mov r1, fp
	rsb r2, r5, #0
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl sub_020CCCD8
	sub r1, r5, r4
	add r0, r7, r6
	ldrh r3, [sb, #0x2c]
	ldr r2, [sb, #0x18]
	sub r0, r2, r0
	mul r0, r3, r0
	mov r0, r0, lsl #3
	str r0, [sl, #0x30]
	ldrh r2, [sb, #0x2e]
	ldr r0, [sb, #0x1c]
	sub r0, r1, r0
	add r0, r0, #0x2000
	mul r0, r2, r0
	mov r0, r0, lsl #3
	str r0, [sl, #0x34]
	bl sub_020CCC44
	mul r0, r7, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C63C8

	arm_func_start sub_020C64A8
sub_020C64A8: ; 0x020C64A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl sub_020CCCD8
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl sub_020CCC44
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	rsb r2, r2, #0
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl sub_020CCCD8
	ldrsh r1, [r5, #0x20]
	ldrsh r0, [r5, #0x22]
	ldrh r2, [r5, #0x2c]
	add r0, r1, r0
	rsb r0, r0, #0
	add r0, r0, #0x1000
	mul r0, r2, r0
	mov r0, r0, lsl #3
	str r0, [r6, #0x30]
	ldrsh r1, [r5, #0x20]
	ldrsh r0, [r5, #0x22]
	ldrh r2, [r5, #0x2e]
	sub r0, r1, r0
	add r0, r0, #0x1000
	mul r0, r2, r0
	mov r0, r0, lsl #3
	str r0, [r6, #0x34]
	bl sub_020CCC44
	ldrsh r1, [r5, #0x20]
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C64A8

	arm_func_start sub_020C6560
sub_020C6560: ; 0x020C6560
	ldr r2, [r1, #0x18]
	mov ip, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str ip, [r0, #4]
	str ip, [r0, #0x30]
	ldr r2, [r1, #0x1c]
	ldrh r3, [r1, #0x2e]
	mov r1, r2, lsl #1
	rsb r1, r1, #0
	add r1, r1, #0x2000
	mul r1, r3, r1
	mov r1, r1, lsl #3
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end sub_020C6560

	arm_func_start sub_020C65A4
sub_020C65A4: ; 0x020C65A4
	mov r2, #0x1000
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end sub_020C65A4

	arm_func_start sub_020C65C8
sub_020C65C8: ; 0x020C65C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r4, r0
	ldr r0, [r4]
	mov r1, #0
	tst r0, #8
	ldrne r0, _020C6704 ; =0x00101610
	mov r3, #3
	strne r0, [sp]
	ldreq r0, _020C6708 ; =0x00101810
	mov r2, #2
	streq r0, [sp]
	mov r0, #0x1000
	str r0, [sp, #0x44]
	str r3, [sp, #4]
	str r2, [sp, #0x48]
	str r1, [sp, #0x40]
	str r1, [sp, #0x34]
	str r1, [sp, #0x30]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x28]
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r1, [r4]
	ldr r0, _020C670C ; =_02110C1C
	and r1, r1, #7
	ldr r2, [r0, r1, lsl #2]
	add r0, sp, #8
	mov r1, r4
	blx r2
	ldr r3, [r4, #0x30]
	cmp r3, #0x1000
	beq _020C6698
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	ldr r0, [sp, #0x38]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0xc]
	ldr r1, [r4, #0x30]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x38]
_020C6698:
	ldr r3, [r4, #0x34]
	cmp r3, #0x1000
	beq _020C66E8
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x18]
	ldr r2, [r4, #0x34]
	ldr r0, [sp, #0x3c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x1c]
	ldr r1, [r4, #0x34]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x3c]
_020C66E8:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0x12
	bl sub_020C2528
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020C6704: .word 0x00101610
_020C6708: .word 0x00101810
_020C670C: .word _02110C1C
	arm_func_end sub_020C65C8

	arm_func_start sub_020C6710
sub_020C6710: ; 0x020C6710
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	ldr r0, [r6]
	mov r4, #0
	ands r5, r0, #0x18
	bne _020C673C
	add r1, r6, #0x1c
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
_020C673C:
	ldr r0, [r6]
	tst r0, #4
	bne _020C67AC
	cmp r5, #0
	movne r4, #1
	bne _020C67AC
	ldr r2, [r6, #0x4c]
	ldr r0, [r6, #0x10]
	add r1, sp, #0
	smull r3, r0, r2, r0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp]
	ldr r3, [r6, #0x50]
	ldr r2, [r6, #0x14]
	mov r0, #0x1c
	smull ip, r2, r3, r2
	mov r3, ip, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sp, #4]
	ldr ip, [r6, #0x54]
	ldr r3, [r6, #0x18]
	mov r2, #3
	smull lr, r3, ip, r3
	mov ip, lr, lsr #0xc
	orr ip, ip, r3, lsl #20
	str ip, [sp, #8]
	bl sub_020C2528
_020C67AC:
	ldr r0, [r6]
	tst r0, #2
	bne _020C67E4
	cmp r4, #0
	add r1, r6, #0x28
	beq _020C67D4
	mov r0, #0x19
	mov r2, #0xc
	bl sub_020C2528
	b _020C67FC
_020C67D4:
	mov r0, #0x1a
	mov r2, #9
	bl sub_020C2528
	b _020C67FC
_020C67E4:
	cmp r4, #0
	beq _020C67FC
	add r1, r6, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl sub_020C2528
_020C67FC:
	cmp r5, #0
	bne _020C6814
	add r1, r6, #0x10
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
_020C6814:
	ldr r0, [r6]
	tst r0, #1
	addne sp, sp, #0xc
	ldmneia sp!, {r3, r4, r5, r6, pc}
	add r1, r6, #4
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020C6710

	arm_func_start sub_020C683C
sub_020C683C: ; 0x020C683C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	tst r3, #4
	ldrb r4, [r2, #1]
	ldrb r0, [r2, #2]
	beq _020C68D8
	ldr r2, [r5]
	ldr r1, _020C6A3C ; =0x021DA700
	orr r2, r2, #1
	str r2, [r5]
	ldr r3, [r1]
	mov r1, r0, lsr #5
	add r1, r3, r1, lsl #2
	ldr r1, [r1, #0xc4]
	and r2, r0, #0x1f
	mov r6, #1
	tst r1, r6, lsl r2
	beq _020C68AC
	add r3, r3, #0xc4
	mov r2, r4, lsr #5
	ldr r1, [r3, r2, lsl #2]
	and r0, r4, #0x1f
	orr r0, r1, r6, lsl r0
	str r0, [r3, r2, lsl #2]
	ldr r0, [r5]
	orr r0, r0, #0x18
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C68AC:
	mov r2, #0x18
	ldr r7, _020C6A40 ; =0x021DB504
	mul r6, r0, r2
	mla r1, r4, r2, r7
	add r0, r7, r6
	bl sub_020D4808
	add r0, r7, r6
	add r1, r5, #0x10
	mov r2, #0x18
	bl sub_020D4808
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C68D8:
	ldr r3, [r1]
	ldr r2, _020C6A3C ; =0x021DA700
	str r3, [r5, #4]
	ldr r3, [r1, #4]
	mov r7, r0, lsr #5
	str r3, [r5, #8]
	ldr r3, [r1, #8]
	and r8, r0, #0x1f
	str r3, [r5, #0xc]
	ldr r6, [r2]
	mov r3, #1
	add r2, r6, r7, lsl #2
	ldr r2, [r2, #0xc4]
	tst r2, r3, lsl r8
	mov r2, #0x18
	beq _020C6960
	ldr r3, _020C6A40 ; =0x021DB504
	mov r0, r1
	mla r1, r4, r2, r3
	bl sub_020D4808
	ldr r0, _020C6A3C ; =0x021DA700
	mov r2, r4, lsr #5
	ldr r1, [r0]
	and r0, r4, #0x1f
	add r3, r1, #0xc4
	mov r1, #1
	mvn r0, r1, lsl r0
	ldr r1, [r3, r2, lsl #2]
	and r0, r1, r0
	str r0, [r3, r2, lsl #2]
	ldr r0, [r5]
	orr r0, r0, #0x18
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C6960:
	mul ip, r0, r2
	and r7, r4, #0x1f
	mvn r7, r3, lsl r7
	add r6, r6, #0xc4
	mov lr, r4, lsr #5
	ldr r8, [r6, lr, lsl #2]
	mul r3, r4, r2
	and r4, r8, r7
	str r4, [r6, lr, lsl #2]
	ldr r0, _020C6A40 ; =0x021DB504
	ldr r7, [r1]
	ldr r4, [r0, ip]
	ldr r6, _020C6A44 ; =0x021DB508
	smull r8, r4, r7, r4
	mov r7, r8, lsr #0xc
	orr r7, r7, r4, lsl #20
	str r7, [r0, r3]
	ldr r8, [r1, #4]
	ldr r4, [r6, ip]
	ldr r7, _020C6A48 ; =0x021DB50C
	smull lr, r4, r8, r4
	mov r8, lr, lsr #0xc
	orr r8, r8, r4, lsl #20
	str r8, [r6, r3]
	ldr r8, [r1, #8]
	ldr r4, [r7, ip]
	ldr r6, _020C6A4C ; =0x021DB510
	smull lr, r4, r8, r4
	mov r8, lr, lsr #0xc
	orr r8, r8, r4, lsl #20
	str r8, [r7, r3]
	ldr r7, [r1, #0xc]
	ldr r4, [r6, ip]
	ldr lr, _020C6A50 ; =0x021DB514
	smull r8, r4, r7, r4
	mov r7, r8, lsr #0xc
	orr r7, r7, r4, lsl #20
	str r7, [r6, r3]
	ldr r7, [r1, #0x10]
	ldr r6, [lr, ip]
	ldr r4, _020C6A54 ; =0x021DB518
	smull r8, r6, r7, r6
	mov r7, r8, lsr #0xc
	orr r7, r7, r6, lsl #20
	str r7, [lr, r3]
	ldr r6, [r1, #0x14]
	ldr r1, [r4, ip]
	add r0, r0, ip
	smull ip, r1, r6, r1
	mov r6, ip, lsr #0xc
	orr r6, r6, r1, lsl #20
	add r1, r5, #0x10
	str r6, [r4, r3]
	bl sub_020D4808
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C6A3C: .word 0x021DA700
_020C6A40: .word 0x021DB504
_020C6A44: .word 0x021DB508
_020C6A48: .word 0x021DB50C
_020C6A4C: .word 0x021DB510
_020C6A50: .word 0x021DB514
_020C6A54: .word 0x021DB518
	arm_func_end sub_020C683C

	arm_func_start sub_020C6A58
sub_020C6A58: ; 0x020C6A58
	stmdb sp!, {lr}
	sub sp, sp, #0x3c
	ldr r1, [r0]
	mov r2, #0
	tst r1, #8
	ldrne r1, _020C6C1C ; =0x00101710
	mov r3, #3
	strne r1, [sp]
	ldreq r1, _020C6C20 ; =0x00101910
	str r3, [sp, #4]
	streq r1, [sp]
	mov r1, #2
	str r2, [sp, #0x34]
	str r2, [sp, #0x28]
	str r2, [sp, #0x24]
	str r2, [sp, #0x20]
	str r2, [sp, #0x1c]
	str r2, [sp, #0x14]
	str r2, [sp, #0x10]
	str r2, [sp, #0xc]
	str r1, [sp, #0x38]
	ldr r1, [r0]
	tst r1, #4
	beq _020C6AF0
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	ldr r1, [r0]
	tst r1, #1
	beq _020C6ADC
	mov r1, #0x1000
	str r1, [sp, #8]
	str r1, [sp, #0x18]
	b _020C6B90
_020C6ADC:
	ldr r1, [r0, #0x18]
	str r1, [sp, #8]
	ldr r1, [r0, #0x1c]
	str r1, [sp, #0x18]
	b _020C6B90
_020C6AF0:
	tst r1, #1
	beq _020C6B38
	ldr r2, [r0, #0x24]
	ldrh r1, [r0, #0x2c]
	mov r2, r2, lsl #4
	rsb r2, r2, #0
	mul r1, r2, r1
	str r1, [sp, #0x2c]
	ldr r2, [r0, #0x28]
	ldrh r1, [r0, #0x2e]
	mov r2, r2, lsl #4
	rsb r2, r2, #0
	mul r3, r2, r1
	mov r1, #0x1000
	str r3, [sp, #0x30]
	str r1, [sp, #8]
	str r1, [sp, #0x18]
	b _020C6B90
_020C6B38:
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x24]
	ldrh ip, [r0, #0x2c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #8
	orr r2, r2, r1, lsl #24
	rsb r1, r2, #0
	mul r1, ip, r1
	str r1, [sp, #0x2c]
	ldr r2, [r0, #0x1c]
	ldr r1, [r0, #0x28]
	ldrh ip, [r0, #0x2e]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #8
	orr r2, r2, r1, lsl #24
	rsb r1, r2, #0
	mul r1, ip, r1
	str r1, [sp, #0x30]
	ldr r1, [r0, #0x18]
	str r1, [sp, #8]
	ldr r1, [r0, #0x1c]
	str r1, [sp, #0x18]
_020C6B90:
	ldr ip, [r0, #0x30]
	cmp ip, #0x1000
	beq _020C6BC8
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x2c]
	smull r3, r2, ip, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sp, #8]
	ldr r2, [r0, #0x30]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x2c]
_020C6BC8:
	ldr ip, [r0, #0x34]
	cmp ip, #0x1000
	beq _020C6C00
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x30]
	smull r3, r2, ip, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sp, #0x18]
	ldr r0, [r0, #0x34]
	smull r2, r1, r0, r1
	mov r0, r2, lsr #0xc
	orr r0, r0, r1, lsl #20
	str r0, [sp, #0x30]
_020C6C00:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0xe
	bl sub_020C2528
	add sp, sp, #0x3c
	ldmia sp!, {pc}
	.align 2, 0
_020C6C1C: .word 0x00101710
_020C6C20: .word 0x00101910
	arm_func_end sub_020C6A58

	arm_func_start sub_020C6C24
sub_020C6C24: ; 0x020C6C24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl sub_020CCCD8
	ldrsh r0, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r5, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r7, [sl]
	str r5, [sl, #0x14]
	bl sub_020CCC44
	mov r1, fp
	mul r0, r4, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl sub_020CCCD8
	ldrh r1, [sb, #0x2c]
	ldrh r8, [sb, #0x2e]
	ldr r2, [sb, #0x28]
	rsb r0, r1, #0
	mul r3, r2, r8
	rsb r2, r8, #0
	add r8, r3, r2, lsl #11
	smull r3, r2, r5, r8
	smull r8, r5, r6, r8
	ldr fp, [sb, #0x24]
	mul ip, fp, r1
	rsb r0, ip, r0, lsl #11
	smlal r3, r2, r4, r0
	smull r4, r0, r7, r0
	subs r4, r4, r8
	sbc r0, r0, r5
	mov r4, r4, lsr #8
	orr r4, r4, r0, lsl #24
	add r0, r4, r1, lsl #15
	str r0, [sl, #0x30]
	ldrh r1, [sb, #0x2e]
	mov r0, r3, lsr #8
	orr r0, r0, r2, lsl #24
	add r0, r0, r1, lsl #15
	str r0, [sl, #0x34]
	bl sub_020CCC44
	rsb r1, r6, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C6C24

	arm_func_start sub_020C6D2C
sub_020C6D2C: ; 0x020C6D2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl sub_020CCCD8
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl sub_020CCC44
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl sub_020CCCD8
	ldrh r2, [r5, #0x2c]
	ldrh r4, [r5, #0x2e]
	ldr r1, [r5, #0x28]
	ldr r0, [r5, #0x24]
	mul r3, r1, r4
	rsb r1, r4, #0
	mul r4, r0, r2
	rsb r0, r2, #0
	add r1, r3, r1, lsl #11
	ldrsh r3, [r5, #0x20]
	rsb r0, r4, r0, lsl #11
	ldrsh lr, [r5, #0x22]
	smull ip, r4, r3, r1
	smull r7, r3, lr, r0
	subs r7, r7, ip
	sbc r3, r3, r4
	mov r4, r7, lsr #8
	orr r4, r4, r3, lsl #24
	add r2, r4, r2, lsl #15
	str r2, [r6, #0x30]
	ldrsh r2, [r5, #0x22]
	ldrsh r3, [r5, #0x20]
	ldrh ip, [r5, #0x2e]
	smull r4, r1, r2, r1
	smlal r4, r1, r3, r0
	mov r0, r4, lsr #8
	orr r0, r0, r1, lsl #24
	add r0, r0, ip, lsl #15
	str r0, [r6, #0x34]
	bl sub_020CCC44
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C6D2C

	arm_func_start sub_020C6E14
sub_020C6E14: ; 0x020C6E14
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, [r1, #0x18]
	mov r3, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str r3, [r0, #4]
	ldrh r5, [r1, #0x2c]
	ldr ip, [r1, #0x24]
	ldrh r2, [r1, #0x2e]
	mul lr, ip, r5
	rsb ip, r5, #0
	ldr r4, [r1, #0x18]
	rsb ip, lr, ip, lsl #11
	smull lr, ip, r4, ip
	ldr r6, [r1, #0x28]
	mov r4, lr, lsr #8
	orr r4, r4, ip, lsl #24
	add r4, r4, r5, lsl #15
	str r4, [r0, #0x30]
	mul r4, r6, r2
	rsb r5, r2, #0
	ldr r2, [r1, #0x1c]
	add r4, r4, r5, lsl #11
	smull lr, ip, r2, r4
	mov r2, lr, lsr #8
	ldrh r1, [r1, #0x2e]
	orr r2, r2, ip, lsl #24
	add r1, r2, r1, lsl #15
	str r1, [r0, #0x34]
	str r3, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C6E14

	arm_func_start sub_020C6E94
sub_020C6E94: ; 0x020C6E94
	mov r2, #0x1000
	str r2, [r0]
	str r2, [r0, #0x14]
	mov ip, #0
	str ip, [r0, #4]
	ldr r3, [r1, #0x24]
	ldrh r2, [r1, #0x2c]
	rsb r3, r3, #0
	mul r2, r3, r2
	mov r2, r2, lsl #4
	str r2, [r0, #0x30]
	ldrh r2, [r1, #0x2e]
	ldr r1, [r1, #0x28]
	mul r2, r1, r2
	mov r1, r2, lsl #4
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end sub_020C6E94

	arm_func_start sub_020C6EDC
sub_020C6EDC: ; 0x020C6EDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl sub_020CCCD8
	ldrsh r0, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r5, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r7, [sl]
	str r5, [sl, #0x14]
	bl sub_020CCC44
	mov r1, fp
	mul r0, r4, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl sub_020CCCD8
	ldrh r3, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	rsb r0, r3, #0
	rsb r1, r1, #0
	mov r2, r1, lsl #0xb
	mov fp, r0, lsl #0xb
	smull r1, r0, r7, fp
	smull r8, r7, r5, r2
	smlal r8, r7, r4, fp
	mov r4, r8, lsr #8
	orr r4, r4, r7, lsl #24
	smull r5, r2, r6, r2
	subs r1, r1, r5
	sbc r0, r0, r2
	mov r1, r1, lsr #8
	orr r1, r1, r0, lsl #24
	add r0, r1, r3, lsl #15
	str r0, [sl, #0x30]
	ldrh r0, [sb, #0x2e]
	add r0, r4, r0, lsl #15
	str r0, [sl, #0x34]
	bl sub_020CCC44
	rsb r1, r6, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C6EDC

	arm_func_start sub_020C6FD4
sub_020C6FD4: ; 0x020C6FD4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl sub_020CCCD8
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl sub_020CCC44
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl sub_020CCCD8
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	ldrsh r4, [r5, #0x22]
	rsb r0, r2, #0
	rsb r1, r1, #0
	mov r0, r0, lsl #0xb
	ldrsh r3, [r5, #0x20]
	mov r1, r1, lsl #0xb
	smull r7, lr, r4, r0
	smull ip, r4, r3, r1
	subs r7, r7, ip
	sbc r3, lr, r4
	mov r4, r7, lsr #8
	orr r4, r4, r3, lsl #24
	add r2, r4, r2, lsl #15
	str r2, [r6, #0x30]
	ldrsh r2, [r5, #0x22]
	ldrsh r3, [r5, #0x20]
	ldrh ip, [r5, #0x2e]
	smull r4, r1, r2, r1
	smlal r4, r1, r3, r0
	mov r0, r4, lsr #8
	orr r0, r0, r1, lsl #24
	add r0, r0, ip, lsl #15
	str r0, [r6, #0x34]
	bl sub_020CCC44
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C6FD4

	arm_func_start sub_020C70AC
sub_020C70AC: ; 0x020C70AC
	ldr r2, [r1, #0x18]
	mov ip, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str ip, [r0, #4]
	ldr r3, [r1, #0x18]
	ldrh r2, [r1, #0x2c]
	rsb r3, r3, #0x1000
	mul r2, r3, r2
	mov r2, r2, lsl #3
	str r2, [r0, #0x30]
	ldr r2, [r1, #0x1c]
	ldrh r1, [r1, #0x2e]
	rsb r2, r2, #0x1000
	mul r1, r2, r1
	mov r1, r1, lsl #3
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end sub_020C70AC

	arm_func_start sub_020C70FC
sub_020C70FC: ; 0x020C70FC
	mov r2, #0x1000
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end sub_020C70FC

	arm_func_start sub_020C7120
sub_020C7120: ; 0x020C7120
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r4, r0
	ldr r0, [r4]
	mov r1, #0
	tst r0, #8
	ldrne r0, _020C725C ; =0x00101610
	mov r3, #3
	strne r0, [sp]
	ldreq r0, _020C7260 ; =0x00101810
	mov r2, #2
	streq r0, [sp]
	mov r0, #0x1000
	str r0, [sp, #0x44]
	str r3, [sp, #4]
	str r2, [sp, #0x48]
	str r1, [sp, #0x40]
	str r1, [sp, #0x34]
	str r1, [sp, #0x30]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x28]
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r1, [r4]
	ldr r0, _020C7264 ; =_02110C3C
	and r1, r1, #7
	ldr r2, [r0, r1, lsl #2]
	add r0, sp, #8
	mov r1, r4
	blx r2
	ldr r3, [r4, #0x30]
	cmp r3, #0x1000
	beq _020C71F0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	ldr r0, [sp, #0x38]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0xc]
	ldr r1, [r4, #0x30]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x38]
_020C71F0:
	ldr r3, [r4, #0x34]
	cmp r3, #0x1000
	beq _020C7240
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x18]
	ldr r2, [r4, #0x34]
	ldr r0, [sp, #0x3c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x1c]
	ldr r1, [r4, #0x34]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x3c]
_020C7240:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0x12
	bl sub_020C2528
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020C725C: .word 0x00101610
_020C7260: .word 0x00101810
_020C7264: .word _02110C3C
	arm_func_end sub_020C7120

	arm_func_start sub_020C7268
sub_020C7268: ; 0x020C7268
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r1
	ldrh r2, [r6, #0x2c]
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	mov sl, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, sl
	bl sub_020CCCD8
	ldrsh r3, [r6, #0x22]
	ldr r0, [r6, #0x18]
	ldrsh sb, [r6, #0x20]
	smull r2, r1, r0, r3
	mov r2, r2, lsr #0xc
	ldr r8, [r6, #0x1c]
	orr r2, r2, r1, lsl #20
	str r2, [r7]
	smull r2, r1, r8, r3
	mov r4, r2, lsr #0xc
	orr r4, r4, r1, lsl #20
	smull r2, r1, r0, sb
	mov r5, r2, lsr #0xc
	orr r5, r5, r1, lsl #20
	str r4, [r7, #0x14]
	bl sub_020CCC44
	smull r2, r1, r8, sb
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [r7, #4]
	mov r0, sl
	mov r1, fp
	bl sub_020CCCD8
	ldr lr, [r6, #0x1c]
	ldrsh r2, [r6, #0x20]
	ldr r8, [r6, #0x24]
	ldr r0, [r6, #0x28]
	smull sl, sb, r8, r2
	ldrh r1, [r6, #0x2c]
	smull r3, r2, r0, r2
	ldrsh ip, [r6, #0x22]
	str r1, [sp]
	mov fp, lr, asr #0x1f
	smlal r3, r2, r8, ip
	smull r8, ip, r0, ip
	subs r8, sl, r8
	sbc r0, sb, ip
	mov sb, r8, lsr #0xc
	mov ip, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r3, r2, asr #0xc
	orr ip, ip, r2, lsl #20
	umull sl, r2, sb, lr
	mla r2, sb, fp, r2
	mov r8, r0, asr #0xc
	mla r2, r8, lr, r2
	ldr r1, [r6, #0x18]
	mov r8, sl, lsr #0xc
	orr r8, r8, r2, lsl #20
	add r2, r4, r8
	mov r0, r1, asr #0x1f
	umull r8, r4, ip, r1
	mla r4, ip, r0, r4
	mla r4, r3, r1, r4
	mov r0, r8, lsr #0xc
	orr r0, r0, r4, lsl #20
	sub r1, r5, r0
	ldr r0, [sp]
	sub r2, r2, #0x1000
	mul r1, r0, r1
	mov r0, r1, lsl #4
	str r0, [r7, #0x30]
	ldrh r0, [r6, #0x2e]
	rsb r0, r0, #0
	mul r1, r0, r2
	mov r0, r1, lsl #4
	str r0, [r7, #0x34]
	bl sub_020CCC44
	rsb r1, r5, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r7, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C7268

	arm_func_start sub_020C73BC
sub_020C73BC: ; 0x020C73BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl sub_020CCCD8
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl sub_020CCC44
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl sub_020CCCD8
	ldrsh lr, [r5, #0x20]
	ldr r4, [r5, #0x28]
	ldrsh r0, [r5, #0x22]
	ldr ip, [r5, #0x24]
	smull r3, r2, r4, lr
	smlal r3, r2, ip, r0
	smull r1, r0, r4, r0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	sub r4, lr, r3
	smull r3, r2, ip, lr
	subs r1, r3, r1
	sbc r0, r2, r0
	ldrh r2, [r5, #0x2c]
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	mul r0, r2, r4
	mov r0, r0, lsl #4
	str r0, [r6, #0x30]
	ldrsh r0, [r5, #0x22]
	ldrh r2, [r5, #0x2e]
	add r0, r0, r1
	rsb r1, r2, #0
	sub r0, r0, #0x1000
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [r6, #0x34]
	bl sub_020CCC44
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C73BC

	arm_func_start sub_020C749C
sub_020C749C: ; 0x020C749C
	stmdb sp!, {r4, lr}
	ldr r3, [r1, #0x18]
	mov r2, #0
	str r3, [r0]
	ldr r3, [r1, #0x1c]
	str r3, [r0, #0x14]
	str r2, [r0, #4]
	ldr ip, [r1, #0x24]
	ldr r3, [r1, #0x18]
	ldr r4, [r1, #0x28]
	smull lr, r3, ip, r3
	mov ip, lr, lsr #0xc
	orr ip, ip, r3, lsl #20
	ldrh lr, [r1, #0x2c]
	rsb r3, ip, #0
	ldr ip, [r1, #0x1c]
	rsb r4, r4, #0
	mul r3, lr, r3
	smull lr, ip, r4, ip
	mov r3, r3, lsl #4
	str r3, [r0, #0x30]
	mov r4, lr, lsr #0xc
	ldrh r3, [r1, #0x2e]
	ldr r1, [r1, #0x1c]
	orr r4, r4, ip, lsl #20
	add r1, r1, r4
	rsb r3, r3, #0
	sub r1, r1, #0x1000
	mul r1, r3, r1
	mov r1, r1, lsl #4
	str r1, [r0, #0x34]
	str r2, [r0, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C749C

	arm_func_start sub_020C7520
sub_020C7520: ; 0x020C7520
	stmdb sp!, {r3, lr}
	mov r2, #0x1000
	str r2, [r0]
	str r2, [r0, #0x14]
	mov lr, #0
	str lr, [r0, #4]
	ldr r2, [r1, #0x24]
	ldrh r3, [r1, #0x2c]
	rsb r2, r2, #0
	ldr ip, [r1, #0x28]
	mul r2, r3, r2
	mov r2, r2, lsl #4
	str r2, [r0, #0x30]
	ldrh r1, [r1, #0x2e]
	rsb r2, ip, #0
	rsb r1, r1, #0
	mul r2, r1, r2
	mov r1, r2, lsl #4
	str r1, [r0, #0x34]
	str lr, [r0, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C7520

	arm_func_start sub_020C7574
sub_020C7574: ; 0x020C7574
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl sub_020CCCD8
	ldrsh r3, [sb, #0x22]
	ldr r0, [sb, #0x18]
	ldrsh r7, [sb, #0x20]
	ldr r5, [sb, #0x1c]
	smull r2, r1, r0, r3
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sl]
	smull r2, r1, r5, r3
	mov r4, r2, lsr #0xc
	orr r4, r4, r1, lsl #20
	smull r2, r1, r0, r7
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	str r4, [sl, #0x14]
	bl sub_020CCC44
	smull r2, r1, r5, r7
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	mov r1, fp
	bl sub_020CCCD8
	sub r0, r4, #0x1000
	ldrh r1, [sb, #0x2c]
	mul r2, r1, r6
	mov r1, r2, lsl #4
	str r1, [sl, #0x30]
	ldrh r1, [sb, #0x2e]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [sl, #0x34]
	bl sub_020CCC44
	rsb r1, r6, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C7574

	arm_func_start sub_020C7640
sub_020C7640: ; 0x020C7640
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl sub_020CCCD8
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl sub_020CCC44
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl sub_020CCCD8
	ldrh r1, [r5, #0x2c]
	ldrsh r0, [r5, #0x20]
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [r6, #0x30]
	ldrh r1, [r5, #0x2e]
	ldrsh r0, [r5, #0x22]
	rsb r1, r1, #0
	sub r0, r0, #0x1000
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [r6, #0x34]
	bl sub_020CCC44
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C7640

	arm_func_start sub_020C76E4
sub_020C76E4: ; 0x020C76E4
	ldr r2, [r1, #0x18]
	mov r3, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str r3, [r0, #4]
	str r3, [r0, #0x30]
	ldrh r2, [r1, #0x2e]
	ldr r1, [r1, #0x1c]
	rsb r2, r2, #0
	sub r1, r1, #0x1000
	mul r1, r2, r1
	mov r1, r1, lsl #4
	str r1, [r0, #0x34]
	str r3, [r0, #0x10]
	bx lr
	arm_func_end sub_020C76E4

	arm_func_start sub_020C7724
sub_020C7724: ; 0x020C7724
	mov r2, #0x1000
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end sub_020C7724

	arm_func_start sub_020C7748
sub_020C7748: ; 0x020C7748
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r4, r0
	ldr r0, [r4]
	mov r3, #3
	tst r0, #8
	ldrne r0, _020C78C4 ; =0x00101610
	mov r2, #2
	strne r0, [sp]
	ldreq r0, _020C78C8 ; =0x00101810
	mov r1, #0x1000
	streq r0, [sp]
	mov r0, #0
	str r3, [sp, #4]
	str r2, [sp, #0x48]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	str r0, [sp, #0x34]
	str r0, [sp, #0x30]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x28]
	str r0, [sp, #0x24]
	str r0, [sp, #0x20]
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [r4]
	tst r0, #1
	strne r1, [r4, #0x1c]
	strne r1, [r4, #0x18]
	ldr r0, [r4]
	tst r0, #2
	beq _020C77D8
	mov r0, #0x1000
	strh r0, [r4, #0x22]
	mov r0, #0
	strh r0, [r4, #0x20]
_020C77D8:
	ldr r0, [r4]
	tst r0, #4
	movne r0, #0
	strne r0, [r4, #0x28]
	strne r0, [r4, #0x24]
	ldr r1, [r4]
	ldr r0, _020C78CC ; =_02110C5C
	and r1, r1, #7
	ldr r2, [r0, r1, lsl #2]
	add r0, sp, #8
	mov r1, r4
	blx r2
	ldr r3, [r4, #0x30]
	cmp r3, #0x1000
	beq _020C7858
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	ldr r0, [sp, #0x38]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0xc]
	ldr r1, [r4, #0x30]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x38]
_020C7858:
	ldr r3, [r4, #0x34]
	cmp r3, #0x1000
	beq _020C78A8
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x18]
	ldr r2, [r4, #0x34]
	ldr r0, [sp, #0x3c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x1c]
	ldr r1, [r4, #0x34]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x3c]
_020C78A8:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0x12
	bl sub_020C2528
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020C78C4: .word 0x00101610
_020C78C8: .word 0x00101810
_020C78CC: .word _02110C5C
	arm_func_end sub_020C7748

	arm_func_start sub_020C78D0
sub_020C78D0: ; 0x020C78D0
	stmdb sp!, {r3, lr}
	ldr r0, _020C7944 ; =0x021DD420
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	str r1, [r0, #0xc]
	bl sub_020D54D0
	ldr r0, _020C7948 ; =sub_020C7B34
	ldr r1, _020C7944 ; =0x021DD420
	mov r2, #0
	str r0, [r1, #0x10]
	ldr r0, _020C794C ; =sub_020C7B6C
	str r2, [r1, #0x14]
	str r0, [r1, #0x1c]
	ldr r0, _020C7950 ; =0x021DD430
	str r2, [r1, #0x20]
	bl sub_020DB960
	ldr r0, _020C7954 ; =0x021DD43C
	bl sub_020DB978
	bl sub_020C7C74
	bl sub_020C908C
	bl sub_020C83E4
	ldr r0, _020C7944 ; =0x021DD420
	mvn r1, #0
	strb r1, [r0]
	mov r1, #1
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C7944: .word 0x021DD420
_020C7948: .word sub_020C7B34
_020C794C: .word sub_020C7B6C
_020C7950: .word 0x021DD430
_020C7954: .word 0x021DD43C
	arm_func_end sub_020C78D0

	arm_func_start sub_020C7958
sub_020C7958: ; 0x020C7958
	stmdb sp!, {r4, lr}
	mov r4, #0
_020C7960:
	mov r0, r4
	bl sub_020D5604
	cmp r0, #0
	bne _020C7960
	bl sub_020C8498
	bl sub_020C90A4
	bl sub_020CAB94
	mov r0, #0
	bl sub_020D57D4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C7958

	arm_func_start sub_020C7988
sub_020C7988: ; 0x020C7988
	ldr ip, _020C7990 ; =sub_020D5394
	bx ip
	.align 2, 0
_020C7990: .word sub_020D5394
	arm_func_end sub_020C7988

	arm_func_start sub_020C7994
sub_020C7994: ; 0x020C7994
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _020C79AC
	mov r0, #0x40
	bl sub_020D53DC
	ldmia sp!, {r3, pc}
_020C79AC:
	bl sub_020D53FC
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C7994

	arm_func_start sub_020C79B4
sub_020C79B4: ; 0x020C79B4
	stmdb sp!, {r4, lr}
	ldr r0, _020C7A88 ; =0x021DD420
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020C7A68
	mov r4, #0
_020C79CC:
	mov r0, r4
	bl sub_020D5604
	cmp r0, #0
	bne _020C79CC
	ldr r0, _020C7A88 ; =0x021DD420
	ldr r0, [r0, #8]
	bl sub_020D5A28
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _020C7A88 ; =0x021DD420
	ldr r2, _020C7A8C ; =0x021DD460
	ldrsb r1, [r0]
	cmp r1, #0
	movlt r1, #1
	strltb r1, [r0]
	ldr r0, _020C7A88 ; =0x021DD420
	ldrsb r1, [r0]
	ldr r0, _020C7A90 ; =0x000011E0
	mla r0, r1, r0, r2
	bl sub_020D541C
	bl sub_020D59FC
	ldr r1, _020C7A88 ; =0x021DD420
	ldr r3, _020C7A8C ; =0x021DD460
	str r0, [r1, #8]
	ldrsb r0, [r1]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r1]
	ldr r0, _020C7A88 ; =0x021DD420
	ldr r1, _020C7A90 ; =0x000011E0
	ldrsb r2, [r0]
	mla r0, r2, r1, r3
	bl sub_020D285C
	mov r0, #0
	bl sub_020D57D4
	mov r0, #1
	ldmia sp!, {r4, pc}
_020C7A68:
	ldr r0, _020C7A8C ; =0x021DD460
	bl sub_020D541C
	bl sub_020D59FC
	ldr r1, _020C7A88 ; =0x021DD420
	str r0, [r1, #8]
	mov r0, #0
	str r0, [r1, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7A88: .word 0x021DD420
_020C7A8C: .word 0x021DD460
_020C7A90: .word 0x000011E0
	arm_func_end sub_020C79B4

	arm_func_start sub_020C7A94
sub_020C7A94: ; 0x020C7A94
	stmdb sp!, {r3, lr}
	ldr r2, _020C7AD4 ; =0x021DD420
	mov ip, r0
	ldrsb r3, [r2]
	mov r2, r1
	cmp r3, #0
	movlt r0, #0
	ldrge r1, _020C7AD8 ; =0x021DD460
	ldrge r0, _020C7ADC ; =0x000011E0
	mlage r0, r3, r0, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, ip
	bl sub_020D5DA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C7AD4: .word 0x021DD420
_020C7AD8: .word 0x021DD460
_020C7ADC: .word 0x000011E0
	arm_func_end sub_020C7A94

	arm_func_start sub_020C7AE0
sub_020C7AE0: ; 0x020C7AE0
	stmdb sp!, {r4, lr}
	ldr r3, _020C7B28 ; =0x021DD420
	mov r4, r0
	ldrsb ip, [r3]
	mov lr, r1
	mov r3, r2
	cmp ip, #0
	movlt r0, #0
	ldrge r1, _020C7B2C ; =0x021DD460
	ldrge r0, _020C7B30 ; =0x000011E0
	mlage r0, ip, r0, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r4
	mov r2, lr
	bl sub_020D5F34
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7B28: .word 0x021DD420
_020C7B2C: .word 0x021DD460
_020C7B30: .word 0x000011E0
	arm_func_end sub_020C7AE0

	arm_func_start sub_020C7B34
sub_020C7B34: ; 0x020C7B34
	stmdb sp!, {r4, lr}
	bl sub_020C921C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020D519C
	bl sub_020D59FC
	mov r4, r0
	mov r0, #1
	bl sub_020D57D4
	mov r0, r4
	bl sub_020D5990
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C7B34

	arm_func_start sub_020C7B6C
sub_020C7B6C: ; 0x020C7B6C
	ldr ip, _020C7B74 ; =sub_020C927C
	bx ip
	.align 2, 0
_020C7B74: .word sub_020C927C
	arm_func_end sub_020C7B6C

	arm_func_start sub_020C7B78
sub_020C7B78: ; 0x020C7B78
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r1, _020C7BBC ; =0x021DF820
	ldr r1, [r1, #8]
	tst r4, r1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, #0
	bl sub_020D5240
	ldr r1, _020C7BBC ; =0x021DF820
	mov r0, #1
	ldr r2, [r1, #8]
	orr r2, r2, r4
	str r2, [r1, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7BBC: .word 0x021DF820
	arm_func_end sub_020C7B78

	arm_func_start sub_020C7BC0
sub_020C7BC0: ; 0x020C7BC0
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	bl sub_020D5260
	ldr r0, _020C7BEC ; =0x021DF820
	mvn r1, r4
	ldr r2, [r0, #8]
	and r1, r2, r1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7BEC: .word 0x021DF820
	arm_func_end sub_020C7BC0

	arm_func_start sub_020C7BF0
sub_020C7BF0: ; 0x020C7BF0
	ldr r1, _020C7C08 ; =0x021DF820
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_020C7C08: .word 0x021DF820
	arm_func_end sub_020C7BF0

	arm_func_start sub_020C7C0C
sub_020C7C0C: ; 0x020C7C0C
	ldr r0, _020C7C50 ; =0x021DF820
	mov r3, #1
	ldr r1, [r0, #4]
	mov r0, #0
_020C7C1C:
	tst r1, r3
	bne _020C7C38
	ldr r1, _020C7C50 ; =0x021DF820
	ldr r2, [r1, #4]
	orr r2, r2, r3
	str r2, [r1, #4]
	bx lr
_020C7C38:
	add r0, r0, #1
	cmp r0, #8
	mov r3, r3, lsl #1
	blt _020C7C1C
	mvn r0, #0
	bx lr
	.align 2, 0
_020C7C50: .word 0x021DF820
	arm_func_end sub_020C7C0C

	arm_func_start sub_020C7C54
sub_020C7C54: ; 0x020C7C54
	ldr r1, _020C7C70 ; =0x021DF820
	mov r2, #1
	mvn r0, r2, lsl r0
	ldr r2, [r1, #4]
	and r0, r2, r0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020C7C70: .word 0x021DF820
	arm_func_end sub_020C7C54

	arm_func_start sub_020C7C74
sub_020C7C74: ; 0x020C7C74
	ldr r0, _020C7C8C ; =0x021DF820
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020C7C8C: .word 0x021DF820
	arm_func_end sub_020C7C74

	arm_func_start sub_020C7C90
sub_020C7C90: ; 0x020C7C90
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r0, r0, lsl r4
	bl sub_020C7B78
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x14
	mul r0, r4, r0
	ldr r2, _020C7CD0 ; =0x021DF82C
	mov r1, #0
	str r4, [r2, r0]
	add r0, r2, r0
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7CD0: .word 0x021DF82C
	arm_func_end sub_020C7C90

	arm_func_start sub_020C7CD4
sub_020C7CD4: ; 0x020C7CD4
	ldr r0, [r0]
	mov r1, #1
	ldr ip, _020C7CE8 ; =sub_020C7BC0
	mov r0, r1, lsl r0
	bx ip
	.align 2, 0
_020C7CE8: .word sub_020C7BC0
	arm_func_end sub_020C7CD4

	arm_func_start sub_020C7CEC
sub_020C7CEC: ; 0x020C7CEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	movs r8, r1
	mov sb, r0
	mov r7, r2
	mov r6, r3
	beq _020C7D14
	cmp r8, #1
	beq _020C7D28
	b _020C7D38
_020C7D14:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	mov r4, r1, asr #2
	rsb r5, r4, r0, asr #2
	b _020C7D38
_020C7D28:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	mov r4, r1, asr #1
	rsb r5, r4, r0, asr #1
_020C7D38:
	ldr r2, [sp, #0x40]
	ldr r0, _020C7E04 ; =0xD87F8000
	mov r3, r2, asr #0x1f
	mov r1, #0x7f
	bl _ll_udiv
	ldr r2, [sp, #0x48]
	mov r3, r2, asr #0x1f
	bl _ll_udiv
	cmp r1, #0
	mov r2, #0x10
	cmpeq r0, #0x10
	mov r3, #0
	movlo r0, r2
	blo _020C7D80
	ldr r2, _020C7E08 ; =0x0000FFFF
	cmp r1, r3
	cmpeq r0, r2
	movhi r0, r2
_020C7D80:
	ldr r1, [sp, #0x44]
	stmia sp, {r4, r5}
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	cmp r6, #0
	movne r3, #1
	ldr r1, [sp, #0x4c]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sb]
	moveq r3, #2
	mov r1, r8
	mov r2, r7
	bl sub_020D52E8
	mov r1, #0
	ldr r0, [sb]
	mov r2, #1
	mov r0, r2, lsl r0
	mov r2, r1
	mov r3, r1
	bl sub_020D5174
	mov r0, #1
	str r0, [sb, #8]
	mov r0, #0
	str r0, [sb, #0xc]
	bl sub_020D59FC
	str r0, [sb, #0x10]
	ldr r1, [sp, #0x40]
	mov r0, #1
	str r1, [sb, #4]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020C7E04: .word 0xD87F8000
_020C7E08: .word 0x0000FFFF
	arm_func_end sub_020C7CEC

	arm_func_start sub_020C7E0C
sub_020C7E0C: ; 0x020C7E0C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4]
	mov r2, #1
	mov r1, #0
	mov r0, r2, lsl r0
	mov r2, r1
	mov r3, r1
	bl sub_020D519C
	mov r0, #0
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C7E0C

	arm_func_start sub_020C7E48
sub_020C7E48: ; 0x020C7E48
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	mov r2, #1
	mov r0, r2, lsl r0
	mov r2, #0
	bl sub_020D52A0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C7E48

	arm_func_start sub_020C7E70
sub_020C7E70: ; 0x020C7E70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	mov r4, r1
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [r5, #4]
	ldr r0, _020C7EEC ; =0xD87F8000
	mov r3, r2, asr #0x1f
	mov r1, #0x7f
	bl _ll_udiv
	mov r2, r4
	mov r3, r4, asr #0x1f
	bl _ll_udiv
	mov r3, r0
	cmp r1, #0
	mov r0, #0x10
	cmpeq r3, #0x10
	mov r2, #0
	movlo r3, r0
	blo _020C7ED4
	ldr r0, _020C7EF0 ; =0x0000FFFF
	cmp r1, r2
	cmpeq r3, r0
	movhi r3, r0
_020C7ED4:
	ldr r0, [r5]
	mov r1, #1
	mov r0, r1, lsl r0
	mov r1, r3
	bl sub_020D5280
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C7EEC: .word 0xD87F8000
_020C7EF0: .word 0x0000FFFF
	arm_func_end sub_020C7E70

	arm_func_start sub_020C7EF4
sub_020C7EF4: ; 0x020C7EF4
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	mov r2, #1
	mov r0, r2, lsl r0
	bl sub_020D52C8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C7EF4

	arm_func_start sub_020C7F18
sub_020C7F18: ; 0x020C7F18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _020C7F54
	ldr r0, [r4, #0x10]
	bl sub_020D5A28
	cmp r0, #0
	mov r0, #1
	ldmeqia sp!, {r4, pc}
	str r0, [r4, #0xc]
_020C7F54:
	bl sub_020D5D30
	ldr r1, [r4]
	mov r2, #1
	tst r0, r2, lsl r1
	movne r0, r2
	moveq r0, #0
	streq r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C7F18

	arm_func_start sub_020C7F74
sub_020C7F74: ; 0x020C7F74
	mov r2, #0x24
	mul r2, r0, r2
	ldr r0, _020C7F88 ; =0x021DFDE4
	strb r1, [r0, r2]
	bx lr
	.align 2, 0
_020C7F88: .word 0x021DFDE4
	arm_func_end sub_020C7F74

	arm_func_start sub_020C7F8C
sub_020C7F8C: ; 0x020C7F8C
	mov r2, #0x24
	mul r2, r0, r2
	mov r0, r1, lsl #0x10
	ldr r1, _020C7FA8 ; =0x021DFDDC
	mov r0, r0, lsr #0x10
	str r0, [r1, r2]
	bx lr
	.align 2, 0
_020C7FA8: .word 0x021DFDDC
	arm_func_end sub_020C7F8C

	arm_func_start sub_020C7FAC
sub_020C7FAC: ; 0x020C7FAC
	mov r2, #0x24
	mul r2, r0, r2
	ldr r0, _020C7FC0 ; =0x021DFDE0
	str r1, [r0, r2]
	bx lr
	.align 2, 0
_020C7FC0: .word 0x021DFDE0
	arm_func_end sub_020C7FAC

	arm_func_start sub_020C7FC4
sub_020C7FC4: ; 0x020C7FC4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r6, r0
	mov r0, r1
	mov r3, #0
	ldr r2, _020C8050 ; =sub_020C89C8
	add r1, r5, #0x14
	str r3, [sp]
	bl sub_020C9B50
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r2, #0
	str r2, [r4, #0xc]
	str r6, [r4, #0x10]
	mov r1, r5
	add r0, r4, #0x14
	str r2, [r4, #8]
	bl sub_020C9A0C
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r2, _020C8054 ; =0x021DFDC4
	mov r1, #0x24
	mla r2, r6, r1, r2
	str r0, [r4, #8]
	mov r1, r4
	add r0, r2, #0xc
	bl sub_020B4BAC
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020C8050: .word sub_020C89C8
_020C8054: .word 0x021DFDC4
	arm_func_end sub_020C7FC4

	arm_func_start sub_020C8058
sub_020C8058: ; 0x020C8058
	ldr ip, _020C8064 ; =sub_020C86F0
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020C8064: .word sub_020C86F0
	arm_func_end sub_020C8058

	arm_func_start sub_020C8068
sub_020C8068: ; 0x020C8068
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020C80BC ; =0x021DFDC4
	mov r2, #0x24
	mla r6, r0, r2, r3
	ldr r5, _020C80C0 ; =0x021DF984
	mov r7, r1
	mov r4, #0
_020C8084:
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	beq _020C80A8
	ldr r0, [r5, #4]
	cmp r0, r6
	bne _020C80A8
	mov r0, r5
	mov r1, r7
	bl sub_020C86F0
_020C80A8:
	add r4, r4, #1
	cmp r4, #0x10
	add r5, r5, #0x44
	blt _020C8084
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C80BC: .word 0x021DFDC4
_020C80C0: .word 0x021DF984
	arm_func_end sub_020C8068

	arm_func_start sub_020C80C4
sub_020C80C4: ; 0x020C80C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _020C8118 ; =0x021DF984
	mov r7, r0
	mov r6, r1
	mov r4, #0
_020C80D8:
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	beq _020C8104
	ldrh r0, [r5, #0x34]
	cmp r0, #1
	ldreqh r0, [r5, #0x38]
	cmpeq r0, r7
	bne _020C8104
	mov r0, r5
	mov r1, r6
	bl sub_020C86F0
_020C8104:
	add r4, r4, #1
	cmp r4, #0x10
	add r5, r5, #0x44
	blt _020C80D8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C8118: .word 0x021DF984
	arm_func_end sub_020C80C4

	arm_func_start sub_020C811C
sub_020C811C: ; 0x020C811C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _020C8158 ; =0x021DF984
	mov r6, r0
	mov r4, #0
_020C812C:
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	beq _020C8144
	mov r0, r5
	mov r1, r6
	bl sub_020C86F0
_020C8144:
	add r4, r4, #1
	cmp r4, #0x10
	add r5, r5, #0x44
	blt _020C812C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C8158: .word 0x021DF984
	arm_func_end sub_020C811C

	arm_func_start sub_020C815C
sub_020C815C: ; 0x020C815C
	ldr ip, _020C8168 ; =sub_020C873C
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020C8168: .word sub_020C873C
	arm_func_end sub_020C815C

	arm_func_start sub_020C816C
sub_020C816C: ; 0x020C816C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r6, r0, r2
	ldr r5, _020C81C0 ; =0x021DFDC4
	mov r8, r1
	add r0, r5, r6
	mov r1, #0
	bl sub_020B4D14
	movs r7, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_020C8194:
	mov r1, r7
	add r0, r5, r6
	bl sub_020B4D14
	mov r4, r0
	mov r0, r7
	mov r1, r8
	bl sub_020C873C
	mov r7, r4
	cmp r4, #0
	bne _020C8194
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C81C0: .word 0x021DFDC4
	arm_func_end sub_020C816C

	arm_func_start sub_020C81C4
sub_020C81C4: ; 0x020C81C4
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_020C81C4

	arm_func_start sub_020C81D0
sub_020C81D0: ; 0x020C81D0
	ldr r1, [r0]
	cmp r1, #0
	bxeq lr
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1]
	str r2, [r0]
	bx lr
	arm_func_end sub_020C81D0

	arm_func_start sub_020C81F0
sub_020C81F0: ; 0x020C81F0
	mov r1, #0x24
	mul r1, r0, r1
	ldr r0, _020C8204 ; =0x021DFDCC
	ldrh r0, [r0, r1]
	bx lr
	.align 2, 0
_020C8204: .word 0x021DFDCC
	arm_func_end sub_020C81F0

	arm_func_start sub_020C8208
sub_020C8208: ; 0x020C8208
	ldr r2, [r0]
	cmp r2, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x41]
	bx lr
	arm_func_end sub_020C8208

	arm_func_start sub_020C821C
sub_020C821C: ; 0x020C821C
	ldr r2, [r0]
	cmp r2, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x40]
	bx lr
	arm_func_end sub_020C821C

	arm_func_start sub_020C8230
sub_020C8230: ; 0x020C8230
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldrne r3, [r0]
	ldrneb r0, [r3, #0x2c]
	cmpne r0, #2
	ldmeqia sp!, {r3, pc}
	add r0, r3, #0x1c
	mov r1, r1, lsl #8
	bl sub_020CAEE4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C8230

	arm_func_start sub_020C825C
sub_020C825C: ; 0x020C825C
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl sub_020D50FC
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C825C

	arm_func_start sub_020C827C
sub_020C827C: ; 0x020C827C
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl sub_020D5114
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C827C

	arm_func_start sub_020C829C
sub_020C829C: ; 0x020C829C
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl sub_020D5130
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C829C

	arm_func_start sub_020C82BC
sub_020C82BC: ; 0x020C82BC
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl sub_020D514C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C82BC

	arm_func_start sub_020C82DC
sub_020C82DC: ; 0x020C82DC
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl sub_020D50CC
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C82DC

	arm_func_start sub_020C82FC
sub_020C82FC: ; 0x020C82FC
	ldr r2, [r0]
	cmp r2, #0
	bxeq lr
	ldr r2, [r0]
	mov r3, #1
	strh r3, [r2, #0x34]
	ldr r0, [r0]
	strh r1, [r0, #0x38]
	bx lr
	arm_func_end sub_020C82FC

	arm_func_start sub_020C8320
sub_020C8320: ; 0x020C8320
	ldr r3, [r0]
	cmp r3, #0
	bxeq lr
	ldr r3, [r0]
	mov ip, #2
	strh ip, [r3, #0x34]
	ldr r3, [r0]
	strh r1, [r3, #0x38]
	ldr r0, [r0]
	strh r2, [r0, #0x3a]
	bx lr
	arm_func_end sub_020C8320

	arm_func_start sub_020C834C
sub_020C834C: ; 0x020C834C
	ldr r1, [r0]
	cmp r1, #0
	mvneq r0, #0
	bxeq lr
	ldr r1, [r0]
	ldrh r0, [r1, #0x34]
	cmp r0, #1
	mvnne r0, #0
	ldreqh r0, [r1, #0x38]
	bx lr
	arm_func_end sub_020C834C

	arm_func_start sub_020C8374
sub_020C8374: ; 0x020C8374
	stmdb sp!, {r4, lr}
	ldr r3, [r0]
	mov r4, r2
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, [r0]
	ldrb r0, [r2, #0x2d]
	cmp r0, #0
	bne _020C83AC
	mvn r0, #0
	strh r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_020C83AC:
	ldrb r0, [r2, #0x3c]
	bl sub_020D5D5C
	strh r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C8374

	arm_func_start sub_020C83C0
sub_020C83C0: ; 0x020C83C0
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl sub_020C7AE0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C83C0

	arm_func_start sub_020C83E4
sub_020C83E4: ; 0x020C83E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _020C8488 ; =0x021DF978
	mov r1, #0x14
	bl sub_020B4B68
	ldr r0, _020C848C ; =0x021DF96C
	mov r1, #0x14
	bl sub_020B4B68
	mov r6, #0
	ldr r7, _020C8490 ; =0x021DF984
	ldr r4, _020C848C ; =0x021DF96C
	mov r5, r6
_020C8410:
	strb r5, [r7, #0x2c]
	mov r0, r4
	mov r1, r7
	strb r6, [r7, #0x3c]
	bl sub_020B4BAC
	add r6, r6, #1
	cmp r6, #0x10
	add r7, r7, #0x44
	blt _020C8410
	mov sl, #0
	ldr sb, _020C8494 ; =0x021DFDC4
	mov r8, #0xc
	mov r7, sl
	mov r6, #0x7f
	mov r5, #1
	mov r4, sl
_020C8450:
	mov r0, sb
	mov r1, r8
	bl sub_020B4B68
	mov r1, r7
	add r0, sb, #0xc
	bl sub_020B4B68
	strb r6, [sb, #0x20]
	str r5, [sb, #0x18]
	add sl, sl, #1
	str r4, [sb, #0x1c]
	cmp sl, #0x20
	add sb, sb, #0x24
	blt _020C8450
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020C8488: .word 0x021DF978
_020C848C: .word 0x021DF96C
_020C8490: .word 0x021DF984
_020C8494: .word 0x021DFDC4
	arm_func_end sub_020C83E4

	arm_func_start sub_020C8498
sub_020C8498: ; 0x020C8498
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl sub_020D5D04
	mov fp, r0
	ldr r0, _020C85F0 ; =0x021DF978
	mov r1, #0
	bl sub_020B4D14
	movs r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr r5, _020C85F4 ; =0x0210D750
	rsb r4, r4, #0
_020C84C4:
	ldr r0, _020C85F0 ; =0x021DF978
	mov r1, r6
	bl sub_020B4D14
	ldrb r1, [r6, #0x2d]
	mov r7, r0
	cmp r1, #0
	bne _020C84F4
	ldr r0, [r6, #0x30]
	bl sub_020D5A28
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6, #0x2d]
_020C84F4:
	ldrb r0, [r6, #0x2d]
	cmp r0, #0
	beq _020C851C
	ldrb r1, [r6, #0x3c]
	mov r0, #1
	tst fp, r0, lsl r1
	bne _020C851C
	mov r0, r6
	bl sub_020C8944
	b _020C85E0
_020C851C:
	add r0, r6, #0x1c
	bl sub_020CAF40
	ldr r0, [r6, #4]
	ldrb r2, [r6, #0x41]
	ldrb r0, [r0, #0x20]
	ldrb r1, [r6, #0x40]
	mov r2, r2, lsl #1
	mov r0, r0, lsl #1
	mov r1, r1, lsl #1
	ldrsh sl, [r5, r0]
	add r0, r6, #0x1c
	ldrsh r8, [r5, r2]
	ldrsh sb, [r5, r1]
	bl sub_020CAF0C
	mov r0, r0, asr #8
	mov r0, r0, lsl #1
	add r1, sb, r8
	ldrsh r0, [r5, r0]
	add r1, sl, r1
	add r8, r0, r1
	cmp r8, r4
	movlt r8, r4
	blt _020C8584
	ldr r0, _020C85F8 ; =0x00007FFF
	cmp r8, r0
	movgt r8, r0
_020C8584:
	ldrsh r0, [r6, #0x3e]
	cmp r8, r0
	beq _020C85A0
	ldrb r0, [r6, #0x3c]
	mov r1, r8
	bl sub_020D50E4
	strh r8, [r6, #0x3e]
_020C85A0:
	ldrb r0, [r6, #0x2c]
	cmp r0, #2
	bne _020C85C4
	add r0, r6, #0x1c
	bl sub_020CAF58
	cmp r0, #0
	beq _020C85C4
	mov r0, r6
	bl sub_020C88A4
_020C85C4:
	ldrb r0, [r6, #0x2f]
	cmp r0, #0
	beq _020C85E0
	ldrb r0, [r6, #0x3c]
	bl sub_020D508C
	mov r0, #0
	strb r0, [r6, #0x2f]
_020C85E0:
	mov r6, r7
	cmp r7, #0
	bne _020C84C4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C85F0: .word 0x021DF978
_020C85F4: .word 0x0210D750
_020C85F8: .word 0x00007FFF
	arm_func_end sub_020C8498

	arm_func_start sub_020C85FC
sub_020C85FC: ; 0x020C85FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _020C8690 ; =0x021DFDC4
	mov r3, #0x24
	mov r4, r0
	ldr r5, [r4]
	mla r6, r1, r3, ip
	mov r7, r2
	cmp r5, #0
	beq _020C8624
	bl sub_020C81D0
_020C8624:
	ldrh r1, [r6, #8]
	ldr r0, [r6, #0x18]
	cmp r1, r0
	blo _020C8660
	mov r0, r6
	mov r1, #0
	bl sub_020B4D14
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r0, #0x3d]
	cmp r7, r1
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020C88A4
_020C8660:
	mov r0, r7
	bl sub_020C88DC
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	bl sub_020C8800
	str r4, [r5]
	mov r0, r5
	str r5, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C8690: .word 0x021DFDC4
	arm_func_end sub_020C85FC

	arm_func_start sub_020C8694
sub_020C8694: ; 0x020C8694
	ldr ip, _020C869C ; =sub_020C8944
	bx ip
	.align 2, 0
_020C869C: .word sub_020C8944
	arm_func_end sub_020C8694

	arm_func_start sub_020C86A0
sub_020C86A0: ; 0x020C86A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x3c]
	ldr r4, [r5, #4]
	bl sub_020D5064
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _020C86CC
	ldrb r0, [r5, #0x3c]
	ldr r1, _020C86EC ; =0x0000FFFF
	bl sub_020D514C
_020C86CC:
	mov r0, r5
	bl sub_020C87B8
	bl sub_020D59FC
	str r0, [r5, #0x30]
	mov r0, #1
	strb r0, [r5, #0x2f]
	strb r0, [r5, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C86EC: .word 0x0000FFFF
	arm_func_end sub_020C86A0

	arm_func_start sub_020C86F0
sub_020C86F0: ; 0x020C86F0
	stmdb sp!, {r4, lr}
	movs r4, r0
	mov r2, r1
	ldrneb r1, [r4, #0x2c]
	cmpne r1, #0
	ldmeqia sp!, {r4, pc}
	cmp r2, #0
	bne _020C8718
	bl sub_020C88A4
	ldmia sp!, {r4, pc}
_020C8718:
	add r0, r4, #0x1c
	mov r1, #0
	bl sub_020CAEE4
	mov r0, r4
	mov r1, #0
	bl sub_020C8A18
	mov r0, #2
	strb r0, [r4, #0x2c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C86F0

	arm_func_start sub_020C873C
sub_020C873C: ; 0x020C873C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	ldrneb r0, [r5, #0x2e]
	mov r4, r1
	cmpne r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0x3c]
	bl sub_020D50AC
	strb r4, [r5, #0x2e]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C873C

	arm_func_start sub_020C8764
sub_020C8764: ; 0x020C8764
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020C87B4 ; =0x021DFDC4
	mov r2, #0x24
	mla r5, r0, r2, r3
	mov r6, r1
	add r0, r5, #0xc
	mov r1, #0
	bl sub_020B4D14
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r4
	add r0, r5, #0xc
	bl sub_020B4CB4
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	ldr r0, [r4, #8]
	bl sub_020C9A94
	ldr r0, [r4, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C87B4: .word 0x021DFDC4
	arm_func_end sub_020C8764

	arm_func_start sub_020C87B8
sub_020C87B8: ; 0x020C87B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x2e]
	strb r0, [r4, #0x2d]
	strb r0, [r4, #0x2f]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x3e]
	mov r1, #0x7f
	strb r1, [r4, #0x40]
	add r0, r4, #0x1c
	strb r1, [r4, #0x41]
	bl sub_020CAECC
	add r0, r4, #0x1c
	mov r1, #0x7f00
	mov r2, #1
	bl sub_020CAEE4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C87B8

	arm_func_start sub_020C8800
sub_020C8800: ; 0x020C8800
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0
	mov r5, r0
	bl sub_020B4D14
	movs r1, r0
	beq _020C883C
_020C881C:
	ldrb r2, [r4, #0x3d]
	ldrb r0, [r1, #0x3d]
	cmp r2, r0
	blo _020C883C
	mov r0, r5
	bl sub_020B4D14
	movs r1, r0
	bne _020C881C
_020C883C:
	mov r0, r5
	mov r2, r4
	bl sub_020B4C50
	str r5, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C8800

	arm_func_start sub_020C8850
sub_020C8850: ; 0x020C8850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _020C88A0 ; =0x021DF978
	mov r1, #0
	bl sub_020B4D14
	movs r1, r0
	beq _020C8890
	ldr r4, _020C88A0 ; =0x021DF978
_020C8870:
	ldrb r2, [r5, #0x3d]
	ldrb r0, [r1, #0x3d]
	cmp r2, r0
	blo _020C8890
	mov r0, r4
	bl sub_020B4D14
	movs r1, r0
	bne _020C8870
_020C8890:
	ldr r0, _020C88A0 ; =0x021DF978
	mov r2, r5
	bl sub_020B4C50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C88A0: .word 0x021DF978
	arm_func_end sub_020C8850

	arm_func_start sub_020C88A4
sub_020C88A4: ; 0x020C88A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x2c]
	cmp r0, #2
	bne _020C88C4
	ldrb r0, [r4, #0x3c]
	ldr r1, _020C88D8 ; =0xFFFFFD2D
	bl sub_020D50E4
_020C88C4:
	ldrb r0, [r4, #0x3c]
	bl sub_020D5044
	mov r0, r4
	bl sub_020C8944
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C88D8: .word 0xFFFFFD2D
	arm_func_end sub_020C88A4

	arm_func_start sub_020C88DC
sub_020C88DC: ; 0x020C88DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _020C893C ; =0x021DF96C
	mov r1, #0
	bl sub_020B4D14
	movs r4, r0
	bne _020C891C
	ldr r0, _020C8940 ; =0x021DF978
	mov r1, #0
	bl sub_020B4D14
	mov r4, r0
	ldrb r1, [r4, #0x3d]
	cmp r5, r1
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	bl sub_020C88A4
_020C891C:
	ldr r0, _020C893C ; =0x021DF96C
	mov r1, r4
	bl sub_020B4CB4
	mov r0, r4
	strb r5, [r4, #0x3d]
	bl sub_020C8850
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C893C: .word 0x021DF96C
_020C8940: .word 0x021DF978
	arm_func_end sub_020C88DC

	arm_func_start sub_020C8944
sub_020C8944: ; 0x020C8944
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
	strne r0, [r4]
	ldr r5, [r4, #4]
	mov r1, r4
	mov r0, r5
	bl sub_020B4CB4
	mov r0, #0
	str r0, [r4, #4]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _020C899C
	add r0, r5, #0xc
	bl sub_020B4BAC
	ldr r0, [r4, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r4, #8]
_020C899C:
	ldr r0, _020C89C0 ; =0x021DF978
	mov r1, r4
	bl sub_020B4CB4
	ldr r0, _020C89C4 ; =0x021DF96C
	mov r1, r4
	bl sub_020B4BAC
	mov r0, #0
	strb r0, [r4, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C89C0: .word 0x021DF978
_020C89C4: .word 0x021DF96C
	arm_func_end sub_020C8944

	arm_func_start sub_020C89C8
sub_020C89C8: ; 0x020C89C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_020C9A7C
	ldr r1, [r4, #0xc]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #8]
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0x10]
	ldr r2, _020C8A14 ; =0x021DFDC4
	mov r0, #0x24
	mla r0, r1, r0, r2
	mov r1, r4
	add r0, r0, #0xc
	bl sub_020B4CB4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C8A14: .word 0x021DFDC4
	arm_func_end sub_020C89C8

	arm_func_start sub_020C8A18
sub_020C8A18: ; 0x020C8A18
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	mov r5, r1
	cmp r4, #0
	beq _020C8A44
	mov r0, r4
	mov r1, r6
	bl sub_020B4CB4
	mov r0, #0
	str r0, [r6, #4]
_020C8A44:
	ldr r0, _020C8A74 ; =0x021DF978
	mov r1, r6
	bl sub_020B4CB4
	strb r5, [r6, #0x3d]
	cmp r4, #0
	beq _020C8A68
	mov r0, r4
	mov r1, r6
	bl sub_020C8800
_020C8A68:
	mov r0, r6
	bl sub_020C8850
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C8A74: .word 0x021DF978
	arm_func_end sub_020C8A18

	arm_func_start sub_020C8A78
sub_020C8A78: ; 0x020C8A78
	stmdb sp!, {r4, lr}
	ldr r1, _020C8AE0 ; =0x021E0244
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _020C8AA8
	ldr r0, _020C8AE4 ; =0x021E0248
	mov r1, #0
	bl sub_020B4B68
	ldr r0, _020C8AE0 ; =0x021E0244
	mov r1, #1
	str r1, [r0]
_020C8AA8:
	ldr r1, _020C8AE8 ; =sub_020C8F58
	ldr r0, _020C8AEC ; =sub_020C8FA4
	str r1, [r4, #8]
	str r4, [r4, #0xc]
	str r0, [r4, #0x14]
	str r4, [r4, #0x18]
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x24]
	bic r0, r0, #1
	bic r0, r0, #2
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C8AE0: .word 0x021E0244
_020C8AE4: .word 0x021E0248
_020C8AE8: .word sub_020C8F58
_020C8AEC: .word sub_020C8FA4
	arm_func_end sub_020C8A78

	arm_func_start sub_020C8AF0
sub_020C8AF0: ; 0x020C8AF0
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r6, #0
	mov r5, r0
	mov ip, r6
	cmp r4, #0
	ble _020C8B30
	mov r1, #1
_020C8B10:
	ldrb r3, [r2, ip]
	add r0, r5, ip
	strb r3, [r0, #0x4c]
	ldrb r0, [r2, ip]
	add ip, ip, #1
	cmp ip, r4
	orr r6, r6, r1, lsl r0
	blt _020C8B10
_020C8B30:
	mov r0, r6
	bl sub_020C7B78
	cmp r0, #0
	moveq r0, #0
	strne r4, [r5, #0x48]
	strne r6, [r5, #0x44]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C8AF0

	arm_func_start sub_020C8B50
sub_020C8B50: ; 0x020C8B50
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_020C7BC0
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C8B50

	arm_func_start sub_020C8B78
sub_020C8B78: ; 0x020C8B78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sl, r0
	ldr r4, [sl, #0x24]
	mov sb, r1
	mov r1, r4, lsl #0x1f
	mov r8, r2
	mov r4, r3
	movs r1, r1, asr #0x1f
	ldr fp, [sp, #0x44]
	beq _020C8BA8
	bl sub_020C8D6C
_020C8BA8:
	ldr r2, [sl, #0x48]
	mov r0, fp, lsl #5
	mul r1, r2, r0
	mov r0, r4
	bl _u32_div_f
	mul r1, r0, fp
	mov r0, r1, lsl #5
	ldr r2, [sp, #0x40]
	str r0, [sl, #0x28]
	cmp sb, #1
	moveq r0, r0, lsr #1
	mul r0, r2, r0
	mov r1, fp
	bl _u32_div_f
	str r0, [sp, #0x18]
	bl sub_020C7C0C
	cmp r0, #0
	str r0, [sl, #0x40]
	addlt sp, sp, #0x1c
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x48]
	mov r6, #0
	cmp r0, #0
	ble _020C8C80
	ldr r0, [sp, #0x40]
	ldr r5, _020C8D0C ; =0x021E0294
	mov r7, r0, lsl #5
	mov r4, r6
_020C8C1C:
	ldr r1, [sl, #0x28]
	add r0, sl, r6
	mla r2, r1, r6, r8
	ldrb r0, [r0, #0x4c]
	mov r3, #1
	str r2, [r5, r0, lsl #3]
	add r1, r5, r0, lsl #3
	str r4, [r1, #4]
	str r4, [sp]
	ldr r2, [sl, #0x28]
	mov r1, sb
	mov r2, r2, lsr #2
	str r2, [sp, #4]
	mov r2, #0x7f
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r7, [sp, #0x10]
	mov r2, #0x40
	str r2, [sp, #0x14]
	ldr r2, [r5, r0, lsl #3]
	bl sub_020D52E8
	ldr r0, [sl, #0x48]
	add r6, r6, #1
	cmp r6, r0
	blt _020C8C1C
_020C8C80:
	str sl, [sp]
	ldr r1, [sp, #0x18]
	ldr r0, [sl, #0x40]
	ldr r3, _020C8D10 ; =sub_020C8E98
	mov r2, r1
	bl sub_020D5200
	ldr r0, _020C8D14 ; =0x021E0248
	mov r1, sl
	bl sub_020B4BAC
	str sb, [sl, #0x20]
	ldr r1, [sp, #0x48]
	str fp, [sl, #0x2c]
	ldr r0, [sp, #0x4c]
	str r1, [sl, #0x30]
	str r0, [sl, #0x34]
	mov r0, #0
	str r0, [sl, #0x38]
	str r0, [sl, #0x3c]
	ldr r0, [sl, #0x24]
	bic r0, r0, #1
	orr r0, r0, #1
	str r0, [sl, #0x24]
	bl sub_020D3A38
	mov r4, r0
	mov r2, #1
	mov r0, sl
	mov r1, #0
	str r2, [sl, #0x2c]
	bl sub_020C8EA8
	mov r0, r4
	str fp, [sl, #0x2c]
	bl sub_020D3A4C
	mov r0, #1
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C8D0C: .word 0x021E0294
_020C8D10: .word sub_020C8E98
_020C8D14: .word 0x021E0248
	arm_func_end sub_020C8B78

	arm_func_start sub_020C8D18
sub_020C8D18: ; 0x020C8D18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	mov r2, r2, lsl r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl sub_020D5174
	ldr r0, [r4, #0x24]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	ldmneia sp!, {r4, pc}
	add r0, r4, #8
	bl sub_020DB960
	add r0, r4, #0x14
	bl sub_020DB978
	ldr r0, [r4, #0x24]
	orr r0, r0, #2
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C8D18

	arm_func_start sub_020C8D6C
sub_020C8D6C: ; 0x020C8D6C
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0x24]
	mov r1, r1, lsl #0x1f
	movs r1, r1, asr #0x1f
	ldmeqia sp!, {r3, pc}
	bl sub_020C8DF4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C8D6C

	arm_func_start sub_020C8D88
sub_020C8D88: ; 0x020C8D88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	str r1, [r7, #0x3c]
	ldr r0, [r7, #0x48]
	mov r6, #0
	cmp r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r4, _020C8DF0 ; =0x021E0294
	mov r8, #1
_020C8DAC:
	add r0, r7, r6
	ldrb r5, [r0, #0x4c]
	ldr r1, [r7, #0x3c]
	add r0, r4, r5, lsl #3
	ldr r0, [r0, #4]
	add r0, r1, r0
	bl sub_020D60E4
	mov r2, r0
	mov r0, r8, lsl r5
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_020D52A0
	ldr r0, [r7, #0x48]
	add r6, r6, #1
	cmp r6, r0
	blt _020C8DAC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C8DF0: .word 0x021E0294
	arm_func_end sub_020C8D88

	arm_func_start sub_020C8DF4
sub_020C8DF4: ; 0x020C8DF4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #0x24]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	beq _020C8E5C
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	mov r2, r2, lsl r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl sub_020D519C
	add r0, r4, #8
	bl sub_020DB990
	add r0, r4, #0x14
	bl sub_020DB9A8
	ldr r0, [r4, #0x24]
	bic r0, r0, #2
	str r0, [r4, #0x24]
	bl sub_020D59FC
	mov r5, r0
	mov r0, #1
	bl sub_020D57D4
	mov r0, r5
	bl sub_020D5990
_020C8E5C:
	mov r0, r4
	bl sub_020C8E68
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C8DF4

	arm_func_start sub_020C8E68
sub_020C8E68: ; 0x020C8E68
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x40]
	bl sub_020C7C54
	ldr r0, _020C8E94 ; =0x021E0248
	mov r1, r4
	bl sub_020B4CB4
	ldr r0, [r4, #0x24]
	bic r0, r0, #1
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C8E94: .word 0x021E0248
	arm_func_end sub_020C8E68

	arm_func_start sub_020C8E98
sub_020C8E98: ; 0x020C8E98
	ldr ip, _020C8EA4 ; =sub_020C8EA8
	mov r1, #1
	bx ip
	.align 2, 0
_020C8EA4: .word sub_020C8EA8
	arm_func_end sub_020C8E98

	arm_func_start sub_020C8EA8
sub_020C8EA8: ; 0x020C8EA8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl _u32_div_f
	ldr r1, [r5, #0x48]
	ldr r2, [r5, #0x38]
	mov r3, r0
	mul ip, r3, r2
	cmp r1, #0
	mov lr, #0
	ble _020C8F0C
	ldr r2, _020C8F50 ; =0x021E0294
	ldr r0, _020C8F54 ; =0x021E0254
_020C8EE8:
	add r1, r5, lr
	ldrb r1, [r1, #0x4c]
	ldr r1, [r2, r1, lsl #3]
	add r1, r1, ip
	str r1, [r0, lr, lsl #2]
	ldr r1, [r5, #0x48]
	add lr, lr, #1
	cmp lr, r1
	blt _020C8EE8
_020C8F0C:
	ldr r0, [r5, #0x20]
	ldr r2, _020C8F54 ; =0x021E0254
	str r0, [sp]
	ldr ip, [r5, #0x34]
	mov r0, r4
	str ip, [sp, #4]
	ldr r4, [r5, #0x30]
	blx r4
	ldr r0, [r5, #0x38]
	add r1, r0, #1
	str r1, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	cmp r1, r0
	movge r0, #0
	strge r0, [r5, #0x38]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C8F50: .word 0x021E0294
_020C8F54: .word 0x021E0254
	arm_func_end sub_020C8EA8

	arm_func_start sub_020C8F58
sub_020C8F58: ; 0x020C8F58
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #0x24]
	mov r1, r1, lsl #0x1e
	movs r1, r1, asr #0x1f
	ldmeqia sp!, {r4, pc}
	ldr r2, [r0, #0x40]
	mov r3, #1
	mov r1, #0
	mov r2, r3, lsl r2
	ldr r0, [r0, #0x44]
	mov r3, r1
	bl sub_020D519C
	bl sub_020D59FC
	mov r4, r0
	mov r0, #1
	bl sub_020D57D4
	mov r0, r4
	bl sub_020D5990
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C8F58

	arm_func_start sub_020C8FA4
sub_020C8FA4: ; 0x020C8FA4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, [r4, #0x24]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _020C8FF4
	mov r5, #1
_020C8FCC:
	bl sub_020D3A38
	mov r6, r0
	mov r0, r4
	mov r1, r5
	bl sub_020C8EA8
	mov r0, r6
	bl sub_020D3A4C
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _020C8FCC
_020C8FF4:
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	mov r2, r2, lsl r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl sub_020D5174
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C8FA4

	arm_func_start sub_020C9014
sub_020C9014: ; 0x020C9014
	stmdb sp!, {r4, lr}
	ldr r1, _020C9064 ; =0x021E0314
	mov r2, r0
	ldr r0, [r1, #0x48]
	ldr r4, _020C9068 ; =0x021E035C
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	cmp r2, #0
	bne _020C904C
	bl sub_020C912C
	ldmia sp!, {r4, pc}
_020C904C:
	add r0, r4, #0x3c
	mov r1, #0
	bl sub_020CAEE4
	mov r0, #1
	str r0, [r4, #0x4c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C9064: .word 0x021E0314
_020C9068: .word 0x021E035C
	arm_func_end sub_020C9014

	arm_func_start sub_020C906C
sub_020C906C: ; 0x020C906C
	ldr r0, _020C9078 ; =0x021E0314
	ldr r0, [r0, #0x48]
	bx lr
	.align 2, 0
_020C9078: .word 0x021E0314
	arm_func_end sub_020C906C

	arm_func_start sub_020C907C
sub_020C907C: ; 0x020C907C
	ldr r0, _020C9088 ; =0x021E0314
	ldr r0, [r0, #0x4c]
	bx lr
	.align 2, 0
_020C9088: .word 0x021E0314
	arm_func_end sub_020C907C

	arm_func_start sub_020C908C
sub_020C908C: ; 0x020C908C
	ldr r0, _020C90A0 ; =0x021E0314
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0x48]
	bx lr
	.align 2, 0
_020C90A0: .word 0x021E0314
	arm_func_end sub_020C908C

	arm_func_start sub_020C90A4
sub_020C90A4: ; 0x020C90A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020C9124 ; =0x021E0314
	ldr r4, _020C9128 ; =0x021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x3c
	bl sub_020CAF40
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _020C90F4
	add r0, r4, #0x3c
	bl sub_020CAF58
	cmp r0, #0
	beq _020C90F4
	bl sub_020C912C
	ldmia sp!, {r3, r4, r5, pc}
_020C90F4:
	add r0, r4, #0x3c
	bl sub_020CAF0C
	ldr r1, [r4, #0x50]
	mov r5, r0, asr #8
	cmp r5, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x24]
	mov r1, r5
	mov r2, #0
	bl sub_020D52A0
	str r5, [r4, #0x50]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C9124: .word 0x021E0314
_020C9128: .word 0x021E035C
	arm_func_end sub_020C90A4

	arm_func_start sub_020C912C
sub_020C912C: ; 0x020C912C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020C9210 ; =0x021E0314
	ldr r4, _020C9214 ; =0x021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x2c]
	mov r3, #0
	cmp r1, #0
	movge r7, #1
	movlt r7, #0
	cmp r7, #0
	movne r0, #1
	movne r2, r0, lsl r1
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	moveq r2, #0
	bl sub_020D519C
	cmp r7, #0
	beq _020C91B4
	bl sub_020D59FC
	mov r5, r0
	mov r0, #1
	bl sub_020D57D4
	mov r0, r5
	bl sub_020D5990
	ldr r6, _020C9218 ; =0x021E031C
	mov r5, #0
_020C919C:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl sub_020D2444
	cmp r0, #0
	bne _020C919C
_020C91B4:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _020C91C4
	bl sub_020C7BF0
_020C91C4:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _020C91D4
	bl sub_020C7BC0
_020C91D4:
	cmp r7, #0
	beq _020C91E4
	ldr r0, [r4, #0x2c]
	bl sub_020C7C54
_020C91E4:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _020C9204
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020D53B4
_020C9204:
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C9210: .word 0x021E0314
_020C9214: .word 0x021E035C
_020C9218: .word 0x021E031C
	arm_func_end sub_020C912C

	arm_func_start sub_020C921C
sub_020C921C: ; 0x020C921C
	stmdb sp!, {r4, lr}
	ldr r0, _020C9274 ; =0x021E0314
	ldr r3, _020C9278 ; =0x021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r3, #0x2c]
	cmp r1, #0
	movge r0, #1
	movge r2, r0, lsl r1
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	movlt r2, #0
	mov r3, #0
	bl sub_020D519C
	bl sub_020D59FC
	mov r4, r0
	mov r0, #1
	bl sub_020D57D4
	mov r0, r4
	bl sub_020D5990
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C9274: .word 0x021E0314
_020C9278: .word 0x021E035C
	arm_func_end sub_020C921C

	arm_func_start sub_020C927C
sub_020C927C: ; 0x020C927C
	stmdb sp!, {r4, lr}
	ldr r0, _020C92F8 ; =0x021E0314
	ldr r4, _020C92FC ; =0x021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc]
	mov r0, #0
	ldr r2, [r4, #0x14]
	str r0, [r4, #0x1c]
	bl sub_020D47EC
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	mov r0, #0
	bl sub_020D47EC
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	bl DC_FlushRange
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl DC_FlushRange
	ldr r1, [r4, #0x2c]
	mov r3, #0
	cmp r1, #0
	movge r0, #1
	movge r2, r0, lsl r1
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	movlt r2, #0
	bl sub_020D5174
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C92F8: .word 0x021E0314
_020C92FC: .word 0x021E035C
	arm_func_end sub_020C927C

	arm_func_start sub_020C9300
sub_020C9300: ; 0x020C9300
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov ip, #0
	str ip, [r6, #0x8c]
	str ip, [r6, #0x84]
	str ip, [r6, #0x88]
	add r0, r6, #0x7c
	mov r5, r2
	mov r4, r3
	str ip, [r6, #0x90]
	bl sub_020D8180
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r6, #0x34
	bl FS_InitFile
	add r1, r6, #0x7c
	add r0, r6, #0x34
	ldmia r1, {r1, r2}
	bl sub_020D8208
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, r4
	str r3, [r6, #0x30]
	bl sub_020C9380
	cmp r0, #0
	ldrne r0, _020C937C ; =0x021E0910
	strne r6, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C937C: .word 0x021E0910
	arm_func_end sub_020C9300

	arm_func_start sub_020C9380
sub_020C9380: ; 0x020C9380
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	mov r1, #0
	mov r6, r2
	mov r2, r1
	add r0, r5, #0x34
	bl sub_020D83DC
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r5, #0x34
	mov r2, #0x30
	bl sub_020D83CC
	cmp r0, #0x30
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r4, #0
	beq _020C9540
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x1c]
	ldr r2, _020C954C ; =sub_020C99E8
	mov r0, r4
	mov r3, r5
	bl sub_020C9B50
	cmp r0, #0
	str r0, [r5, #0x8c]
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x18]
	add r0, r5, #0x34
	mov r2, #0
	bl sub_020D83DC
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x8c]
	ldr r2, [r5, #0x1c]
	add r0, r5, #0x34
	bl sub_020D83CC
	ldr r1, [r5, #0x1c]
	cmp r0, r1
	addne sp, sp, #4
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	str r0, [sp]
	ldr r1, [r5, #0x24]
	ldr r2, _020C9550 ; =sub_020C99F4
	mov r0, r4
	mov r3, r5
	bl sub_020C9B50
	cmp r0, #0
	str r0, [r5, #0x84]
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x20]
	add r0, r5, #0x34
	mov r2, #0
	bl sub_020D83DC
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x84]
	ldr r2, [r5, #0x24]
	add r0, r5, #0x34
	bl sub_020D83CC
	ldr r1, [r5, #0x24]
	cmp r0, r1
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r6, #0
	ldrne r1, [r5, #0x14]
	cmpne r1, #0
	beq _020C9540
	ldr r2, _020C9554 ; =sub_020C9A00
	mov ip, #0
	mov r0, r4
	mov r3, r5
	str ip, [sp]
	bl sub_020C9B50
	cmp r0, #0
	str r0, [r5, #0x88]
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x10]
	add r0, r5, #0x34
	mov r2, #0
	bl sub_020D83DC
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x88]
	ldr r2, [r5, #0x14]
	add r0, r5, #0x34
	bl sub_020D83CC
	ldr r1, [r5, #0x14]
	cmp r0, r1
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
_020C9540:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020C954C: .word sub_020C99E8
_020C9550: .word sub_020C99F4
_020C9554: .word sub_020C9A00
	arm_func_end sub_020C9380

	arm_func_start sub_020C9558
sub_020C9558: ; 0x020C9558
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	mov r1, r5
	mov r2, #0x30
	bl sub_020D4808
	ldr r0, [r5, #0x18]
	mov r3, #0
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x8c]
	ldr r0, [r5, #0x20]
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x84]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x88]
	str r3, [r5, #0x90]
	ldr r2, [r5, #0x84]
	ldr r0, [r2, #8]
	cmp r0, #0
	bls _020C9604
	mov ip, r3
	mov r1, r3
_020C95D0:
	add r2, r2, #0xc
	ldr r0, [r2, ip]
	add r2, r2, ip
	cmp r0, #0
	moveq r0, r1
	addne r0, r4, r0
	str r0, [r2, #8]
	ldr r2, [r5, #0x84]
	add r3, r3, #1
	ldr r0, [r2, #8]
	add ip, ip, #0x10
	cmp r3, r0
	blo _020C95D0
_020C9604:
	mov r1, #0
	ldr r0, _020C9618 ; =0x021E0910
	str r1, [r5, #0x30]
	str r5, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C9618: .word 0x021E0910
	arm_func_end sub_020C9558

	arm_func_start sub_020C961C
sub_020C961C: ; 0x020C961C
	ldr r1, _020C9630 ; =0x021E0910
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_020C9630: .word 0x021E0910
	arm_func_end sub_020C961C

	arm_func_start sub_020C9634
sub_020C9634: ; 0x020C9634
	ldr r0, _020C9640 ; =0x021E0910
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020C9640: .word 0x021E0910
	arm_func_end sub_020C9634

	arm_func_start sub_020C9644
sub_020C9644: ; 0x020C9644
	stmdb sp!, {r3, lr}
	bl sub_020C965C
	cmp r0, #0
	moveq r0, #0
	addne r0, r0, #4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9644

	arm_func_start sub_020C965C
sub_020C965C: ; 0x020C965C
	ldr r1, _020C96BC ; =0x021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #8]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C96BC: .word 0x021E0910
	arm_func_end sub_020C965C

	arm_func_start sub_020C96C0
sub_020C96C0: ; 0x020C96C0
	ldr r1, _020C9720 ; =0x021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0xc]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C9720: .word 0x021E0910
	arm_func_end sub_020C96C0

	arm_func_start sub_020C9724
sub_020C9724: ; 0x020C9724
	ldr r1, _020C9784 ; =0x021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C9784: .word 0x021E0910
	arm_func_end sub_020C9724

	arm_func_start sub_020C9788
sub_020C9788: ; 0x020C9788
	ldr r1, _020C97E8 ; =0x021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x14]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C97E8: .word 0x021E0910
	arm_func_end sub_020C9788

	arm_func_start sub_020C97EC
sub_020C97EC: ; 0x020C97EC
	ldr r1, _020C984C ; =0x021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x18]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C984C: .word 0x021E0910
	arm_func_end sub_020C97EC

	arm_func_start sub_020C9850
sub_020C9850: ; 0x020C9850
	ldr r1, _020C98B0 ; =0x021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C98B0: .word 0x021E0910
	arm_func_end sub_020C9850

	arm_func_start sub_020C98B4
sub_020C98B4: ; 0x020C98B4
	ldr r1, _020C98D8 ; =0x021E0910
	ldr r1, [r1]
	ldr r2, [r1, #0x84]
	ldr r1, [r2, #8]
	cmp r0, r1
	movhs r0, #0
	addlo r0, r2, r0, lsl #4
	ldrlo r0, [r0, #0x10]
	bx lr
	.align 2, 0
_020C98D8: .word 0x021E0910
	arm_func_end sub_020C98B4

	arm_func_start sub_020C98DC
sub_020C98DC: ; 0x020C98DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _020C99A0 ; =0x021E0910
	mov sb, r2
	ldr r7, [r4]
	mov sl, r1
	ldr r2, [r7, #0x84]
	mov r8, r3
	ldr r1, [r2, #8]
	cmp r0, r1
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, [r7, #0x90]
	add r1, r2, #0xc
	cmp r5, #0
	moveq r5, sb
	add fp, r1, r0, lsl #4
	cmp sb, #0
	mov r4, #0
	ble _020C9998
_020C9928:
	ldr r0, [fp, #4]
	sub r6, sb, r4
	cmp r6, r5
	movgt r6, r5
	sub r0, r0, r8
	cmp r6, r0
	movhi r6, r0
	cmp r6, #0
	beq _020C9998
	ldr r1, [fp]
	mov r2, #0
	add r0, r7, #0x34
	add r1, r1, r8
	bl sub_020D83DC
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, sl
	mov r2, r6
	add r0, r7, #0x34
	bl sub_020D83CC
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r4, r4, r0
	cmp r4, sb
	add r8, r8, r0
	add sl, sl, r0
	blt _020C9928
_020C9998:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C99A0: .word 0x021E0910
	arm_func_end sub_020C98DC

	arm_func_start sub_020C99A4
sub_020C99A4: ; 0x020C99A4
	ldr r1, _020C99C8 ; =0x021E0910
	ldr r1, [r1]
	ldr r2, [r1, #0x84]
	ldr r1, [r2, #8]
	cmp r0, r1
	movhs r0, #0
	addlo r0, r2, r0, lsl #4
	ldrlo r0, [r0, #0x14]
	bx lr
	.align 2, 0
_020C99C8: .word 0x021E0910
	arm_func_end sub_020C99A4

	arm_func_start sub_020C99CC
sub_020C99CC: ; 0x020C99CC
	ldr r2, _020C99E4 ; =0x021E0910
	ldr r2, [r2]
	ldr r2, [r2, #0x84]
	add r0, r2, r0, lsl #4
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
_020C99E4: .word 0x021E0910
	arm_func_end sub_020C99CC

	arm_func_start sub_020C99E8
sub_020C99E8: ; 0x020C99E8
	mov r0, #0
	str r0, [r2, #0x8c]
	bx lr
	arm_func_end sub_020C99E8

	arm_func_start sub_020C99F4
sub_020C99F4: ; 0x020C99F4
	mov r0, #0
	str r0, [r2, #0x84]
	bx lr
	arm_func_end sub_020C99F4

	arm_func_start sub_020C9A00
sub_020C9A00: ; 0x020C9A00
	mov r0, #0
	str r0, [r2, #0x88]
	bx lr
	arm_func_end sub_020C9A00

	arm_func_start sub_020C9A0C
sub_020C9A0C: ; 0x020C9A0C
	stmdb sp!, {r3, r4, r5, lr}
	add r2, r0, #3
	add r0, r0, r1
	bic r5, r2, #3
	cmp r5, r0
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, pc}
	sub r1, r0, r5
	cmp r1, #0x10
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	add r0, r5, #0x10
	sub r1, r1, #0x10
	mov r2, #0
	bl sub_020B56F4
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl sub_020C9D1C
	cmp r0, #0
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl sub_020B572C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C9A0C

	arm_func_start sub_020C9A7C
sub_020C9A7C: ; 0x020C9A7C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020C9A94
	ldr r0, [r4]
	bl sub_020B572C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C9A7C

	arm_func_start sub_020C9A94
sub_020C9A94: ; 0x020C9A94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	mov r6, #0
	mov r1, r6
	add r0, r8, #4
	bl sub_020B4D2C
	movs r5, r0
	beq _020C9B2C
	mov sl, #1
	mov sb, r6
	mov r4, r6
_020C9AC0:
	mov r0, r5
	mov r1, r4
	bl sub_020B4D2C
	movs r7, r0
	beq _020C9B0C
_020C9AD4:
	ldr ip, [r7, #0xc]
	cmp ip, #0
	beq _020C9AF8
	ldr r1, [r7, #8]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	add r0, r7, #0x20
	blx ip
	mov r6, sl
_020C9AF8:
	mov r0, r5
	mov r1, r7
	bl sub_020B4D2C
	movs r7, r0
	bne _020C9AD4
_020C9B0C:
	mov r1, r5
	add r0, r8, #4
	bl sub_020B4CB4
	mov r1, sb
	add r0, r8, #4
	bl sub_020B4D2C
	movs r5, r0
	bne _020C9AC0
_020C9B2C:
	ldr r0, [r8]
	mov r1, #3
	bl sub_020B576C
	cmp r6, #0
	beq _020C9B44
	bl sub_020C9D8C
_020C9B44:
	mov r0, r8
	bl sub_020C9D50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020C9A94

	arm_func_start sub_020C9B50
sub_020C9B50: ; 0x020C9B50
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	add r0, r7, #0x1f
	bic r1, r0, #0x1f
	mov r6, r2
	ldr r0, [r8]
	add r1, r1, #0x20
	mov r2, #0x20
	mov r5, r3
	bl sub_020B5738
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, #4
	mov r1, #0
	bl sub_020B4D2C
	str r7, [r4, #8]
	str r6, [r4, #0xc]
	ldr r2, [sp, #0x18]
	str r5, [r4, #0x10]
	mov r1, r4
	str r2, [r4, #0x14]
	bl sub_020B4BAC
	add r0, r4, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020C9B50

	arm_func_start sub_020C9BB8
sub_020C9BB8: ; 0x020C9BB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r1, [r4, #0xc]
	ldr r0, [r4]
	bl sub_020B57D0
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl sub_020C9D50
	cmp r0, #0
	ldrneh r0, [r4, #0xc]
	subne r0, r0, #1
	ldmneia sp!, {r4, pc}
	ldr r0, [r4]
	mov r1, #0
	bl sub_020B5820
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C9BB8

	arm_func_start sub_020C9C04
sub_020C9C04: ; 0x020C9C04
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, #0
	movs sb, r1
	mov sl, r0
	mov r7, r8
	bne _020C9C24
	bl sub_020C9A94
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C9C24:
	ldrh r0, [sl, #0xc]
	cmp sb, r0
	bge _020C9CA8
	mov r4, #1
	mov r5, r8
_020C9C38:
	mov r1, r5
	add r0, sl, #4
	bl sub_020B4D2C
	mov r1, r8
	mov r6, r0
	bl sub_020B4D2C
	movs r8, r0
	beq _020C9C90
_020C9C58:
	ldr ip, [r8, #0xc]
	cmp ip, #0
	beq _020C9C7C
	ldr r1, [r8, #8]
	ldr r2, [r8, #0x10]
	ldr r3, [r8, #0x14]
	add r0, r8, #0x20
	blx ip
	mov r7, r4
_020C9C7C:
	mov r0, r6
	mov r1, r8
	bl sub_020B4D2C
	movs r8, r0
	bne _020C9C58
_020C9C90:
	mov r1, r6
	add r0, sl, #4
	bl sub_020B4CB4
	ldrh r0, [sl, #0xc]
	cmp sb, r0
	blt _020C9C38
_020C9CA8:
	ldr r0, [sl]
	mov r1, sb
	bl sub_020B5820
	cmp r7, #0
	beq _020C9CC0
	bl sub_020C9D8C
_020C9CC0:
	ldrh r1, [sl, #0xc]
	ldr r0, [sl]
	bl sub_020B57D0
	mov r0, sl
	bl sub_020C9D50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020C9C04

	arm_func_start sub_020C9CD8
sub_020C9CD8: ; 0x020C9CD8
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	sub r0, r0, r1
	bx lr
	arm_func_end sub_020C9CD8

	arm_func_start sub_020C9CE8
sub_020C9CE8: ; 0x020C9CE8
	stmdb sp!, {r3, lr}
	ldr r0, [r0]
	mov r1, #0x20
	bl sub_020B5798
	cmp r0, #0x20
	movlo r0, #0
	subhs r0, r0, #0x20
	bichs r0, r0, #0x1f
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9CE8

	arm_func_start sub_020C9D0C
sub_020C9D0C: ; 0x020C9D0C
	ldr ip, _020C9D18 ; =sub_020B4B68
	mov r1, #0
	bx ip
	.align 2, 0
_020C9D18: .word sub_020B4B68
	arm_func_end sub_020C9D0C

	arm_func_start sub_020C9D1C
sub_020C9D1C: ; 0x020C9D1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r0, r5, #4
	mov r1, #0xc
	bl sub_020B4B68
	mov r0, r5
	str r4, [r5]
	bl sub_020C9D50
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C9D1C

	arm_func_start sub_020C9D50
sub_020C9D50: ; 0x020C9D50
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r1, #0x14
	mov r2, #4
	bl sub_020B5738
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_020C9D0C
	mov r1, r4
	add r0, r5, #4
	bl sub_020B4BAC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020C9D50

	arm_func_start sub_020C9D8C
sub_020C9D8C: ; 0x020C9D8C
	stmdb sp!, {r4, lr}
	bl sub_020D59FC
	mov r4, r0
	mov r0, #1
	bl sub_020D57D4
	mov r0, r4
	bl sub_020D5990
	ldmia sp!, {r4, pc}
	arm_func_end sub_020C9D8C

	arm_func_start sub_020C9DAC
sub_020C9DAC: ; 0x020C9DAC
	stmdb sp!, {r3, lr}
	bl sub_020C9E6C
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9DAC

	arm_func_start sub_020C9DC4
sub_020C9DC4: ; 0x020C9DC4
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov ip, #0
	mov r1, #0xff
	mov r3, #1
	str ip, [sp]
	bl sub_020C9F70
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9DC4

	arm_func_start sub_020C9DF0
sub_020C9DF0: ; 0x020C9DF0
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov ip, #0
	mov r1, #0xff
	mov r3, #1
	str ip, [sp]
	bl sub_020CA054
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9DF0

	arm_func_start sub_020C9E1C
sub_020C9E1C: ; 0x020C9E1C
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov ip, #0
	mov r1, #0xff
	mov r3, #1
	str ip, [sp]
	bl sub_020CA194
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9E1C

	arm_func_start sub_020C9E48
sub_020C9E48: ; 0x020C9E48
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl sub_020C9F70
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020C9E48

	arm_func_start sub_020C9E6C
sub_020C9E6C: ; 0x020C9E6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	bl sub_020C9850
	movs r6, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #0
	bls _020C9F68
	add r8, r6, #4
	mov fp, r7
	mov sl, r7
	mov r4, r7
	mov r5, r7
_020C9EA8:
	ldrb r0, [r8]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020C9F54
_020C9EB8: ; jump table
	b _020C9EC8 ; case 0
	b _020C9F10 ; case 1
	b _020C9F34 ; case 2
	b _020C9EEC ; case 3
_020C9EC8:
	str r5, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl sub_020C9F70
	cmp r0, #0
	beq _020C9F54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9EEC:
	str r4, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl sub_020C9FF4
	cmp r0, #0
	beq _020C9F54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9F10:
	str sl, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl sub_020CA054
	cmp r0, #0
	beq _020C9F54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9F34:
	str fp, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl sub_020CA194
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9F54:
	ldr r0, [r6]
	add r7, r7, #1
	cmp r7, r0
	add r8, r8, #8
	blo _020C9EA8
_020C9F68:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020C9E6C

	arm_func_start sub_020C9F70
sub_020C9F70: ; 0x020C9F70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_020C965C
	movs r4, r0
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [sp]
	ldrh r0, [r4, #4]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl sub_020CA054
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	tst r7, #1
	ldr r0, [r4]
	beq _020C9FDC
	mov r1, r6
	mov r2, r5
	bl sub_020CA2C0
	cmp r0, #0
	bne _020C9FE0
	mov r0, #6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C9FDC:
	bl sub_020C99A4
_020C9FE0:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020C9F70

	arm_func_start sub_020C9FF4
sub_020C9FF4: ; 0x020C9FF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020C96C0
	cmp r0, #0
	moveq r0, #3
	ldmeqia sp!, {r4, r5, r6, pc}
	tst r6, #8
	ldr r0, [r0]
	beq _020CA03C
	mov r1, r5
	mov r2, r4
	bl sub_020CA32C
	cmp r0, #0
	bne _020CA040
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020CA03C:
	bl sub_020C99A4
_020CA040:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020C9FF4

	arm_func_start sub_020CA054
sub_020CA054: ; 0x020CA054
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r1
	mov sb, r2
	mov fp, r3
	bl sub_020C9724
	movs r5, r0
	addeq sp, sp, #8
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	tst sl, #2
	ldr r0, [r5]
	beq _020CA0A8
	mov r1, sb
	mov r2, fp
	bl sub_020CA398
	movs r6, r0
	bne _020CA0B0
	add sp, sp, #8
	mov r0, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020CA0A8:
	bl sub_020C99A4
	mov r6, r0
_020CA0B0:
	and r8, sl, #4
	mov r7, #0
_020CA0B8:
	add r0, r5, r7, lsl #1
	ldrh r0, [r0, #4]
	ldr r1, _020CA190 ; =0x0000FFFF
	cmp r0, r1
	beq _020CA16C
	bl sub_020C9788
	movs r4, r0
	addeq sp, sp, #8
	moveq r0, #5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #4
	str r0, [sp]
	add r0, r5, r7, lsl #1
	ldrh r0, [r0, #4]
	mov r1, sl
	mov r2, sb
	mov r3, fp
	bl sub_020CA194
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4]
	mov r0, r0, lsr #0x18
	tst r0, #1
	cmpne r8, #0
	beq _020CA150
	str sb, [sp]
	ldr r1, [r4]
	ldr r0, [sp, #4]
	mov r3, r1, lsl #8
	mov r1, r6
	mov r2, r7
	mov r3, r3, lsr #8
	bl sub_020CA788
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #9
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020CA150:
	cmp r6, #0
	ldrne r2, [sp, #4]
	cmpne r2, #0
	beq _020CA16C
	mov r0, r6
	mov r1, r7
	bl sub_020D6154
_020CA16C:
	add r7, r7, #1
	cmp r7, #4
	blt _020CA0B8
	ldr r0, [sp, #0x30]
	cmp r0, #0
	strne r6, [r0]
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020CA190: .word 0x0000FFFF
	arm_func_end sub_020CA054

	arm_func_start sub_020CA194
sub_020CA194: ; 0x020CA194
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020C9788
	cmp r0, #0
	moveq r0, #5
	ldmeqia sp!, {r4, r5, r6, pc}
	tst r6, #4
	ldr r0, [r0]
	beq _020CA200
	mov r1, r0, lsr #0x18
	tst r1, #1
	mov r0, r0, lsl #8
	mov r1, r5
	beq _020CA1E4
	mov r2, r4
	mov r0, r0, lsr #8
	bl sub_020CA470
	b _020CA1F0
_020CA1E4:
	mov r2, r4
	mov r0, r0, lsr #8
	bl sub_020CA404
_020CA1F0:
	cmp r0, #0
	bne _020CA20C
	mov r0, #9
	ldmia sp!, {r4, r5, r6, pc}
_020CA200:
	mov r0, r0, lsl #8
	mov r0, r0, lsr #8
	bl sub_020C99A4
_020CA20C:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020CA194

	arm_func_start sub_020CA220
sub_020CA220: ; 0x020CA220
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r4, r3
	bl sub_020C98B4
	movs r5, r0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r2, r7
	mov r3, r6
	add r1, r5, #0x20
	str r4, [sp]
	bl sub_020C9B50
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r4
	mov r2, r5
	mov r3, #0
	bl sub_020C98DC
	cmp r5, r0
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r5
	bl sub_020D2878
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020CA220

	arm_func_start sub_020CA2C0
sub_020CA2C0: ; 0x020CA2C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020C99A4
	movs r4, r0
	bne _020CA320
	cmp r5, #0
	moveq r2, #0
	beq _020CA2F0
	bl sub_020C9634
	mov r2, r0
_020CA2F0:
	ldr r1, _020CA328 ; =sub_020CA5D0
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl sub_020CA220
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA320
	mov r0, r7
	mov r1, r4
	bl sub_020C99CC
_020CA320:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA328: .word sub_020CA5D0
	arm_func_end sub_020CA2C0

	arm_func_start sub_020CA32C
sub_020CA32C: ; 0x020CA32C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020C99A4
	movs r4, r0
	bne _020CA38C
	cmp r5, #0
	moveq r2, #0
	beq _020CA35C
	bl sub_020C9634
	mov r2, r0
_020CA35C:
	ldr r1, _020CA394 ; =sub_020CA5D0
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl sub_020CA220
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA38C
	mov r0, r7
	mov r1, r4
	bl sub_020C99CC
_020CA38C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA394: .word sub_020CA5D0
	arm_func_end sub_020CA32C

	arm_func_start sub_020CA398
sub_020CA398: ; 0x020CA398
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020C99A4
	movs r4, r0
	bne _020CA3F8
	cmp r5, #0
	moveq r2, #0
	beq _020CA3C8
	bl sub_020C9634
	mov r2, r0
_020CA3C8:
	ldr r1, _020CA400 ; =sub_020CA5F8
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl sub_020CA220
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA3F8
	mov r0, r7
	mov r1, r4
	bl sub_020C99CC
_020CA3F8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA400: .word sub_020CA5F8
	arm_func_end sub_020CA398

	arm_func_start sub_020CA404
sub_020CA404: ; 0x020CA404
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020C99A4
	movs r4, r0
	bne _020CA464
	cmp r5, #0
	moveq r2, #0
	beq _020CA434
	bl sub_020C9634
	mov r2, r0
_020CA434:
	ldr r1, _020CA46C ; =sub_020CA628
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl sub_020CA220
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA464
	mov r0, r7
	mov r1, r4
	bl sub_020C99CC
_020CA464:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA46C: .word sub_020CA628
	arm_func_end sub_020CA404

	arm_func_start sub_020CA470
sub_020CA470: ; 0x020CA470
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl sub_020C99A4
	movs r5, r0
	bne _020CA564
	ldr r1, _020CA56C ; =0x021E0914
	mov r0, sb
	mov r2, #0x3c
	mov r3, #0
	bl sub_020C98DC
	cmp r0, #0x3c
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _020CA570 ; =0x021E0914
	cmp r8, #0
	ldr r0, [r0, #0x38]
	mov r6, r0, lsl #2
	mov r4, r6, lsl #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	moveq r3, #0
	beq _020CA4DC
	bl sub_020C9634
	mov r3, r0
_020CA4DC:
	ldr r2, _020CA574 ; =sub_020CA658
	mov r0, r8
	add r1, r4, #0x5c
	str sb, [sp]
	bl sub_020C9B50
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r5
	add r2, r6, #0x3c
	mov r3, #0
	bl sub_020C98DC
	add r1, r6, #0x3c
	cmp r0, r1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r5, #0x38]
	add r0, r5, #0x3c
	mov r2, r6
	add r1, r0, r1, lsl #2
	bl sub_020D4A50
	mov r2, r6
	add r0, r5, #0x3c
	mov r1, #0
	bl sub_020D4994
	mov r0, r5
	add r1, r4, #0x3c
	bl sub_020D2878
	cmp r7, #0
	beq _020CA564
	mov r0, sb
	mov r1, r5
	bl sub_020C99CC
_020CA564:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020CA56C: .word 0x021E0914
_020CA570: .word 0x021E0914
_020CA574: .word sub_020CA658
	arm_func_end sub_020CA470

	arm_func_start sub_020CA578
sub_020CA578: ; 0x020CA578
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r4, r1
	mov r7, r0
	mov r6, r2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020D3A38
	mov r5, r0
	mov r0, r4
	bl sub_020C961C
	mov r4, r0
	mov r0, r6
	bl sub_020C99A4
	cmp r7, r0
	bne _020CA5BC
	mov r0, r6
	mov r1, #0
	bl sub_020C99CC
_020CA5BC:
	mov r0, r4
	bl sub_020C961C
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020CA578

	arm_func_start sub_020CA5D0
sub_020CA5D0: ; 0x020CA5D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl sub_020CA578
	mov r0, r5
	add r1, r5, r4
	bl sub_020D5334
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020CA5D0

	arm_func_start sub_020CA5F8
sub_020CA5F8: ; 0x020CA5F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl sub_020CA578
	mov r0, r5
	add r1, r5, r4
	bl sub_020D5354
	mov r0, r5
	bl sub_020D6220
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020CA5F8

	arm_func_start sub_020CA628
sub_020CA628: ; 0x020CA628
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl sub_020CA578
	mov r0, r5
	add r1, r5, r4
	bl sub_020D5374
	mov r0, r5
	bl sub_020D62B8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020CA628

	arm_func_start sub_020CA658
sub_020CA658: ; 0x020CA658
	stmdb sp!, {r4, lr}
	mov r1, r2
	mov r4, r0
	mov r2, r3
	bl sub_020CA578
	mov r0, r4
	bl sub_020D62B8
	ldmia sp!, {r4, pc}
	arm_func_end sub_020CA658

	arm_func_start sub_020CA678
sub_020CA678: ; 0x020CA678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r7, r0
	mov r4, r3
	mov r6, r1
	mov r0, r5
	mov r1, r4
	bl sub_020D650C
	cmp r7, r0
	bne _020CA6B0
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl sub_020D64D8
_020CA6B0:
	mov r0, r7
	add r1, r7, r6
	bl sub_020D5374
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020CA678

	arm_func_start sub_020CA6C0
sub_020CA6C0: ; 0x020CA6C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_020D650C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	bl sub_020D64D0
	ldr r1, [r8, #0x38]
	sub r0, r0, #1
	add r1, r1, r7
	add r1, r8, r1, lsl #2
	cmp r7, r0
	ldrlo r0, [r1, #0x40]
	ldr r4, [r1, #0x3c]
	ldrhs r0, [r8, #8]
	cmp r5, #0
	sub sb, r0, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r2, _020CA784 ; =sub_020CA678
	mov r0, r5
	mov r3, r8
	add r1, sb, #0x20
	str r7, [sp]
	bl sub_020C9B50
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r6
	mov r1, r5
	mov r2, sb
	mov r3, r4
	bl sub_020C98DC
	cmp sb, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	mov r1, sb
	bl sub_020D2878
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl sub_020D64D8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020CA784: .word sub_020CA678
	arm_func_end sub_020CA6C0

	arm_func_start sub_020CA788
sub_020CA788: ; 0x020CA788
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	add r0, sp, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x40]
	bl sub_020D6300
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	cmp r7, #0
	add r2, sp, #8
	addeq sp, sp, #0x1c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0x10
	mov r0, r7
	bl sub_020D6320
	cmp r0, #0
	beq _020CA83C
	add sl, sp, #0x10
	add sb, sp, #8
_020CA7EC:
	ldrb r0, [sp, #0x10]
	cmp r0, #1
	ldreqh r0, [sp, #0x14]
	cmpeq r6, r0
	bne _020CA824
	ldrh r1, [sp, #0x12]
	mov r0, r8
	mov r2, r5
	mov r3, r4
	bl sub_020CA6C0
	cmp r0, #0
	addeq sp, sp, #0x1c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020CA824:
	mov r0, r7
	mov r1, sl
	mov r2, sb
	bl sub_020D6320
	cmp r0, #0
	bne _020CA7EC
_020CA83C:
	mov r0, #1
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020CA788

	arm_func_start sub_020CA848
sub_020CA848: ; 0x020CA848
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	bl sub_020C9634
	mov r6, #0
	mov r5, r6
_020CA85C:
	mov r0, r6
	bl sub_020C97EC
	movs r7, r0
	beq _020CA8D0
	ldrb r1, [r7]
	mov r0, r6
	bl sub_020C7F8C
	ldrh r1, [r7, #2]
	mov r0, r6
	bl sub_020C7FAC
	ldr r0, [r7, #4]
	cmp r0, #0
	cmpne r4, #0
	beq _020CA8D0
	ldrb r0, [r7]
	mov r8, r5
	cmp r0, #0
	ble _020CA8D0
_020CA8A4:
	ldr r2, [r7, #4]
	mov r0, r6
	mov r1, r4
	bl sub_020C7FC4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r7]
	add r8, r8, #1
	cmp r8, r0
	blt _020CA8A4
_020CA8D0:
	add r6, r6, #1
	cmp r6, #0x20
	blt _020CA85C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020CA848

	arm_func_start sub_020CA8E4
sub_020CA8E4: ; 0x020CA8E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r0, [sp, #0x20]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020C965C
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	ldrltb r4, [r0, #8]
	cmp r5, #0
	ldrlth r5, [r0, #4]
	cmp r6, #0
	ldrltb r6, [r0, #9]
	ldr ip, [sp, #0x20]
	mov r2, r5
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r3, r4
	str ip, [sp, #4]
	bl sub_020CA9D4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020CA8E4

	arm_func_start sub_020CA954
sub_020CA954: ; 0x020CA954
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl sub_020C96C0
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r0]
	bl sub_020C99A4
	movs r4, r0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r5
	bl sub_020CAE8C
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	stmia sp, {r0, r4, r6}
	str r5, [sp, #0xc]
	ldrb r1, [r0, #9]
	ldrh r2, [r0, #4]
	ldrb r3, [r0, #8]
	mov r0, r7
	bl sub_020CAAD0
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020CA954

	arm_func_start sub_020CA9D4
sub_020CA9D4: ; 0x020CA9D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r2
	mov r2, r3
	ldr r5, [sp, #0x28]
	mov r6, r0
	mov r7, r1
	bl sub_020C85FC
	movs r4, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r4
	bl sub_020C8764
	mov r7, r0
	add ip, sp, #4
	mov r0, r8
	mov r2, r7
	mov r1, #6
	mov r3, #0
	str ip, [sp]
	bl sub_020CA054
	cmp r0, #0
	beq _020CAA4C
	mov r0, r4
	bl sub_020C8694
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020CAA4C:
	ldr r0, [sp, #0x2c]
	add ip, sp, #8
	mov r2, r7
	mov r1, #1
	mov r3, #0
	str ip, [sp]
	bl sub_020C9F70
	cmp r0, #0
	beq _020CAA84
	mov r0, r4
	bl sub_020C8694
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020CAA84:
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	ldr r1, [r2, #0x18]
	mov r0, r4
	add r1, r2, r1
	mov r2, #0
	bl sub_020C86A0
	ldrb r1, [r5, #6]
	mov r0, r6
	bl sub_020C821C
	ldrb r1, [r5, #7]
	mov r0, r6
	bl sub_020C825C
	ldr r1, [sp, #0x2c]
	mov r0, r6
	bl sub_020C82FC
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020CA9D4

	arm_func_start sub_020CAAD0
sub_020CAAD0: ; 0x020CAAD0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r2
	mov r2, r3
	ldr r6, [sp, #0x20]
	mov r4, r0
	mov r8, r1
	bl sub_020C85FC
	movs r5, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r5
	bl sub_020C8764
	add ip, sp, #4
	mov r2, r0
	mov r0, r7
	mov r1, #6
	mov r3, #0
	str ip, [sp]
	bl sub_020CA054
	cmp r0, #0
	beq _020CAB44
	mov r0, r5
	bl sub_020C8694
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020CAB44:
	ldr ip, [sp, #0x24]
	ldr r2, [r6]
	ldr r1, [ip, #0x18]
	ldr r3, [sp, #4]
	mov r0, r5
	add r1, ip, r1
	bl sub_020C86A0
	ldrb r1, [r6, #6]
	mov r0, r4
	bl sub_020C821C
	ldrb r1, [r6, #7]
	mov r0, r4
	bl sub_020C825C
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r0, r4
	bl sub_020C8320
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020CAAD0

	arm_func_start sub_020CAB94
sub_020CAB94: ; 0x020CAB94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r7, _020CAC9C ; =0x021E0FEC
	ldr r4, _020CACA0 ; =0x0210D750
	mov r5, #0
_020CABA4:
	ldr r1, [r7, #0x110]
	mov r0, r1, lsl #0x1f
	movs r0, r0, asr #0x1f
	beq _020CAC88
	ldr r0, [r7, #0x114]
	cmp r0, #0
	bne _020CABCC
	mov r0, r7
	bl sub_020CACD0
	b _020CAC88
_020CABCC:
	mov r0, r1, lsl #0x1d
	movs r0, r0, asr #0x1f
	ldrne r0, [r7, #0x118]
	cmpne r0, #0
	beq _020CABF8
	mov r0, r7
	bl sub_020C8D18
	ldr r0, [r7, #0x110]
	orr r0, r0, #2
	bic r0, r0, #4
	str r0, [r7, #0x110]
_020CABF8:
	ldr r0, [r7, #0x110]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	beq _020CAC88
	add r0, r7, #0xe8
	bl sub_020CAF40
	ldr r1, [r7, #0x154]
	add r0, r7, #0xe8
	mov r1, r1, lsl #1
	ldrsh r6, [r4, r1]
	bl sub_020CAF0C
	mov r0, r0, asr #8
	ldr r1, [r7, #0x158]
	mov r0, r0, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r4, r0]
	ldrsh r2, [r4, r2]
	ldr r0, [r7, #0x15c]
	add r1, r1, r6
	add r6, r2, r1
	cmp r6, r0
	beq _020CAC60
	mov r0, r7
	mov r1, r6
	bl sub_020C8D88
	str r6, [r7, #0x15c]
_020CAC60:
	ldr r0, [r7, #0x110]
	mov r0, r0, lsl #0x1c
	movs r0, r0, asr #0x1f
	beq _020CAC88
	add r0, r7, #0xe8
	bl sub_020CAF58
	cmp r0, #0
	beq _020CAC88
	mov r0, r7
	bl sub_020CACD0
_020CAC88:
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x174
	blt _020CABA4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CAC9C: .word 0x021E0FEC
_020CACA0: .word 0x0210D750
	arm_func_end sub_020CAB94

	arm_func_start sub_020CACA4
sub_020CACA4: ; 0x020CACA4
	ldr r2, [r0, #0x14c]
	cmp r2, #0
	movne r1, #0
	strne r1, [r2]
	strne r1, [r0, #0x14c]
	ldr r1, [r0, #0x110]
	bic r2, r1, #1
	bic r1, r2, #4
	bic r1, r1, #2
	str r1, [r0, #0x110]
	bx lr
	arm_func_end sub_020CACA4

	arm_func_start sub_020CACD0
sub_020CACD0: ; 0x020CACD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020CAD60 ; =0x021E0FC8
	bl OS_LockMutex
	ldr r0, _020CAD64 ; =0x021E0950
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020CACFC
	add r0, r0, #0xc8
	add r0, r0, #0x400
	bl OS_LockMutex
_020CACFC:
	ldr r0, [r4, #0x110]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	beq _020CAD14
	mov r0, r4
	bl sub_020C8D6C
_020CAD14:
	ldr r0, [r4, #0x110]
	mov r0, r0, lsl #0x1f
	movs r0, r0, asr #0x1f
	beq _020CAD30
	ldr r1, [r4, #0x170]
	mov r0, r4
	blx r1
_020CAD30:
	mov r0, r4
	bl sub_020CAD68
	ldr r0, _020CAD60 ; =0x021E0FC8
	bl OS_UnlockMutex
	ldr r0, _020CAD64 ; =0x021E0950
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r0, #0xc8
	add r0, r0, #0x400
	bl OS_UnlockMutex
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CAD60: .word 0x021E0FC8
_020CAD64: .word 0x021E0950
	arm_func_end sub_020CACD0

	arm_func_start sub_020CAD68
sub_020CAD68: ; 0x020CAD68
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x110]
	mov r1, r1, lsl #0x1f
	movs r1, r1, asr #0x1f
	ldmeqia sp!, {r4, pc}
	bl sub_020CADCC
	ldr r1, [r4, #0x168]
	mov r0, r4
	blx r1
	ldr r0, _020CADC4 ; =0x021E0FE0
	mov r1, r4
	bl sub_020CADF0
	ldr r0, _020CADC8 ; =0x021E0950
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020CADB8
	mov r1, r4
	add r0, r0, #0x4e0
	bl sub_020CADF0
_020CADB8:
	mov r0, r4
	bl sub_020CACA4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CADC4: .word 0x021E0FE0
_020CADC8: .word 0x021E0950
	arm_func_end sub_020CAD68

	arm_func_start sub_020CADCC
sub_020CADCC: ; 0x020CADCC
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0x120]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	subs r1, r1, #1
	str r1, [r0, #0x120]
	ldmneia sp!, {r3, pc}
	bl sub_020C8B50
	ldmia sp!, {r3, pc}
	arm_func_end sub_020CADCC

	arm_func_start sub_020CADF0
sub_020CADF0: ; 0x020CADF0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	bl sub_020D3A38
	mov r4, r0
	mov r0, r8
	mov r1, #0
	bl sub_020B4D14
	movs r5, r0
	beq _020CAE54
_020CAE18:
	mov r0, r8
	mov r1, r5
	bl sub_020B4D14
	ldr r1, [r5, #8]
	mov r6, r0
	cmp r1, r7
	bne _020CAE48
	mov r0, r8
	mov r1, r5
	bl sub_020B4CB4
	mov r0, r5
	bl sub_020CAE60
_020CAE48:
	mov r5, r6
	cmp r6, #0
	bne _020CAE18
_020CAE54:
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020CADF0

	arm_func_start sub_020CAE60
sub_020CAE60: ; 0x020CAE60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020D3A38
	mov r4, r0
	ldr r0, _020CAE88 ; =0x021E095C
	mov r1, r5
	bl sub_020B4BAC
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020CAE88: .word 0x021E095C
	arm_func_end sub_020CAE60

	arm_func_start sub_020CAE8C
sub_020CAE8C: ; 0x020CAE8C
	cmp r1, #0
	movlt r0, #0
	bxlt lr
	ldr r2, [r0, #0x1c]
	cmp r1, r2
	movhs r0, #0
	bxhs lr
	mov r2, #0xc
	mul r3, r1, r2
	add ip, r0, #0x20
	ldr r1, [ip, r3]
	sub r0, r2, #0xd
	cmp r1, r0
	add r0, ip, r3
	moveq r0, #0
	bx lr
	arm_func_end sub_020CAE8C

	arm_func_start sub_020CAECC
sub_020CAECC: ; 0x020CAECC
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_020CAECC

	arm_func_start sub_020CAEE4
sub_020CAEE4: ; 0x020CAEE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020CAF0C
	stmia r6, {r0, r5}
	str r4, [r6, #0xc]
	mov r0, #0
	str r0, [r6, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020CAEE4

	arm_func_start sub_020CAF0C
sub_020CAF0C: ; 0x020CAF0C
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #8]
	cmp r2, r1
	ldrge r0, [r0, #4]
	ldmgeia sp!, {r4, pc}
	ldr r4, [r0]
	ldr r0, [r0, #4]
	sub r0, r0, r4
	mul r0, r2, r0
	bl sub_020F2998
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020CAF0C

	arm_func_start sub_020CAF40
sub_020CAF40: ; 0x020CAF40
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #8]
	bx lr
	arm_func_end sub_020CAF40

	arm_func_start sub_020CAF58
sub_020CAF58: ; 0x020CAF58
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	movge r0, #1
	movlt r0, #0
	bx lr
	arm_func_end sub_020CAF58

	.rodata

_02109200:
	.byte 0xD8, 0x58, 0x0B, 0x02, 0xEC, 0x58, 0x0B, 0x02, 0x44, 0x59, 0x0B, 0x02, 0x60, 0x59, 0x0B, 0x02
	.byte 0x48, 0x5F, 0x0B, 0x02, 0x74, 0x5F, 0x0B, 0x02, 0xA0, 0x5F, 0x0B, 0x02, 0xC4, 0x5F, 0x0B, 0x02
	.byte 0xE8, 0x5F, 0x0B, 0x02, 0xF4, 0x5F, 0x0B, 0x02, 0x00, 0x60, 0x0B, 0x02, 0x0C, 0x60, 0x0B, 0x02
	.byte 0x18, 0x60, 0x0B, 0x02, 0x24, 0x60, 0x0B, 0x02, 0x30, 0x60, 0x0B, 0x02, 0x3C, 0x60, 0x0B, 0x02
	.byte 0x48, 0x60, 0x0B, 0x02, 0x54, 0x60, 0x0B, 0x02, 0x60, 0x60, 0x0B, 0x02, 0x6C, 0x60, 0x0B, 0x02
	.byte 0x78, 0x60, 0x0B, 0x02, 0xA4, 0x60, 0x0B, 0x02, 0xD0, 0x60, 0x0B, 0x02, 0xDC, 0x60, 0x0B, 0x02
	.byte 0xE8, 0x60, 0x0B, 0x02, 0xF4, 0x60, 0x0B, 0x02, 0x00, 0x61, 0x0B, 0x02, 0x0C, 0x61, 0x0B, 0x02
	.byte 0x18, 0x61, 0x0B, 0x02, 0x24, 0x61, 0x0B, 0x02, 0x30, 0x61, 0x0B, 0x02, 0x3C, 0x61, 0x0B, 0x02
	.byte 0x48, 0x61, 0x0B, 0x02, 0x54, 0x61, 0x0B, 0x02, 0x60, 0x61, 0x0B, 0x02, 0x6C, 0x61, 0x0B, 0x02
	.byte 0x78, 0x61, 0x0B, 0x02, 0xA4, 0x61, 0x0B, 0x02, 0xD0, 0x61, 0x0B, 0x02, 0xDC, 0x61, 0x0B, 0x02
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00
	.byte 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x10, 0x00, 0x20, 0x00, 0x20, 0x00, 0x40, 0x00
	.byte 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00, 0x10, 0x00, 0x20, 0x00, 0x20, 0x00, 0x40, 0x00
	.byte 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x7C, 0xCA, 0x0B, 0x02, 0x74, 0xCE, 0x0B, 0x02, 0xF4, 0xCE, 0x0B, 0x02, 0x7C, 0xCA, 0x0B, 0x02
	.byte 0x24, 0xCE, 0x0B, 0x02, 0xF4, 0xCE, 0x0B, 0x02, 0x14, 0xCC, 0x0B, 0x02, 0x24, 0xCE, 0x0B, 0x02
	.byte 0x90, 0xD0, 0x0B, 0x02, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x01
	.byte 0x02, 0x01, 0x02, 0x01, 0x00, 0x02, 0x01, 0x02, 0x02, 0x02, 0x03, 0x02, 0x00, 0x02, 0x01, 0x02
	.byte 0x02, 0x03, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40, 0x00, 0x80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x40, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.byte 0x00, 0x40, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xC0
	.byte 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x80, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x80, 0xFF, 0x7F
	.byte 0xFF, 0xFF, 0xFF, 0x7F, 0x04, 0x05, 0x07, 0x08, 0x03, 0x05, 0x06, 0x08, 0x03, 0x04, 0x06, 0x07
	.byte 0x01, 0x02, 0x07, 0x08, 0x00, 0x02, 0x06, 0x08, 0x00, 0x01, 0x06, 0x07, 0x01, 0x02, 0x04, 0x05
	.byte 0x00, 0x02, 0x03, 0x05, 0x00, 0x01, 0x03, 0x04, 0x04, 0x05, 0x07, 0x08, 0x03, 0x05, 0x06, 0x08
	.byte 0x03, 0x04, 0x06, 0x07, 0x01, 0x02, 0x07, 0x08, 0x00, 0x02, 0x06, 0x08, 0x00, 0x01, 0x06, 0x07
	.byte 0x01, 0x02, 0x04, 0x05, 0x00, 0x02, 0x03, 0x05, 0x00, 0x01, 0x03, 0x04, 0x00, 0x00, 0x00, 0x10
	.byte 0x06, 0x00, 0x00, 0x10, 0x0D, 0x00, 0x00, 0x10, 0x13, 0x00, 0x00, 0x10, 0x19, 0x00, 0x00, 0x10
	.byte 0x1F, 0x00, 0x00, 0x10, 0x26, 0x00, 0x00, 0x10, 0x2C, 0x00, 0x00, 0x10, 0x32, 0x00, 0x00, 0x10
	.byte 0x39, 0x00, 0x00, 0x10, 0x3F, 0x00, 0x00, 0x10, 0x45, 0x00, 0xFF, 0x0F, 0x4B, 0x00, 0xFF, 0x0F
	.byte 0x52, 0x00, 0xFF, 0x0F, 0x58, 0x00, 0xFF, 0x0F, 0x5E, 0x00, 0xFF, 0x0F, 0x65, 0x00, 0xFF, 0x0F
	.byte 0x6B, 0x00, 0xFF, 0x0F, 0x71, 0x00, 0xFE, 0x0F, 0x77, 0x00, 0xFE, 0x0F, 0x7E, 0x00, 0xFE, 0x0F
	.byte 0x84, 0x00, 0xFE, 0x0F, 0x8A, 0x00, 0xFE, 0x0F, 0x90, 0x00, 0xFD, 0x0F, 0x97, 0x00, 0xFD, 0x0F
	.byte 0x9D, 0x00, 0xFD, 0x0F, 0xA3, 0x00, 0xFD, 0x0F, 0xAA, 0x00, 0xFC, 0x0F, 0xB0, 0x00, 0xFC, 0x0F
	.byte 0xB6, 0x00, 0xFC, 0x0F, 0xBC, 0x00, 0xFC, 0x0F, 0xC3, 0x00, 0xFB, 0x0F, 0xC9, 0x00, 0xFB, 0x0F
	.byte 0xCF, 0x00, 0xFB, 0x0F, 0xD6, 0x00, 0xFA, 0x0F, 0xDC, 0x00, 0xFA, 0x0F, 0xE2, 0x00, 0xFA, 0x0F
	.byte 0xE8, 0x00, 0xF9, 0x0F, 0xEF, 0x00, 0xF9, 0x0F, 0xF5, 0x00, 0xF9, 0x0F, 0xFB, 0x00, 0xF8, 0x0F
	.byte 0x01, 0x01, 0xF8, 0x0F, 0x08, 0x01, 0xF8, 0x0F, 0x0E, 0x01, 0xF7, 0x0F, 0x14, 0x01, 0xF7, 0x0F
	.byte 0x1B, 0x01, 0xF6, 0x0F, 0x21, 0x01, 0xF6, 0x0F, 0x27, 0x01, 0xF5, 0x0F, 0x2D, 0x01, 0xF5, 0x0F
	.byte 0x34, 0x01, 0xF4, 0x0F, 0x3A, 0x01, 0xF4, 0x0F, 0x40, 0x01, 0xF3, 0x0F, 0x46, 0x01, 0xF3, 0x0F
	.byte 0x4D, 0x01, 0xF2, 0x0F, 0x53, 0x01, 0xF2, 0x0F, 0x59, 0x01, 0xF1, 0x0F, 0x5F, 0x01, 0xF1, 0x0F
	.byte 0x66, 0x01, 0xF0, 0x0F, 0x6C, 0x01, 0xF0, 0x0F, 0x72, 0x01, 0xEF, 0x0F, 0x78, 0x01, 0xEF, 0x0F
	.byte 0x7F, 0x01, 0xEE, 0x0F, 0x85, 0x01, 0xED, 0x0F, 0x8B, 0x01, 0xED, 0x0F, 0x91, 0x01, 0xEC, 0x0F
	.byte 0x98, 0x01, 0xEC, 0x0F, 0x9E, 0x01, 0xEB, 0x0F, 0xA4, 0x01, 0xEA, 0x0F, 0xAA, 0x01, 0xEA, 0x0F
	.byte 0xB1, 0x01, 0xE9, 0x0F, 0xB7, 0x01, 0xE8, 0x0F, 0xBD, 0x01, 0xE8, 0x0F, 0xC3, 0x01, 0xE7, 0x0F
	.byte 0xCA, 0x01, 0xE6, 0x0F, 0xD0, 0x01, 0xE6, 0x0F, 0xD6, 0x01, 0xE5, 0x0F, 0xDC, 0x01, 0xE4, 0x0F
	.byte 0xE3, 0x01, 0xE3, 0x0F, 0xE9, 0x01, 0xE3, 0x0F, 0xEF, 0x01, 0xE2, 0x0F, 0xF5, 0x01, 0xE1, 0x0F
	.byte 0xFC, 0x01, 0xE0, 0x0F, 0x02, 0x02, 0xE0, 0x0F, 0x08, 0x02, 0xDF, 0x0F, 0x0E, 0x02, 0xDE, 0x0F
	.byte 0x15, 0x02, 0xDD, 0x0F, 0x1B, 0x02, 0xDC, 0x0F, 0x21, 0x02, 0xDC, 0x0F, 0x27, 0x02, 0xDB, 0x0F
	.byte 0x2D, 0x02, 0xDA, 0x0F, 0x34, 0x02, 0xD9, 0x0F, 0x3A, 0x02, 0xD8, 0x0F, 0x40, 0x02, 0xD7, 0x0F
	.byte 0x46, 0x02, 0xD6, 0x0F, 0x4D, 0x02, 0xD5, 0x0F, 0x53, 0x02, 0xD5, 0x0F, 0x59, 0x02, 0xD4, 0x0F
	.byte 0x5F, 0x02, 0xD3, 0x0F, 0x65, 0x02, 0xD2, 0x0F, 0x6C, 0x02, 0xD1, 0x0F, 0x72, 0x02, 0xD0, 0x0F
	.byte 0x78, 0x02, 0xCF, 0x0F, 0x7E, 0x02, 0xCE, 0x0F, 0x84, 0x02, 0xCD, 0x0F, 0x8B, 0x02, 0xCC, 0x0F
	.byte 0x91, 0x02, 0xCB, 0x0F, 0x97, 0x02, 0xCA, 0x0F, 0x9D, 0x02, 0xC9, 0x0F, 0xA3, 0x02, 0xC8, 0x0F
	.byte 0xAA, 0x02, 0xC7, 0x0F, 0xB0, 0x02, 0xC6, 0x0F, 0xB6, 0x02, 0xC5, 0x0F, 0xBC, 0x02, 0xC4, 0x0F
	.byte 0xC2, 0x02, 0xC3, 0x0F, 0xC9, 0x02, 0xC2, 0x0F, 0xCF, 0x02, 0xC0, 0x0F, 0xD5, 0x02, 0xBF, 0x0F
	.byte 0xDB, 0x02, 0xBE, 0x0F, 0xE1, 0x02, 0xBD, 0x0F, 0xE8, 0x02, 0xBC, 0x0F, 0xEE, 0x02, 0xBB, 0x0F
	.byte 0xF4, 0x02, 0xBA, 0x0F, 0xFA, 0x02, 0xB8, 0x0F, 0x00, 0x03, 0xB7, 0x0F, 0x06, 0x03, 0xB6, 0x0F
	.byte 0x0D, 0x03, 0xB5, 0x0F, 0x13, 0x03, 0xB4, 0x0F, 0x19, 0x03, 0xB3, 0x0F, 0x1F, 0x03, 0xB1, 0x0F
	.byte 0x25, 0x03, 0xB0, 0x0F, 0x2B, 0x03, 0xAF, 0x0F, 0x32, 0x03, 0xAE, 0x0F, 0x38, 0x03, 0xAC, 0x0F
	.byte 0x3E, 0x03, 0xAB, 0x0F, 0x44, 0x03, 0xAA, 0x0F, 0x4A, 0x03, 0xA8, 0x0F, 0x50, 0x03, 0xA7, 0x0F
	.byte 0x56, 0x03, 0xA6, 0x0F, 0x5D, 0x03, 0xA5, 0x0F, 0x63, 0x03, 0xA3, 0x0F, 0x69, 0x03, 0xA2, 0x0F
	.byte 0x6F, 0x03, 0xA1, 0x0F, 0x75, 0x03, 0x9F, 0x0F, 0x7B, 0x03, 0x9E, 0x0F, 0x81, 0x03, 0x9C, 0x0F
	.byte 0x88, 0x03, 0x9B, 0x0F, 0x8E, 0x03, 0x9A, 0x0F, 0x94, 0x03, 0x98, 0x0F, 0x9A, 0x03, 0x97, 0x0F
	.byte 0xA0, 0x03, 0x95, 0x0F, 0xA6, 0x03, 0x94, 0x0F, 0xAC, 0x03, 0x93, 0x0F, 0xB2, 0x03, 0x91, 0x0F
	.byte 0xB9, 0x03, 0x90, 0x0F, 0xBF, 0x03, 0x8E, 0x0F, 0xC5, 0x03, 0x8D, 0x0F, 0xCB, 0x03, 0x8B, 0x0F
	.byte 0xD1, 0x03, 0x8A, 0x0F, 0xD7, 0x03, 0x88, 0x0F, 0xDD, 0x03, 0x87, 0x0F, 0xE3, 0x03, 0x85, 0x0F
	.byte 0xE9, 0x03, 0x84, 0x0F, 0xEF, 0x03, 0x82, 0x0F, 0xF6, 0x03, 0x81, 0x0F, 0xFC, 0x03, 0x7F, 0x0F
	.byte 0x02, 0x04, 0x7D, 0x0F, 0x08, 0x04, 0x7C, 0x0F, 0x0E, 0x04, 0x7A, 0x0F, 0x14, 0x04, 0x79, 0x0F
	.byte 0x1A, 0x04, 0x77, 0x0F, 0x20, 0x04, 0x76, 0x0F, 0x26, 0x04, 0x74, 0x0F, 0x2C, 0x04, 0x72, 0x0F
	.byte 0x32, 0x04, 0x71, 0x0F, 0x38, 0x04, 0x6F, 0x0F, 0x3E, 0x04, 0x6D, 0x0F, 0x44, 0x04, 0x6C, 0x0F
	.byte 0x4B, 0x04, 0x6A, 0x0F, 0x51, 0x04, 0x68, 0x0F, 0x57, 0x04, 0x67, 0x0F, 0x5D, 0x04, 0x65, 0x0F
	.byte 0x63, 0x04, 0x63, 0x0F, 0x69, 0x04, 0x61, 0x0F, 0x6F, 0x04, 0x60, 0x0F, 0x75, 0x04, 0x5E, 0x0F
	.byte 0x7B, 0x04, 0x5C, 0x0F, 0x81, 0x04, 0x5A, 0x0F, 0x87, 0x04, 0x59, 0x0F, 0x8D, 0x04, 0x57, 0x0F
	.byte 0x93, 0x04, 0x55, 0x0F, 0x99, 0x04, 0x53, 0x0F, 0x9F, 0x04, 0x51, 0x0F, 0xA5, 0x04, 0x50, 0x0F
	.byte 0xAB, 0x04, 0x4E, 0x0F, 0xB1, 0x04, 0x4C, 0x0F, 0xB7, 0x04, 0x4A, 0x0F, 0xBD, 0x04, 0x48, 0x0F
	.byte 0xC3, 0x04, 0x46, 0x0F, 0xC9, 0x04, 0x45, 0x0F, 0xCF, 0x04, 0x43, 0x0F, 0xD5, 0x04, 0x41, 0x0F
	.byte 0xDB, 0x04, 0x3F, 0x0F, 0xE1, 0x04, 0x3D, 0x0F, 0xE7, 0x04, 0x3B, 0x0F, 0xED, 0x04, 0x39, 0x0F
	.byte 0xF3, 0x04, 0x37, 0x0F, 0xF9, 0x04, 0x35, 0x0F, 0xFF, 0x04, 0x33, 0x0F, 0x05, 0x05, 0x31, 0x0F
	.byte 0x0B, 0x05, 0x2F, 0x0F, 0x11, 0x05, 0x2D, 0x0F, 0x17, 0x05, 0x2B, 0x0F, 0x1D, 0x05, 0x29, 0x0F
	.byte 0x23, 0x05, 0x27, 0x0F, 0x29, 0x05, 0x25, 0x0F, 0x2F, 0x05, 0x23, 0x0F, 0x34, 0x05, 0x21, 0x0F
	.byte 0x3A, 0x05, 0x1F, 0x0F, 0x40, 0x05, 0x1D, 0x0F, 0x46, 0x05, 0x1B, 0x0F, 0x4C, 0x05, 0x19, 0x0F
	.byte 0x52, 0x05, 0x17, 0x0F, 0x58, 0x05, 0x15, 0x0F, 0x5E, 0x05, 0x13, 0x0F, 0x64, 0x05, 0x11, 0x0F
	.byte 0x6A, 0x05, 0x0E, 0x0F, 0x70, 0x05, 0x0C, 0x0F, 0x76, 0x05, 0x0A, 0x0F, 0x7C, 0x05, 0x08, 0x0F
	.byte 0x81, 0x05, 0x06, 0x0F, 0x87, 0x05, 0x04, 0x0F, 0x8D, 0x05, 0x02, 0x0F, 0x93, 0x05, 0xFF, 0x0E
	.byte 0x99, 0x05, 0xFD, 0x0E, 0x9F, 0x05, 0xFB, 0x0E, 0xA5, 0x05, 0xF9, 0x0E, 0xAB, 0x05, 0xF7, 0x0E
	.byte 0xB1, 0x05, 0xF4, 0x0E, 0xB6, 0x05, 0xF2, 0x0E, 0xBC, 0x05, 0xF0, 0x0E, 0xC2, 0x05, 0xEE, 0x0E
	.byte 0xC8, 0x05, 0xEB, 0x0E, 0xCE, 0x05, 0xE9, 0x0E, 0xD4, 0x05, 0xE7, 0x0E, 0xDA, 0x05, 0xE4, 0x0E
	.byte 0xDF, 0x05, 0xE2, 0x0E, 0xE5, 0x05, 0xE0, 0x0E, 0xEB, 0x05, 0xDD, 0x0E, 0xF1, 0x05, 0xDB, 0x0E
	.byte 0xF7, 0x05, 0xD9, 0x0E, 0xFD, 0x05, 0xD6, 0x0E, 0x02, 0x06, 0xD4, 0x0E, 0x08, 0x06, 0xD2, 0x0E
	.byte 0x0E, 0x06, 0xCF, 0x0E, 0x14, 0x06, 0xCD, 0x0E, 0x1A, 0x06, 0xCB, 0x0E, 0x1F, 0x06, 0xC8, 0x0E
	.byte 0x25, 0x06, 0xC6, 0x0E, 0x2B, 0x06, 0xC3, 0x0E, 0x31, 0x06, 0xC1, 0x0E, 0x37, 0x06, 0xBF, 0x0E
	.byte 0x3C, 0x06, 0xBC, 0x0E, 0x42, 0x06, 0xBA, 0x0E, 0x48, 0x06, 0xB7, 0x0E, 0x4E, 0x06, 0xB5, 0x0E
	.byte 0x54, 0x06, 0xB2, 0x0E, 0x59, 0x06, 0xB0, 0x0E, 0x5F, 0x06, 0xAD, 0x0E, 0x65, 0x06, 0xAB, 0x0E
	.byte 0x6B, 0x06, 0xA8, 0x0E, 0x70, 0x06, 0xA6, 0x0E, 0x76, 0x06, 0xA3, 0x0E, 0x7C, 0x06, 0xA1, 0x0E
	.byte 0x82, 0x06, 0x9E, 0x0E, 0x87, 0x06, 0x9B, 0x0E, 0x8D, 0x06, 0x99, 0x0E, 0x93, 0x06, 0x96, 0x0E
	.byte 0x99, 0x06, 0x94, 0x0E, 0x9E, 0x06, 0x91, 0x0E, 0xA4, 0x06, 0x8F, 0x0E, 0xAA, 0x06, 0x8C, 0x0E
	.byte 0xAF, 0x06, 0x89, 0x0E, 0xB5, 0x06, 0x87, 0x0E, 0xBB, 0x06, 0x84, 0x0E, 0xC1, 0x06, 0x81, 0x0E
	.byte 0xC6, 0x06, 0x7F, 0x0E, 0xCC, 0x06, 0x7C, 0x0E, 0xD2, 0x06, 0x79, 0x0E, 0xD7, 0x06, 0x77, 0x0E
	.byte 0xDD, 0x06, 0x74, 0x0E, 0xE3, 0x06, 0x71, 0x0E, 0xE8, 0x06, 0x6F, 0x0E, 0xEE, 0x06, 0x6C, 0x0E
	.byte 0xF4, 0x06, 0x69, 0x0E, 0xF9, 0x06, 0x66, 0x0E, 0xFF, 0x06, 0x64, 0x0E, 0x05, 0x07, 0x61, 0x0E
	.byte 0x0A, 0x07, 0x5E, 0x0E, 0x10, 0x07, 0x5B, 0x0E, 0x15, 0x07, 0x59, 0x0E, 0x1B, 0x07, 0x56, 0x0E
	.byte 0x21, 0x07, 0x53, 0x0E, 0x26, 0x07, 0x50, 0x0E, 0x2C, 0x07, 0x4D, 0x0E, 0x32, 0x07, 0x4B, 0x0E
	.byte 0x37, 0x07, 0x48, 0x0E, 0x3D, 0x07, 0x45, 0x0E, 0x42, 0x07, 0x42, 0x0E, 0x48, 0x07, 0x3F, 0x0E
	.byte 0x4E, 0x07, 0x3C, 0x0E, 0x53, 0x07, 0x3A, 0x0E, 0x59, 0x07, 0x37, 0x0E, 0x5E, 0x07, 0x34, 0x0E
	.byte 0x64, 0x07, 0x31, 0x0E, 0x6A, 0x07, 0x2E, 0x0E, 0x6F, 0x07, 0x2B, 0x0E, 0x75, 0x07, 0x28, 0x0E
	.byte 0x7A, 0x07, 0x25, 0x0E, 0x80, 0x07, 0x22, 0x0E, 0x85, 0x07, 0x1F, 0x0E, 0x8B, 0x07, 0x1C, 0x0E
	.byte 0x90, 0x07, 0x19, 0x0E, 0x96, 0x07, 0x16, 0x0E, 0x9B, 0x07, 0x13, 0x0E, 0xA1, 0x07, 0x10, 0x0E
	.byte 0xA6, 0x07, 0x0D, 0x0E, 0xAC, 0x07, 0x0A, 0x0E, 0xB2, 0x07, 0x07, 0x0E, 0xB7, 0x07, 0x04, 0x0E
	.byte 0xBD, 0x07, 0x01, 0x0E, 0xC2, 0x07, 0xFE, 0x0D, 0xC8, 0x07, 0xFB, 0x0D, 0xCD, 0x07, 0xF8, 0x0D
	.byte 0xD2, 0x07, 0xF5, 0x0D, 0xD8, 0x07, 0xF2, 0x0D, 0xDD, 0x07, 0xEF, 0x0D, 0xE3, 0x07, 0xEC, 0x0D
	.byte 0xE8, 0x07, 0xE9, 0x0D, 0xEE, 0x07, 0xE6, 0x0D, 0xF3, 0x07, 0xE3, 0x0D, 0xF9, 0x07, 0xDF, 0x0D
	.byte 0xFE, 0x07, 0xDC, 0x0D, 0x04, 0x08, 0xD9, 0x0D, 0x09, 0x08, 0xD6, 0x0D, 0x0E, 0x08, 0xD3, 0x0D
	.byte 0x14, 0x08, 0xD0, 0x0D, 0x19, 0x08, 0xCC, 0x0D, 0x1F, 0x08, 0xC9, 0x0D, 0x24, 0x08, 0xC6, 0x0D
	.byte 0x2A, 0x08, 0xC3, 0x0D, 0x2F, 0x08, 0xC0, 0x0D, 0x34, 0x08, 0xBC, 0x0D, 0x3A, 0x08, 0xB9, 0x0D
	.byte 0x3F, 0x08, 0xB6, 0x0D, 0x45, 0x08, 0xB3, 0x0D, 0x4A, 0x08, 0xB0, 0x0D, 0x4F, 0x08, 0xAC, 0x0D
	.byte 0x55, 0x08, 0xA9, 0x0D, 0x5A, 0x08, 0xA6, 0x0D, 0x5F, 0x08, 0xA2, 0x0D, 0x65, 0x08, 0x9F, 0x0D
	.byte 0x6A, 0x08, 0x9C, 0x0D, 0x6F, 0x08, 0x99, 0x0D, 0x75, 0x08, 0x95, 0x0D, 0x7A, 0x08, 0x92, 0x0D
	.byte 0x7F, 0x08, 0x8F, 0x0D, 0x85, 0x08, 0x8B, 0x0D, 0x8A, 0x08, 0x88, 0x0D, 0x8F, 0x08, 0x85, 0x0D
	.byte 0x95, 0x08, 0x81, 0x0D, 0x9A, 0x08, 0x7E, 0x0D, 0x9F, 0x08, 0x7A, 0x0D, 0xA5, 0x08, 0x77, 0x0D
	.byte 0xAA, 0x08, 0x74, 0x0D, 0xAF, 0x08, 0x70, 0x0D, 0xB4, 0x08, 0x6D, 0x0D, 0xBA, 0x08, 0x69, 0x0D
	.byte 0xBF, 0x08, 0x66, 0x0D, 0xC4, 0x08, 0x62, 0x0D, 0xC9, 0x08, 0x5F, 0x0D, 0xCF, 0x08, 0x5C, 0x0D
	.byte 0xD4, 0x08, 0x58, 0x0D, 0xD9, 0x08, 0x55, 0x0D, 0xDE, 0x08, 0x51, 0x0D, 0xE4, 0x08, 0x4E, 0x0D
	.byte 0xE9, 0x08, 0x4A, 0x0D, 0xEE, 0x08, 0x47, 0x0D, 0xF3, 0x08, 0x43, 0x0D, 0xF8, 0x08, 0x40, 0x0D
	.byte 0xFE, 0x08, 0x3C, 0x0D, 0x03, 0x09, 0x39, 0x0D, 0x08, 0x09, 0x35, 0x0D, 0x0D, 0x09, 0x32, 0x0D
	.byte 0x12, 0x09, 0x2E, 0x0D, 0x18, 0x09, 0x2A, 0x0D, 0x1D, 0x09, 0x27, 0x0D, 0x22, 0x09, 0x23, 0x0D
	.byte 0x27, 0x09, 0x20, 0x0D, 0x2C, 0x09, 0x1C, 0x0D, 0x31, 0x09, 0x18, 0x0D, 0x37, 0x09, 0x15, 0x0D
	.byte 0x3C, 0x09, 0x11, 0x0D, 0x41, 0x09, 0x0E, 0x0D, 0x46, 0x09, 0x0A, 0x0D, 0x4B, 0x09, 0x06, 0x0D
	.byte 0x50, 0x09, 0x03, 0x0D, 0x55, 0x09, 0xFF, 0x0C, 0x5A, 0x09, 0xFB, 0x0C, 0x5F, 0x09, 0xF8, 0x0C
	.byte 0x65, 0x09, 0xF4, 0x0C, 0x6A, 0x09, 0xF0, 0x0C, 0x6F, 0x09, 0xED, 0x0C, 0x74, 0x09, 0xE9, 0x0C
	.byte 0x79, 0x09, 0xE5, 0x0C, 0x7E, 0x09, 0xE1, 0x0C, 0x83, 0x09, 0xDE, 0x0C, 0x88, 0x09, 0xDA, 0x0C
	.byte 0x8D, 0x09, 0xD6, 0x0C, 0x92, 0x09, 0xD2, 0x0C, 0x97, 0x09, 0xCF, 0x0C, 0x9C, 0x09, 0xCB, 0x0C
	.byte 0xA1, 0x09, 0xC7, 0x0C, 0xA6, 0x09, 0xC3, 0x0C, 0xAB, 0x09, 0xC0, 0x0C, 0xB0, 0x09, 0xBC, 0x0C
	.byte 0xB5, 0x09, 0xB8, 0x0C, 0xBA, 0x09, 0xB4, 0x0C, 0xBF, 0x09, 0xB0, 0x0C, 0xC4, 0x09, 0xAC, 0x0C
	.byte 0xC9, 0x09, 0xA9, 0x0C, 0xCE, 0x09, 0xA5, 0x0C, 0xD3, 0x09, 0xA1, 0x0C, 0xD8, 0x09, 0x9D, 0x0C
	.byte 0xDD, 0x09, 0x99, 0x0C, 0xE2, 0x09, 0x95, 0x0C, 0xE7, 0x09, 0x91, 0x0C, 0xEC, 0x09, 0x8E, 0x0C
	.byte 0xF1, 0x09, 0x8A, 0x0C, 0xF6, 0x09, 0x86, 0x0C, 0xFB, 0x09, 0x82, 0x0C, 0xFF, 0x09, 0x7E, 0x0C
	.byte 0x04, 0x0A, 0x7A, 0x0C, 0x09, 0x0A, 0x76, 0x0C, 0x0E, 0x0A, 0x72, 0x0C, 0x13, 0x0A, 0x6E, 0x0C
	.byte 0x18, 0x0A, 0x6A, 0x0C, 0x1D, 0x0A, 0x66, 0x0C, 0x22, 0x0A, 0x62, 0x0C, 0x26, 0x0A, 0x5E, 0x0C
	.byte 0x2B, 0x0A, 0x5A, 0x0C, 0x30, 0x0A, 0x56, 0x0C, 0x35, 0x0A, 0x52, 0x0C, 0x3A, 0x0A, 0x4E, 0x0C
	.byte 0x3F, 0x0A, 0x4A, 0x0C, 0x44, 0x0A, 0x46, 0x0C, 0x48, 0x0A, 0x42, 0x0C, 0x4D, 0x0A, 0x3E, 0x0C
	.byte 0x52, 0x0A, 0x3A, 0x0C, 0x57, 0x0A, 0x36, 0x0C, 0x5C, 0x0A, 0x32, 0x0C, 0x60, 0x0A, 0x2E, 0x0C
	.byte 0x65, 0x0A, 0x2A, 0x0C, 0x6A, 0x0A, 0x26, 0x0C, 0x6F, 0x0A, 0x22, 0x0C, 0x73, 0x0A, 0x1E, 0x0C
	.byte 0x78, 0x0A, 0x19, 0x0C, 0x7D, 0x0A, 0x15, 0x0C, 0x82, 0x0A, 0x11, 0x0C, 0x86, 0x0A, 0x0D, 0x0C
	.byte 0x8B, 0x0A, 0x09, 0x0C, 0x90, 0x0A, 0x05, 0x0C, 0x95, 0x0A, 0x01, 0x0C, 0x99, 0x0A, 0xFC, 0x0B
	.byte 0x9E, 0x0A, 0xF8, 0x0B, 0xA3, 0x0A, 0xF4, 0x0B, 0xA7, 0x0A, 0xF0, 0x0B, 0xAC, 0x0A, 0xEC, 0x0B
	.byte 0xB1, 0x0A, 0xE8, 0x0B, 0xB5, 0x0A, 0xE3, 0x0B, 0xBA, 0x0A, 0xDF, 0x0B, 0xBF, 0x0A, 0xDB, 0x0B
	.byte 0xC3, 0x0A, 0xD7, 0x0B, 0xC8, 0x0A, 0xD2, 0x0B, 0xCD, 0x0A, 0xCE, 0x0B, 0xD1, 0x0A, 0xCA, 0x0B
	.byte 0xD6, 0x0A, 0xC6, 0x0B, 0xDB, 0x0A, 0xC1, 0x0B, 0xDF, 0x0A, 0xBD, 0x0B, 0xE4, 0x0A, 0xB9, 0x0B
	.byte 0xE8, 0x0A, 0xB5, 0x0B, 0xED, 0x0A, 0xB0, 0x0B, 0xF2, 0x0A, 0xAC, 0x0B, 0xF6, 0x0A, 0xA8, 0x0B
	.byte 0xFB, 0x0A, 0xA3, 0x0B, 0xFF, 0x0A, 0x9F, 0x0B, 0x04, 0x0B, 0x9B, 0x0B, 0x08, 0x0B, 0x97, 0x0B
	.byte 0x0D, 0x0B, 0x92, 0x0B, 0x11, 0x0B, 0x8E, 0x0B, 0x16, 0x0B, 0x89, 0x0B, 0x1B, 0x0B, 0x85, 0x0B
	.byte 0x1F, 0x0B, 0x81, 0x0B, 0x24, 0x0B, 0x7C, 0x0B, 0x28, 0x0B, 0x78, 0x0B, 0x2D, 0x0B, 0x74, 0x0B
	.byte 0x31, 0x0B, 0x6F, 0x0B, 0x36, 0x0B, 0x6B, 0x0B, 0x3A, 0x0B, 0x66, 0x0B, 0x3E, 0x0B, 0x62, 0x0B
	.byte 0x43, 0x0B, 0x5E, 0x0B, 0x47, 0x0B, 0x59, 0x0B, 0x4C, 0x0B, 0x55, 0x0B, 0x50, 0x0B, 0x50, 0x0B
	.byte 0x55, 0x0B, 0x4C, 0x0B, 0x59, 0x0B, 0x47, 0x0B, 0x5E, 0x0B, 0x43, 0x0B, 0x62, 0x0B, 0x3E, 0x0B
	.byte 0x66, 0x0B, 0x3A, 0x0B, 0x6B, 0x0B, 0x36, 0x0B, 0x6F, 0x0B, 0x31, 0x0B, 0x74, 0x0B, 0x2D, 0x0B
	.byte 0x78, 0x0B, 0x28, 0x0B, 0x7C, 0x0B, 0x24, 0x0B, 0x81, 0x0B, 0x1F, 0x0B, 0x85, 0x0B, 0x1B, 0x0B
	.byte 0x89, 0x0B, 0x16, 0x0B, 0x8E, 0x0B, 0x11, 0x0B, 0x92, 0x0B, 0x0D, 0x0B, 0x97, 0x0B, 0x08, 0x0B
	.byte 0x9B, 0x0B, 0x04, 0x0B, 0x9F, 0x0B, 0xFF, 0x0A, 0xA3, 0x0B, 0xFB, 0x0A, 0xA8, 0x0B, 0xF6, 0x0A
	.byte 0xAC, 0x0B, 0xF2, 0x0A, 0xB0, 0x0B, 0xED, 0x0A, 0xB5, 0x0B, 0xE8, 0x0A, 0xB9, 0x0B, 0xE4, 0x0A
	.byte 0xBD, 0x0B, 0xDF, 0x0A, 0xC1, 0x0B, 0xDB, 0x0A, 0xC6, 0x0B, 0xD6, 0x0A, 0xCA, 0x0B, 0xD1, 0x0A
	.byte 0xCE, 0x0B, 0xCD, 0x0A, 0xD2, 0x0B, 0xC8, 0x0A, 0xD7, 0x0B, 0xC3, 0x0A, 0xDB, 0x0B, 0xBF, 0x0A
	.byte 0xDF, 0x0B, 0xBA, 0x0A, 0xE3, 0x0B, 0xB5, 0x0A, 0xE8, 0x0B, 0xB1, 0x0A, 0xEC, 0x0B, 0xAC, 0x0A
	.byte 0xF0, 0x0B, 0xA7, 0x0A, 0xF4, 0x0B, 0xA3, 0x0A, 0xF8, 0x0B, 0x9E, 0x0A, 0xFC, 0x0B, 0x99, 0x0A
	.byte 0x01, 0x0C, 0x95, 0x0A, 0x05, 0x0C, 0x90, 0x0A, 0x09, 0x0C, 0x8B, 0x0A, 0x0D, 0x0C, 0x86, 0x0A
	.byte 0x11, 0x0C, 0x82, 0x0A, 0x15, 0x0C, 0x7D, 0x0A, 0x19, 0x0C, 0x78, 0x0A, 0x1E, 0x0C, 0x73, 0x0A
	.byte 0x22, 0x0C, 0x6F, 0x0A, 0x26, 0x0C, 0x6A, 0x0A, 0x2A, 0x0C, 0x65, 0x0A, 0x2E, 0x0C, 0x60, 0x0A
	.byte 0x32, 0x0C, 0x5C, 0x0A, 0x36, 0x0C, 0x57, 0x0A, 0x3A, 0x0C, 0x52, 0x0A, 0x3E, 0x0C, 0x4D, 0x0A
	.byte 0x42, 0x0C, 0x48, 0x0A, 0x46, 0x0C, 0x44, 0x0A, 0x4A, 0x0C, 0x3F, 0x0A, 0x4E, 0x0C, 0x3A, 0x0A
	.byte 0x52, 0x0C, 0x35, 0x0A, 0x56, 0x0C, 0x30, 0x0A, 0x5A, 0x0C, 0x2B, 0x0A, 0x5E, 0x0C, 0x26, 0x0A
	.byte 0x62, 0x0C, 0x22, 0x0A, 0x66, 0x0C, 0x1D, 0x0A, 0x6A, 0x0C, 0x18, 0x0A, 0x6E, 0x0C, 0x13, 0x0A
	.byte 0x72, 0x0C, 0x0E, 0x0A, 0x76, 0x0C, 0x09, 0x0A, 0x7A, 0x0C, 0x04, 0x0A, 0x7E, 0x0C, 0xFF, 0x09
	.byte 0x82, 0x0C, 0xFB, 0x09, 0x86, 0x0C, 0xF6, 0x09, 0x8A, 0x0C, 0xF1, 0x09, 0x8E, 0x0C, 0xEC, 0x09
	.byte 0x91, 0x0C, 0xE7, 0x09, 0x95, 0x0C, 0xE2, 0x09, 0x99, 0x0C, 0xDD, 0x09, 0x9D, 0x0C, 0xD8, 0x09
	.byte 0xA1, 0x0C, 0xD3, 0x09, 0xA5, 0x0C, 0xCE, 0x09, 0xA9, 0x0C, 0xC9, 0x09, 0xAC, 0x0C, 0xC4, 0x09
	.byte 0xB0, 0x0C, 0xBF, 0x09, 0xB4, 0x0C, 0xBA, 0x09, 0xB8, 0x0C, 0xB5, 0x09, 0xBC, 0x0C, 0xB0, 0x09
	.byte 0xC0, 0x0C, 0xAB, 0x09, 0xC3, 0x0C, 0xA6, 0x09, 0xC7, 0x0C, 0xA1, 0x09, 0xCB, 0x0C, 0x9C, 0x09
	.byte 0xCF, 0x0C, 0x97, 0x09, 0xD2, 0x0C, 0x92, 0x09, 0xD6, 0x0C, 0x8D, 0x09, 0xDA, 0x0C, 0x88, 0x09
	.byte 0xDE, 0x0C, 0x83, 0x09, 0xE1, 0x0C, 0x7E, 0x09, 0xE5, 0x0C, 0x79, 0x09, 0xE9, 0x0C, 0x74, 0x09
	.byte 0xED, 0x0C, 0x6F, 0x09, 0xF0, 0x0C, 0x6A, 0x09, 0xF4, 0x0C, 0x65, 0x09, 0xF8, 0x0C, 0x5F, 0x09
	.byte 0xFB, 0x0C, 0x5A, 0x09, 0xFF, 0x0C, 0x55, 0x09, 0x03, 0x0D, 0x50, 0x09, 0x06, 0x0D, 0x4B, 0x09
	.byte 0x0A, 0x0D, 0x46, 0x09, 0x0E, 0x0D, 0x41, 0x09, 0x11, 0x0D, 0x3C, 0x09, 0x15, 0x0D, 0x37, 0x09
	.byte 0x18, 0x0D, 0x31, 0x09, 0x1C, 0x0D, 0x2C, 0x09, 0x20, 0x0D, 0x27, 0x09, 0x23, 0x0D, 0x22, 0x09
	.byte 0x27, 0x0D, 0x1D, 0x09, 0x2A, 0x0D, 0x18, 0x09, 0x2E, 0x0D, 0x12, 0x09, 0x32, 0x0D, 0x0D, 0x09
	.byte 0x35, 0x0D, 0x08, 0x09, 0x39, 0x0D, 0x03, 0x09, 0x3C, 0x0D, 0xFE, 0x08, 0x40, 0x0D, 0xF8, 0x08
	.byte 0x43, 0x0D, 0xF3, 0x08, 0x47, 0x0D, 0xEE, 0x08, 0x4A, 0x0D, 0xE9, 0x08, 0x4E, 0x0D, 0xE4, 0x08
	.byte 0x51, 0x0D, 0xDE, 0x08, 0x55, 0x0D, 0xD9, 0x08, 0x58, 0x0D, 0xD4, 0x08, 0x5C, 0x0D, 0xCF, 0x08
	.byte 0x5F, 0x0D, 0xC9, 0x08, 0x62, 0x0D, 0xC4, 0x08, 0x66, 0x0D, 0xBF, 0x08, 0x69, 0x0D, 0xBA, 0x08
	.byte 0x6D, 0x0D, 0xB4, 0x08, 0x70, 0x0D, 0xAF, 0x08, 0x74, 0x0D, 0xAA, 0x08, 0x77, 0x0D, 0xA5, 0x08
	.byte 0x7A, 0x0D, 0x9F, 0x08, 0x7E, 0x0D, 0x9A, 0x08, 0x81, 0x0D, 0x95, 0x08, 0x85, 0x0D, 0x8F, 0x08
	.byte 0x88, 0x0D, 0x8A, 0x08, 0x8B, 0x0D, 0x85, 0x08, 0x8F, 0x0D, 0x7F, 0x08, 0x92, 0x0D, 0x7A, 0x08
	.byte 0x95, 0x0D, 0x75, 0x08, 0x99, 0x0D, 0x6F, 0x08, 0x9C, 0x0D, 0x6A, 0x08, 0x9F, 0x0D, 0x65, 0x08
	.byte 0xA2, 0x0D, 0x5F, 0x08, 0xA6, 0x0D, 0x5A, 0x08, 0xA9, 0x0D, 0x55, 0x08, 0xAC, 0x0D, 0x4F, 0x08
	.byte 0xB0, 0x0D, 0x4A, 0x08, 0xB3, 0x0D, 0x45, 0x08, 0xB6, 0x0D, 0x3F, 0x08, 0xB9, 0x0D, 0x3A, 0x08
	.byte 0xBC, 0x0D, 0x34, 0x08, 0xC0, 0x0D, 0x2F, 0x08, 0xC3, 0x0D, 0x2A, 0x08, 0xC6, 0x0D, 0x24, 0x08
	.byte 0xC9, 0x0D, 0x1F, 0x08, 0xCC, 0x0D, 0x19, 0x08, 0xD0, 0x0D, 0x14, 0x08, 0xD3, 0x0D, 0x0E, 0x08
	.byte 0xD6, 0x0D, 0x09, 0x08, 0xD9, 0x0D, 0x04, 0x08, 0xDC, 0x0D, 0xFE, 0x07, 0xDF, 0x0D, 0xF9, 0x07
	.byte 0xE3, 0x0D, 0xF3, 0x07, 0xE6, 0x0D, 0xEE, 0x07, 0xE9, 0x0D, 0xE8, 0x07, 0xEC, 0x0D, 0xE3, 0x07
	.byte 0xEF, 0x0D, 0xDD, 0x07, 0xF2, 0x0D, 0xD8, 0x07, 0xF5, 0x0D, 0xD2, 0x07, 0xF8, 0x0D, 0xCD, 0x07
	.byte 0xFB, 0x0D, 0xC8, 0x07, 0xFE, 0x0D, 0xC2, 0x07, 0x01, 0x0E, 0xBD, 0x07, 0x04, 0x0E, 0xB7, 0x07
	.byte 0x07, 0x0E, 0xB2, 0x07, 0x0A, 0x0E, 0xAC, 0x07, 0x0D, 0x0E, 0xA6, 0x07, 0x10, 0x0E, 0xA1, 0x07
	.byte 0x13, 0x0E, 0x9B, 0x07, 0x16, 0x0E, 0x96, 0x07, 0x19, 0x0E, 0x90, 0x07, 0x1C, 0x0E, 0x8B, 0x07
	.byte 0x1F, 0x0E, 0x85, 0x07, 0x22, 0x0E, 0x80, 0x07, 0x25, 0x0E, 0x7A, 0x07, 0x28, 0x0E, 0x75, 0x07
	.byte 0x2B, 0x0E, 0x6F, 0x07, 0x2E, 0x0E, 0x6A, 0x07, 0x31, 0x0E, 0x64, 0x07, 0x34, 0x0E, 0x5E, 0x07
	.byte 0x37, 0x0E, 0x59, 0x07, 0x3A, 0x0E, 0x53, 0x07, 0x3C, 0x0E, 0x4E, 0x07, 0x3F, 0x0E, 0x48, 0x07
	.byte 0x42, 0x0E, 0x42, 0x07, 0x45, 0x0E, 0x3D, 0x07, 0x48, 0x0E, 0x37, 0x07, 0x4B, 0x0E, 0x32, 0x07
	.byte 0x4D, 0x0E, 0x2C, 0x07, 0x50, 0x0E, 0x26, 0x07, 0x53, 0x0E, 0x21, 0x07, 0x56, 0x0E, 0x1B, 0x07
	.byte 0x59, 0x0E, 0x15, 0x07, 0x5B, 0x0E, 0x10, 0x07, 0x5E, 0x0E, 0x0A, 0x07, 0x61, 0x0E, 0x05, 0x07
	.byte 0x64, 0x0E, 0xFF, 0x06, 0x66, 0x0E, 0xF9, 0x06, 0x69, 0x0E, 0xF4, 0x06, 0x6C, 0x0E, 0xEE, 0x06
	.byte 0x6F, 0x0E, 0xE8, 0x06, 0x71, 0x0E, 0xE3, 0x06, 0x74, 0x0E, 0xDD, 0x06, 0x77, 0x0E, 0xD7, 0x06
	.byte 0x79, 0x0E, 0xD2, 0x06, 0x7C, 0x0E, 0xCC, 0x06, 0x7F, 0x0E, 0xC6, 0x06, 0x81, 0x0E, 0xC1, 0x06
	.byte 0x84, 0x0E, 0xBB, 0x06, 0x87, 0x0E, 0xB5, 0x06, 0x89, 0x0E, 0xAF, 0x06, 0x8C, 0x0E, 0xAA, 0x06
	.byte 0x8F, 0x0E, 0xA4, 0x06, 0x91, 0x0E, 0x9E, 0x06, 0x94, 0x0E, 0x99, 0x06, 0x96, 0x0E, 0x93, 0x06
	.byte 0x99, 0x0E, 0x8D, 0x06, 0x9B, 0x0E, 0x87, 0x06, 0x9E, 0x0E, 0x82, 0x06, 0xA1, 0x0E, 0x7C, 0x06
	.byte 0xA3, 0x0E, 0x76, 0x06, 0xA6, 0x0E, 0x70, 0x06, 0xA8, 0x0E, 0x6B, 0x06, 0xAB, 0x0E, 0x65, 0x06
	.byte 0xAD, 0x0E, 0x5F, 0x06, 0xB0, 0x0E, 0x59, 0x06, 0xB2, 0x0E, 0x54, 0x06, 0xB5, 0x0E, 0x4E, 0x06
	.byte 0xB7, 0x0E, 0x48, 0x06, 0xBA, 0x0E, 0x42, 0x06, 0xBC, 0x0E, 0x3C, 0x06, 0xBF, 0x0E, 0x37, 0x06
	.byte 0xC1, 0x0E, 0x31, 0x06, 0xC3, 0x0E, 0x2B, 0x06, 0xC6, 0x0E, 0x25, 0x06, 0xC8, 0x0E, 0x1F, 0x06
	.byte 0xCB, 0x0E, 0x1A, 0x06, 0xCD, 0x0E, 0x14, 0x06, 0xCF, 0x0E, 0x0E, 0x06, 0xD2, 0x0E, 0x08, 0x06
	.byte 0xD4, 0x0E, 0x02, 0x06, 0xD6, 0x0E, 0xFD, 0x05, 0xD9, 0x0E, 0xF7, 0x05, 0xDB, 0x0E, 0xF1, 0x05
	.byte 0xDD, 0x0E, 0xEB, 0x05, 0xE0, 0x0E, 0xE5, 0x05, 0xE2, 0x0E, 0xDF, 0x05, 0xE4, 0x0E, 0xDA, 0x05
	.byte 0xE7, 0x0E, 0xD4, 0x05, 0xE9, 0x0E, 0xCE, 0x05, 0xEB, 0x0E, 0xC8, 0x05, 0xEE, 0x0E, 0xC2, 0x05
	.byte 0xF0, 0x0E, 0xBC, 0x05, 0xF2, 0x0E, 0xB6, 0x05, 0xF4, 0x0E, 0xB1, 0x05, 0xF7, 0x0E, 0xAB, 0x05
	.byte 0xF9, 0x0E, 0xA5, 0x05, 0xFB, 0x0E, 0x9F, 0x05, 0xFD, 0x0E, 0x99, 0x05, 0xFF, 0x0E, 0x93, 0x05
	.byte 0x02, 0x0F, 0x8D, 0x05, 0x04, 0x0F, 0x87, 0x05, 0x06, 0x0F, 0x81, 0x05, 0x08, 0x0F, 0x7C, 0x05
	.byte 0x0A, 0x0F, 0x76, 0x05, 0x0C, 0x0F, 0x70, 0x05, 0x0E, 0x0F, 0x6A, 0x05, 0x11, 0x0F, 0x64, 0x05
	.byte 0x13, 0x0F, 0x5E, 0x05, 0x15, 0x0F, 0x58, 0x05, 0x17, 0x0F, 0x52, 0x05, 0x19, 0x0F, 0x4C, 0x05
	.byte 0x1B, 0x0F, 0x46, 0x05, 0x1D, 0x0F, 0x40, 0x05, 0x1F, 0x0F, 0x3A, 0x05, 0x21, 0x0F, 0x34, 0x05
	.byte 0x23, 0x0F, 0x2F, 0x05, 0x25, 0x0F, 0x29, 0x05, 0x27, 0x0F, 0x23, 0x05, 0x29, 0x0F, 0x1D, 0x05
	.byte 0x2B, 0x0F, 0x17, 0x05, 0x2D, 0x0F, 0x11, 0x05, 0x2F, 0x0F, 0x0B, 0x05, 0x31, 0x0F, 0x05, 0x05
	.byte 0x33, 0x0F, 0xFF, 0x04, 0x35, 0x0F, 0xF9, 0x04, 0x37, 0x0F, 0xF3, 0x04, 0x39, 0x0F, 0xED, 0x04
	.byte 0x3B, 0x0F, 0xE7, 0x04, 0x3D, 0x0F, 0xE1, 0x04, 0x3F, 0x0F, 0xDB, 0x04, 0x41, 0x0F, 0xD5, 0x04
	.byte 0x43, 0x0F, 0xCF, 0x04, 0x45, 0x0F, 0xC9, 0x04, 0x46, 0x0F, 0xC3, 0x04, 0x48, 0x0F, 0xBD, 0x04
	.byte 0x4A, 0x0F, 0xB7, 0x04, 0x4C, 0x0F, 0xB1, 0x04, 0x4E, 0x0F, 0xAB, 0x04, 0x50, 0x0F, 0xA5, 0x04
	.byte 0x51, 0x0F, 0x9F, 0x04, 0x53, 0x0F, 0x99, 0x04, 0x55, 0x0F, 0x93, 0x04, 0x57, 0x0F, 0x8D, 0x04
	.byte 0x59, 0x0F, 0x87, 0x04, 0x5A, 0x0F, 0x81, 0x04, 0x5C, 0x0F, 0x7B, 0x04, 0x5E, 0x0F, 0x75, 0x04
	.byte 0x60, 0x0F, 0x6F, 0x04, 0x61, 0x0F, 0x69, 0x04, 0x63, 0x0F, 0x63, 0x04, 0x65, 0x0F, 0x5D, 0x04
	.byte 0x67, 0x0F, 0x57, 0x04, 0x68, 0x0F, 0x51, 0x04, 0x6A, 0x0F, 0x4B, 0x04, 0x6C, 0x0F, 0x44, 0x04
	.byte 0x6D, 0x0F, 0x3E, 0x04, 0x6F, 0x0F, 0x38, 0x04, 0x71, 0x0F, 0x32, 0x04, 0x72, 0x0F, 0x2C, 0x04
	.byte 0x74, 0x0F, 0x26, 0x04, 0x76, 0x0F, 0x20, 0x04, 0x77, 0x0F, 0x1A, 0x04, 0x79, 0x0F, 0x14, 0x04
	.byte 0x7A, 0x0F, 0x0E, 0x04, 0x7C, 0x0F, 0x08, 0x04, 0x7D, 0x0F, 0x02, 0x04, 0x7F, 0x0F, 0xFC, 0x03
	.byte 0x81, 0x0F, 0xF6, 0x03, 0x82, 0x0F, 0xEF, 0x03, 0x84, 0x0F, 0xE9, 0x03, 0x85, 0x0F, 0xE3, 0x03
	.byte 0x87, 0x0F, 0xDD, 0x03, 0x88, 0x0F, 0xD7, 0x03, 0x8A, 0x0F, 0xD1, 0x03, 0x8B, 0x0F, 0xCB, 0x03
	.byte 0x8D, 0x0F, 0xC5, 0x03, 0x8E, 0x0F, 0xBF, 0x03, 0x90, 0x0F, 0xB9, 0x03, 0x91, 0x0F, 0xB2, 0x03
	.byte 0x93, 0x0F, 0xAC, 0x03, 0x94, 0x0F, 0xA6, 0x03, 0x95, 0x0F, 0xA0, 0x03, 0x97, 0x0F, 0x9A, 0x03
	.byte 0x98, 0x0F, 0x94, 0x03, 0x9A, 0x0F, 0x8E, 0x03, 0x9B, 0x0F, 0x88, 0x03, 0x9C, 0x0F, 0x81, 0x03
	.byte 0x9E, 0x0F, 0x7B, 0x03, 0x9F, 0x0F, 0x75, 0x03, 0xA1, 0x0F, 0x6F, 0x03, 0xA2, 0x0F, 0x69, 0x03
	.byte 0xA3, 0x0F, 0x63, 0x03, 0xA5, 0x0F, 0x5D, 0x03, 0xA6, 0x0F, 0x56, 0x03, 0xA7, 0x0F, 0x50, 0x03
	.byte 0xA8, 0x0F, 0x4A, 0x03, 0xAA, 0x0F, 0x44, 0x03, 0xAB, 0x0F, 0x3E, 0x03, 0xAC, 0x0F, 0x38, 0x03
	.byte 0xAE, 0x0F, 0x32, 0x03, 0xAF, 0x0F, 0x2B, 0x03, 0xB0, 0x0F, 0x25, 0x03, 0xB1, 0x0F, 0x1F, 0x03
	.byte 0xB3, 0x0F, 0x19, 0x03, 0xB4, 0x0F, 0x13, 0x03, 0xB5, 0x0F, 0x0D, 0x03, 0xB6, 0x0F, 0x06, 0x03
	.byte 0xB7, 0x0F, 0x00, 0x03, 0xB8, 0x0F, 0xFA, 0x02, 0xBA, 0x0F, 0xF4, 0x02, 0xBB, 0x0F, 0xEE, 0x02
	.byte 0xBC, 0x0F, 0xE8, 0x02, 0xBD, 0x0F, 0xE1, 0x02, 0xBE, 0x0F, 0xDB, 0x02, 0xBF, 0x0F, 0xD5, 0x02
	.byte 0xC0, 0x0F, 0xCF, 0x02, 0xC2, 0x0F, 0xC9, 0x02, 0xC3, 0x0F, 0xC2, 0x02, 0xC4, 0x0F, 0xBC, 0x02
	.byte 0xC5, 0x0F, 0xB6, 0x02, 0xC6, 0x0F, 0xB0, 0x02, 0xC7, 0x0F, 0xAA, 0x02, 0xC8, 0x0F, 0xA3, 0x02
	.byte 0xC9, 0x0F, 0x9D, 0x02, 0xCA, 0x0F, 0x97, 0x02, 0xCB, 0x0F, 0x91, 0x02, 0xCC, 0x0F, 0x8B, 0x02
	.byte 0xCD, 0x0F, 0x84, 0x02, 0xCE, 0x0F, 0x7E, 0x02, 0xCF, 0x0F, 0x78, 0x02, 0xD0, 0x0F, 0x72, 0x02
	.byte 0xD1, 0x0F, 0x6C, 0x02, 0xD2, 0x0F, 0x65, 0x02, 0xD3, 0x0F, 0x5F, 0x02, 0xD4, 0x0F, 0x59, 0x02
	.byte 0xD5, 0x0F, 0x53, 0x02, 0xD5, 0x0F, 0x4D, 0x02, 0xD6, 0x0F, 0x46, 0x02, 0xD7, 0x0F, 0x40, 0x02
	.byte 0xD8, 0x0F, 0x3A, 0x02, 0xD9, 0x0F, 0x34, 0x02, 0xDA, 0x0F, 0x2D, 0x02, 0xDB, 0x0F, 0x27, 0x02
	.byte 0xDC, 0x0F, 0x21, 0x02, 0xDC, 0x0F, 0x1B, 0x02, 0xDD, 0x0F, 0x15, 0x02, 0xDE, 0x0F, 0x0E, 0x02
	.byte 0xDF, 0x0F, 0x08, 0x02, 0xE0, 0x0F, 0x02, 0x02, 0xE0, 0x0F, 0xFC, 0x01, 0xE1, 0x0F, 0xF5, 0x01
	.byte 0xE2, 0x0F, 0xEF, 0x01, 0xE3, 0x0F, 0xE9, 0x01, 0xE3, 0x0F, 0xE3, 0x01, 0xE4, 0x0F, 0xDC, 0x01
	.byte 0xE5, 0x0F, 0xD6, 0x01, 0xE6, 0x0F, 0xD0, 0x01, 0xE6, 0x0F, 0xCA, 0x01, 0xE7, 0x0F, 0xC3, 0x01
	.byte 0xE8, 0x0F, 0xBD, 0x01, 0xE8, 0x0F, 0xB7, 0x01, 0xE9, 0x0F, 0xB1, 0x01, 0xEA, 0x0F, 0xAA, 0x01
	.byte 0xEA, 0x0F, 0xA4, 0x01, 0xEB, 0x0F, 0x9E, 0x01, 0xEC, 0x0F, 0x98, 0x01, 0xEC, 0x0F, 0x91, 0x01
	.byte 0xED, 0x0F, 0x8B, 0x01, 0xED, 0x0F, 0x85, 0x01, 0xEE, 0x0F, 0x7F, 0x01, 0xEF, 0x0F, 0x78, 0x01
	.byte 0xEF, 0x0F, 0x72, 0x01, 0xF0, 0x0F, 0x6C, 0x01, 0xF0, 0x0F, 0x66, 0x01, 0xF1, 0x0F, 0x5F, 0x01
	.byte 0xF1, 0x0F, 0x59, 0x01, 0xF2, 0x0F, 0x53, 0x01, 0xF2, 0x0F, 0x4D, 0x01, 0xF3, 0x0F, 0x46, 0x01
	.byte 0xF3, 0x0F, 0x40, 0x01, 0xF4, 0x0F, 0x3A, 0x01, 0xF4, 0x0F, 0x34, 0x01, 0xF5, 0x0F, 0x2D, 0x01
	.byte 0xF5, 0x0F, 0x27, 0x01, 0xF6, 0x0F, 0x21, 0x01, 0xF6, 0x0F, 0x1B, 0x01, 0xF7, 0x0F, 0x14, 0x01
	.byte 0xF7, 0x0F, 0x0E, 0x01, 0xF8, 0x0F, 0x08, 0x01, 0xF8, 0x0F, 0x01, 0x01, 0xF8, 0x0F, 0xFB, 0x00
	.byte 0xF9, 0x0F, 0xF5, 0x00, 0xF9, 0x0F, 0xEF, 0x00, 0xF9, 0x0F, 0xE8, 0x00, 0xFA, 0x0F, 0xE2, 0x00
	.byte 0xFA, 0x0F, 0xDC, 0x00, 0xFA, 0x0F, 0xD6, 0x00, 0xFB, 0x0F, 0xCF, 0x00, 0xFB, 0x0F, 0xC9, 0x00
	.byte 0xFB, 0x0F, 0xC3, 0x00, 0xFC, 0x0F, 0xBC, 0x00, 0xFC, 0x0F, 0xB6, 0x00, 0xFC, 0x0F, 0xB0, 0x00
	.byte 0xFC, 0x0F, 0xAA, 0x00, 0xFD, 0x0F, 0xA3, 0x00, 0xFD, 0x0F, 0x9D, 0x00, 0xFD, 0x0F, 0x97, 0x00
	.byte 0xFD, 0x0F, 0x90, 0x00, 0xFE, 0x0F, 0x8A, 0x00, 0xFE, 0x0F, 0x84, 0x00, 0xFE, 0x0F, 0x7E, 0x00
	.byte 0xFE, 0x0F, 0x77, 0x00, 0xFE, 0x0F, 0x71, 0x00, 0xFF, 0x0F, 0x6B, 0x00, 0xFF, 0x0F, 0x65, 0x00
	.byte 0xFF, 0x0F, 0x5E, 0x00, 0xFF, 0x0F, 0x58, 0x00, 0xFF, 0x0F, 0x52, 0x00, 0xFF, 0x0F, 0x4B, 0x00
	.byte 0xFF, 0x0F, 0x45, 0x00, 0x00, 0x10, 0x3F, 0x00, 0x00, 0x10, 0x39, 0x00, 0x00, 0x10, 0x32, 0x00
	.byte 0x00, 0x10, 0x2C, 0x00, 0x00, 0x10, 0x26, 0x00, 0x00, 0x10, 0x1F, 0x00, 0x00, 0x10, 0x19, 0x00
	.byte 0x00, 0x10, 0x13, 0x00, 0x00, 0x10, 0x0D, 0x00, 0x00, 0x10, 0x06, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0xFA, 0xFF, 0x00, 0x10, 0xF3, 0xFF, 0x00, 0x10, 0xED, 0xFF, 0x00, 0x10, 0xE7, 0xFF
	.byte 0x00, 0x10, 0xE1, 0xFF, 0x00, 0x10, 0xDA, 0xFF, 0x00, 0x10, 0xD4, 0xFF, 0x00, 0x10, 0xCE, 0xFF
	.byte 0x00, 0x10, 0xC7, 0xFF, 0x00, 0x10, 0xC1, 0xFF, 0xFF, 0x0F, 0xBB, 0xFF, 0xFF, 0x0F, 0xB5, 0xFF
	.byte 0xFF, 0x0F, 0xAE, 0xFF, 0xFF, 0x0F, 0xA8, 0xFF, 0xFF, 0x0F, 0xA2, 0xFF, 0xFF, 0x0F, 0x9B, 0xFF
	.byte 0xFF, 0x0F, 0x95, 0xFF, 0xFE, 0x0F, 0x8F, 0xFF, 0xFE, 0x0F, 0x89, 0xFF, 0xFE, 0x0F, 0x82, 0xFF
	.byte 0xFE, 0x0F, 0x7C, 0xFF, 0xFE, 0x0F, 0x76, 0xFF, 0xFD, 0x0F, 0x70, 0xFF, 0xFD, 0x0F, 0x69, 0xFF
	.byte 0xFD, 0x0F, 0x63, 0xFF, 0xFD, 0x0F, 0x5D, 0xFF, 0xFC, 0x0F, 0x56, 0xFF, 0xFC, 0x0F, 0x50, 0xFF
	.byte 0xFC, 0x0F, 0x4A, 0xFF, 0xFC, 0x0F, 0x44, 0xFF, 0xFB, 0x0F, 0x3D, 0xFF, 0xFB, 0x0F, 0x37, 0xFF
	.byte 0xFB, 0x0F, 0x31, 0xFF, 0xFA, 0x0F, 0x2A, 0xFF, 0xFA, 0x0F, 0x24, 0xFF, 0xFA, 0x0F, 0x1E, 0xFF
	.byte 0xF9, 0x0F, 0x18, 0xFF, 0xF9, 0x0F, 0x11, 0xFF, 0xF9, 0x0F, 0x0B, 0xFF, 0xF8, 0x0F, 0x05, 0xFF
	.byte 0xF8, 0x0F, 0xFF, 0xFE, 0xF8, 0x0F, 0xF8, 0xFE, 0xF7, 0x0F, 0xF2, 0xFE, 0xF7, 0x0F, 0xEC, 0xFE
	.byte 0xF6, 0x0F, 0xE5, 0xFE, 0xF6, 0x0F, 0xDF, 0xFE, 0xF5, 0x0F, 0xD9, 0xFE, 0xF5, 0x0F, 0xD3, 0xFE
	.byte 0xF4, 0x0F, 0xCC, 0xFE, 0xF4, 0x0F, 0xC6, 0xFE, 0xF3, 0x0F, 0xC0, 0xFE, 0xF3, 0x0F, 0xBA, 0xFE
	.byte 0xF2, 0x0F, 0xB3, 0xFE, 0xF2, 0x0F, 0xAD, 0xFE, 0xF1, 0x0F, 0xA7, 0xFE, 0xF1, 0x0F, 0xA1, 0xFE
	.byte 0xF0, 0x0F, 0x9A, 0xFE, 0xF0, 0x0F, 0x94, 0xFE, 0xEF, 0x0F, 0x8E, 0xFE, 0xEF, 0x0F, 0x88, 0xFE
	.byte 0xEE, 0x0F, 0x81, 0xFE, 0xED, 0x0F, 0x7B, 0xFE, 0xED, 0x0F, 0x75, 0xFE, 0xEC, 0x0F, 0x6F, 0xFE
	.byte 0xEC, 0x0F, 0x68, 0xFE, 0xEB, 0x0F, 0x62, 0xFE, 0xEA, 0x0F, 0x5C, 0xFE, 0xEA, 0x0F, 0x56, 0xFE
	.byte 0xE9, 0x0F, 0x4F, 0xFE, 0xE8, 0x0F, 0x49, 0xFE, 0xE8, 0x0F, 0x43, 0xFE, 0xE7, 0x0F, 0x3D, 0xFE
	.byte 0xE6, 0x0F, 0x36, 0xFE, 0xE6, 0x0F, 0x30, 0xFE, 0xE5, 0x0F, 0x2A, 0xFE, 0xE4, 0x0F, 0x24, 0xFE
	.byte 0xE3, 0x0F, 0x1D, 0xFE, 0xE3, 0x0F, 0x17, 0xFE, 0xE2, 0x0F, 0x11, 0xFE, 0xE1, 0x0F, 0x0B, 0xFE
	.byte 0xE0, 0x0F, 0x04, 0xFE, 0xE0, 0x0F, 0xFE, 0xFD, 0xDF, 0x0F, 0xF8, 0xFD, 0xDE, 0x0F, 0xF2, 0xFD
	.byte 0xDD, 0x0F, 0xEB, 0xFD, 0xDC, 0x0F, 0xE5, 0xFD, 0xDC, 0x0F, 0xDF, 0xFD, 0xDB, 0x0F, 0xD9, 0xFD
	.byte 0xDA, 0x0F, 0xD3, 0xFD, 0xD9, 0x0F, 0xCC, 0xFD, 0xD8, 0x0F, 0xC6, 0xFD, 0xD7, 0x0F, 0xC0, 0xFD
	.byte 0xD6, 0x0F, 0xBA, 0xFD, 0xD5, 0x0F, 0xB3, 0xFD, 0xD5, 0x0F, 0xAD, 0xFD, 0xD4, 0x0F, 0xA7, 0xFD
	.byte 0xD3, 0x0F, 0xA1, 0xFD, 0xD2, 0x0F, 0x9B, 0xFD, 0xD1, 0x0F, 0x94, 0xFD, 0xD0, 0x0F, 0x8E, 0xFD
	.byte 0xCF, 0x0F, 0x88, 0xFD, 0xCE, 0x0F, 0x82, 0xFD, 0xCD, 0x0F, 0x7C, 0xFD, 0xCC, 0x0F, 0x75, 0xFD
	.byte 0xCB, 0x0F, 0x6F, 0xFD, 0xCA, 0x0F, 0x69, 0xFD, 0xC9, 0x0F, 0x63, 0xFD, 0xC8, 0x0F, 0x5D, 0xFD
	.byte 0xC7, 0x0F, 0x56, 0xFD, 0xC6, 0x0F, 0x50, 0xFD, 0xC5, 0x0F, 0x4A, 0xFD, 0xC4, 0x0F, 0x44, 0xFD
	.byte 0xC3, 0x0F, 0x3E, 0xFD, 0xC2, 0x0F, 0x37, 0xFD, 0xC0, 0x0F, 0x31, 0xFD, 0xBF, 0x0F, 0x2B, 0xFD
	.byte 0xBE, 0x0F, 0x25, 0xFD, 0xBD, 0x0F, 0x1F, 0xFD, 0xBC, 0x0F, 0x18, 0xFD, 0xBB, 0x0F, 0x12, 0xFD
	.byte 0xBA, 0x0F, 0x0C, 0xFD, 0xB8, 0x0F, 0x06, 0xFD, 0xB7, 0x0F, 0x00, 0xFD, 0xB6, 0x0F, 0xFA, 0xFC
	.byte 0xB5, 0x0F, 0xF3, 0xFC, 0xB4, 0x0F, 0xED, 0xFC, 0xB3, 0x0F, 0xE7, 0xFC, 0xB1, 0x0F, 0xE1, 0xFC
	.byte 0xB0, 0x0F, 0xDB, 0xFC, 0xAF, 0x0F, 0xD5, 0xFC, 0xAE, 0x0F, 0xCE, 0xFC, 0xAC, 0x0F, 0xC8, 0xFC
	.byte 0xAB, 0x0F, 0xC2, 0xFC, 0xAA, 0x0F, 0xBC, 0xFC, 0xA8, 0x0F, 0xB6, 0xFC, 0xA7, 0x0F, 0xB0, 0xFC
	.byte 0xA6, 0x0F, 0xAA, 0xFC, 0xA5, 0x0F, 0xA3, 0xFC, 0xA3, 0x0F, 0x9D, 0xFC, 0xA2, 0x0F, 0x97, 0xFC
	.byte 0xA1, 0x0F, 0x91, 0xFC, 0x9F, 0x0F, 0x8B, 0xFC, 0x9E, 0x0F, 0x85, 0xFC, 0x9C, 0x0F, 0x7F, 0xFC
	.byte 0x9B, 0x0F, 0x78, 0xFC, 0x9A, 0x0F, 0x72, 0xFC, 0x98, 0x0F, 0x6C, 0xFC, 0x97, 0x0F, 0x66, 0xFC
	.byte 0x95, 0x0F, 0x60, 0xFC, 0x94, 0x0F, 0x5A, 0xFC, 0x93, 0x0F, 0x54, 0xFC, 0x91, 0x0F, 0x4E, 0xFC
	.byte 0x90, 0x0F, 0x47, 0xFC, 0x8E, 0x0F, 0x41, 0xFC, 0x8D, 0x0F, 0x3B, 0xFC, 0x8B, 0x0F, 0x35, 0xFC
	.byte 0x8A, 0x0F, 0x2F, 0xFC, 0x88, 0x0F, 0x29, 0xFC, 0x87, 0x0F, 0x23, 0xFC, 0x85, 0x0F, 0x1D, 0xFC
	.byte 0x84, 0x0F, 0x17, 0xFC, 0x82, 0x0F, 0x11, 0xFC, 0x81, 0x0F, 0x0A, 0xFC, 0x7F, 0x0F, 0x04, 0xFC
	.byte 0x7D, 0x0F, 0xFE, 0xFB, 0x7C, 0x0F, 0xF8, 0xFB, 0x7A, 0x0F, 0xF2, 0xFB, 0x79, 0x0F, 0xEC, 0xFB
	.byte 0x77, 0x0F, 0xE6, 0xFB, 0x76, 0x0F, 0xE0, 0xFB, 0x74, 0x0F, 0xDA, 0xFB, 0x72, 0x0F, 0xD4, 0xFB
	.byte 0x71, 0x0F, 0xCE, 0xFB, 0x6F, 0x0F, 0xC8, 0xFB, 0x6D, 0x0F, 0xC2, 0xFB, 0x6C, 0x0F, 0xBC, 0xFB
	.byte 0x6A, 0x0F, 0xB5, 0xFB, 0x68, 0x0F, 0xAF, 0xFB, 0x67, 0x0F, 0xA9, 0xFB, 0x65, 0x0F, 0xA3, 0xFB
	.byte 0x63, 0x0F, 0x9D, 0xFB, 0x61, 0x0F, 0x97, 0xFB, 0x60, 0x0F, 0x91, 0xFB, 0x5E, 0x0F, 0x8B, 0xFB
	.byte 0x5C, 0x0F, 0x85, 0xFB, 0x5A, 0x0F, 0x7F, 0xFB, 0x59, 0x0F, 0x79, 0xFB, 0x57, 0x0F, 0x73, 0xFB
	.byte 0x55, 0x0F, 0x6D, 0xFB, 0x53, 0x0F, 0x67, 0xFB, 0x51, 0x0F, 0x61, 0xFB, 0x50, 0x0F, 0x5B, 0xFB
	.byte 0x4E, 0x0F, 0x55, 0xFB, 0x4C, 0x0F, 0x4F, 0xFB, 0x4A, 0x0F, 0x49, 0xFB, 0x48, 0x0F, 0x43, 0xFB
	.byte 0x46, 0x0F, 0x3D, 0xFB, 0x45, 0x0F, 0x37, 0xFB, 0x43, 0x0F, 0x31, 0xFB, 0x41, 0x0F, 0x2B, 0xFB
	.byte 0x3F, 0x0F, 0x25, 0xFB, 0x3D, 0x0F, 0x1F, 0xFB, 0x3B, 0x0F, 0x19, 0xFB, 0x39, 0x0F, 0x13, 0xFB
	.byte 0x37, 0x0F, 0x0D, 0xFB, 0x35, 0x0F, 0x07, 0xFB, 0x33, 0x0F, 0x01, 0xFB, 0x31, 0x0F, 0xFB, 0xFA
	.byte 0x2F, 0x0F, 0xF5, 0xFA, 0x2D, 0x0F, 0xEF, 0xFA, 0x2B, 0x0F, 0xE9, 0xFA, 0x29, 0x0F, 0xE3, 0xFA
	.byte 0x27, 0x0F, 0xDD, 0xFA, 0x25, 0x0F, 0xD7, 0xFA, 0x23, 0x0F, 0xD1, 0xFA, 0x21, 0x0F, 0xCC, 0xFA
	.byte 0x1F, 0x0F, 0xC6, 0xFA, 0x1D, 0x0F, 0xC0, 0xFA, 0x1B, 0x0F, 0xBA, 0xFA, 0x19, 0x0F, 0xB4, 0xFA
	.byte 0x17, 0x0F, 0xAE, 0xFA, 0x15, 0x0F, 0xA8, 0xFA, 0x13, 0x0F, 0xA2, 0xFA, 0x11, 0x0F, 0x9C, 0xFA
	.byte 0x0E, 0x0F, 0x96, 0xFA, 0x0C, 0x0F, 0x90, 0xFA, 0x0A, 0x0F, 0x8A, 0xFA, 0x08, 0x0F, 0x84, 0xFA
	.byte 0x06, 0x0F, 0x7F, 0xFA, 0x04, 0x0F, 0x79, 0xFA, 0x02, 0x0F, 0x73, 0xFA, 0xFF, 0x0E, 0x6D, 0xFA
	.byte 0xFD, 0x0E, 0x67, 0xFA, 0xFB, 0x0E, 0x61, 0xFA, 0xF9, 0x0E, 0x5B, 0xFA, 0xF7, 0x0E, 0x55, 0xFA
	.byte 0xF4, 0x0E, 0x4F, 0xFA, 0xF2, 0x0E, 0x4A, 0xFA, 0xF0, 0x0E, 0x44, 0xFA, 0xEE, 0x0E, 0x3E, 0xFA
	.byte 0xEB, 0x0E, 0x38, 0xFA, 0xE9, 0x0E, 0x32, 0xFA, 0xE7, 0x0E, 0x2C, 0xFA, 0xE4, 0x0E, 0x26, 0xFA
	.byte 0xE2, 0x0E, 0x21, 0xFA, 0xE0, 0x0E, 0x1B, 0xFA, 0xDD, 0x0E, 0x15, 0xFA, 0xDB, 0x0E, 0x0F, 0xFA
	.byte 0xD9, 0x0E, 0x09, 0xFA, 0xD6, 0x0E, 0x03, 0xFA, 0xD4, 0x0E, 0xFE, 0xF9, 0xD2, 0x0E, 0xF8, 0xF9
	.byte 0xCF, 0x0E, 0xF2, 0xF9, 0xCD, 0x0E, 0xEC, 0xF9, 0xCB, 0x0E, 0xE6, 0xF9, 0xC8, 0x0E, 0xE1, 0xF9
	.byte 0xC6, 0x0E, 0xDB, 0xF9, 0xC3, 0x0E, 0xD5, 0xF9, 0xC1, 0x0E, 0xCF, 0xF9, 0xBF, 0x0E, 0xC9, 0xF9
	.byte 0xBC, 0x0E, 0xC4, 0xF9, 0xBA, 0x0E, 0xBE, 0xF9, 0xB7, 0x0E, 0xB8, 0xF9, 0xB5, 0x0E, 0xB2, 0xF9
	.byte 0xB2, 0x0E, 0xAC, 0xF9, 0xB0, 0x0E, 0xA7, 0xF9, 0xAD, 0x0E, 0xA1, 0xF9, 0xAB, 0x0E, 0x9B, 0xF9
	.byte 0xA8, 0x0E, 0x95, 0xF9, 0xA6, 0x0E, 0x90, 0xF9, 0xA3, 0x0E, 0x8A, 0xF9, 0xA1, 0x0E, 0x84, 0xF9
	.byte 0x9E, 0x0E, 0x7E, 0xF9, 0x9B, 0x0E, 0x79, 0xF9, 0x99, 0x0E, 0x73, 0xF9, 0x96, 0x0E, 0x6D, 0xF9
	.byte 0x94, 0x0E, 0x67, 0xF9, 0x91, 0x0E, 0x62, 0xF9, 0x8F, 0x0E, 0x5C, 0xF9, 0x8C, 0x0E, 0x56, 0xF9
	.byte 0x89, 0x0E, 0x51, 0xF9, 0x87, 0x0E, 0x4B, 0xF9, 0x84, 0x0E, 0x45, 0xF9, 0x81, 0x0E, 0x3F, 0xF9
	.byte 0x7F, 0x0E, 0x3A, 0xF9, 0x7C, 0x0E, 0x34, 0xF9, 0x79, 0x0E, 0x2E, 0xF9, 0x77, 0x0E, 0x29, 0xF9
	.byte 0x74, 0x0E, 0x23, 0xF9, 0x71, 0x0E, 0x1D, 0xF9, 0x6F, 0x0E, 0x18, 0xF9, 0x6C, 0x0E, 0x12, 0xF9
	.byte 0x69, 0x0E, 0x0C, 0xF9, 0x66, 0x0E, 0x07, 0xF9, 0x64, 0x0E, 0x01, 0xF9, 0x61, 0x0E, 0xFB, 0xF8
	.byte 0x5E, 0x0E, 0xF6, 0xF8, 0x5B, 0x0E, 0xF0, 0xF8, 0x59, 0x0E, 0xEB, 0xF8, 0x56, 0x0E, 0xE5, 0xF8
	.byte 0x53, 0x0E, 0xDF, 0xF8, 0x50, 0x0E, 0xDA, 0xF8, 0x4D, 0x0E, 0xD4, 0xF8, 0x4B, 0x0E, 0xCE, 0xF8
	.byte 0x48, 0x0E, 0xC9, 0xF8, 0x45, 0x0E, 0xC3, 0xF8, 0x42, 0x0E, 0xBE, 0xF8, 0x3F, 0x0E, 0xB8, 0xF8
	.byte 0x3C, 0x0E, 0xB2, 0xF8, 0x3A, 0x0E, 0xAD, 0xF8, 0x37, 0x0E, 0xA7, 0xF8, 0x34, 0x0E, 0xA2, 0xF8
	.byte 0x31, 0x0E, 0x9C, 0xF8, 0x2E, 0x0E, 0x96, 0xF8, 0x2B, 0x0E, 0x91, 0xF8, 0x28, 0x0E, 0x8B, 0xF8
	.byte 0x25, 0x0E, 0x86, 0xF8, 0x22, 0x0E, 0x80, 0xF8, 0x1F, 0x0E, 0x7B, 0xF8, 0x1C, 0x0E, 0x75, 0xF8
	.byte 0x19, 0x0E, 0x70, 0xF8, 0x16, 0x0E, 0x6A, 0xF8, 0x13, 0x0E, 0x65, 0xF8, 0x10, 0x0E, 0x5F, 0xF8
	.byte 0x0D, 0x0E, 0x5A, 0xF8, 0x0A, 0x0E, 0x54, 0xF8, 0x07, 0x0E, 0x4E, 0xF8, 0x04, 0x0E, 0x49, 0xF8
	.byte 0x01, 0x0E, 0x43, 0xF8, 0xFE, 0x0D, 0x3E, 0xF8, 0xFB, 0x0D, 0x38, 0xF8, 0xF8, 0x0D, 0x33, 0xF8
	.byte 0xF5, 0x0D, 0x2E, 0xF8, 0xF2, 0x0D, 0x28, 0xF8, 0xEF, 0x0D, 0x23, 0xF8, 0xEC, 0x0D, 0x1D, 0xF8
	.byte 0xE9, 0x0D, 0x18, 0xF8, 0xE6, 0x0D, 0x12, 0xF8, 0xE3, 0x0D, 0x0D, 0xF8, 0xDF, 0x0D, 0x07, 0xF8
	.byte 0xDC, 0x0D, 0x02, 0xF8, 0xD9, 0x0D, 0xFC, 0xF7, 0xD6, 0x0D, 0xF7, 0xF7, 0xD3, 0x0D, 0xF2, 0xF7
	.byte 0xD0, 0x0D, 0xEC, 0xF7, 0xCC, 0x0D, 0xE7, 0xF7, 0xC9, 0x0D, 0xE1, 0xF7, 0xC6, 0x0D, 0xDC, 0xF7
	.byte 0xC3, 0x0D, 0xD6, 0xF7, 0xC0, 0x0D, 0xD1, 0xF7, 0xBC, 0x0D, 0xCC, 0xF7, 0xB9, 0x0D, 0xC6, 0xF7
	.byte 0xB6, 0x0D, 0xC1, 0xF7, 0xB3, 0x0D, 0xBB, 0xF7, 0xB0, 0x0D, 0xB6, 0xF7, 0xAC, 0x0D, 0xB1, 0xF7
	.byte 0xA9, 0x0D, 0xAB, 0xF7, 0xA6, 0x0D, 0xA6, 0xF7, 0xA2, 0x0D, 0xA1, 0xF7, 0x9F, 0x0D, 0x9B, 0xF7
	.byte 0x9C, 0x0D, 0x96, 0xF7, 0x99, 0x0D, 0x91, 0xF7, 0x95, 0x0D, 0x8B, 0xF7, 0x92, 0x0D, 0x86, 0xF7
	.byte 0x8F, 0x0D, 0x81, 0xF7, 0x8B, 0x0D, 0x7B, 0xF7, 0x88, 0x0D, 0x76, 0xF7, 0x85, 0x0D, 0x71, 0xF7
	.byte 0x81, 0x0D, 0x6B, 0xF7, 0x7E, 0x0D, 0x66, 0xF7, 0x7A, 0x0D, 0x61, 0xF7, 0x77, 0x0D, 0x5B, 0xF7
	.byte 0x74, 0x0D, 0x56, 0xF7, 0x70, 0x0D, 0x51, 0xF7, 0x6D, 0x0D, 0x4C, 0xF7, 0x69, 0x0D, 0x46, 0xF7
	.byte 0x66, 0x0D, 0x41, 0xF7, 0x62, 0x0D, 0x3C, 0xF7, 0x5F, 0x0D, 0x37, 0xF7, 0x5C, 0x0D, 0x31, 0xF7
	.byte 0x58, 0x0D, 0x2C, 0xF7, 0x55, 0x0D, 0x27, 0xF7, 0x51, 0x0D, 0x22, 0xF7, 0x4E, 0x0D, 0x1C, 0xF7
	.byte 0x4A, 0x0D, 0x17, 0xF7, 0x47, 0x0D, 0x12, 0xF7, 0x43, 0x0D, 0x0D, 0xF7, 0x40, 0x0D, 0x08, 0xF7
	.byte 0x3C, 0x0D, 0x02, 0xF7, 0x39, 0x0D, 0xFD, 0xF6, 0x35, 0x0D, 0xF8, 0xF6, 0x32, 0x0D, 0xF3, 0xF6
	.byte 0x2E, 0x0D, 0xEE, 0xF6, 0x2A, 0x0D, 0xE8, 0xF6, 0x27, 0x0D, 0xE3, 0xF6, 0x23, 0x0D, 0xDE, 0xF6
	.byte 0x20, 0x0D, 0xD9, 0xF6, 0x1C, 0x0D, 0xD4, 0xF6, 0x18, 0x0D, 0xCF, 0xF6, 0x15, 0x0D, 0xC9, 0xF6
	.byte 0x11, 0x0D, 0xC4, 0xF6, 0x0E, 0x0D, 0xBF, 0xF6, 0x0A, 0x0D, 0xBA, 0xF6, 0x06, 0x0D, 0xB5, 0xF6
	.byte 0x03, 0x0D, 0xB0, 0xF6, 0xFF, 0x0C, 0xAB, 0xF6, 0xFB, 0x0C, 0xA6, 0xF6, 0xF8, 0x0C, 0xA1, 0xF6
	.byte 0xF4, 0x0C, 0x9B, 0xF6, 0xF0, 0x0C, 0x96, 0xF6, 0xED, 0x0C, 0x91, 0xF6, 0xE9, 0x0C, 0x8C, 0xF6
	.byte 0xE5, 0x0C, 0x87, 0xF6, 0xE1, 0x0C, 0x82, 0xF6, 0xDE, 0x0C, 0x7D, 0xF6, 0xDA, 0x0C, 0x78, 0xF6
	.byte 0xD6, 0x0C, 0x73, 0xF6, 0xD2, 0x0C, 0x6E, 0xF6, 0xCF, 0x0C, 0x69, 0xF6, 0xCB, 0x0C, 0x64, 0xF6
	.byte 0xC7, 0x0C, 0x5F, 0xF6, 0xC3, 0x0C, 0x5A, 0xF6, 0xC0, 0x0C, 0x55, 0xF6, 0xBC, 0x0C, 0x50, 0xF6
	.byte 0xB8, 0x0C, 0x4B, 0xF6, 0xB4, 0x0C, 0x46, 0xF6, 0xB0, 0x0C, 0x41, 0xF6, 0xAC, 0x0C, 0x3C, 0xF6
	.byte 0xA9, 0x0C, 0x37, 0xF6, 0xA5, 0x0C, 0x32, 0xF6, 0xA1, 0x0C, 0x2D, 0xF6, 0x9D, 0x0C, 0x28, 0xF6
	.byte 0x99, 0x0C, 0x23, 0xF6, 0x95, 0x0C, 0x1E, 0xF6, 0x91, 0x0C, 0x19, 0xF6, 0x8E, 0x0C, 0x14, 0xF6
	.byte 0x8A, 0x0C, 0x0F, 0xF6, 0x86, 0x0C, 0x0A, 0xF6, 0x82, 0x0C, 0x05, 0xF6, 0x7E, 0x0C, 0x01, 0xF6
	.byte 0x7A, 0x0C, 0xFC, 0xF5, 0x76, 0x0C, 0xF7, 0xF5, 0x72, 0x0C, 0xF2, 0xF5, 0x6E, 0x0C, 0xED, 0xF5
	.byte 0x6A, 0x0C, 0xE8, 0xF5, 0x66, 0x0C, 0xE3, 0xF5, 0x62, 0x0C, 0xDE, 0xF5, 0x5E, 0x0C, 0xDA, 0xF5
	.byte 0x5A, 0x0C, 0xD5, 0xF5, 0x56, 0x0C, 0xD0, 0xF5, 0x52, 0x0C, 0xCB, 0xF5, 0x4E, 0x0C, 0xC6, 0xF5
	.byte 0x4A, 0x0C, 0xC1, 0xF5, 0x46, 0x0C, 0xBC, 0xF5, 0x42, 0x0C, 0xB8, 0xF5, 0x3E, 0x0C, 0xB3, 0xF5
	.byte 0x3A, 0x0C, 0xAE, 0xF5, 0x36, 0x0C, 0xA9, 0xF5, 0x32, 0x0C, 0xA4, 0xF5, 0x2E, 0x0C, 0xA0, 0xF5
	.byte 0x2A, 0x0C, 0x9B, 0xF5, 0x26, 0x0C, 0x96, 0xF5, 0x22, 0x0C, 0x91, 0xF5, 0x1E, 0x0C, 0x8D, 0xF5
	.byte 0x19, 0x0C, 0x88, 0xF5, 0x15, 0x0C, 0x83, 0xF5, 0x11, 0x0C, 0x7E, 0xF5, 0x0D, 0x0C, 0x7A, 0xF5
	.byte 0x09, 0x0C, 0x75, 0xF5, 0x05, 0x0C, 0x70, 0xF5, 0x01, 0x0C, 0x6B, 0xF5, 0xFC, 0x0B, 0x67, 0xF5
	.byte 0xF8, 0x0B, 0x62, 0xF5, 0xF4, 0x0B, 0x5D, 0xF5, 0xF0, 0x0B, 0x59, 0xF5, 0xEC, 0x0B, 0x54, 0xF5
	.byte 0xE8, 0x0B, 0x4F, 0xF5, 0xE3, 0x0B, 0x4B, 0xF5, 0xDF, 0x0B, 0x46, 0xF5, 0xDB, 0x0B, 0x41, 0xF5
	.byte 0xD7, 0x0B, 0x3D, 0xF5, 0xD2, 0x0B, 0x38, 0xF5, 0xCE, 0x0B, 0x33, 0xF5, 0xCA, 0x0B, 0x2F, 0xF5
	.byte 0xC6, 0x0B, 0x2A, 0xF5, 0xC1, 0x0B, 0x25, 0xF5, 0xBD, 0x0B, 0x21, 0xF5, 0xB9, 0x0B, 0x1C, 0xF5
	.byte 0xB5, 0x0B, 0x18, 0xF5, 0xB0, 0x0B, 0x13, 0xF5, 0xAC, 0x0B, 0x0E, 0xF5, 0xA8, 0x0B, 0x0A, 0xF5
	.byte 0xA3, 0x0B, 0x05, 0xF5, 0x9F, 0x0B, 0x01, 0xF5, 0x9B, 0x0B, 0xFC, 0xF4, 0x97, 0x0B, 0xF8, 0xF4
	.byte 0x92, 0x0B, 0xF3, 0xF4, 0x8E, 0x0B, 0xEF, 0xF4, 0x89, 0x0B, 0xEA, 0xF4, 0x85, 0x0B, 0xE5, 0xF4
	.byte 0x81, 0x0B, 0xE1, 0xF4, 0x7C, 0x0B, 0xDC, 0xF4, 0x78, 0x0B, 0xD8, 0xF4, 0x74, 0x0B, 0xD3, 0xF4
	.byte 0x6F, 0x0B, 0xCF, 0xF4, 0x6B, 0x0B, 0xCA, 0xF4, 0x66, 0x0B, 0xC6, 0xF4, 0x62, 0x0B, 0xC2, 0xF4
	.byte 0x5E, 0x0B, 0xBD, 0xF4, 0x59, 0x0B, 0xB9, 0xF4, 0x55, 0x0B, 0xB4, 0xF4, 0x50, 0x0B, 0xB0, 0xF4
	.byte 0x4C, 0x0B, 0xAB, 0xF4, 0x47, 0x0B, 0xA7, 0xF4, 0x43, 0x0B, 0xA2, 0xF4, 0x3E, 0x0B, 0x9E, 0xF4
	.byte 0x3A, 0x0B, 0x9A, 0xF4, 0x36, 0x0B, 0x95, 0xF4, 0x31, 0x0B, 0x91, 0xF4, 0x2D, 0x0B, 0x8C, 0xF4
	.byte 0x28, 0x0B, 0x88, 0xF4, 0x24, 0x0B, 0x84, 0xF4, 0x1F, 0x0B, 0x7F, 0xF4, 0x1B, 0x0B, 0x7B, 0xF4
	.byte 0x16, 0x0B, 0x77, 0xF4, 0x11, 0x0B, 0x72, 0xF4, 0x0D, 0x0B, 0x6E, 0xF4, 0x08, 0x0B, 0x69, 0xF4
	.byte 0x04, 0x0B, 0x65, 0xF4, 0xFF, 0x0A, 0x61, 0xF4, 0xFB, 0x0A, 0x5D, 0xF4, 0xF6, 0x0A, 0x58, 0xF4
	.byte 0xF2, 0x0A, 0x54, 0xF4, 0xED, 0x0A, 0x50, 0xF4, 0xE8, 0x0A, 0x4B, 0xF4, 0xE4, 0x0A, 0x47, 0xF4
	.byte 0xDF, 0x0A, 0x43, 0xF4, 0xDB, 0x0A, 0x3F, 0xF4, 0xD6, 0x0A, 0x3A, 0xF4, 0xD1, 0x0A, 0x36, 0xF4
	.byte 0xCD, 0x0A, 0x32, 0xF4, 0xC8, 0x0A, 0x2E, 0xF4, 0xC3, 0x0A, 0x29, 0xF4, 0xBF, 0x0A, 0x25, 0xF4
	.byte 0xBA, 0x0A, 0x21, 0xF4, 0xB5, 0x0A, 0x1D, 0xF4, 0xB1, 0x0A, 0x18, 0xF4, 0xAC, 0x0A, 0x14, 0xF4
	.byte 0xA7, 0x0A, 0x10, 0xF4, 0xA3, 0x0A, 0x0C, 0xF4, 0x9E, 0x0A, 0x08, 0xF4, 0x99, 0x0A, 0x04, 0xF4
	.byte 0x95, 0x0A, 0xFF, 0xF3, 0x90, 0x0A, 0xFB, 0xF3, 0x8B, 0x0A, 0xF7, 0xF3, 0x86, 0x0A, 0xF3, 0xF3
	.byte 0x82, 0x0A, 0xEF, 0xF3, 0x7D, 0x0A, 0xEB, 0xF3, 0x78, 0x0A, 0xE7, 0xF3, 0x73, 0x0A, 0xE2, 0xF3
	.byte 0x6F, 0x0A, 0xDE, 0xF3, 0x6A, 0x0A, 0xDA, 0xF3, 0x65, 0x0A, 0xD6, 0xF3, 0x60, 0x0A, 0xD2, 0xF3
	.byte 0x5C, 0x0A, 0xCE, 0xF3, 0x57, 0x0A, 0xCA, 0xF3, 0x52, 0x0A, 0xC6, 0xF3, 0x4D, 0x0A, 0xC2, 0xF3
	.byte 0x48, 0x0A, 0xBE, 0xF3, 0x44, 0x0A, 0xBA, 0xF3, 0x3F, 0x0A, 0xB6, 0xF3, 0x3A, 0x0A, 0xB2, 0xF3
	.byte 0x35, 0x0A, 0xAE, 0xF3, 0x30, 0x0A, 0xAA, 0xF3, 0x2B, 0x0A, 0xA6, 0xF3, 0x26, 0x0A, 0xA2, 0xF3
	.byte 0x22, 0x0A, 0x9E, 0xF3, 0x1D, 0x0A, 0x9A, 0xF3, 0x18, 0x0A, 0x96, 0xF3, 0x13, 0x0A, 0x92, 0xF3
	.byte 0x0E, 0x0A, 0x8E, 0xF3, 0x09, 0x0A, 0x8A, 0xF3, 0x04, 0x0A, 0x86, 0xF3, 0xFF, 0x09, 0x82, 0xF3
	.byte 0xFB, 0x09, 0x7E, 0xF3, 0xF6, 0x09, 0x7A, 0xF3, 0xF1, 0x09, 0x76, 0xF3, 0xEC, 0x09, 0x72, 0xF3
	.byte 0xE7, 0x09, 0x6F, 0xF3, 0xE2, 0x09, 0x6B, 0xF3, 0xDD, 0x09, 0x67, 0xF3, 0xD8, 0x09, 0x63, 0xF3
	.byte 0xD3, 0x09, 0x5F, 0xF3, 0xCE, 0x09, 0x5B, 0xF3, 0xC9, 0x09, 0x57, 0xF3, 0xC4, 0x09, 0x54, 0xF3
	.byte 0xBF, 0x09, 0x50, 0xF3, 0xBA, 0x09, 0x4C, 0xF3, 0xB5, 0x09, 0x48, 0xF3, 0xB0, 0x09, 0x44, 0xF3
	.byte 0xAB, 0x09, 0x40, 0xF3, 0xA6, 0x09, 0x3D, 0xF3, 0xA1, 0x09, 0x39, 0xF3, 0x9C, 0x09, 0x35, 0xF3
	.byte 0x97, 0x09, 0x31, 0xF3, 0x92, 0x09, 0x2E, 0xF3, 0x8D, 0x09, 0x2A, 0xF3, 0x88, 0x09, 0x26, 0xF3
	.byte 0x83, 0x09, 0x22, 0xF3, 0x7E, 0x09, 0x1F, 0xF3, 0x79, 0x09, 0x1B, 0xF3, 0x74, 0x09, 0x17, 0xF3
	.byte 0x6F, 0x09, 0x13, 0xF3, 0x6A, 0x09, 0x10, 0xF3, 0x65, 0x09, 0x0C, 0xF3, 0x5F, 0x09, 0x08, 0xF3
	.byte 0x5A, 0x09, 0x05, 0xF3, 0x55, 0x09, 0x01, 0xF3, 0x50, 0x09, 0xFD, 0xF2, 0x4B, 0x09, 0xFA, 0xF2
	.byte 0x46, 0x09, 0xF6, 0xF2, 0x41, 0x09, 0xF2, 0xF2, 0x3C, 0x09, 0xEF, 0xF2, 0x37, 0x09, 0xEB, 0xF2
	.byte 0x31, 0x09, 0xE8, 0xF2, 0x2C, 0x09, 0xE4, 0xF2, 0x27, 0x09, 0xE0, 0xF2, 0x22, 0x09, 0xDD, 0xF2
	.byte 0x1D, 0x09, 0xD9, 0xF2, 0x18, 0x09, 0xD6, 0xF2, 0x12, 0x09, 0xD2, 0xF2, 0x0D, 0x09, 0xCE, 0xF2
	.byte 0x08, 0x09, 0xCB, 0xF2, 0x03, 0x09, 0xC7, 0xF2, 0xFE, 0x08, 0xC4, 0xF2, 0xF8, 0x08, 0xC0, 0xF2
	.byte 0xF3, 0x08, 0xBD, 0xF2, 0xEE, 0x08, 0xB9, 0xF2, 0xE9, 0x08, 0xB6, 0xF2, 0xE4, 0x08, 0xB2, 0xF2
	.byte 0xDE, 0x08, 0xAF, 0xF2, 0xD9, 0x08, 0xAB, 0xF2, 0xD4, 0x08, 0xA8, 0xF2, 0xCF, 0x08, 0xA4, 0xF2
	.byte 0xC9, 0x08, 0xA1, 0xF2, 0xC4, 0x08, 0x9E, 0xF2, 0xBF, 0x08, 0x9A, 0xF2, 0xBA, 0x08, 0x97, 0xF2
	.byte 0xB4, 0x08, 0x93, 0xF2, 0xAF, 0x08, 0x90, 0xF2, 0xAA, 0x08, 0x8C, 0xF2, 0xA5, 0x08, 0x89, 0xF2
	.byte 0x9F, 0x08, 0x86, 0xF2, 0x9A, 0x08, 0x82, 0xF2, 0x95, 0x08, 0x7F, 0xF2, 0x8F, 0x08, 0x7B, 0xF2
	.byte 0x8A, 0x08, 0x78, 0xF2, 0x85, 0x08, 0x75, 0xF2, 0x7F, 0x08, 0x71, 0xF2, 0x7A, 0x08, 0x6E, 0xF2
	.byte 0x75, 0x08, 0x6B, 0xF2, 0x6F, 0x08, 0x67, 0xF2, 0x6A, 0x08, 0x64, 0xF2, 0x65, 0x08, 0x61, 0xF2
	.byte 0x5F, 0x08, 0x5E, 0xF2, 0x5A, 0x08, 0x5A, 0xF2, 0x55, 0x08, 0x57, 0xF2, 0x4F, 0x08, 0x54, 0xF2
	.byte 0x4A, 0x08, 0x50, 0xF2, 0x45, 0x08, 0x4D, 0xF2, 0x3F, 0x08, 0x4A, 0xF2, 0x3A, 0x08, 0x47, 0xF2
	.byte 0x34, 0x08, 0x44, 0xF2, 0x2F, 0x08, 0x40, 0xF2, 0x2A, 0x08, 0x3D, 0xF2, 0x24, 0x08, 0x3A, 0xF2
	.byte 0x1F, 0x08, 0x37, 0xF2, 0x19, 0x08, 0x34, 0xF2, 0x14, 0x08, 0x30, 0xF2, 0x0E, 0x08, 0x2D, 0xF2
	.byte 0x09, 0x08, 0x2A, 0xF2, 0x04, 0x08, 0x27, 0xF2, 0xFE, 0x07, 0x24, 0xF2, 0xF9, 0x07, 0x21, 0xF2
	.byte 0xF3, 0x07, 0x1D, 0xF2, 0xEE, 0x07, 0x1A, 0xF2, 0xE8, 0x07, 0x17, 0xF2, 0xE3, 0x07, 0x14, 0xF2
	.byte 0xDD, 0x07, 0x11, 0xF2, 0xD8, 0x07, 0x0E, 0xF2, 0xD2, 0x07, 0x0B, 0xF2, 0xCD, 0x07, 0x08, 0xF2
	.byte 0xC8, 0x07, 0x05, 0xF2, 0xC2, 0x07, 0x02, 0xF2, 0xBD, 0x07, 0xFF, 0xF1, 0xB7, 0x07, 0xFC, 0xF1
	.byte 0xB2, 0x07, 0xF9, 0xF1, 0xAC, 0x07, 0xF6, 0xF1, 0xA6, 0x07, 0xF3, 0xF1, 0xA1, 0x07, 0xF0, 0xF1
	.byte 0x9B, 0x07, 0xED, 0xF1, 0x96, 0x07, 0xEA, 0xF1, 0x90, 0x07, 0xE7, 0xF1, 0x8B, 0x07, 0xE4, 0xF1
	.byte 0x85, 0x07, 0xE1, 0xF1, 0x80, 0x07, 0xDE, 0xF1, 0x7A, 0x07, 0xDB, 0xF1, 0x75, 0x07, 0xD8, 0xF1
	.byte 0x6F, 0x07, 0xD5, 0xF1, 0x6A, 0x07, 0xD2, 0xF1, 0x64, 0x07, 0xCF, 0xF1, 0x5E, 0x07, 0xCC, 0xF1
	.byte 0x59, 0x07, 0xC9, 0xF1, 0x53, 0x07, 0xC6, 0xF1, 0x4E, 0x07, 0xC4, 0xF1, 0x48, 0x07, 0xC1, 0xF1
	.byte 0x42, 0x07, 0xBE, 0xF1, 0x3D, 0x07, 0xBB, 0xF1, 0x37, 0x07, 0xB8, 0xF1, 0x32, 0x07, 0xB5, 0xF1
	.byte 0x2C, 0x07, 0xB3, 0xF1, 0x26, 0x07, 0xB0, 0xF1, 0x21, 0x07, 0xAD, 0xF1, 0x1B, 0x07, 0xAA, 0xF1
	.byte 0x15, 0x07, 0xA7, 0xF1, 0x10, 0x07, 0xA5, 0xF1, 0x0A, 0x07, 0xA2, 0xF1, 0x05, 0x07, 0x9F, 0xF1
	.byte 0xFF, 0x06, 0x9C, 0xF1, 0xF9, 0x06, 0x9A, 0xF1, 0xF4, 0x06, 0x97, 0xF1, 0xEE, 0x06, 0x94, 0xF1
	.byte 0xE8, 0x06, 0x91, 0xF1, 0xE3, 0x06, 0x8F, 0xF1, 0xDD, 0x06, 0x8C, 0xF1, 0xD7, 0x06, 0x89, 0xF1
	.byte 0xD2, 0x06, 0x87, 0xF1, 0xCC, 0x06, 0x84, 0xF1, 0xC6, 0x06, 0x81, 0xF1, 0xC1, 0x06, 0x7F, 0xF1
	.byte 0xBB, 0x06, 0x7C, 0xF1, 0xB5, 0x06, 0x79, 0xF1, 0xAF, 0x06, 0x77, 0xF1, 0xAA, 0x06, 0x74, 0xF1
	.byte 0xA4, 0x06, 0x71, 0xF1, 0x9E, 0x06, 0x6F, 0xF1, 0x99, 0x06, 0x6C, 0xF1, 0x93, 0x06, 0x6A, 0xF1
	.byte 0x8D, 0x06, 0x67, 0xF1, 0x87, 0x06, 0x65, 0xF1, 0x82, 0x06, 0x62, 0xF1, 0x7C, 0x06, 0x5F, 0xF1
	.byte 0x76, 0x06, 0x5D, 0xF1, 0x70, 0x06, 0x5A, 0xF1, 0x6B, 0x06, 0x58, 0xF1, 0x65, 0x06, 0x55, 0xF1
	.byte 0x5F, 0x06, 0x53, 0xF1, 0x59, 0x06, 0x50, 0xF1, 0x54, 0x06, 0x4E, 0xF1, 0x4E, 0x06, 0x4B, 0xF1
	.byte 0x48, 0x06, 0x49, 0xF1, 0x42, 0x06, 0x46, 0xF1, 0x3C, 0x06, 0x44, 0xF1, 0x37, 0x06, 0x41, 0xF1
	.byte 0x31, 0x06, 0x3F, 0xF1, 0x2B, 0x06, 0x3D, 0xF1, 0x25, 0x06, 0x3A, 0xF1, 0x1F, 0x06, 0x38, 0xF1
	.byte 0x1A, 0x06, 0x35, 0xF1, 0x14, 0x06, 0x33, 0xF1, 0x0E, 0x06, 0x31, 0xF1, 0x08, 0x06, 0x2E, 0xF1
	.byte 0x02, 0x06, 0x2C, 0xF1, 0xFD, 0x05, 0x2A, 0xF1, 0xF7, 0x05, 0x27, 0xF1, 0xF1, 0x05, 0x25, 0xF1
	.byte 0xEB, 0x05, 0x23, 0xF1, 0xE5, 0x05, 0x20, 0xF1, 0xDF, 0x05, 0x1E, 0xF1, 0xDA, 0x05, 0x1C, 0xF1
	.byte 0xD4, 0x05, 0x19, 0xF1, 0xCE, 0x05, 0x17, 0xF1, 0xC8, 0x05, 0x15, 0xF1, 0xC2, 0x05, 0x12, 0xF1
	.byte 0xBC, 0x05, 0x10, 0xF1, 0xB6, 0x05, 0x0E, 0xF1, 0xB1, 0x05, 0x0C, 0xF1, 0xAB, 0x05, 0x09, 0xF1
	.byte 0xA5, 0x05, 0x07, 0xF1, 0x9F, 0x05, 0x05, 0xF1, 0x99, 0x05, 0x03, 0xF1, 0x93, 0x05, 0x01, 0xF1
	.byte 0x8D, 0x05, 0xFE, 0xF0, 0x87, 0x05, 0xFC, 0xF0, 0x81, 0x05, 0xFA, 0xF0, 0x7C, 0x05, 0xF8, 0xF0
	.byte 0x76, 0x05, 0xF6, 0xF0, 0x70, 0x05, 0xF4, 0xF0, 0x6A, 0x05, 0xF2, 0xF0, 0x64, 0x05, 0xEF, 0xF0
	.byte 0x5E, 0x05, 0xED, 0xF0, 0x58, 0x05, 0xEB, 0xF0, 0x52, 0x05, 0xE9, 0xF0, 0x4C, 0x05, 0xE7, 0xF0
	.byte 0x46, 0x05, 0xE5, 0xF0, 0x40, 0x05, 0xE3, 0xF0, 0x3A, 0x05, 0xE1, 0xF0, 0x34, 0x05, 0xDF, 0xF0
	.byte 0x2F, 0x05, 0xDD, 0xF0, 0x29, 0x05, 0xDB, 0xF0, 0x23, 0x05, 0xD9, 0xF0, 0x1D, 0x05, 0xD7, 0xF0
	.byte 0x17, 0x05, 0xD5, 0xF0, 0x11, 0x05, 0xD3, 0xF0, 0x0B, 0x05, 0xD1, 0xF0, 0x05, 0x05, 0xCF, 0xF0
	.byte 0xFF, 0x04, 0xCD, 0xF0, 0xF9, 0x04, 0xCB, 0xF0, 0xF3, 0x04, 0xC9, 0xF0, 0xED, 0x04, 0xC7, 0xF0
	.byte 0xE7, 0x04, 0xC5, 0xF0, 0xE1, 0x04, 0xC3, 0xF0, 0xDB, 0x04, 0xC1, 0xF0, 0xD5, 0x04, 0xBF, 0xF0
	.byte 0xCF, 0x04, 0xBD, 0xF0, 0xC9, 0x04, 0xBB, 0xF0, 0xC3, 0x04, 0xBA, 0xF0, 0xBD, 0x04, 0xB8, 0xF0
	.byte 0xB7, 0x04, 0xB6, 0xF0, 0xB1, 0x04, 0xB4, 0xF0, 0xAB, 0x04, 0xB2, 0xF0, 0xA5, 0x04, 0xB0, 0xF0
	.byte 0x9F, 0x04, 0xAF, 0xF0, 0x99, 0x04, 0xAD, 0xF0, 0x93, 0x04, 0xAB, 0xF0, 0x8D, 0x04, 0xA9, 0xF0
	.byte 0x87, 0x04, 0xA7, 0xF0, 0x81, 0x04, 0xA6, 0xF0, 0x7B, 0x04, 0xA4, 0xF0, 0x75, 0x04, 0xA2, 0xF0
	.byte 0x6F, 0x04, 0xA0, 0xF0, 0x69, 0x04, 0x9F, 0xF0, 0x63, 0x04, 0x9D, 0xF0, 0x5D, 0x04, 0x9B, 0xF0
	.byte 0x57, 0x04, 0x99, 0xF0, 0x51, 0x04, 0x98, 0xF0, 0x4B, 0x04, 0x96, 0xF0, 0x44, 0x04, 0x94, 0xF0
	.byte 0x3E, 0x04, 0x93, 0xF0, 0x38, 0x04, 0x91, 0xF0, 0x32, 0x04, 0x8F, 0xF0, 0x2C, 0x04, 0x8E, 0xF0
	.byte 0x26, 0x04, 0x8C, 0xF0, 0x20, 0x04, 0x8A, 0xF0, 0x1A, 0x04, 0x89, 0xF0, 0x14, 0x04, 0x87, 0xF0
	.byte 0x0E, 0x04, 0x86, 0xF0, 0x08, 0x04, 0x84, 0xF0, 0x02, 0x04, 0x83, 0xF0, 0xFC, 0x03, 0x81, 0xF0
	.byte 0xF6, 0x03, 0x7F, 0xF0, 0xEF, 0x03, 0x7E, 0xF0, 0xE9, 0x03, 0x7C, 0xF0, 0xE3, 0x03, 0x7B, 0xF0
	.byte 0xDD, 0x03, 0x79, 0xF0, 0xD7, 0x03, 0x78, 0xF0, 0xD1, 0x03, 0x76, 0xF0, 0xCB, 0x03, 0x75, 0xF0
	.byte 0xC5, 0x03, 0x73, 0xF0, 0xBF, 0x03, 0x72, 0xF0, 0xB9, 0x03, 0x70, 0xF0, 0xB2, 0x03, 0x6F, 0xF0
	.byte 0xAC, 0x03, 0x6D, 0xF0, 0xA6, 0x03, 0x6C, 0xF0, 0xA0, 0x03, 0x6B, 0xF0, 0x9A, 0x03, 0x69, 0xF0
	.byte 0x94, 0x03, 0x68, 0xF0, 0x8E, 0x03, 0x66, 0xF0, 0x88, 0x03, 0x65, 0xF0, 0x81, 0x03, 0x64, 0xF0
	.byte 0x7B, 0x03, 0x62, 0xF0, 0x75, 0x03, 0x61, 0xF0, 0x6F, 0x03, 0x5F, 0xF0, 0x69, 0x03, 0x5E, 0xF0
	.byte 0x63, 0x03, 0x5D, 0xF0, 0x5D, 0x03, 0x5B, 0xF0, 0x56, 0x03, 0x5A, 0xF0, 0x50, 0x03, 0x59, 0xF0
	.byte 0x4A, 0x03, 0x58, 0xF0, 0x44, 0x03, 0x56, 0xF0, 0x3E, 0x03, 0x55, 0xF0, 0x38, 0x03, 0x54, 0xF0
	.byte 0x32, 0x03, 0x52, 0xF0, 0x2B, 0x03, 0x51, 0xF0, 0x25, 0x03, 0x50, 0xF0, 0x1F, 0x03, 0x4F, 0xF0
	.byte 0x19, 0x03, 0x4D, 0xF0, 0x13, 0x03, 0x4C, 0xF0, 0x0D, 0x03, 0x4B, 0xF0, 0x06, 0x03, 0x4A, 0xF0
	.byte 0x00, 0x03, 0x49, 0xF0, 0xFA, 0x02, 0x48, 0xF0, 0xF4, 0x02, 0x46, 0xF0, 0xEE, 0x02, 0x45, 0xF0
	.byte 0xE8, 0x02, 0x44, 0xF0, 0xE1, 0x02, 0x43, 0xF0, 0xDB, 0x02, 0x42, 0xF0, 0xD5, 0x02, 0x41, 0xF0
	.byte 0xCF, 0x02, 0x40, 0xF0, 0xC9, 0x02, 0x3E, 0xF0, 0xC2, 0x02, 0x3D, 0xF0, 0xBC, 0x02, 0x3C, 0xF0
	.byte 0xB6, 0x02, 0x3B, 0xF0, 0xB0, 0x02, 0x3A, 0xF0, 0xAA, 0x02, 0x39, 0xF0, 0xA3, 0x02, 0x38, 0xF0
	.byte 0x9D, 0x02, 0x37, 0xF0, 0x97, 0x02, 0x36, 0xF0, 0x91, 0x02, 0x35, 0xF0, 0x8B, 0x02, 0x34, 0xF0
	.byte 0x84, 0x02, 0x33, 0xF0, 0x7E, 0x02, 0x32, 0xF0, 0x78, 0x02, 0x31, 0xF0, 0x72, 0x02, 0x30, 0xF0
	.byte 0x6C, 0x02, 0x2F, 0xF0, 0x65, 0x02, 0x2E, 0xF0, 0x5F, 0x02, 0x2D, 0xF0, 0x59, 0x02, 0x2C, 0xF0
	.byte 0x53, 0x02, 0x2B, 0xF0, 0x4D, 0x02, 0x2B, 0xF0, 0x46, 0x02, 0x2A, 0xF0, 0x40, 0x02, 0x29, 0xF0
	.byte 0x3A, 0x02, 0x28, 0xF0, 0x34, 0x02, 0x27, 0xF0, 0x2D, 0x02, 0x26, 0xF0, 0x27, 0x02, 0x25, 0xF0
	.byte 0x21, 0x02, 0x24, 0xF0, 0x1B, 0x02, 0x24, 0xF0, 0x15, 0x02, 0x23, 0xF0, 0x0E, 0x02, 0x22, 0xF0
	.byte 0x08, 0x02, 0x21, 0xF0, 0x02, 0x02, 0x20, 0xF0, 0xFC, 0x01, 0x20, 0xF0, 0xF5, 0x01, 0x1F, 0xF0
	.byte 0xEF, 0x01, 0x1E, 0xF0, 0xE9, 0x01, 0x1D, 0xF0, 0xE3, 0x01, 0x1D, 0xF0, 0xDC, 0x01, 0x1C, 0xF0
	.byte 0xD6, 0x01, 0x1B, 0xF0, 0xD0, 0x01, 0x1A, 0xF0, 0xCA, 0x01, 0x1A, 0xF0, 0xC3, 0x01, 0x19, 0xF0
	.byte 0xBD, 0x01, 0x18, 0xF0, 0xB7, 0x01, 0x18, 0xF0, 0xB1, 0x01, 0x17, 0xF0, 0xAA, 0x01, 0x16, 0xF0
	.byte 0xA4, 0x01, 0x16, 0xF0, 0x9E, 0x01, 0x15, 0xF0, 0x98, 0x01, 0x14, 0xF0, 0x91, 0x01, 0x14, 0xF0
	.byte 0x8B, 0x01, 0x13, 0xF0, 0x85, 0x01, 0x13, 0xF0, 0x7F, 0x01, 0x12, 0xF0, 0x78, 0x01, 0x11, 0xF0
	.byte 0x72, 0x01, 0x11, 0xF0, 0x6C, 0x01, 0x10, 0xF0, 0x66, 0x01, 0x10, 0xF0, 0x5F, 0x01, 0x0F, 0xF0
	.byte 0x59, 0x01, 0x0F, 0xF0, 0x53, 0x01, 0x0E, 0xF0, 0x4D, 0x01, 0x0E, 0xF0, 0x46, 0x01, 0x0D, 0xF0
	.byte 0x40, 0x01, 0x0D, 0xF0, 0x3A, 0x01, 0x0C, 0xF0, 0x34, 0x01, 0x0C, 0xF0, 0x2D, 0x01, 0x0B, 0xF0
	.byte 0x27, 0x01, 0x0B, 0xF0, 0x21, 0x01, 0x0A, 0xF0, 0x1B, 0x01, 0x0A, 0xF0, 0x14, 0x01, 0x09, 0xF0
	.byte 0x0E, 0x01, 0x09, 0xF0, 0x08, 0x01, 0x08, 0xF0, 0x01, 0x01, 0x08, 0xF0, 0xFB, 0x00, 0x08, 0xF0
	.byte 0xF5, 0x00, 0x07, 0xF0, 0xEF, 0x00, 0x07, 0xF0, 0xE8, 0x00, 0x07, 0xF0, 0xE2, 0x00, 0x06, 0xF0
	.byte 0xDC, 0x00, 0x06, 0xF0, 0xD6, 0x00, 0x06, 0xF0, 0xCF, 0x00, 0x05, 0xF0, 0xC9, 0x00, 0x05, 0xF0
	.byte 0xC3, 0x00, 0x05, 0xF0, 0xBC, 0x00, 0x04, 0xF0, 0xB6, 0x00, 0x04, 0xF0, 0xB0, 0x00, 0x04, 0xF0
	.byte 0xAA, 0x00, 0x04, 0xF0, 0xA3, 0x00, 0x03, 0xF0, 0x9D, 0x00, 0x03, 0xF0, 0x97, 0x00, 0x03, 0xF0
	.byte 0x90, 0x00, 0x03, 0xF0, 0x8A, 0x00, 0x02, 0xF0, 0x84, 0x00, 0x02, 0xF0, 0x7E, 0x00, 0x02, 0xF0
	.byte 0x77, 0x00, 0x02, 0xF0, 0x71, 0x00, 0x02, 0xF0, 0x6B, 0x00, 0x01, 0xF0, 0x65, 0x00, 0x01, 0xF0
	.byte 0x5E, 0x00, 0x01, 0xF0, 0x58, 0x00, 0x01, 0xF0, 0x52, 0x00, 0x01, 0xF0, 0x4B, 0x00, 0x01, 0xF0
	.byte 0x45, 0x00, 0x01, 0xF0, 0x3F, 0x00, 0x00, 0xF0, 0x39, 0x00, 0x00, 0xF0, 0x32, 0x00, 0x00, 0xF0
	.byte 0x2C, 0x00, 0x00, 0xF0, 0x26, 0x00, 0x00, 0xF0, 0x1F, 0x00, 0x00, 0xF0, 0x19, 0x00, 0x00, 0xF0
	.byte 0x13, 0x00, 0x00, 0xF0, 0x0D, 0x00, 0x00, 0xF0, 0x06, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xF0
	.byte 0xFA, 0xFF, 0x00, 0xF0, 0xF3, 0xFF, 0x00, 0xF0, 0xED, 0xFF, 0x00, 0xF0, 0xE7, 0xFF, 0x00, 0xF0
	.byte 0xE1, 0xFF, 0x00, 0xF0, 0xDA, 0xFF, 0x00, 0xF0, 0xD4, 0xFF, 0x00, 0xF0, 0xCE, 0xFF, 0x00, 0xF0
	.byte 0xC7, 0xFF, 0x00, 0xF0, 0xC1, 0xFF, 0x00, 0xF0, 0xBB, 0xFF, 0x01, 0xF0, 0xB5, 0xFF, 0x01, 0xF0
	.byte 0xAE, 0xFF, 0x01, 0xF0, 0xA8, 0xFF, 0x01, 0xF0, 0xA2, 0xFF, 0x01, 0xF0, 0x9B, 0xFF, 0x01, 0xF0
	.byte 0x95, 0xFF, 0x01, 0xF0, 0x8F, 0xFF, 0x02, 0xF0, 0x89, 0xFF, 0x02, 0xF0, 0x82, 0xFF, 0x02, 0xF0
	.byte 0x7C, 0xFF, 0x02, 0xF0, 0x76, 0xFF, 0x02, 0xF0, 0x70, 0xFF, 0x03, 0xF0, 0x69, 0xFF, 0x03, 0xF0
	.byte 0x63, 0xFF, 0x03, 0xF0, 0x5D, 0xFF, 0x03, 0xF0, 0x56, 0xFF, 0x04, 0xF0, 0x50, 0xFF, 0x04, 0xF0
	.byte 0x4A, 0xFF, 0x04, 0xF0, 0x44, 0xFF, 0x04, 0xF0, 0x3D, 0xFF, 0x05, 0xF0, 0x37, 0xFF, 0x05, 0xF0
	.byte 0x31, 0xFF, 0x05, 0xF0, 0x2A, 0xFF, 0x06, 0xF0, 0x24, 0xFF, 0x06, 0xF0, 0x1E, 0xFF, 0x06, 0xF0
	.byte 0x18, 0xFF, 0x07, 0xF0, 0x11, 0xFF, 0x07, 0xF0, 0x0B, 0xFF, 0x07, 0xF0, 0x05, 0xFF, 0x08, 0xF0
	.byte 0xFF, 0xFE, 0x08, 0xF0, 0xF8, 0xFE, 0x08, 0xF0, 0xF2, 0xFE, 0x09, 0xF0, 0xEC, 0xFE, 0x09, 0xF0
	.byte 0xE5, 0xFE, 0x0A, 0xF0, 0xDF, 0xFE, 0x0A, 0xF0, 0xD9, 0xFE, 0x0B, 0xF0, 0xD3, 0xFE, 0x0B, 0xF0
	.byte 0xCC, 0xFE, 0x0C, 0xF0, 0xC6, 0xFE, 0x0C, 0xF0, 0xC0, 0xFE, 0x0D, 0xF0, 0xBA, 0xFE, 0x0D, 0xF0
	.byte 0xB3, 0xFE, 0x0E, 0xF0, 0xAD, 0xFE, 0x0E, 0xF0, 0xA7, 0xFE, 0x0F, 0xF0, 0xA1, 0xFE, 0x0F, 0xF0
	.byte 0x9A, 0xFE, 0x10, 0xF0, 0x94, 0xFE, 0x10, 0xF0, 0x8E, 0xFE, 0x11, 0xF0, 0x88, 0xFE, 0x11, 0xF0
	.byte 0x81, 0xFE, 0x12, 0xF0, 0x7B, 0xFE, 0x13, 0xF0, 0x75, 0xFE, 0x13, 0xF0, 0x6F, 0xFE, 0x14, 0xF0
	.byte 0x68, 0xFE, 0x14, 0xF0, 0x62, 0xFE, 0x15, 0xF0, 0x5C, 0xFE, 0x16, 0xF0, 0x56, 0xFE, 0x16, 0xF0
	.byte 0x4F, 0xFE, 0x17, 0xF0, 0x49, 0xFE, 0x18, 0xF0, 0x43, 0xFE, 0x18, 0xF0, 0x3D, 0xFE, 0x19, 0xF0
	.byte 0x36, 0xFE, 0x1A, 0xF0, 0x30, 0xFE, 0x1A, 0xF0, 0x2A, 0xFE, 0x1B, 0xF0, 0x24, 0xFE, 0x1C, 0xF0
	.byte 0x1D, 0xFE, 0x1D, 0xF0, 0x17, 0xFE, 0x1D, 0xF0, 0x11, 0xFE, 0x1E, 0xF0, 0x0B, 0xFE, 0x1F, 0xF0
	.byte 0x04, 0xFE, 0x20, 0xF0, 0xFE, 0xFD, 0x20, 0xF0, 0xF8, 0xFD, 0x21, 0xF0, 0xF2, 0xFD, 0x22, 0xF0
	.byte 0xEB, 0xFD, 0x23, 0xF0, 0xE5, 0xFD, 0x24, 0xF0, 0xDF, 0xFD, 0x24, 0xF0, 0xD9, 0xFD, 0x25, 0xF0
	.byte 0xD3, 0xFD, 0x26, 0xF0, 0xCC, 0xFD, 0x27, 0xF0, 0xC6, 0xFD, 0x28, 0xF0, 0xC0, 0xFD, 0x29, 0xF0
	.byte 0xBA, 0xFD, 0x2A, 0xF0, 0xB3, 0xFD, 0x2B, 0xF0, 0xAD, 0xFD, 0x2B, 0xF0, 0xA7, 0xFD, 0x2C, 0xF0
	.byte 0xA1, 0xFD, 0x2D, 0xF0, 0x9B, 0xFD, 0x2E, 0xF0, 0x94, 0xFD, 0x2F, 0xF0, 0x8E, 0xFD, 0x30, 0xF0
	.byte 0x88, 0xFD, 0x31, 0xF0, 0x82, 0xFD, 0x32, 0xF0, 0x7C, 0xFD, 0x33, 0xF0, 0x75, 0xFD, 0x34, 0xF0
	.byte 0x6F, 0xFD, 0x35, 0xF0, 0x69, 0xFD, 0x36, 0xF0, 0x63, 0xFD, 0x37, 0xF0, 0x5D, 0xFD, 0x38, 0xF0
	.byte 0x56, 0xFD, 0x39, 0xF0, 0x50, 0xFD, 0x3A, 0xF0, 0x4A, 0xFD, 0x3B, 0xF0, 0x44, 0xFD, 0x3C, 0xF0
	.byte 0x3E, 0xFD, 0x3D, 0xF0, 0x37, 0xFD, 0x3E, 0xF0, 0x31, 0xFD, 0x40, 0xF0, 0x2B, 0xFD, 0x41, 0xF0
	.byte 0x25, 0xFD, 0x42, 0xF0, 0x1F, 0xFD, 0x43, 0xF0, 0x18, 0xFD, 0x44, 0xF0, 0x12, 0xFD, 0x45, 0xF0
	.byte 0x0C, 0xFD, 0x46, 0xF0, 0x06, 0xFD, 0x48, 0xF0, 0x00, 0xFD, 0x49, 0xF0, 0xFA, 0xFC, 0x4A, 0xF0
	.byte 0xF3, 0xFC, 0x4B, 0xF0, 0xED, 0xFC, 0x4C, 0xF0, 0xE7, 0xFC, 0x4D, 0xF0, 0xE1, 0xFC, 0x4F, 0xF0
	.byte 0xDB, 0xFC, 0x50, 0xF0, 0xD5, 0xFC, 0x51, 0xF0, 0xCE, 0xFC, 0x52, 0xF0, 0xC8, 0xFC, 0x54, 0xF0
	.byte 0xC2, 0xFC, 0x55, 0xF0, 0xBC, 0xFC, 0x56, 0xF0, 0xB6, 0xFC, 0x58, 0xF0, 0xB0, 0xFC, 0x59, 0xF0
	.byte 0xAA, 0xFC, 0x5A, 0xF0, 0xA3, 0xFC, 0x5B, 0xF0, 0x9D, 0xFC, 0x5D, 0xF0, 0x97, 0xFC, 0x5E, 0xF0
	.byte 0x91, 0xFC, 0x5F, 0xF0, 0x8B, 0xFC, 0x61, 0xF0, 0x85, 0xFC, 0x62, 0xF0, 0x7F, 0xFC, 0x64, 0xF0
	.byte 0x78, 0xFC, 0x65, 0xF0, 0x72, 0xFC, 0x66, 0xF0, 0x6C, 0xFC, 0x68, 0xF0, 0x66, 0xFC, 0x69, 0xF0
	.byte 0x60, 0xFC, 0x6B, 0xF0, 0x5A, 0xFC, 0x6C, 0xF0, 0x54, 0xFC, 0x6D, 0xF0, 0x4E, 0xFC, 0x6F, 0xF0
	.byte 0x47, 0xFC, 0x70, 0xF0, 0x41, 0xFC, 0x72, 0xF0, 0x3B, 0xFC, 0x73, 0xF0, 0x35, 0xFC, 0x75, 0xF0
	.byte 0x2F, 0xFC, 0x76, 0xF0, 0x29, 0xFC, 0x78, 0xF0, 0x23, 0xFC, 0x79, 0xF0, 0x1D, 0xFC, 0x7B, 0xF0
	.byte 0x17, 0xFC, 0x7C, 0xF0, 0x11, 0xFC, 0x7E, 0xF0, 0x0A, 0xFC, 0x7F, 0xF0, 0x04, 0xFC, 0x81, 0xF0
	.byte 0xFE, 0xFB, 0x83, 0xF0, 0xF8, 0xFB, 0x84, 0xF0, 0xF2, 0xFB, 0x86, 0xF0, 0xEC, 0xFB, 0x87, 0xF0
	.byte 0xE6, 0xFB, 0x89, 0xF0, 0xE0, 0xFB, 0x8A, 0xF0, 0xDA, 0xFB, 0x8C, 0xF0, 0xD4, 0xFB, 0x8E, 0xF0
	.byte 0xCE, 0xFB, 0x8F, 0xF0, 0xC8, 0xFB, 0x91, 0xF0, 0xC2, 0xFB, 0x93, 0xF0, 0xBC, 0xFB, 0x94, 0xF0
	.byte 0xB5, 0xFB, 0x96, 0xF0, 0xAF, 0xFB, 0x98, 0xF0, 0xA9, 0xFB, 0x99, 0xF0, 0xA3, 0xFB, 0x9B, 0xF0
	.byte 0x9D, 0xFB, 0x9D, 0xF0, 0x97, 0xFB, 0x9F, 0xF0, 0x91, 0xFB, 0xA0, 0xF0, 0x8B, 0xFB, 0xA2, 0xF0
	.byte 0x85, 0xFB, 0xA4, 0xF0, 0x7F, 0xFB, 0xA6, 0xF0, 0x79, 0xFB, 0xA7, 0xF0, 0x73, 0xFB, 0xA9, 0xF0
	.byte 0x6D, 0xFB, 0xAB, 0xF0, 0x67, 0xFB, 0xAD, 0xF0, 0x61, 0xFB, 0xAF, 0xF0, 0x5B, 0xFB, 0xB0, 0xF0
	.byte 0x55, 0xFB, 0xB2, 0xF0, 0x4F, 0xFB, 0xB4, 0xF0, 0x49, 0xFB, 0xB6, 0xF0, 0x43, 0xFB, 0xB8, 0xF0
	.byte 0x3D, 0xFB, 0xBA, 0xF0, 0x37, 0xFB, 0xBB, 0xF0, 0x31, 0xFB, 0xBD, 0xF0, 0x2B, 0xFB, 0xBF, 0xF0
	.byte 0x25, 0xFB, 0xC1, 0xF0, 0x1F, 0xFB, 0xC3, 0xF0, 0x19, 0xFB, 0xC5, 0xF0, 0x13, 0xFB, 0xC7, 0xF0
	.byte 0x0D, 0xFB, 0xC9, 0xF0, 0x07, 0xFB, 0xCB, 0xF0, 0x01, 0xFB, 0xCD, 0xF0, 0xFB, 0xFA, 0xCF, 0xF0
	.byte 0xF5, 0xFA, 0xD1, 0xF0, 0xEF, 0xFA, 0xD3, 0xF0, 0xE9, 0xFA, 0xD5, 0xF0, 0xE3, 0xFA, 0xD7, 0xF0
	.byte 0xDD, 0xFA, 0xD9, 0xF0, 0xD7, 0xFA, 0xDB, 0xF0, 0xD1, 0xFA, 0xDD, 0xF0, 0xCC, 0xFA, 0xDF, 0xF0
	.byte 0xC6, 0xFA, 0xE1, 0xF0, 0xC0, 0xFA, 0xE3, 0xF0, 0xBA, 0xFA, 0xE5, 0xF0, 0xB4, 0xFA, 0xE7, 0xF0
	.byte 0xAE, 0xFA, 0xE9, 0xF0, 0xA8, 0xFA, 0xEB, 0xF0, 0xA2, 0xFA, 0xED, 0xF0, 0x9C, 0xFA, 0xEF, 0xF0
	.byte 0x96, 0xFA, 0xF2, 0xF0, 0x90, 0xFA, 0xF4, 0xF0, 0x8A, 0xFA, 0xF6, 0xF0, 0x84, 0xFA, 0xF8, 0xF0
	.byte 0x7F, 0xFA, 0xFA, 0xF0, 0x79, 0xFA, 0xFC, 0xF0, 0x73, 0xFA, 0xFE, 0xF0, 0x6D, 0xFA, 0x01, 0xF1
	.byte 0x67, 0xFA, 0x03, 0xF1, 0x61, 0xFA, 0x05, 0xF1, 0x5B, 0xFA, 0x07, 0xF1, 0x55, 0xFA, 0x09, 0xF1
	.byte 0x4F, 0xFA, 0x0C, 0xF1, 0x4A, 0xFA, 0x0E, 0xF1, 0x44, 0xFA, 0x10, 0xF1, 0x3E, 0xFA, 0x12, 0xF1
	.byte 0x38, 0xFA, 0x15, 0xF1, 0x32, 0xFA, 0x17, 0xF1, 0x2C, 0xFA, 0x19, 0xF1, 0x26, 0xFA, 0x1C, 0xF1
	.byte 0x21, 0xFA, 0x1E, 0xF1, 0x1B, 0xFA, 0x20, 0xF1, 0x15, 0xFA, 0x23, 0xF1, 0x0F, 0xFA, 0x25, 0xF1
	.byte 0x09, 0xFA, 0x27, 0xF1, 0x03, 0xFA, 0x2A, 0xF1, 0xFE, 0xF9, 0x2C, 0xF1, 0xF8, 0xF9, 0x2E, 0xF1
	.byte 0xF2, 0xF9, 0x31, 0xF1, 0xEC, 0xF9, 0x33, 0xF1, 0xE6, 0xF9, 0x35, 0xF1, 0xE1, 0xF9, 0x38, 0xF1
	.byte 0xDB, 0xF9, 0x3A, 0xF1, 0xD5, 0xF9, 0x3D, 0xF1, 0xCF, 0xF9, 0x3F, 0xF1, 0xC9, 0xF9, 0x41, 0xF1
	.byte 0xC4, 0xF9, 0x44, 0xF1, 0xBE, 0xF9, 0x46, 0xF1, 0xB8, 0xF9, 0x49, 0xF1, 0xB2, 0xF9, 0x4B, 0xF1
	.byte 0xAC, 0xF9, 0x4E, 0xF1, 0xA7, 0xF9, 0x50, 0xF1, 0xA1, 0xF9, 0x53, 0xF1, 0x9B, 0xF9, 0x55, 0xF1
	.byte 0x95, 0xF9, 0x58, 0xF1, 0x90, 0xF9, 0x5A, 0xF1, 0x8A, 0xF9, 0x5D, 0xF1, 0x84, 0xF9, 0x5F, 0xF1
	.byte 0x7E, 0xF9, 0x62, 0xF1, 0x79, 0xF9, 0x65, 0xF1, 0x73, 0xF9, 0x67, 0xF1, 0x6D, 0xF9, 0x6A, 0xF1
	.byte 0x67, 0xF9, 0x6C, 0xF1, 0x62, 0xF9, 0x6F, 0xF1, 0x5C, 0xF9, 0x71, 0xF1, 0x56, 0xF9, 0x74, 0xF1
	.byte 0x51, 0xF9, 0x77, 0xF1, 0x4B, 0xF9, 0x79, 0xF1, 0x45, 0xF9, 0x7C, 0xF1, 0x3F, 0xF9, 0x7F, 0xF1
	.byte 0x3A, 0xF9, 0x81, 0xF1, 0x34, 0xF9, 0x84, 0xF1, 0x2E, 0xF9, 0x87, 0xF1, 0x29, 0xF9, 0x89, 0xF1
	.byte 0x23, 0xF9, 0x8C, 0xF1, 0x1D, 0xF9, 0x8F, 0xF1, 0x18, 0xF9, 0x91, 0xF1, 0x12, 0xF9, 0x94, 0xF1
	.byte 0x0C, 0xF9, 0x97, 0xF1, 0x07, 0xF9, 0x9A, 0xF1, 0x01, 0xF9, 0x9C, 0xF1, 0xFB, 0xF8, 0x9F, 0xF1
	.byte 0xF6, 0xF8, 0xA2, 0xF1, 0xF0, 0xF8, 0xA5, 0xF1, 0xEB, 0xF8, 0xA7, 0xF1, 0xE5, 0xF8, 0xAA, 0xF1
	.byte 0xDF, 0xF8, 0xAD, 0xF1, 0xDA, 0xF8, 0xB0, 0xF1, 0xD4, 0xF8, 0xB3, 0xF1, 0xCE, 0xF8, 0xB5, 0xF1
	.byte 0xC9, 0xF8, 0xB8, 0xF1, 0xC3, 0xF8, 0xBB, 0xF1, 0xBE, 0xF8, 0xBE, 0xF1, 0xB8, 0xF8, 0xC1, 0xF1
	.byte 0xB2, 0xF8, 0xC4, 0xF1, 0xAD, 0xF8, 0xC6, 0xF1, 0xA7, 0xF8, 0xC9, 0xF1, 0xA2, 0xF8, 0xCC, 0xF1
	.byte 0x9C, 0xF8, 0xCF, 0xF1, 0x96, 0xF8, 0xD2, 0xF1, 0x91, 0xF8, 0xD5, 0xF1, 0x8B, 0xF8, 0xD8, 0xF1
	.byte 0x86, 0xF8, 0xDB, 0xF1, 0x80, 0xF8, 0xDE, 0xF1, 0x7B, 0xF8, 0xE1, 0xF1, 0x75, 0xF8, 0xE4, 0xF1
	.byte 0x70, 0xF8, 0xE7, 0xF1, 0x6A, 0xF8, 0xEA, 0xF1, 0x65, 0xF8, 0xED, 0xF1, 0x5F, 0xF8, 0xF0, 0xF1
	.byte 0x5A, 0xF8, 0xF3, 0xF1, 0x54, 0xF8, 0xF6, 0xF1, 0x4E, 0xF8, 0xF9, 0xF1, 0x49, 0xF8, 0xFC, 0xF1
	.byte 0x43, 0xF8, 0xFF, 0xF1, 0x3E, 0xF8, 0x02, 0xF2, 0x38, 0xF8, 0x05, 0xF2, 0x33, 0xF8, 0x08, 0xF2
	.byte 0x2E, 0xF8, 0x0B, 0xF2, 0x28, 0xF8, 0x0E, 0xF2, 0x23, 0xF8, 0x11, 0xF2, 0x1D, 0xF8, 0x14, 0xF2
	.byte 0x18, 0xF8, 0x17, 0xF2, 0x12, 0xF8, 0x1A, 0xF2, 0x0D, 0xF8, 0x1D, 0xF2, 0x07, 0xF8, 0x21, 0xF2
	.byte 0x02, 0xF8, 0x24, 0xF2, 0xFC, 0xF7, 0x27, 0xF2, 0xF7, 0xF7, 0x2A, 0xF2, 0xF2, 0xF7, 0x2D, 0xF2
	.byte 0xEC, 0xF7, 0x30, 0xF2, 0xE7, 0xF7, 0x34, 0xF2, 0xE1, 0xF7, 0x37, 0xF2, 0xDC, 0xF7, 0x3A, 0xF2
	.byte 0xD6, 0xF7, 0x3D, 0xF2, 0xD1, 0xF7, 0x40, 0xF2, 0xCC, 0xF7, 0x44, 0xF2, 0xC6, 0xF7, 0x47, 0xF2
	.byte 0xC1, 0xF7, 0x4A, 0xF2, 0xBB, 0xF7, 0x4D, 0xF2, 0xB6, 0xF7, 0x50, 0xF2, 0xB1, 0xF7, 0x54, 0xF2
	.byte 0xAB, 0xF7, 0x57, 0xF2, 0xA6, 0xF7, 0x5A, 0xF2, 0xA1, 0xF7, 0x5E, 0xF2, 0x9B, 0xF7, 0x61, 0xF2
	.byte 0x96, 0xF7, 0x64, 0xF2, 0x91, 0xF7, 0x67, 0xF2, 0x8B, 0xF7, 0x6B, 0xF2, 0x86, 0xF7, 0x6E, 0xF2
	.byte 0x81, 0xF7, 0x71, 0xF2, 0x7B, 0xF7, 0x75, 0xF2, 0x76, 0xF7, 0x78, 0xF2, 0x71, 0xF7, 0x7B, 0xF2
	.byte 0x6B, 0xF7, 0x7F, 0xF2, 0x66, 0xF7, 0x82, 0xF2, 0x61, 0xF7, 0x86, 0xF2, 0x5B, 0xF7, 0x89, 0xF2
	.byte 0x56, 0xF7, 0x8C, 0xF2, 0x51, 0xF7, 0x90, 0xF2, 0x4C, 0xF7, 0x93, 0xF2, 0x46, 0xF7, 0x97, 0xF2
	.byte 0x41, 0xF7, 0x9A, 0xF2, 0x3C, 0xF7, 0x9E, 0xF2, 0x37, 0xF7, 0xA1, 0xF2, 0x31, 0xF7, 0xA4, 0xF2
	.byte 0x2C, 0xF7, 0xA8, 0xF2, 0x27, 0xF7, 0xAB, 0xF2, 0x22, 0xF7, 0xAF, 0xF2, 0x1C, 0xF7, 0xB2, 0xF2
	.byte 0x17, 0xF7, 0xB6, 0xF2, 0x12, 0xF7, 0xB9, 0xF2, 0x0D, 0xF7, 0xBD, 0xF2, 0x08, 0xF7, 0xC0, 0xF2
	.byte 0x02, 0xF7, 0xC4, 0xF2, 0xFD, 0xF6, 0xC7, 0xF2, 0xF8, 0xF6, 0xCB, 0xF2, 0xF3, 0xF6, 0xCE, 0xF2
	.byte 0xEE, 0xF6, 0xD2, 0xF2, 0xE8, 0xF6, 0xD6, 0xF2, 0xE3, 0xF6, 0xD9, 0xF2, 0xDE, 0xF6, 0xDD, 0xF2
	.byte 0xD9, 0xF6, 0xE0, 0xF2, 0xD4, 0xF6, 0xE4, 0xF2, 0xCF, 0xF6, 0xE8, 0xF2, 0xC9, 0xF6, 0xEB, 0xF2
	.byte 0xC4, 0xF6, 0xEF, 0xF2, 0xBF, 0xF6, 0xF2, 0xF2, 0xBA, 0xF6, 0xF6, 0xF2, 0xB5, 0xF6, 0xFA, 0xF2
	.byte 0xB0, 0xF6, 0xFD, 0xF2, 0xAB, 0xF6, 0x01, 0xF3, 0xA6, 0xF6, 0x05, 0xF3, 0xA1, 0xF6, 0x08, 0xF3
	.byte 0x9B, 0xF6, 0x0C, 0xF3, 0x96, 0xF6, 0x10, 0xF3, 0x91, 0xF6, 0x13, 0xF3, 0x8C, 0xF6, 0x17, 0xF3
	.byte 0x87, 0xF6, 0x1B, 0xF3, 0x82, 0xF6, 0x1F, 0xF3, 0x7D, 0xF6, 0x22, 0xF3, 0x78, 0xF6, 0x26, 0xF3
	.byte 0x73, 0xF6, 0x2A, 0xF3, 0x6E, 0xF6, 0x2E, 0xF3, 0x69, 0xF6, 0x31, 0xF3, 0x64, 0xF6, 0x35, 0xF3
	.byte 0x5F, 0xF6, 0x39, 0xF3, 0x5A, 0xF6, 0x3D, 0xF3, 0x55, 0xF6, 0x40, 0xF3, 0x50, 0xF6, 0x44, 0xF3
	.byte 0x4B, 0xF6, 0x48, 0xF3, 0x46, 0xF6, 0x4C, 0xF3, 0x41, 0xF6, 0x50, 0xF3, 0x3C, 0xF6, 0x54, 0xF3
	.byte 0x37, 0xF6, 0x57, 0xF3, 0x32, 0xF6, 0x5B, 0xF3, 0x2D, 0xF6, 0x5F, 0xF3, 0x28, 0xF6, 0x63, 0xF3
	.byte 0x23, 0xF6, 0x67, 0xF3, 0x1E, 0xF6, 0x6B, 0xF3, 0x19, 0xF6, 0x6F, 0xF3, 0x14, 0xF6, 0x72, 0xF3
	.byte 0x0F, 0xF6, 0x76, 0xF3, 0x0A, 0xF6, 0x7A, 0xF3, 0x05, 0xF6, 0x7E, 0xF3, 0x01, 0xF6, 0x82, 0xF3
	.byte 0xFC, 0xF5, 0x86, 0xF3, 0xF7, 0xF5, 0x8A, 0xF3, 0xF2, 0xF5, 0x8E, 0xF3, 0xED, 0xF5, 0x92, 0xF3
	.byte 0xE8, 0xF5, 0x96, 0xF3, 0xE3, 0xF5, 0x9A, 0xF3, 0xDE, 0xF5, 0x9E, 0xF3, 0xDA, 0xF5, 0xA2, 0xF3
	.byte 0xD5, 0xF5, 0xA6, 0xF3, 0xD0, 0xF5, 0xAA, 0xF3, 0xCB, 0xF5, 0xAE, 0xF3, 0xC6, 0xF5, 0xB2, 0xF3
	.byte 0xC1, 0xF5, 0xB6, 0xF3, 0xBC, 0xF5, 0xBA, 0xF3, 0xB8, 0xF5, 0xBE, 0xF3, 0xB3, 0xF5, 0xC2, 0xF3
	.byte 0xAE, 0xF5, 0xC6, 0xF3, 0xA9, 0xF5, 0xCA, 0xF3, 0xA4, 0xF5, 0xCE, 0xF3, 0xA0, 0xF5, 0xD2, 0xF3
	.byte 0x9B, 0xF5, 0xD6, 0xF3, 0x96, 0xF5, 0xDA, 0xF3, 0x91, 0xF5, 0xDE, 0xF3, 0x8D, 0xF5, 0xE2, 0xF3
	.byte 0x88, 0xF5, 0xE7, 0xF3, 0x83, 0xF5, 0xEB, 0xF3, 0x7E, 0xF5, 0xEF, 0xF3, 0x7A, 0xF5, 0xF3, 0xF3
	.byte 0x75, 0xF5, 0xF7, 0xF3, 0x70, 0xF5, 0xFB, 0xF3, 0x6B, 0xF5, 0xFF, 0xF3, 0x67, 0xF5, 0x04, 0xF4
	.byte 0x62, 0xF5, 0x08, 0xF4, 0x5D, 0xF5, 0x0C, 0xF4, 0x59, 0xF5, 0x10, 0xF4, 0x54, 0xF5, 0x14, 0xF4
	.byte 0x4F, 0xF5, 0x18, 0xF4, 0x4B, 0xF5, 0x1D, 0xF4, 0x46, 0xF5, 0x21, 0xF4, 0x41, 0xF5, 0x25, 0xF4
	.byte 0x3D, 0xF5, 0x29, 0xF4, 0x38, 0xF5, 0x2E, 0xF4, 0x33, 0xF5, 0x32, 0xF4, 0x2F, 0xF5, 0x36, 0xF4
	.byte 0x2A, 0xF5, 0x3A, 0xF4, 0x25, 0xF5, 0x3F, 0xF4, 0x21, 0xF5, 0x43, 0xF4, 0x1C, 0xF5, 0x47, 0xF4
	.byte 0x18, 0xF5, 0x4B, 0xF4, 0x13, 0xF5, 0x50, 0xF4, 0x0E, 0xF5, 0x54, 0xF4, 0x0A, 0xF5, 0x58, 0xF4
	.byte 0x05, 0xF5, 0x5D, 0xF4, 0x01, 0xF5, 0x61, 0xF4, 0xFC, 0xF4, 0x65, 0xF4, 0xF8, 0xF4, 0x69, 0xF4
	.byte 0xF3, 0xF4, 0x6E, 0xF4, 0xEF, 0xF4, 0x72, 0xF4, 0xEA, 0xF4, 0x77, 0xF4, 0xE5, 0xF4, 0x7B, 0xF4
	.byte 0xE1, 0xF4, 0x7F, 0xF4, 0xDC, 0xF4, 0x84, 0xF4, 0xD8, 0xF4, 0x88, 0xF4, 0xD3, 0xF4, 0x8C, 0xF4
	.byte 0xCF, 0xF4, 0x91, 0xF4, 0xCA, 0xF4, 0x95, 0xF4, 0xC6, 0xF4, 0x9A, 0xF4, 0xC2, 0xF4, 0x9E, 0xF4
	.byte 0xBD, 0xF4, 0xA2, 0xF4, 0xB9, 0xF4, 0xA7, 0xF4, 0xB4, 0xF4, 0xAB, 0xF4, 0xB0, 0xF4, 0xB0, 0xF4
	.byte 0xAB, 0xF4, 0xB4, 0xF4, 0xA7, 0xF4, 0xB9, 0xF4, 0xA2, 0xF4, 0xBD, 0xF4, 0x9E, 0xF4, 0xC2, 0xF4
	.byte 0x9A, 0xF4, 0xC6, 0xF4, 0x95, 0xF4, 0xCA, 0xF4, 0x91, 0xF4, 0xCF, 0xF4, 0x8C, 0xF4, 0xD3, 0xF4
	.byte 0x88, 0xF4, 0xD8, 0xF4, 0x84, 0xF4, 0xDC, 0xF4, 0x7F, 0xF4, 0xE1, 0xF4, 0x7B, 0xF4, 0xE5, 0xF4
	.byte 0x77, 0xF4, 0xEA, 0xF4, 0x72, 0xF4, 0xEF, 0xF4, 0x6E, 0xF4, 0xF3, 0xF4, 0x69, 0xF4, 0xF8, 0xF4
	.byte 0x65, 0xF4, 0xFC, 0xF4, 0x61, 0xF4, 0x01, 0xF5, 0x5D, 0xF4, 0x05, 0xF5, 0x58, 0xF4, 0x0A, 0xF5
	.byte 0x54, 0xF4, 0x0E, 0xF5, 0x50, 0xF4, 0x13, 0xF5, 0x4B, 0xF4, 0x18, 0xF5, 0x47, 0xF4, 0x1C, 0xF5
	.byte 0x43, 0xF4, 0x21, 0xF5, 0x3F, 0xF4, 0x25, 0xF5, 0x3A, 0xF4, 0x2A, 0xF5, 0x36, 0xF4, 0x2F, 0xF5
	.byte 0x32, 0xF4, 0x33, 0xF5, 0x2E, 0xF4, 0x38, 0xF5, 0x29, 0xF4, 0x3D, 0xF5, 0x25, 0xF4, 0x41, 0xF5
	.byte 0x21, 0xF4, 0x46, 0xF5, 0x1D, 0xF4, 0x4B, 0xF5, 0x18, 0xF4, 0x4F, 0xF5, 0x14, 0xF4, 0x54, 0xF5
	.byte 0x10, 0xF4, 0x59, 0xF5, 0x0C, 0xF4, 0x5D, 0xF5, 0x08, 0xF4, 0x62, 0xF5, 0x04, 0xF4, 0x67, 0xF5
	.byte 0xFF, 0xF3, 0x6B, 0xF5, 0xFB, 0xF3, 0x70, 0xF5, 0xF7, 0xF3, 0x75, 0xF5, 0xF3, 0xF3, 0x7A, 0xF5
	.byte 0xEF, 0xF3, 0x7E, 0xF5, 0xEB, 0xF3, 0x83, 0xF5, 0xE7, 0xF3, 0x88, 0xF5, 0xE2, 0xF3, 0x8D, 0xF5
	.byte 0xDE, 0xF3, 0x91, 0xF5, 0xDA, 0xF3, 0x96, 0xF5, 0xD6, 0xF3, 0x9B, 0xF5, 0xD2, 0xF3, 0xA0, 0xF5
	.byte 0xCE, 0xF3, 0xA4, 0xF5, 0xCA, 0xF3, 0xA9, 0xF5, 0xC6, 0xF3, 0xAE, 0xF5, 0xC2, 0xF3, 0xB3, 0xF5
	.byte 0xBE, 0xF3, 0xB8, 0xF5, 0xBA, 0xF3, 0xBC, 0xF5, 0xB6, 0xF3, 0xC1, 0xF5, 0xB2, 0xF3, 0xC6, 0xF5
	.byte 0xAE, 0xF3, 0xCB, 0xF5, 0xAA, 0xF3, 0xD0, 0xF5, 0xA6, 0xF3, 0xD5, 0xF5, 0xA2, 0xF3, 0xDA, 0xF5
	.byte 0x9E, 0xF3, 0xDE, 0xF5, 0x9A, 0xF3, 0xE3, 0xF5, 0x96, 0xF3, 0xE8, 0xF5, 0x92, 0xF3, 0xED, 0xF5
	.byte 0x8E, 0xF3, 0xF2, 0xF5, 0x8A, 0xF3, 0xF7, 0xF5, 0x86, 0xF3, 0xFC, 0xF5, 0x82, 0xF3, 0x01, 0xF6
	.byte 0x7E, 0xF3, 0x05, 0xF6, 0x7A, 0xF3, 0x0A, 0xF6, 0x76, 0xF3, 0x0F, 0xF6, 0x72, 0xF3, 0x14, 0xF6
	.byte 0x6F, 0xF3, 0x19, 0xF6, 0x6B, 0xF3, 0x1E, 0xF6, 0x67, 0xF3, 0x23, 0xF6, 0x63, 0xF3, 0x28, 0xF6
	.byte 0x5F, 0xF3, 0x2D, 0xF6, 0x5B, 0xF3, 0x32, 0xF6, 0x57, 0xF3, 0x37, 0xF6, 0x54, 0xF3, 0x3C, 0xF6
	.byte 0x50, 0xF3, 0x41, 0xF6, 0x4C, 0xF3, 0x46, 0xF6, 0x48, 0xF3, 0x4B, 0xF6, 0x44, 0xF3, 0x50, 0xF6
	.byte 0x40, 0xF3, 0x55, 0xF6, 0x3D, 0xF3, 0x5A, 0xF6, 0x39, 0xF3, 0x5F, 0xF6, 0x35, 0xF3, 0x64, 0xF6
	.byte 0x31, 0xF3, 0x69, 0xF6, 0x2E, 0xF3, 0x6E, 0xF6, 0x2A, 0xF3, 0x73, 0xF6, 0x26, 0xF3, 0x78, 0xF6
	.byte 0x22, 0xF3, 0x7D, 0xF6, 0x1F, 0xF3, 0x82, 0xF6, 0x1B, 0xF3, 0x87, 0xF6, 0x17, 0xF3, 0x8C, 0xF6
	.byte 0x13, 0xF3, 0x91, 0xF6, 0x10, 0xF3, 0x96, 0xF6, 0x0C, 0xF3, 0x9B, 0xF6, 0x08, 0xF3, 0xA1, 0xF6
	.byte 0x05, 0xF3, 0xA6, 0xF6, 0x01, 0xF3, 0xAB, 0xF6, 0xFD, 0xF2, 0xB0, 0xF6, 0xFA, 0xF2, 0xB5, 0xF6
	.byte 0xF6, 0xF2, 0xBA, 0xF6, 0xF2, 0xF2, 0xBF, 0xF6, 0xEF, 0xF2, 0xC4, 0xF6, 0xEB, 0xF2, 0xC9, 0xF6
	.byte 0xE8, 0xF2, 0xCF, 0xF6, 0xE4, 0xF2, 0xD4, 0xF6, 0xE0, 0xF2, 0xD9, 0xF6, 0xDD, 0xF2, 0xDE, 0xF6
	.byte 0xD9, 0xF2, 0xE3, 0xF6, 0xD6, 0xF2, 0xE8, 0xF6, 0xD2, 0xF2, 0xEE, 0xF6, 0xCE, 0xF2, 0xF3, 0xF6
	.byte 0xCB, 0xF2, 0xF8, 0xF6, 0xC7, 0xF2, 0xFD, 0xF6, 0xC4, 0xF2, 0x02, 0xF7, 0xC0, 0xF2, 0x08, 0xF7
	.byte 0xBD, 0xF2, 0x0D, 0xF7, 0xB9, 0xF2, 0x12, 0xF7, 0xB6, 0xF2, 0x17, 0xF7, 0xB2, 0xF2, 0x1C, 0xF7
	.byte 0xAF, 0xF2, 0x22, 0xF7, 0xAB, 0xF2, 0x27, 0xF7, 0xA8, 0xF2, 0x2C, 0xF7, 0xA4, 0xF2, 0x31, 0xF7
	.byte 0xA1, 0xF2, 0x37, 0xF7, 0x9E, 0xF2, 0x3C, 0xF7, 0x9A, 0xF2, 0x41, 0xF7, 0x97, 0xF2, 0x46, 0xF7
	.byte 0x93, 0xF2, 0x4C, 0xF7, 0x90, 0xF2, 0x51, 0xF7, 0x8C, 0xF2, 0x56, 0xF7, 0x89, 0xF2, 0x5B, 0xF7
	.byte 0x86, 0xF2, 0x61, 0xF7, 0x82, 0xF2, 0x66, 0xF7, 0x7F, 0xF2, 0x6B, 0xF7, 0x7B, 0xF2, 0x71, 0xF7
	.byte 0x78, 0xF2, 0x76, 0xF7, 0x75, 0xF2, 0x7B, 0xF7, 0x71, 0xF2, 0x81, 0xF7, 0x6E, 0xF2, 0x86, 0xF7
	.byte 0x6B, 0xF2, 0x8B, 0xF7, 0x67, 0xF2, 0x91, 0xF7, 0x64, 0xF2, 0x96, 0xF7, 0x61, 0xF2, 0x9B, 0xF7
	.byte 0x5E, 0xF2, 0xA1, 0xF7, 0x5A, 0xF2, 0xA6, 0xF7, 0x57, 0xF2, 0xAB, 0xF7, 0x54, 0xF2, 0xB1, 0xF7
	.byte 0x50, 0xF2, 0xB6, 0xF7, 0x4D, 0xF2, 0xBB, 0xF7, 0x4A, 0xF2, 0xC1, 0xF7, 0x47, 0xF2, 0xC6, 0xF7
	.byte 0x44, 0xF2, 0xCC, 0xF7, 0x40, 0xF2, 0xD1, 0xF7, 0x3D, 0xF2, 0xD6, 0xF7, 0x3A, 0xF2, 0xDC, 0xF7
	.byte 0x37, 0xF2, 0xE1, 0xF7, 0x34, 0xF2, 0xE7, 0xF7, 0x30, 0xF2, 0xEC, 0xF7, 0x2D, 0xF2, 0xF2, 0xF7
	.byte 0x2A, 0xF2, 0xF7, 0xF7, 0x27, 0xF2, 0xFC, 0xF7, 0x24, 0xF2, 0x02, 0xF8, 0x21, 0xF2, 0x07, 0xF8
	.byte 0x1D, 0xF2, 0x0D, 0xF8, 0x1A, 0xF2, 0x12, 0xF8, 0x17, 0xF2, 0x18, 0xF8, 0x14, 0xF2, 0x1D, 0xF8
	.byte 0x11, 0xF2, 0x23, 0xF8, 0x0E, 0xF2, 0x28, 0xF8, 0x0B, 0xF2, 0x2E, 0xF8, 0x08, 0xF2, 0x33, 0xF8
	.byte 0x05, 0xF2, 0x38, 0xF8, 0x02, 0xF2, 0x3E, 0xF8, 0xFF, 0xF1, 0x43, 0xF8, 0xFC, 0xF1, 0x49, 0xF8
	.byte 0xF9, 0xF1, 0x4E, 0xF8, 0xF6, 0xF1, 0x54, 0xF8, 0xF3, 0xF1, 0x5A, 0xF8, 0xF0, 0xF1, 0x5F, 0xF8
	.byte 0xED, 0xF1, 0x65, 0xF8, 0xEA, 0xF1, 0x6A, 0xF8, 0xE7, 0xF1, 0x70, 0xF8, 0xE4, 0xF1, 0x75, 0xF8
	.byte 0xE1, 0xF1, 0x7B, 0xF8, 0xDE, 0xF1, 0x80, 0xF8, 0xDB, 0xF1, 0x86, 0xF8, 0xD8, 0xF1, 0x8B, 0xF8
	.byte 0xD5, 0xF1, 0x91, 0xF8, 0xD2, 0xF1, 0x96, 0xF8, 0xCF, 0xF1, 0x9C, 0xF8, 0xCC, 0xF1, 0xA2, 0xF8
	.byte 0xC9, 0xF1, 0xA7, 0xF8, 0xC6, 0xF1, 0xAD, 0xF8, 0xC4, 0xF1, 0xB2, 0xF8, 0xC1, 0xF1, 0xB8, 0xF8
	.byte 0xBE, 0xF1, 0xBE, 0xF8, 0xBB, 0xF1, 0xC3, 0xF8, 0xB8, 0xF1, 0xC9, 0xF8, 0xB5, 0xF1, 0xCE, 0xF8
	.byte 0xB3, 0xF1, 0xD4, 0xF8, 0xB0, 0xF1, 0xDA, 0xF8, 0xAD, 0xF1, 0xDF, 0xF8, 0xAA, 0xF1, 0xE5, 0xF8
	.byte 0xA7, 0xF1, 0xEB, 0xF8, 0xA5, 0xF1, 0xF0, 0xF8, 0xA2, 0xF1, 0xF6, 0xF8, 0x9F, 0xF1, 0xFB, 0xF8
	.byte 0x9C, 0xF1, 0x01, 0xF9, 0x9A, 0xF1, 0x07, 0xF9, 0x97, 0xF1, 0x0C, 0xF9, 0x94, 0xF1, 0x12, 0xF9
	.byte 0x91, 0xF1, 0x18, 0xF9, 0x8F, 0xF1, 0x1D, 0xF9, 0x8C, 0xF1, 0x23, 0xF9, 0x89, 0xF1, 0x29, 0xF9
	.byte 0x87, 0xF1, 0x2E, 0xF9, 0x84, 0xF1, 0x34, 0xF9, 0x81, 0xF1, 0x3A, 0xF9, 0x7F, 0xF1, 0x3F, 0xF9
	.byte 0x7C, 0xF1, 0x45, 0xF9, 0x79, 0xF1, 0x4B, 0xF9, 0x77, 0xF1, 0x51, 0xF9, 0x74, 0xF1, 0x56, 0xF9
	.byte 0x71, 0xF1, 0x5C, 0xF9, 0x6F, 0xF1, 0x62, 0xF9, 0x6C, 0xF1, 0x67, 0xF9, 0x6A, 0xF1, 0x6D, 0xF9
	.byte 0x67, 0xF1, 0x73, 0xF9, 0x65, 0xF1, 0x79, 0xF9, 0x62, 0xF1, 0x7E, 0xF9, 0x5F, 0xF1, 0x84, 0xF9
	.byte 0x5D, 0xF1, 0x8A, 0xF9, 0x5A, 0xF1, 0x90, 0xF9, 0x58, 0xF1, 0x95, 0xF9, 0x55, 0xF1, 0x9B, 0xF9
	.byte 0x53, 0xF1, 0xA1, 0xF9, 0x50, 0xF1, 0xA7, 0xF9, 0x4E, 0xF1, 0xAC, 0xF9, 0x4B, 0xF1, 0xB2, 0xF9
	.byte 0x49, 0xF1, 0xB8, 0xF9, 0x46, 0xF1, 0xBE, 0xF9, 0x44, 0xF1, 0xC4, 0xF9, 0x41, 0xF1, 0xC9, 0xF9
	.byte 0x3F, 0xF1, 0xCF, 0xF9, 0x3D, 0xF1, 0xD5, 0xF9, 0x3A, 0xF1, 0xDB, 0xF9, 0x38, 0xF1, 0xE1, 0xF9
	.byte 0x35, 0xF1, 0xE6, 0xF9, 0x33, 0xF1, 0xEC, 0xF9, 0x31, 0xF1, 0xF2, 0xF9, 0x2E, 0xF1, 0xF8, 0xF9
	.byte 0x2C, 0xF1, 0xFE, 0xF9, 0x2A, 0xF1, 0x03, 0xFA, 0x27, 0xF1, 0x09, 0xFA, 0x25, 0xF1, 0x0F, 0xFA
	.byte 0x23, 0xF1, 0x15, 0xFA, 0x20, 0xF1, 0x1B, 0xFA, 0x1E, 0xF1, 0x21, 0xFA, 0x1C, 0xF1, 0x26, 0xFA
	.byte 0x19, 0xF1, 0x2C, 0xFA, 0x17, 0xF1, 0x32, 0xFA, 0x15, 0xF1, 0x38, 0xFA, 0x12, 0xF1, 0x3E, 0xFA
	.byte 0x10, 0xF1, 0x44, 0xFA, 0x0E, 0xF1, 0x4A, 0xFA, 0x0C, 0xF1, 0x4F, 0xFA, 0x09, 0xF1, 0x55, 0xFA
	.byte 0x07, 0xF1, 0x5B, 0xFA, 0x05, 0xF1, 0x61, 0xFA, 0x03, 0xF1, 0x67, 0xFA, 0x01, 0xF1, 0x6D, 0xFA
	.byte 0xFE, 0xF0, 0x73, 0xFA, 0xFC, 0xF0, 0x79, 0xFA, 0xFA, 0xF0, 0x7F, 0xFA, 0xF8, 0xF0, 0x84, 0xFA
	.byte 0xF6, 0xF0, 0x8A, 0xFA, 0xF4, 0xF0, 0x90, 0xFA, 0xF2, 0xF0, 0x96, 0xFA, 0xEF, 0xF0, 0x9C, 0xFA
	.byte 0xED, 0xF0, 0xA2, 0xFA, 0xEB, 0xF0, 0xA8, 0xFA, 0xE9, 0xF0, 0xAE, 0xFA, 0xE7, 0xF0, 0xB4, 0xFA
	.byte 0xE5, 0xF0, 0xBA, 0xFA, 0xE3, 0xF0, 0xC0, 0xFA, 0xE1, 0xF0, 0xC6, 0xFA, 0xDF, 0xF0, 0xCC, 0xFA
	.byte 0xDD, 0xF0, 0xD1, 0xFA, 0xDB, 0xF0, 0xD7, 0xFA, 0xD9, 0xF0, 0xDD, 0xFA, 0xD7, 0xF0, 0xE3, 0xFA
	.byte 0xD5, 0xF0, 0xE9, 0xFA, 0xD3, 0xF0, 0xEF, 0xFA, 0xD1, 0xF0, 0xF5, 0xFA, 0xCF, 0xF0, 0xFB, 0xFA
	.byte 0xCD, 0xF0, 0x01, 0xFB, 0xCB, 0xF0, 0x07, 0xFB, 0xC9, 0xF0, 0x0D, 0xFB, 0xC7, 0xF0, 0x13, 0xFB
	.byte 0xC5, 0xF0, 0x19, 0xFB, 0xC3, 0xF0, 0x1F, 0xFB, 0xC1, 0xF0, 0x25, 0xFB, 0xBF, 0xF0, 0x2B, 0xFB
	.byte 0xBD, 0xF0, 0x31, 0xFB, 0xBB, 0xF0, 0x37, 0xFB, 0xBA, 0xF0, 0x3D, 0xFB, 0xB8, 0xF0, 0x43, 0xFB
	.byte 0xB6, 0xF0, 0x49, 0xFB, 0xB4, 0xF0, 0x4F, 0xFB, 0xB2, 0xF0, 0x55, 0xFB, 0xB0, 0xF0, 0x5B, 0xFB
	.byte 0xAF, 0xF0, 0x61, 0xFB, 0xAD, 0xF0, 0x67, 0xFB, 0xAB, 0xF0, 0x6D, 0xFB, 0xA9, 0xF0, 0x73, 0xFB
	.byte 0xA7, 0xF0, 0x79, 0xFB, 0xA6, 0xF0, 0x7F, 0xFB, 0xA4, 0xF0, 0x85, 0xFB, 0xA2, 0xF0, 0x8B, 0xFB
	.byte 0xA0, 0xF0, 0x91, 0xFB, 0x9F, 0xF0, 0x97, 0xFB, 0x9D, 0xF0, 0x9D, 0xFB, 0x9B, 0xF0, 0xA3, 0xFB
	.byte 0x99, 0xF0, 0xA9, 0xFB, 0x98, 0xF0, 0xAF, 0xFB, 0x96, 0xF0, 0xB5, 0xFB, 0x94, 0xF0, 0xBC, 0xFB
	.byte 0x93, 0xF0, 0xC2, 0xFB, 0x91, 0xF0, 0xC8, 0xFB, 0x8F, 0xF0, 0xCE, 0xFB, 0x8E, 0xF0, 0xD4, 0xFB
	.byte 0x8C, 0xF0, 0xDA, 0xFB, 0x8A, 0xF0, 0xE0, 0xFB, 0x89, 0xF0, 0xE6, 0xFB, 0x87, 0xF0, 0xEC, 0xFB
	.byte 0x86, 0xF0, 0xF2, 0xFB, 0x84, 0xF0, 0xF8, 0xFB, 0x83, 0xF0, 0xFE, 0xFB, 0x81, 0xF0, 0x04, 0xFC
	.byte 0x7F, 0xF0, 0x0A, 0xFC, 0x7E, 0xF0, 0x11, 0xFC, 0x7C, 0xF0, 0x17, 0xFC, 0x7B, 0xF0, 0x1D, 0xFC
	.byte 0x79, 0xF0, 0x23, 0xFC, 0x78, 0xF0, 0x29, 0xFC, 0x76, 0xF0, 0x2F, 0xFC, 0x75, 0xF0, 0x35, 0xFC
	.byte 0x73, 0xF0, 0x3B, 0xFC, 0x72, 0xF0, 0x41, 0xFC, 0x70, 0xF0, 0x47, 0xFC, 0x6F, 0xF0, 0x4E, 0xFC
	.byte 0x6D, 0xF0, 0x54, 0xFC, 0x6C, 0xF0, 0x5A, 0xFC, 0x6B, 0xF0, 0x60, 0xFC, 0x69, 0xF0, 0x66, 0xFC
	.byte 0x68, 0xF0, 0x6C, 0xFC, 0x66, 0xF0, 0x72, 0xFC, 0x65, 0xF0, 0x78, 0xFC, 0x64, 0xF0, 0x7F, 0xFC
	.byte 0x62, 0xF0, 0x85, 0xFC, 0x61, 0xF0, 0x8B, 0xFC, 0x5F, 0xF0, 0x91, 0xFC, 0x5E, 0xF0, 0x97, 0xFC
	.byte 0x5D, 0xF0, 0x9D, 0xFC, 0x5B, 0xF0, 0xA3, 0xFC, 0x5A, 0xF0, 0xAA, 0xFC, 0x59, 0xF0, 0xB0, 0xFC
	.byte 0x58, 0xF0, 0xB6, 0xFC, 0x56, 0xF0, 0xBC, 0xFC, 0x55, 0xF0, 0xC2, 0xFC, 0x54, 0xF0, 0xC8, 0xFC
	.byte 0x52, 0xF0, 0xCE, 0xFC, 0x51, 0xF0, 0xD5, 0xFC, 0x50, 0xF0, 0xDB, 0xFC, 0x4F, 0xF0, 0xE1, 0xFC
	.byte 0x4D, 0xF0, 0xE7, 0xFC, 0x4C, 0xF0, 0xED, 0xFC, 0x4B, 0xF0, 0xF3, 0xFC, 0x4A, 0xF0, 0xFA, 0xFC
	.byte 0x49, 0xF0, 0x00, 0xFD, 0x48, 0xF0, 0x06, 0xFD, 0x46, 0xF0, 0x0C, 0xFD, 0x45, 0xF0, 0x12, 0xFD
	.byte 0x44, 0xF0, 0x18, 0xFD, 0x43, 0xF0, 0x1F, 0xFD, 0x42, 0xF0, 0x25, 0xFD, 0x41, 0xF0, 0x2B, 0xFD
	.byte 0x40, 0xF0, 0x31, 0xFD, 0x3E, 0xF0, 0x37, 0xFD, 0x3D, 0xF0, 0x3E, 0xFD, 0x3C, 0xF0, 0x44, 0xFD
	.byte 0x3B, 0xF0, 0x4A, 0xFD, 0x3A, 0xF0, 0x50, 0xFD, 0x39, 0xF0, 0x56, 0xFD, 0x38, 0xF0, 0x5D, 0xFD
	.byte 0x37, 0xF0, 0x63, 0xFD, 0x36, 0xF0, 0x69, 0xFD, 0x35, 0xF0, 0x6F, 0xFD, 0x34, 0xF0, 0x75, 0xFD
	.byte 0x33, 0xF0, 0x7C, 0xFD, 0x32, 0xF0, 0x82, 0xFD, 0x31, 0xF0, 0x88, 0xFD, 0x30, 0xF0, 0x8E, 0xFD
	.byte 0x2F, 0xF0, 0x94, 0xFD, 0x2E, 0xF0, 0x9B, 0xFD, 0x2D, 0xF0, 0xA1, 0xFD, 0x2C, 0xF0, 0xA7, 0xFD
	.byte 0x2B, 0xF0, 0xAD, 0xFD, 0x2B, 0xF0, 0xB3, 0xFD, 0x2A, 0xF0, 0xBA, 0xFD, 0x29, 0xF0, 0xC0, 0xFD
	.byte 0x28, 0xF0, 0xC6, 0xFD, 0x27, 0xF0, 0xCC, 0xFD, 0x26, 0xF0, 0xD3, 0xFD, 0x25, 0xF0, 0xD9, 0xFD
	.byte 0x24, 0xF0, 0xDF, 0xFD, 0x24, 0xF0, 0xE5, 0xFD, 0x23, 0xF0, 0xEB, 0xFD, 0x22, 0xF0, 0xF2, 0xFD
	.byte 0x21, 0xF0, 0xF8, 0xFD, 0x20, 0xF0, 0xFE, 0xFD, 0x20, 0xF0, 0x04, 0xFE, 0x1F, 0xF0, 0x0B, 0xFE
	.byte 0x1E, 0xF0, 0x11, 0xFE, 0x1D, 0xF0, 0x17, 0xFE, 0x1D, 0xF0, 0x1D, 0xFE, 0x1C, 0xF0, 0x24, 0xFE
	.byte 0x1B, 0xF0, 0x2A, 0xFE, 0x1A, 0xF0, 0x30, 0xFE, 0x1A, 0xF0, 0x36, 0xFE, 0x19, 0xF0, 0x3D, 0xFE
	.byte 0x18, 0xF0, 0x43, 0xFE, 0x18, 0xF0, 0x49, 0xFE, 0x17, 0xF0, 0x4F, 0xFE, 0x16, 0xF0, 0x56, 0xFE
	.byte 0x16, 0xF0, 0x5C, 0xFE, 0x15, 0xF0, 0x62, 0xFE, 0x14, 0xF0, 0x68, 0xFE, 0x14, 0xF0, 0x6F, 0xFE
	.byte 0x13, 0xF0, 0x75, 0xFE, 0x13, 0xF0, 0x7B, 0xFE, 0x12, 0xF0, 0x81, 0xFE, 0x11, 0xF0, 0x88, 0xFE
	.byte 0x11, 0xF0, 0x8E, 0xFE, 0x10, 0xF0, 0x94, 0xFE, 0x10, 0xF0, 0x9A, 0xFE, 0x0F, 0xF0, 0xA1, 0xFE
	.byte 0x0F, 0xF0, 0xA7, 0xFE, 0x0E, 0xF0, 0xAD, 0xFE, 0x0E, 0xF0, 0xB3, 0xFE, 0x0D, 0xF0, 0xBA, 0xFE
	.byte 0x0D, 0xF0, 0xC0, 0xFE, 0x0C, 0xF0, 0xC6, 0xFE, 0x0C, 0xF0, 0xCC, 0xFE, 0x0B, 0xF0, 0xD3, 0xFE
	.byte 0x0B, 0xF0, 0xD9, 0xFE, 0x0A, 0xF0, 0xDF, 0xFE, 0x0A, 0xF0, 0xE5, 0xFE, 0x09, 0xF0, 0xEC, 0xFE
	.byte 0x09, 0xF0, 0xF2, 0xFE, 0x08, 0xF0, 0xF8, 0xFE, 0x08, 0xF0, 0xFF, 0xFE, 0x08, 0xF0, 0x05, 0xFF
	.byte 0x07, 0xF0, 0x0B, 0xFF, 0x07, 0xF0, 0x11, 0xFF, 0x07, 0xF0, 0x18, 0xFF, 0x06, 0xF0, 0x1E, 0xFF
	.byte 0x06, 0xF0, 0x24, 0xFF, 0x06, 0xF0, 0x2A, 0xFF, 0x05, 0xF0, 0x31, 0xFF, 0x05, 0xF0, 0x37, 0xFF
	.byte 0x05, 0xF0, 0x3D, 0xFF, 0x04, 0xF0, 0x44, 0xFF, 0x04, 0xF0, 0x4A, 0xFF, 0x04, 0xF0, 0x50, 0xFF
	.byte 0x04, 0xF0, 0x56, 0xFF, 0x03, 0xF0, 0x5D, 0xFF, 0x03, 0xF0, 0x63, 0xFF, 0x03, 0xF0, 0x69, 0xFF
	.byte 0x03, 0xF0, 0x70, 0xFF, 0x02, 0xF0, 0x76, 0xFF, 0x02, 0xF0, 0x7C, 0xFF, 0x02, 0xF0, 0x82, 0xFF
	.byte 0x02, 0xF0, 0x89, 0xFF, 0x02, 0xF0, 0x8F, 0xFF, 0x01, 0xF0, 0x95, 0xFF, 0x01, 0xF0, 0x9B, 0xFF
	.byte 0x01, 0xF0, 0xA2, 0xFF, 0x01, 0xF0, 0xA8, 0xFF, 0x01, 0xF0, 0xAE, 0xFF, 0x01, 0xF0, 0xB5, 0xFF
	.byte 0x01, 0xF0, 0xBB, 0xFF, 0x00, 0xF0, 0xC1, 0xFF, 0x00, 0xF0, 0xC7, 0xFF, 0x00, 0xF0, 0xCE, 0xFF
	.byte 0x00, 0xF0, 0xD4, 0xFF, 0x00, 0xF0, 0xDA, 0xFF, 0x00, 0xF0, 0xE1, 0xFF, 0x00, 0xF0, 0xE7, 0xFF
	.byte 0x00, 0xF0, 0xED, 0xFF, 0x00, 0xF0, 0xF3, 0xFF, 0x00, 0xF0, 0xFA, 0xFF, 0x00, 0xF0, 0x00, 0x00
	.byte 0x00, 0xF0, 0x06, 0x00, 0x00, 0xF0, 0x0D, 0x00, 0x00, 0xF0, 0x13, 0x00, 0x00, 0xF0, 0x19, 0x00
	.byte 0x00, 0xF0, 0x1F, 0x00, 0x00, 0xF0, 0x26, 0x00, 0x00, 0xF0, 0x2C, 0x00, 0x00, 0xF0, 0x32, 0x00
	.byte 0x00, 0xF0, 0x39, 0x00, 0x00, 0xF0, 0x3F, 0x00, 0x01, 0xF0, 0x45, 0x00, 0x01, 0xF0, 0x4B, 0x00
	.byte 0x01, 0xF0, 0x52, 0x00, 0x01, 0xF0, 0x58, 0x00, 0x01, 0xF0, 0x5E, 0x00, 0x01, 0xF0, 0x65, 0x00
	.byte 0x01, 0xF0, 0x6B, 0x00, 0x02, 0xF0, 0x71, 0x00, 0x02, 0xF0, 0x77, 0x00, 0x02, 0xF0, 0x7E, 0x00
	.byte 0x02, 0xF0, 0x84, 0x00, 0x02, 0xF0, 0x8A, 0x00, 0x03, 0xF0, 0x90, 0x00, 0x03, 0xF0, 0x97, 0x00
	.byte 0x03, 0xF0, 0x9D, 0x00, 0x03, 0xF0, 0xA3, 0x00, 0x04, 0xF0, 0xAA, 0x00, 0x04, 0xF0, 0xB0, 0x00
	.byte 0x04, 0xF0, 0xB6, 0x00, 0x04, 0xF0, 0xBC, 0x00, 0x05, 0xF0, 0xC3, 0x00, 0x05, 0xF0, 0xC9, 0x00
	.byte 0x05, 0xF0, 0xCF, 0x00, 0x06, 0xF0, 0xD6, 0x00, 0x06, 0xF0, 0xDC, 0x00, 0x06, 0xF0, 0xE2, 0x00
	.byte 0x07, 0xF0, 0xE8, 0x00, 0x07, 0xF0, 0xEF, 0x00, 0x07, 0xF0, 0xF5, 0x00, 0x08, 0xF0, 0xFB, 0x00
	.byte 0x08, 0xF0, 0x01, 0x01, 0x08, 0xF0, 0x08, 0x01, 0x09, 0xF0, 0x0E, 0x01, 0x09, 0xF0, 0x14, 0x01
	.byte 0x0A, 0xF0, 0x1B, 0x01, 0x0A, 0xF0, 0x21, 0x01, 0x0B, 0xF0, 0x27, 0x01, 0x0B, 0xF0, 0x2D, 0x01
	.byte 0x0C, 0xF0, 0x34, 0x01, 0x0C, 0xF0, 0x3A, 0x01, 0x0D, 0xF0, 0x40, 0x01, 0x0D, 0xF0, 0x46, 0x01
	.byte 0x0E, 0xF0, 0x4D, 0x01, 0x0E, 0xF0, 0x53, 0x01, 0x0F, 0xF0, 0x59, 0x01, 0x0F, 0xF0, 0x5F, 0x01
	.byte 0x10, 0xF0, 0x66, 0x01, 0x10, 0xF0, 0x6C, 0x01, 0x11, 0xF0, 0x72, 0x01, 0x11, 0xF0, 0x78, 0x01
	.byte 0x12, 0xF0, 0x7F, 0x01, 0x13, 0xF0, 0x85, 0x01, 0x13, 0xF0, 0x8B, 0x01, 0x14, 0xF0, 0x91, 0x01
	.byte 0x14, 0xF0, 0x98, 0x01, 0x15, 0xF0, 0x9E, 0x01, 0x16, 0xF0, 0xA4, 0x01, 0x16, 0xF0, 0xAA, 0x01
	.byte 0x17, 0xF0, 0xB1, 0x01, 0x18, 0xF0, 0xB7, 0x01, 0x18, 0xF0, 0xBD, 0x01, 0x19, 0xF0, 0xC3, 0x01
	.byte 0x1A, 0xF0, 0xCA, 0x01, 0x1A, 0xF0, 0xD0, 0x01, 0x1B, 0xF0, 0xD6, 0x01, 0x1C, 0xF0, 0xDC, 0x01
	.byte 0x1D, 0xF0, 0xE3, 0x01, 0x1D, 0xF0, 0xE9, 0x01, 0x1E, 0xF0, 0xEF, 0x01, 0x1F, 0xF0, 0xF5, 0x01
	.byte 0x20, 0xF0, 0xFC, 0x01, 0x20, 0xF0, 0x02, 0x02, 0x21, 0xF0, 0x08, 0x02, 0x22, 0xF0, 0x0E, 0x02
	.byte 0x23, 0xF0, 0x15, 0x02, 0x24, 0xF0, 0x1B, 0x02, 0x24, 0xF0, 0x21, 0x02, 0x25, 0xF0, 0x27, 0x02
	.byte 0x26, 0xF0, 0x2D, 0x02, 0x27, 0xF0, 0x34, 0x02, 0x28, 0xF0, 0x3A, 0x02, 0x29, 0xF0, 0x40, 0x02
	.byte 0x2A, 0xF0, 0x46, 0x02, 0x2B, 0xF0, 0x4D, 0x02, 0x2B, 0xF0, 0x53, 0x02, 0x2C, 0xF0, 0x59, 0x02
	.byte 0x2D, 0xF0, 0x5F, 0x02, 0x2E, 0xF0, 0x65, 0x02, 0x2F, 0xF0, 0x6C, 0x02, 0x30, 0xF0, 0x72, 0x02
	.byte 0x31, 0xF0, 0x78, 0x02, 0x32, 0xF0, 0x7E, 0x02, 0x33, 0xF0, 0x84, 0x02, 0x34, 0xF0, 0x8B, 0x02
	.byte 0x35, 0xF0, 0x91, 0x02, 0x36, 0xF0, 0x97, 0x02, 0x37, 0xF0, 0x9D, 0x02, 0x38, 0xF0, 0xA3, 0x02
	.byte 0x39, 0xF0, 0xAA, 0x02, 0x3A, 0xF0, 0xB0, 0x02, 0x3B, 0xF0, 0xB6, 0x02, 0x3C, 0xF0, 0xBC, 0x02
	.byte 0x3D, 0xF0, 0xC2, 0x02, 0x3E, 0xF0, 0xC9, 0x02, 0x40, 0xF0, 0xCF, 0x02, 0x41, 0xF0, 0xD5, 0x02
	.byte 0x42, 0xF0, 0xDB, 0x02, 0x43, 0xF0, 0xE1, 0x02, 0x44, 0xF0, 0xE8, 0x02, 0x45, 0xF0, 0xEE, 0x02
	.byte 0x46, 0xF0, 0xF4, 0x02, 0x48, 0xF0, 0xFA, 0x02, 0x49, 0xF0, 0x00, 0x03, 0x4A, 0xF0, 0x06, 0x03
	.byte 0x4B, 0xF0, 0x0D, 0x03, 0x4C, 0xF0, 0x13, 0x03, 0x4D, 0xF0, 0x19, 0x03, 0x4F, 0xF0, 0x1F, 0x03
	.byte 0x50, 0xF0, 0x25, 0x03, 0x51, 0xF0, 0x2B, 0x03, 0x52, 0xF0, 0x32, 0x03, 0x54, 0xF0, 0x38, 0x03
	.byte 0x55, 0xF0, 0x3E, 0x03, 0x56, 0xF0, 0x44, 0x03, 0x58, 0xF0, 0x4A, 0x03, 0x59, 0xF0, 0x50, 0x03
	.byte 0x5A, 0xF0, 0x56, 0x03, 0x5B, 0xF0, 0x5D, 0x03, 0x5D, 0xF0, 0x63, 0x03, 0x5E, 0xF0, 0x69, 0x03
	.byte 0x5F, 0xF0, 0x6F, 0x03, 0x61, 0xF0, 0x75, 0x03, 0x62, 0xF0, 0x7B, 0x03, 0x64, 0xF0, 0x81, 0x03
	.byte 0x65, 0xF0, 0x88, 0x03, 0x66, 0xF0, 0x8E, 0x03, 0x68, 0xF0, 0x94, 0x03, 0x69, 0xF0, 0x9A, 0x03
	.byte 0x6B, 0xF0, 0xA0, 0x03, 0x6C, 0xF0, 0xA6, 0x03, 0x6D, 0xF0, 0xAC, 0x03, 0x6F, 0xF0, 0xB2, 0x03
	.byte 0x70, 0xF0, 0xB9, 0x03, 0x72, 0xF0, 0xBF, 0x03, 0x73, 0xF0, 0xC5, 0x03, 0x75, 0xF0, 0xCB, 0x03
	.byte 0x76, 0xF0, 0xD1, 0x03, 0x78, 0xF0, 0xD7, 0x03, 0x79, 0xF0, 0xDD, 0x03, 0x7B, 0xF0, 0xE3, 0x03
	.byte 0x7C, 0xF0, 0xE9, 0x03, 0x7E, 0xF0, 0xEF, 0x03, 0x7F, 0xF0, 0xF6, 0x03, 0x81, 0xF0, 0xFC, 0x03
	.byte 0x83, 0xF0, 0x02, 0x04, 0x84, 0xF0, 0x08, 0x04, 0x86, 0xF0, 0x0E, 0x04, 0x87, 0xF0, 0x14, 0x04
	.byte 0x89, 0xF0, 0x1A, 0x04, 0x8A, 0xF0, 0x20, 0x04, 0x8C, 0xF0, 0x26, 0x04, 0x8E, 0xF0, 0x2C, 0x04
	.byte 0x8F, 0xF0, 0x32, 0x04, 0x91, 0xF0, 0x38, 0x04, 0x93, 0xF0, 0x3E, 0x04, 0x94, 0xF0, 0x44, 0x04
	.byte 0x96, 0xF0, 0x4B, 0x04, 0x98, 0xF0, 0x51, 0x04, 0x99, 0xF0, 0x57, 0x04, 0x9B, 0xF0, 0x5D, 0x04
	.byte 0x9D, 0xF0, 0x63, 0x04, 0x9F, 0xF0, 0x69, 0x04, 0xA0, 0xF0, 0x6F, 0x04, 0xA2, 0xF0, 0x75, 0x04
	.byte 0xA4, 0xF0, 0x7B, 0x04, 0xA6, 0xF0, 0x81, 0x04, 0xA7, 0xF0, 0x87, 0x04, 0xA9, 0xF0, 0x8D, 0x04
	.byte 0xAB, 0xF0, 0x93, 0x04, 0xAD, 0xF0, 0x99, 0x04, 0xAF, 0xF0, 0x9F, 0x04, 0xB0, 0xF0, 0xA5, 0x04
	.byte 0xB2, 0xF0, 0xAB, 0x04, 0xB4, 0xF0, 0xB1, 0x04, 0xB6, 0xF0, 0xB7, 0x04, 0xB8, 0xF0, 0xBD, 0x04
	.byte 0xBA, 0xF0, 0xC3, 0x04, 0xBB, 0xF0, 0xC9, 0x04, 0xBD, 0xF0, 0xCF, 0x04, 0xBF, 0xF0, 0xD5, 0x04
	.byte 0xC1, 0xF0, 0xDB, 0x04, 0xC3, 0xF0, 0xE1, 0x04, 0xC5, 0xF0, 0xE7, 0x04, 0xC7, 0xF0, 0xED, 0x04
	.byte 0xC9, 0xF0, 0xF3, 0x04, 0xCB, 0xF0, 0xF9, 0x04, 0xCD, 0xF0, 0xFF, 0x04, 0xCF, 0xF0, 0x05, 0x05
	.byte 0xD1, 0xF0, 0x0B, 0x05, 0xD3, 0xF0, 0x11, 0x05, 0xD5, 0xF0, 0x17, 0x05, 0xD7, 0xF0, 0x1D, 0x05
	.byte 0xD9, 0xF0, 0x23, 0x05, 0xDB, 0xF0, 0x29, 0x05, 0xDD, 0xF0, 0x2F, 0x05, 0xDF, 0xF0, 0x34, 0x05
	.byte 0xE1, 0xF0, 0x3A, 0x05, 0xE3, 0xF0, 0x40, 0x05, 0xE5, 0xF0, 0x46, 0x05, 0xE7, 0xF0, 0x4C, 0x05
	.byte 0xE9, 0xF0, 0x52, 0x05, 0xEB, 0xF0, 0x58, 0x05, 0xED, 0xF0, 0x5E, 0x05, 0xEF, 0xF0, 0x64, 0x05
	.byte 0xF2, 0xF0, 0x6A, 0x05, 0xF4, 0xF0, 0x70, 0x05, 0xF6, 0xF0, 0x76, 0x05, 0xF8, 0xF0, 0x7C, 0x05
	.byte 0xFA, 0xF0, 0x81, 0x05, 0xFC, 0xF0, 0x87, 0x05, 0xFE, 0xF0, 0x8D, 0x05, 0x01, 0xF1, 0x93, 0x05
	.byte 0x03, 0xF1, 0x99, 0x05, 0x05, 0xF1, 0x9F, 0x05, 0x07, 0xF1, 0xA5, 0x05, 0x09, 0xF1, 0xAB, 0x05
	.byte 0x0C, 0xF1, 0xB1, 0x05, 0x0E, 0xF1, 0xB6, 0x05, 0x10, 0xF1, 0xBC, 0x05, 0x12, 0xF1, 0xC2, 0x05
	.byte 0x15, 0xF1, 0xC8, 0x05, 0x17, 0xF1, 0xCE, 0x05, 0x19, 0xF1, 0xD4, 0x05, 0x1C, 0xF1, 0xDA, 0x05
	.byte 0x1E, 0xF1, 0xDF, 0x05, 0x20, 0xF1, 0xE5, 0x05, 0x23, 0xF1, 0xEB, 0x05, 0x25, 0xF1, 0xF1, 0x05
	.byte 0x27, 0xF1, 0xF7, 0x05, 0x2A, 0xF1, 0xFD, 0x05, 0x2C, 0xF1, 0x02, 0x06, 0x2E, 0xF1, 0x08, 0x06
	.byte 0x31, 0xF1, 0x0E, 0x06, 0x33, 0xF1, 0x14, 0x06, 0x35, 0xF1, 0x1A, 0x06, 0x38, 0xF1, 0x1F, 0x06
	.byte 0x3A, 0xF1, 0x25, 0x06, 0x3D, 0xF1, 0x2B, 0x06, 0x3F, 0xF1, 0x31, 0x06, 0x41, 0xF1, 0x37, 0x06
	.byte 0x44, 0xF1, 0x3C, 0x06, 0x46, 0xF1, 0x42, 0x06, 0x49, 0xF1, 0x48, 0x06, 0x4B, 0xF1, 0x4E, 0x06
	.byte 0x4E, 0xF1, 0x54, 0x06, 0x50, 0xF1, 0x59, 0x06, 0x53, 0xF1, 0x5F, 0x06, 0x55, 0xF1, 0x65, 0x06
	.byte 0x58, 0xF1, 0x6B, 0x06, 0x5A, 0xF1, 0x70, 0x06, 0x5D, 0xF1, 0x76, 0x06, 0x5F, 0xF1, 0x7C, 0x06
	.byte 0x62, 0xF1, 0x82, 0x06, 0x65, 0xF1, 0x87, 0x06, 0x67, 0xF1, 0x8D, 0x06, 0x6A, 0xF1, 0x93, 0x06
	.byte 0x6C, 0xF1, 0x99, 0x06, 0x6F, 0xF1, 0x9E, 0x06, 0x71, 0xF1, 0xA4, 0x06, 0x74, 0xF1, 0xAA, 0x06
	.byte 0x77, 0xF1, 0xAF, 0x06, 0x79, 0xF1, 0xB5, 0x06, 0x7C, 0xF1, 0xBB, 0x06, 0x7F, 0xF1, 0xC1, 0x06
	.byte 0x81, 0xF1, 0xC6, 0x06, 0x84, 0xF1, 0xCC, 0x06, 0x87, 0xF1, 0xD2, 0x06, 0x89, 0xF1, 0xD7, 0x06
	.byte 0x8C, 0xF1, 0xDD, 0x06, 0x8F, 0xF1, 0xE3, 0x06, 0x91, 0xF1, 0xE8, 0x06, 0x94, 0xF1, 0xEE, 0x06
	.byte 0x97, 0xF1, 0xF4, 0x06, 0x9A, 0xF1, 0xF9, 0x06, 0x9C, 0xF1, 0xFF, 0x06, 0x9F, 0xF1, 0x05, 0x07
	.byte 0xA2, 0xF1, 0x0A, 0x07, 0xA5, 0xF1, 0x10, 0x07, 0xA7, 0xF1, 0x15, 0x07, 0xAA, 0xF1, 0x1B, 0x07
	.byte 0xAD, 0xF1, 0x21, 0x07, 0xB0, 0xF1, 0x26, 0x07, 0xB3, 0xF1, 0x2C, 0x07, 0xB5, 0xF1, 0x32, 0x07
	.byte 0xB8, 0xF1, 0x37, 0x07, 0xBB, 0xF1, 0x3D, 0x07, 0xBE, 0xF1, 0x42, 0x07, 0xC1, 0xF1, 0x48, 0x07
	.byte 0xC4, 0xF1, 0x4E, 0x07, 0xC6, 0xF1, 0x53, 0x07, 0xC9, 0xF1, 0x59, 0x07, 0xCC, 0xF1, 0x5E, 0x07
	.byte 0xCF, 0xF1, 0x64, 0x07, 0xD2, 0xF1, 0x6A, 0x07, 0xD5, 0xF1, 0x6F, 0x07, 0xD8, 0xF1, 0x75, 0x07
	.byte 0xDB, 0xF1, 0x7A, 0x07, 0xDE, 0xF1, 0x80, 0x07, 0xE1, 0xF1, 0x85, 0x07, 0xE4, 0xF1, 0x8B, 0x07
	.byte 0xE7, 0xF1, 0x90, 0x07, 0xEA, 0xF1, 0x96, 0x07, 0xED, 0xF1, 0x9B, 0x07, 0xF0, 0xF1, 0xA1, 0x07
	.byte 0xF3, 0xF1, 0xA6, 0x07, 0xF6, 0xF1, 0xAC, 0x07, 0xF9, 0xF1, 0xB2, 0x07, 0xFC, 0xF1, 0xB7, 0x07
	.byte 0xFF, 0xF1, 0xBD, 0x07, 0x02, 0xF2, 0xC2, 0x07, 0x05, 0xF2, 0xC8, 0x07, 0x08, 0xF2, 0xCD, 0x07
	.byte 0x0B, 0xF2, 0xD2, 0x07, 0x0E, 0xF2, 0xD8, 0x07, 0x11, 0xF2, 0xDD, 0x07, 0x14, 0xF2, 0xE3, 0x07
	.byte 0x17, 0xF2, 0xE8, 0x07, 0x1A, 0xF2, 0xEE, 0x07, 0x1D, 0xF2, 0xF3, 0x07, 0x21, 0xF2, 0xF9, 0x07
	.byte 0x24, 0xF2, 0xFE, 0x07, 0x27, 0xF2, 0x04, 0x08, 0x2A, 0xF2, 0x09, 0x08, 0x2D, 0xF2, 0x0E, 0x08
	.byte 0x30, 0xF2, 0x14, 0x08, 0x34, 0xF2, 0x19, 0x08, 0x37, 0xF2, 0x1F, 0x08, 0x3A, 0xF2, 0x24, 0x08
	.byte 0x3D, 0xF2, 0x2A, 0x08, 0x40, 0xF2, 0x2F, 0x08, 0x44, 0xF2, 0x34, 0x08, 0x47, 0xF2, 0x3A, 0x08
	.byte 0x4A, 0xF2, 0x3F, 0x08, 0x4D, 0xF2, 0x45, 0x08, 0x50, 0xF2, 0x4A, 0x08, 0x54, 0xF2, 0x4F, 0x08
	.byte 0x57, 0xF2, 0x55, 0x08, 0x5A, 0xF2, 0x5A, 0x08, 0x5E, 0xF2, 0x5F, 0x08, 0x61, 0xF2, 0x65, 0x08
	.byte 0x64, 0xF2, 0x6A, 0x08, 0x67, 0xF2, 0x6F, 0x08, 0x6B, 0xF2, 0x75, 0x08, 0x6E, 0xF2, 0x7A, 0x08
	.byte 0x71, 0xF2, 0x7F, 0x08, 0x75, 0xF2, 0x85, 0x08, 0x78, 0xF2, 0x8A, 0x08, 0x7B, 0xF2, 0x8F, 0x08
	.byte 0x7F, 0xF2, 0x95, 0x08, 0x82, 0xF2, 0x9A, 0x08, 0x86, 0xF2, 0x9F, 0x08, 0x89, 0xF2, 0xA5, 0x08
	.byte 0x8C, 0xF2, 0xAA, 0x08, 0x90, 0xF2, 0xAF, 0x08, 0x93, 0xF2, 0xB4, 0x08, 0x97, 0xF2, 0xBA, 0x08
	.byte 0x9A, 0xF2, 0xBF, 0x08, 0x9E, 0xF2, 0xC4, 0x08, 0xA1, 0xF2, 0xC9, 0x08, 0xA4, 0xF2, 0xCF, 0x08
	.byte 0xA8, 0xF2, 0xD4, 0x08, 0xAB, 0xF2, 0xD9, 0x08, 0xAF, 0xF2, 0xDE, 0x08, 0xB2, 0xF2, 0xE4, 0x08
	.byte 0xB6, 0xF2, 0xE9, 0x08, 0xB9, 0xF2, 0xEE, 0x08, 0xBD, 0xF2, 0xF3, 0x08, 0xC0, 0xF2, 0xF8, 0x08
	.byte 0xC4, 0xF2, 0xFE, 0x08, 0xC7, 0xF2, 0x03, 0x09, 0xCB, 0xF2, 0x08, 0x09, 0xCE, 0xF2, 0x0D, 0x09
	.byte 0xD2, 0xF2, 0x12, 0x09, 0xD6, 0xF2, 0x18, 0x09, 0xD9, 0xF2, 0x1D, 0x09, 0xDD, 0xF2, 0x22, 0x09
	.byte 0xE0, 0xF2, 0x27, 0x09, 0xE4, 0xF2, 0x2C, 0x09, 0xE8, 0xF2, 0x31, 0x09, 0xEB, 0xF2, 0x37, 0x09
	.byte 0xEF, 0xF2, 0x3C, 0x09, 0xF2, 0xF2, 0x41, 0x09, 0xF6, 0xF2, 0x46, 0x09, 0xFA, 0xF2, 0x4B, 0x09
	.byte 0xFD, 0xF2, 0x50, 0x09, 0x01, 0xF3, 0x55, 0x09, 0x05, 0xF3, 0x5A, 0x09, 0x08, 0xF3, 0x5F, 0x09
	.byte 0x0C, 0xF3, 0x65, 0x09, 0x10, 0xF3, 0x6A, 0x09, 0x13, 0xF3, 0x6F, 0x09, 0x17, 0xF3, 0x74, 0x09
	.byte 0x1B, 0xF3, 0x79, 0x09, 0x1F, 0xF3, 0x7E, 0x09, 0x22, 0xF3, 0x83, 0x09, 0x26, 0xF3, 0x88, 0x09
	.byte 0x2A, 0xF3, 0x8D, 0x09, 0x2E, 0xF3, 0x92, 0x09, 0x31, 0xF3, 0x97, 0x09, 0x35, 0xF3, 0x9C, 0x09
	.byte 0x39, 0xF3, 0xA1, 0x09, 0x3D, 0xF3, 0xA6, 0x09, 0x40, 0xF3, 0xAB, 0x09, 0x44, 0xF3, 0xB0, 0x09
	.byte 0x48, 0xF3, 0xB5, 0x09, 0x4C, 0xF3, 0xBA, 0x09, 0x50, 0xF3, 0xBF, 0x09, 0x54, 0xF3, 0xC4, 0x09
	.byte 0x57, 0xF3, 0xC9, 0x09, 0x5B, 0xF3, 0xCE, 0x09, 0x5F, 0xF3, 0xD3, 0x09, 0x63, 0xF3, 0xD8, 0x09
	.byte 0x67, 0xF3, 0xDD, 0x09, 0x6B, 0xF3, 0xE2, 0x09, 0x6F, 0xF3, 0xE7, 0x09, 0x72, 0xF3, 0xEC, 0x09
	.byte 0x76, 0xF3, 0xF1, 0x09, 0x7A, 0xF3, 0xF6, 0x09, 0x7E, 0xF3, 0xFB, 0x09, 0x82, 0xF3, 0xFF, 0x09
	.byte 0x86, 0xF3, 0x04, 0x0A, 0x8A, 0xF3, 0x09, 0x0A, 0x8E, 0xF3, 0x0E, 0x0A, 0x92, 0xF3, 0x13, 0x0A
	.byte 0x96, 0xF3, 0x18, 0x0A, 0x9A, 0xF3, 0x1D, 0x0A, 0x9E, 0xF3, 0x22, 0x0A, 0xA2, 0xF3, 0x26, 0x0A
	.byte 0xA6, 0xF3, 0x2B, 0x0A, 0xAA, 0xF3, 0x30, 0x0A, 0xAE, 0xF3, 0x35, 0x0A, 0xB2, 0xF3, 0x3A, 0x0A
	.byte 0xB6, 0xF3, 0x3F, 0x0A, 0xBA, 0xF3, 0x44, 0x0A, 0xBE, 0xF3, 0x48, 0x0A, 0xC2, 0xF3, 0x4D, 0x0A
	.byte 0xC6, 0xF3, 0x52, 0x0A, 0xCA, 0xF3, 0x57, 0x0A, 0xCE, 0xF3, 0x5C, 0x0A, 0xD2, 0xF3, 0x60, 0x0A
	.byte 0xD6, 0xF3, 0x65, 0x0A, 0xDA, 0xF3, 0x6A, 0x0A, 0xDE, 0xF3, 0x6F, 0x0A, 0xE2, 0xF3, 0x73, 0x0A
	.byte 0xE7, 0xF3, 0x78, 0x0A, 0xEB, 0xF3, 0x7D, 0x0A, 0xEF, 0xF3, 0x82, 0x0A, 0xF3, 0xF3, 0x86, 0x0A
	.byte 0xF7, 0xF3, 0x8B, 0x0A, 0xFB, 0xF3, 0x90, 0x0A, 0xFF, 0xF3, 0x95, 0x0A, 0x04, 0xF4, 0x99, 0x0A
	.byte 0x08, 0xF4, 0x9E, 0x0A, 0x0C, 0xF4, 0xA3, 0x0A, 0x10, 0xF4, 0xA7, 0x0A, 0x14, 0xF4, 0xAC, 0x0A
	.byte 0x18, 0xF4, 0xB1, 0x0A, 0x1D, 0xF4, 0xB5, 0x0A, 0x21, 0xF4, 0xBA, 0x0A, 0x25, 0xF4, 0xBF, 0x0A
	.byte 0x29, 0xF4, 0xC3, 0x0A, 0x2E, 0xF4, 0xC8, 0x0A, 0x32, 0xF4, 0xCD, 0x0A, 0x36, 0xF4, 0xD1, 0x0A
	.byte 0x3A, 0xF4, 0xD6, 0x0A, 0x3F, 0xF4, 0xDB, 0x0A, 0x43, 0xF4, 0xDF, 0x0A, 0x47, 0xF4, 0xE4, 0x0A
	.byte 0x4B, 0xF4, 0xE8, 0x0A, 0x50, 0xF4, 0xED, 0x0A, 0x54, 0xF4, 0xF2, 0x0A, 0x58, 0xF4, 0xF6, 0x0A
	.byte 0x5D, 0xF4, 0xFB, 0x0A, 0x61, 0xF4, 0xFF, 0x0A, 0x65, 0xF4, 0x04, 0x0B, 0x69, 0xF4, 0x08, 0x0B
	.byte 0x6E, 0xF4, 0x0D, 0x0B, 0x72, 0xF4, 0x11, 0x0B, 0x77, 0xF4, 0x16, 0x0B, 0x7B, 0xF4, 0x1B, 0x0B
	.byte 0x7F, 0xF4, 0x1F, 0x0B, 0x84, 0xF4, 0x24, 0x0B, 0x88, 0xF4, 0x28, 0x0B, 0x8C, 0xF4, 0x2D, 0x0B
	.byte 0x91, 0xF4, 0x31, 0x0B, 0x95, 0xF4, 0x36, 0x0B, 0x9A, 0xF4, 0x3A, 0x0B, 0x9E, 0xF4, 0x3E, 0x0B
	.byte 0xA2, 0xF4, 0x43, 0x0B, 0xA7, 0xF4, 0x47, 0x0B, 0xAB, 0xF4, 0x4C, 0x0B, 0xB0, 0xF4, 0x50, 0x0B
	.byte 0xB4, 0xF4, 0x55, 0x0B, 0xB9, 0xF4, 0x59, 0x0B, 0xBD, 0xF4, 0x5E, 0x0B, 0xC2, 0xF4, 0x62, 0x0B
	.byte 0xC6, 0xF4, 0x66, 0x0B, 0xCA, 0xF4, 0x6B, 0x0B, 0xCF, 0xF4, 0x6F, 0x0B, 0xD3, 0xF4, 0x74, 0x0B
	.byte 0xD8, 0xF4, 0x78, 0x0B, 0xDC, 0xF4, 0x7C, 0x0B, 0xE1, 0xF4, 0x81, 0x0B, 0xE5, 0xF4, 0x85, 0x0B
	.byte 0xEA, 0xF4, 0x89, 0x0B, 0xEF, 0xF4, 0x8E, 0x0B, 0xF3, 0xF4, 0x92, 0x0B, 0xF8, 0xF4, 0x97, 0x0B
	.byte 0xFC, 0xF4, 0x9B, 0x0B, 0x01, 0xF5, 0x9F, 0x0B, 0x05, 0xF5, 0xA3, 0x0B, 0x0A, 0xF5, 0xA8, 0x0B
	.byte 0x0E, 0xF5, 0xAC, 0x0B, 0x13, 0xF5, 0xB0, 0x0B, 0x18, 0xF5, 0xB5, 0x0B, 0x1C, 0xF5, 0xB9, 0x0B
	.byte 0x21, 0xF5, 0xBD, 0x0B, 0x25, 0xF5, 0xC1, 0x0B, 0x2A, 0xF5, 0xC6, 0x0B, 0x2F, 0xF5, 0xCA, 0x0B
	.byte 0x33, 0xF5, 0xCE, 0x0B, 0x38, 0xF5, 0xD2, 0x0B, 0x3D, 0xF5, 0xD7, 0x0B, 0x41, 0xF5, 0xDB, 0x0B
	.byte 0x46, 0xF5, 0xDF, 0x0B, 0x4B, 0xF5, 0xE3, 0x0B, 0x4F, 0xF5, 0xE8, 0x0B, 0x54, 0xF5, 0xEC, 0x0B
	.byte 0x59, 0xF5, 0xF0, 0x0B, 0x5D, 0xF5, 0xF4, 0x0B, 0x62, 0xF5, 0xF8, 0x0B, 0x67, 0xF5, 0xFC, 0x0B
	.byte 0x6B, 0xF5, 0x01, 0x0C, 0x70, 0xF5, 0x05, 0x0C, 0x75, 0xF5, 0x09, 0x0C, 0x7A, 0xF5, 0x0D, 0x0C
	.byte 0x7E, 0xF5, 0x11, 0x0C, 0x83, 0xF5, 0x15, 0x0C, 0x88, 0xF5, 0x19, 0x0C, 0x8D, 0xF5, 0x1E, 0x0C
	.byte 0x91, 0xF5, 0x22, 0x0C, 0x96, 0xF5, 0x26, 0x0C, 0x9B, 0xF5, 0x2A, 0x0C, 0xA0, 0xF5, 0x2E, 0x0C
	.byte 0xA4, 0xF5, 0x32, 0x0C, 0xA9, 0xF5, 0x36, 0x0C, 0xAE, 0xF5, 0x3A, 0x0C, 0xB3, 0xF5, 0x3E, 0x0C
	.byte 0xB8, 0xF5, 0x42, 0x0C, 0xBC, 0xF5, 0x46, 0x0C, 0xC1, 0xF5, 0x4A, 0x0C, 0xC6, 0xF5, 0x4E, 0x0C
	.byte 0xCB, 0xF5, 0x52, 0x0C, 0xD0, 0xF5, 0x56, 0x0C, 0xD5, 0xF5, 0x5A, 0x0C, 0xDA, 0xF5, 0x5E, 0x0C
	.byte 0xDE, 0xF5, 0x62, 0x0C, 0xE3, 0xF5, 0x66, 0x0C, 0xE8, 0xF5, 0x6A, 0x0C, 0xED, 0xF5, 0x6E, 0x0C
	.byte 0xF2, 0xF5, 0x72, 0x0C, 0xF7, 0xF5, 0x76, 0x0C, 0xFC, 0xF5, 0x7A, 0x0C, 0x01, 0xF6, 0x7E, 0x0C
	.byte 0x05, 0xF6, 0x82, 0x0C, 0x0A, 0xF6, 0x86, 0x0C, 0x0F, 0xF6, 0x8A, 0x0C, 0x14, 0xF6, 0x8E, 0x0C
	.byte 0x19, 0xF6, 0x91, 0x0C, 0x1E, 0xF6, 0x95, 0x0C, 0x23, 0xF6, 0x99, 0x0C, 0x28, 0xF6, 0x9D, 0x0C
	.byte 0x2D, 0xF6, 0xA1, 0x0C, 0x32, 0xF6, 0xA5, 0x0C, 0x37, 0xF6, 0xA9, 0x0C, 0x3C, 0xF6, 0xAC, 0x0C
	.byte 0x41, 0xF6, 0xB0, 0x0C, 0x46, 0xF6, 0xB4, 0x0C, 0x4B, 0xF6, 0xB8, 0x0C, 0x50, 0xF6, 0xBC, 0x0C
	.byte 0x55, 0xF6, 0xC0, 0x0C, 0x5A, 0xF6, 0xC3, 0x0C, 0x5F, 0xF6, 0xC7, 0x0C, 0x64, 0xF6, 0xCB, 0x0C
	.byte 0x69, 0xF6, 0xCF, 0x0C, 0x6E, 0xF6, 0xD2, 0x0C, 0x73, 0xF6, 0xD6, 0x0C, 0x78, 0xF6, 0xDA, 0x0C
	.byte 0x7D, 0xF6, 0xDE, 0x0C, 0x82, 0xF6, 0xE1, 0x0C, 0x87, 0xF6, 0xE5, 0x0C, 0x8C, 0xF6, 0xE9, 0x0C
	.byte 0x91, 0xF6, 0xED, 0x0C, 0x96, 0xF6, 0xF0, 0x0C, 0x9B, 0xF6, 0xF4, 0x0C, 0xA1, 0xF6, 0xF8, 0x0C
	.byte 0xA6, 0xF6, 0xFB, 0x0C, 0xAB, 0xF6, 0xFF, 0x0C, 0xB0, 0xF6, 0x03, 0x0D, 0xB5, 0xF6, 0x06, 0x0D
	.byte 0xBA, 0xF6, 0x0A, 0x0D, 0xBF, 0xF6, 0x0E, 0x0D, 0xC4, 0xF6, 0x11, 0x0D, 0xC9, 0xF6, 0x15, 0x0D
	.byte 0xCF, 0xF6, 0x18, 0x0D, 0xD4, 0xF6, 0x1C, 0x0D, 0xD9, 0xF6, 0x20, 0x0D, 0xDE, 0xF6, 0x23, 0x0D
	.byte 0xE3, 0xF6, 0x27, 0x0D, 0xE8, 0xF6, 0x2A, 0x0D, 0xEE, 0xF6, 0x2E, 0x0D, 0xF3, 0xF6, 0x32, 0x0D
	.byte 0xF8, 0xF6, 0x35, 0x0D, 0xFD, 0xF6, 0x39, 0x0D, 0x02, 0xF7, 0x3C, 0x0D, 0x08, 0xF7, 0x40, 0x0D
	.byte 0x0D, 0xF7, 0x43, 0x0D, 0x12, 0xF7, 0x47, 0x0D, 0x17, 0xF7, 0x4A, 0x0D, 0x1C, 0xF7, 0x4E, 0x0D
	.byte 0x22, 0xF7, 0x51, 0x0D, 0x27, 0xF7, 0x55, 0x0D, 0x2C, 0xF7, 0x58, 0x0D, 0x31, 0xF7, 0x5C, 0x0D
	.byte 0x37, 0xF7, 0x5F, 0x0D, 0x3C, 0xF7, 0x62, 0x0D, 0x41, 0xF7, 0x66, 0x0D, 0x46, 0xF7, 0x69, 0x0D
	.byte 0x4C, 0xF7, 0x6D, 0x0D, 0x51, 0xF7, 0x70, 0x0D, 0x56, 0xF7, 0x74, 0x0D, 0x5B, 0xF7, 0x77, 0x0D
	.byte 0x61, 0xF7, 0x7A, 0x0D, 0x66, 0xF7, 0x7E, 0x0D, 0x6B, 0xF7, 0x81, 0x0D, 0x71, 0xF7, 0x85, 0x0D
	.byte 0x76, 0xF7, 0x88, 0x0D, 0x7B, 0xF7, 0x8B, 0x0D, 0x81, 0xF7, 0x8F, 0x0D, 0x86, 0xF7, 0x92, 0x0D
	.byte 0x8B, 0xF7, 0x95, 0x0D, 0x91, 0xF7, 0x99, 0x0D, 0x96, 0xF7, 0x9C, 0x0D, 0x9B, 0xF7, 0x9F, 0x0D
	.byte 0xA1, 0xF7, 0xA2, 0x0D, 0xA6, 0xF7, 0xA6, 0x0D, 0xAB, 0xF7, 0xA9, 0x0D, 0xB1, 0xF7, 0xAC, 0x0D
	.byte 0xB6, 0xF7, 0xB0, 0x0D, 0xBB, 0xF7, 0xB3, 0x0D, 0xC1, 0xF7, 0xB6, 0x0D, 0xC6, 0xF7, 0xB9, 0x0D
	.byte 0xCC, 0xF7, 0xBC, 0x0D, 0xD1, 0xF7, 0xC0, 0x0D, 0xD6, 0xF7, 0xC3, 0x0D, 0xDC, 0xF7, 0xC6, 0x0D
	.byte 0xE1, 0xF7, 0xC9, 0x0D, 0xE7, 0xF7, 0xCC, 0x0D, 0xEC, 0xF7, 0xD0, 0x0D, 0xF2, 0xF7, 0xD3, 0x0D
	.byte 0xF7, 0xF7, 0xD6, 0x0D, 0xFC, 0xF7, 0xD9, 0x0D, 0x02, 0xF8, 0xDC, 0x0D, 0x07, 0xF8, 0xDF, 0x0D
	.byte 0x0D, 0xF8, 0xE3, 0x0D, 0x12, 0xF8, 0xE6, 0x0D, 0x18, 0xF8, 0xE9, 0x0D, 0x1D, 0xF8, 0xEC, 0x0D
	.byte 0x23, 0xF8, 0xEF, 0x0D, 0x28, 0xF8, 0xF2, 0x0D, 0x2E, 0xF8, 0xF5, 0x0D, 0x33, 0xF8, 0xF8, 0x0D
	.byte 0x38, 0xF8, 0xFB, 0x0D, 0x3E, 0xF8, 0xFE, 0x0D, 0x43, 0xF8, 0x01, 0x0E, 0x49, 0xF8, 0x04, 0x0E
	.byte 0x4E, 0xF8, 0x07, 0x0E, 0x54, 0xF8, 0x0A, 0x0E, 0x5A, 0xF8, 0x0D, 0x0E, 0x5F, 0xF8, 0x10, 0x0E
	.byte 0x65, 0xF8, 0x13, 0x0E, 0x6A, 0xF8, 0x16, 0x0E, 0x70, 0xF8, 0x19, 0x0E, 0x75, 0xF8, 0x1C, 0x0E
	.byte 0x7B, 0xF8, 0x1F, 0x0E, 0x80, 0xF8, 0x22, 0x0E, 0x86, 0xF8, 0x25, 0x0E, 0x8B, 0xF8, 0x28, 0x0E
	.byte 0x91, 0xF8, 0x2B, 0x0E, 0x96, 0xF8, 0x2E, 0x0E, 0x9C, 0xF8, 0x31, 0x0E, 0xA2, 0xF8, 0x34, 0x0E
	.byte 0xA7, 0xF8, 0x37, 0x0E, 0xAD, 0xF8, 0x3A, 0x0E, 0xB2, 0xF8, 0x3C, 0x0E, 0xB8, 0xF8, 0x3F, 0x0E
	.byte 0xBE, 0xF8, 0x42, 0x0E, 0xC3, 0xF8, 0x45, 0x0E, 0xC9, 0xF8, 0x48, 0x0E, 0xCE, 0xF8, 0x4B, 0x0E
	.byte 0xD4, 0xF8, 0x4D, 0x0E, 0xDA, 0xF8, 0x50, 0x0E, 0xDF, 0xF8, 0x53, 0x0E, 0xE5, 0xF8, 0x56, 0x0E
	.byte 0xEB, 0xF8, 0x59, 0x0E, 0xF0, 0xF8, 0x5B, 0x0E, 0xF6, 0xF8, 0x5E, 0x0E, 0xFB, 0xF8, 0x61, 0x0E
	.byte 0x01, 0xF9, 0x64, 0x0E, 0x07, 0xF9, 0x66, 0x0E, 0x0C, 0xF9, 0x69, 0x0E, 0x12, 0xF9, 0x6C, 0x0E
	.byte 0x18, 0xF9, 0x6F, 0x0E, 0x1D, 0xF9, 0x71, 0x0E, 0x23, 0xF9, 0x74, 0x0E, 0x29, 0xF9, 0x77, 0x0E
	.byte 0x2E, 0xF9, 0x79, 0x0E, 0x34, 0xF9, 0x7C, 0x0E, 0x3A, 0xF9, 0x7F, 0x0E, 0x3F, 0xF9, 0x81, 0x0E
	.byte 0x45, 0xF9, 0x84, 0x0E, 0x4B, 0xF9, 0x87, 0x0E, 0x51, 0xF9, 0x89, 0x0E, 0x56, 0xF9, 0x8C, 0x0E
	.byte 0x5C, 0xF9, 0x8F, 0x0E, 0x62, 0xF9, 0x91, 0x0E, 0x67, 0xF9, 0x94, 0x0E, 0x6D, 0xF9, 0x96, 0x0E
	.byte 0x73, 0xF9, 0x99, 0x0E, 0x79, 0xF9, 0x9B, 0x0E, 0x7E, 0xF9, 0x9E, 0x0E, 0x84, 0xF9, 0xA1, 0x0E
	.byte 0x8A, 0xF9, 0xA3, 0x0E, 0x90, 0xF9, 0xA6, 0x0E, 0x95, 0xF9, 0xA8, 0x0E, 0x9B, 0xF9, 0xAB, 0x0E
	.byte 0xA1, 0xF9, 0xAD, 0x0E, 0xA7, 0xF9, 0xB0, 0x0E, 0xAC, 0xF9, 0xB2, 0x0E, 0xB2, 0xF9, 0xB5, 0x0E
	.byte 0xB8, 0xF9, 0xB7, 0x0E, 0xBE, 0xF9, 0xBA, 0x0E, 0xC4, 0xF9, 0xBC, 0x0E, 0xC9, 0xF9, 0xBF, 0x0E
	.byte 0xCF, 0xF9, 0xC1, 0x0E, 0xD5, 0xF9, 0xC3, 0x0E, 0xDB, 0xF9, 0xC6, 0x0E, 0xE1, 0xF9, 0xC8, 0x0E
	.byte 0xE6, 0xF9, 0xCB, 0x0E, 0xEC, 0xF9, 0xCD, 0x0E, 0xF2, 0xF9, 0xCF, 0x0E, 0xF8, 0xF9, 0xD2, 0x0E
	.byte 0xFE, 0xF9, 0xD4, 0x0E, 0x03, 0xFA, 0xD6, 0x0E, 0x09, 0xFA, 0xD9, 0x0E, 0x0F, 0xFA, 0xDB, 0x0E
	.byte 0x15, 0xFA, 0xDD, 0x0E, 0x1B, 0xFA, 0xE0, 0x0E, 0x21, 0xFA, 0xE2, 0x0E, 0x26, 0xFA, 0xE4, 0x0E
	.byte 0x2C, 0xFA, 0xE7, 0x0E, 0x32, 0xFA, 0xE9, 0x0E, 0x38, 0xFA, 0xEB, 0x0E, 0x3E, 0xFA, 0xEE, 0x0E
	.byte 0x44, 0xFA, 0xF0, 0x0E, 0x4A, 0xFA, 0xF2, 0x0E, 0x4F, 0xFA, 0xF4, 0x0E, 0x55, 0xFA, 0xF7, 0x0E
	.byte 0x5B, 0xFA, 0xF9, 0x0E, 0x61, 0xFA, 0xFB, 0x0E, 0x67, 0xFA, 0xFD, 0x0E, 0x6D, 0xFA, 0xFF, 0x0E
	.byte 0x73, 0xFA, 0x02, 0x0F, 0x79, 0xFA, 0x04, 0x0F, 0x7F, 0xFA, 0x06, 0x0F, 0x84, 0xFA, 0x08, 0x0F
	.byte 0x8A, 0xFA, 0x0A, 0x0F, 0x90, 0xFA, 0x0C, 0x0F, 0x96, 0xFA, 0x0E, 0x0F, 0x9C, 0xFA, 0x11, 0x0F
	.byte 0xA2, 0xFA, 0x13, 0x0F, 0xA8, 0xFA, 0x15, 0x0F, 0xAE, 0xFA, 0x17, 0x0F, 0xB4, 0xFA, 0x19, 0x0F
	.byte 0xBA, 0xFA, 0x1B, 0x0F, 0xC0, 0xFA, 0x1D, 0x0F, 0xC6, 0xFA, 0x1F, 0x0F, 0xCC, 0xFA, 0x21, 0x0F
	.byte 0xD1, 0xFA, 0x23, 0x0F, 0xD7, 0xFA, 0x25, 0x0F, 0xDD, 0xFA, 0x27, 0x0F, 0xE3, 0xFA, 0x29, 0x0F
	.byte 0xE9, 0xFA, 0x2B, 0x0F, 0xEF, 0xFA, 0x2D, 0x0F, 0xF5, 0xFA, 0x2F, 0x0F, 0xFB, 0xFA, 0x31, 0x0F
	.byte 0x01, 0xFB, 0x33, 0x0F, 0x07, 0xFB, 0x35, 0x0F, 0x0D, 0xFB, 0x37, 0x0F, 0x13, 0xFB, 0x39, 0x0F
	.byte 0x19, 0xFB, 0x3B, 0x0F, 0x1F, 0xFB, 0x3D, 0x0F, 0x25, 0xFB, 0x3F, 0x0F, 0x2B, 0xFB, 0x41, 0x0F
	.byte 0x31, 0xFB, 0x43, 0x0F, 0x37, 0xFB, 0x45, 0x0F, 0x3D, 0xFB, 0x46, 0x0F, 0x43, 0xFB, 0x48, 0x0F
	.byte 0x49, 0xFB, 0x4A, 0x0F, 0x4F, 0xFB, 0x4C, 0x0F, 0x55, 0xFB, 0x4E, 0x0F, 0x5B, 0xFB, 0x50, 0x0F
	.byte 0x61, 0xFB, 0x51, 0x0F, 0x67, 0xFB, 0x53, 0x0F, 0x6D, 0xFB, 0x55, 0x0F, 0x73, 0xFB, 0x57, 0x0F
	.byte 0x79, 0xFB, 0x59, 0x0F, 0x7F, 0xFB, 0x5A, 0x0F, 0x85, 0xFB, 0x5C, 0x0F, 0x8B, 0xFB, 0x5E, 0x0F
	.byte 0x91, 0xFB, 0x60, 0x0F, 0x97, 0xFB, 0x61, 0x0F, 0x9D, 0xFB, 0x63, 0x0F, 0xA3, 0xFB, 0x65, 0x0F
	.byte 0xA9, 0xFB, 0x67, 0x0F, 0xAF, 0xFB, 0x68, 0x0F, 0xB5, 0xFB, 0x6A, 0x0F, 0xBC, 0xFB, 0x6C, 0x0F
	.byte 0xC2, 0xFB, 0x6D, 0x0F, 0xC8, 0xFB, 0x6F, 0x0F, 0xCE, 0xFB, 0x71, 0x0F, 0xD4, 0xFB, 0x72, 0x0F
	.byte 0xDA, 0xFB, 0x74, 0x0F, 0xE0, 0xFB, 0x76, 0x0F, 0xE6, 0xFB, 0x77, 0x0F, 0xEC, 0xFB, 0x79, 0x0F
	.byte 0xF2, 0xFB, 0x7A, 0x0F, 0xF8, 0xFB, 0x7C, 0x0F, 0xFE, 0xFB, 0x7D, 0x0F, 0x04, 0xFC, 0x7F, 0x0F
	.byte 0x0A, 0xFC, 0x81, 0x0F, 0x11, 0xFC, 0x82, 0x0F, 0x17, 0xFC, 0x84, 0x0F, 0x1D, 0xFC, 0x85, 0x0F
	.byte 0x23, 0xFC, 0x87, 0x0F, 0x29, 0xFC, 0x88, 0x0F, 0x2F, 0xFC, 0x8A, 0x0F, 0x35, 0xFC, 0x8B, 0x0F
	.byte 0x3B, 0xFC, 0x8D, 0x0F, 0x41, 0xFC, 0x8E, 0x0F, 0x47, 0xFC, 0x90, 0x0F, 0x4E, 0xFC, 0x91, 0x0F
	.byte 0x54, 0xFC, 0x93, 0x0F, 0x5A, 0xFC, 0x94, 0x0F, 0x60, 0xFC, 0x95, 0x0F, 0x66, 0xFC, 0x97, 0x0F
	.byte 0x6C, 0xFC, 0x98, 0x0F, 0x72, 0xFC, 0x9A, 0x0F, 0x78, 0xFC, 0x9B, 0x0F, 0x7F, 0xFC, 0x9C, 0x0F
	.byte 0x85, 0xFC, 0x9E, 0x0F, 0x8B, 0xFC, 0x9F, 0x0F, 0x91, 0xFC, 0xA1, 0x0F, 0x97, 0xFC, 0xA2, 0x0F
	.byte 0x9D, 0xFC, 0xA3, 0x0F, 0xA3, 0xFC, 0xA5, 0x0F, 0xAA, 0xFC, 0xA6, 0x0F, 0xB0, 0xFC, 0xA7, 0x0F
	.byte 0xB6, 0xFC, 0xA8, 0x0F, 0xBC, 0xFC, 0xAA, 0x0F, 0xC2, 0xFC, 0xAB, 0x0F, 0xC8, 0xFC, 0xAC, 0x0F
	.byte 0xCE, 0xFC, 0xAE, 0x0F, 0xD5, 0xFC, 0xAF, 0x0F, 0xDB, 0xFC, 0xB0, 0x0F, 0xE1, 0xFC, 0xB1, 0x0F
	.byte 0xE7, 0xFC, 0xB3, 0x0F, 0xED, 0xFC, 0xB4, 0x0F, 0xF3, 0xFC, 0xB5, 0x0F, 0xFA, 0xFC, 0xB6, 0x0F
	.byte 0x00, 0xFD, 0xB7, 0x0F, 0x06, 0xFD, 0xB8, 0x0F, 0x0C, 0xFD, 0xBA, 0x0F, 0x12, 0xFD, 0xBB, 0x0F
	.byte 0x18, 0xFD, 0xBC, 0x0F, 0x1F, 0xFD, 0xBD, 0x0F, 0x25, 0xFD, 0xBE, 0x0F, 0x2B, 0xFD, 0xBF, 0x0F
	.byte 0x31, 0xFD, 0xC0, 0x0F, 0x37, 0xFD, 0xC2, 0x0F, 0x3E, 0xFD, 0xC3, 0x0F, 0x44, 0xFD, 0xC4, 0x0F
	.byte 0x4A, 0xFD, 0xC5, 0x0F, 0x50, 0xFD, 0xC6, 0x0F, 0x56, 0xFD, 0xC7, 0x0F, 0x5D, 0xFD, 0xC8, 0x0F
	.byte 0x63, 0xFD, 0xC9, 0x0F, 0x69, 0xFD, 0xCA, 0x0F, 0x6F, 0xFD, 0xCB, 0x0F, 0x75, 0xFD, 0xCC, 0x0F
	.byte 0x7C, 0xFD, 0xCD, 0x0F, 0x82, 0xFD, 0xCE, 0x0F, 0x88, 0xFD, 0xCF, 0x0F, 0x8E, 0xFD, 0xD0, 0x0F
	.byte 0x94, 0xFD, 0xD1, 0x0F, 0x9B, 0xFD, 0xD2, 0x0F, 0xA1, 0xFD, 0xD3, 0x0F, 0xA7, 0xFD, 0xD4, 0x0F
	.byte 0xAD, 0xFD, 0xD5, 0x0F, 0xB3, 0xFD, 0xD5, 0x0F, 0xBA, 0xFD, 0xD6, 0x0F, 0xC0, 0xFD, 0xD7, 0x0F
	.byte 0xC6, 0xFD, 0xD8, 0x0F, 0xCC, 0xFD, 0xD9, 0x0F, 0xD3, 0xFD, 0xDA, 0x0F, 0xD9, 0xFD, 0xDB, 0x0F
	.byte 0xDF, 0xFD, 0xDC, 0x0F, 0xE5, 0xFD, 0xDC, 0x0F, 0xEB, 0xFD, 0xDD, 0x0F, 0xF2, 0xFD, 0xDE, 0x0F
	.byte 0xF8, 0xFD, 0xDF, 0x0F, 0xFE, 0xFD, 0xE0, 0x0F, 0x04, 0xFE, 0xE0, 0x0F, 0x0B, 0xFE, 0xE1, 0x0F
	.byte 0x11, 0xFE, 0xE2, 0x0F, 0x17, 0xFE, 0xE3, 0x0F, 0x1D, 0xFE, 0xE3, 0x0F, 0x24, 0xFE, 0xE4, 0x0F
	.byte 0x2A, 0xFE, 0xE5, 0x0F, 0x30, 0xFE, 0xE6, 0x0F, 0x36, 0xFE, 0xE6, 0x0F, 0x3D, 0xFE, 0xE7, 0x0F
	.byte 0x43, 0xFE, 0xE8, 0x0F, 0x49, 0xFE, 0xE8, 0x0F, 0x4F, 0xFE, 0xE9, 0x0F, 0x56, 0xFE, 0xEA, 0x0F
	.byte 0x5C, 0xFE, 0xEA, 0x0F, 0x62, 0xFE, 0xEB, 0x0F, 0x68, 0xFE, 0xEC, 0x0F, 0x6F, 0xFE, 0xEC, 0x0F
	.byte 0x75, 0xFE, 0xED, 0x0F, 0x7B, 0xFE, 0xED, 0x0F, 0x81, 0xFE, 0xEE, 0x0F, 0x88, 0xFE, 0xEF, 0x0F
	.byte 0x8E, 0xFE, 0xEF, 0x0F, 0x94, 0xFE, 0xF0, 0x0F, 0x9A, 0xFE, 0xF0, 0x0F, 0xA1, 0xFE, 0xF1, 0x0F
	.byte 0xA7, 0xFE, 0xF1, 0x0F, 0xAD, 0xFE, 0xF2, 0x0F, 0xB3, 0xFE, 0xF2, 0x0F, 0xBA, 0xFE, 0xF3, 0x0F
	.byte 0xC0, 0xFE, 0xF3, 0x0F, 0xC6, 0xFE, 0xF4, 0x0F, 0xCC, 0xFE, 0xF4, 0x0F, 0xD3, 0xFE, 0xF5, 0x0F
	.byte 0xD9, 0xFE, 0xF5, 0x0F, 0xDF, 0xFE, 0xF6, 0x0F, 0xE5, 0xFE, 0xF6, 0x0F, 0xEC, 0xFE, 0xF7, 0x0F
	.byte 0xF2, 0xFE, 0xF7, 0x0F, 0xF8, 0xFE, 0xF8, 0x0F, 0xFF, 0xFE, 0xF8, 0x0F, 0x05, 0xFF, 0xF8, 0x0F
	.byte 0x0B, 0xFF, 0xF9, 0x0F, 0x11, 0xFF, 0xF9, 0x0F, 0x18, 0xFF, 0xF9, 0x0F, 0x1E, 0xFF, 0xFA, 0x0F
	.byte 0x24, 0xFF, 0xFA, 0x0F, 0x2A, 0xFF, 0xFA, 0x0F, 0x31, 0xFF, 0xFB, 0x0F, 0x37, 0xFF, 0xFB, 0x0F
	.byte 0x3D, 0xFF, 0xFB, 0x0F, 0x44, 0xFF, 0xFC, 0x0F, 0x4A, 0xFF, 0xFC, 0x0F, 0x50, 0xFF, 0xFC, 0x0F
	.byte 0x56, 0xFF, 0xFC, 0x0F, 0x5D, 0xFF, 0xFD, 0x0F, 0x63, 0xFF, 0xFD, 0x0F, 0x69, 0xFF, 0xFD, 0x0F
	.byte 0x70, 0xFF, 0xFD, 0x0F, 0x76, 0xFF, 0xFE, 0x0F, 0x7C, 0xFF, 0xFE, 0x0F, 0x82, 0xFF, 0xFE, 0x0F
	.byte 0x89, 0xFF, 0xFE, 0x0F, 0x8F, 0xFF, 0xFE, 0x0F, 0x95, 0xFF, 0xFF, 0x0F, 0x9B, 0xFF, 0xFF, 0x0F
	.byte 0xA2, 0xFF, 0xFF, 0x0F, 0xA8, 0xFF, 0xFF, 0x0F, 0xAE, 0xFF, 0xFF, 0x0F, 0xB5, 0xFF, 0xFF, 0x0F
	.byte 0xBB, 0xFF, 0xFF, 0x0F, 0xC1, 0xFF, 0x00, 0x10, 0xC7, 0xFF, 0x00, 0x10, 0xCE, 0xFF, 0x00, 0x10
	.byte 0xD4, 0xFF, 0x00, 0x10, 0xDA, 0xFF, 0x00, 0x10, 0xE1, 0xFF, 0x00, 0x10, 0xE7, 0xFF, 0x00, 0x10
	.byte 0xED, 0xFF, 0x00, 0x10, 0xF3, 0xFF, 0x00, 0x10, 0xFA, 0xFF, 0x00, 0x10

	.data

	.public _02110924
_02110924:
	.byte 0xBC, 0x59, 0x0B, 0x02
_02110928:
	.byte 0xC4, 0x59, 0x0B, 0x02

	.public _0211092C
_0211092C:
	.byte 0xCC, 0x59, 0x0B, 0x02


_02110930:
	.byte 0xD4, 0x59, 0x0B, 0x02
_02110934:
	.byte 0x50, 0x09, 0x11, 0x02, 0x98, 0x09, 0x11, 0x02
_0211093C:
	.byte 0xB0, 0x09, 0x11, 0x02
	.byte 0x98, 0x09, 0x11, 0x02, 0x50, 0x09, 0x11, 0x02, 0x80, 0x09, 0x11, 0x02, 0x68, 0x09, 0x11, 0x02
_02110950:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
_02110968:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00
_02110980:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x06, 0x00
_021109C8:
	.byte 0xC4, 0x78, 0x0B, 0x02, 0xB0, 0x78, 0x0B, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021109DC:
	.byte 0xFE, 0xFF, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
_021109E4:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021109FC:
	.byte 0x00, 0xF0, 0xFF, 0xFF
_02110A00:
	.byte 0x05, 0x00, 0x00, 0x00
_02110A04:
	.byte 0x24, 0x5E, 0x0C, 0x02
_02110A08:
	.byte 0x68, 0x3D, 0x0C, 0x02
_02110A0C:
	.byte 0x04, 0x5B, 0x0C, 0x02
_02110A10:
	.byte 0x64, 0x5D, 0x0C, 0x02
_02110A14:
	.byte 0x34, 0x56, 0x0C, 0x02
_02110A18:
	.byte 0xF4, 0xF9, 0x0B, 0x02
_02110A1C:
	.byte 0x08, 0xF6, 0x0B, 0x02
_02110A20:
	.byte 0x2C, 0xF5, 0x0B, 0x02
_02110A24:
	.byte 0x4D, 0x00, 0x41, 0x4D
_02110A28:
	.byte 0x60, 0x55, 0x0C, 0x02, 0x4D, 0x00, 0x50, 0x54
	.byte 0x48, 0x5B, 0x0C, 0x02, 0x4D, 0x00, 0x41, 0x54, 0x30, 0x5A, 0x0C, 0x02, 0x56, 0x00, 0x41, 0x56
	.byte 0xD8, 0x5D, 0x0C, 0x02, 0x4A, 0x00, 0x41, 0x43, 0xEC, 0x3C, 0x0C, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110A74:
	.byte 0x5C, 0x5E, 0x0C, 0x02, 0x18, 0x5F, 0x0C, 0x02, 0x10, 0x67, 0x0C, 0x02
_02110A80:
	.byte 0xD8, 0x5E, 0x0C, 0x02, 0xDC, 0x5F, 0x0C, 0x02, 0x3C, 0x68, 0x0C, 0x02
_02110A8C:
	.byte 0xC8, 0x65, 0x0C, 0x02
	.byte 0x58, 0x6A, 0x0C, 0x02, 0x20, 0x71, 0x0C, 0x02, 0x48, 0x77, 0x0C, 0x02
_02110A9C:
	.byte 0x2A, 0x00, 0x00, 0x00
_02110AA0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
_02110AA8:
	.byte 0x00, 0x00, 0x00, 0x00
_02110AAC:
	.byte 0x3C, 0x00, 0x0C, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110ABC:
	.byte 0x74, 0x05, 0x0C, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110ACC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
_02110B0C:
	.byte 0x12, 0x10, 0x17, 0x1B
_02110B10:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_02110B18:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_02110B3C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110B48:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110B54:
	.byte 0x12, 0x10, 0x17, 0x1B
_02110B58:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_02110B60:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00
_02110B84:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110B90:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110B9C:
	.byte 0xA4, 0xFD, 0x0B, 0x02
	.byte 0xCC, 0xFD, 0x0B, 0x02, 0xF4, 0xFD, 0x0B, 0x02, 0x70, 0xFF, 0x0B, 0x02, 0xC4, 0x04, 0x0C, 0x02
	.byte 0x48, 0x06, 0x0C, 0x02, 0xE8, 0x06, 0x0C, 0x02, 0x48, 0x0B, 0x0C, 0x02, 0x50, 0x0E, 0x0C, 0x02
	.byte 0xB4, 0x11, 0x0C, 0x02, 0x10, 0x19, 0x0C, 0x02, 0xEC, 0x19, 0x0C, 0x02, 0x5C, 0x1A, 0x0C, 0x02
	.byte 0xA0, 0x1D, 0x0C, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110C1C:
	.byte 0x2C, 0x61, 0x0C, 0x02
	.byte 0x34, 0x62, 0x0C, 0x02, 0x04, 0x63, 0x0C, 0x02, 0x80, 0x63, 0x0C, 0x02, 0xC8, 0x63, 0x0C, 0x02
	.byte 0xA8, 0x64, 0x0C, 0x02, 0x60, 0x65, 0x0C, 0x02, 0xA4, 0x65, 0x0C, 0x02
_02110C3C:
	.byte 0x24, 0x6C, 0x0C, 0x02
	.byte 0x2C, 0x6D, 0x0C, 0x02, 0x14, 0x6E, 0x0C, 0x02, 0x94, 0x6E, 0x0C, 0x02, 0xDC, 0x6E, 0x0C, 0x02
	.byte 0xD4, 0x6F, 0x0C, 0x02, 0xAC, 0x70, 0x0C, 0x02, 0xFC, 0x70, 0x0C, 0x02
_02110C5C:
	.byte 0x68, 0x72, 0x0C, 0x02
	.byte 0xBC, 0x73, 0x0C, 0x02, 0x9C, 0x74, 0x0C, 0x02, 0x20, 0x75, 0x0C, 0x02, 0x74, 0x75, 0x0C, 0x02
	.byte 0x40, 0x76, 0x0C, 0x02, 0xE4, 0x76, 0x0C, 0x02, 0x24, 0x77, 0x0C, 0x02
