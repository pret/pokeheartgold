	.include "macros.inc"
	.include "dwcaccount.inc"
	.include "global.inc"

	.text

	; libcrypto.a:rc4.o

	arm_func_start CRYPTO_RC4FastInit
CRYPTO_RC4FastInit: ; 0x020A0500
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
	arm_func_end CRYPTO_RC4FastInit

	arm_func_start CRYPTO_RC4Init
CRYPTO_RC4Init: ; 0x020A0598
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
	arm_func_end CRYPTO_RC4Init

	arm_func_start CRYPTO_RC4FastEncrypt
CRYPTO_RC4FastEncrypt: ; 0x020A0628
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
	arm_func_end CRYPTO_RC4FastEncrypt

	.data

_021105F4:
	.asciz "0123456789abcdefghijklmnopqrstuv"
	.balign 4, 0
_02110618:
	.asciz "%s%c%c%c%c%s"
