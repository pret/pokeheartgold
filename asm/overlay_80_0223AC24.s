	.include "asm/macros.inc"
	.include "overlay_80_0223AC24.inc"
	.include "global.inc"

    .text

    thumb_func_start ov80_0223AC24
ov80_0223AC24: ; 0x0223AC24
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0xb
	mov r1, #0x4c
	str r2, [sp]
	add r5, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r4, r0, #0
	bl memset
	ldr r0, _0223AC64 ; =ov80_0223AC68
	add r1, r4, #0
	mov r2, #5
	bl SysTask_CreateOnMainQueue
	str r5, [r4, #0x48]
	cmp r5, #0
	beq _0223AC54
	mov r0, #0
	str r0, [r5]
_0223AC54:
	str r6, [r4, #0xc]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223AC64: .word ov80_0223AC68
	thumb_func_end ov80_0223AC24

	thumb_func_start ov80_0223AC68
ov80_0223AC68: ; 0x0223AC68
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #5
	bhi _0223AD4E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223AC80: ; jump table
	.short _0223AC8C - _0223AC80 - 2 ; case 0
	.short _0223ACC4 - _0223AC80 - 2 ; case 1
	.short _0223ACDE - _0223AC80 - 2 ; case 2
	.short _0223ACF2 - _0223AC80 - 2 ; case 3
	.short _0223AD0C - _0223AC80 - 2 ; case 4
	.short _0223AD30 - _0223AC80 - 2 ; case 5
_0223AC8C:
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _0223ACA6
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x14]
	add r0, #0x30
	mov r1, #0
	mov r3, #2
	bl ov80_0223AD7C
	b _0223ACBC
_0223ACA6:
	cmp r0, #2
	bne _0223ACBC
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x14]
	add r0, #0x30
	mov r1, #0
	mov r3, #1
	bl ov80_0223AD7C
_0223ACBC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACC4:
	mov r0, #3
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0xc]
	add r0, #0x18
	mov r1, #0
	bl ov80_0223AD7C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACDE:
	add r0, r4, #0
	add r0, #0x18
	bl ov80_0223AD88
	cmp r0, #0
	beq _0223AD4E
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACF2:
	mov r0, #3
	str r0, [sp]
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	ldr r3, [r4, #0xc]
	add r0, #0x18
	mov r2, #0
	bl ov80_0223AD7C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223AD0C:
	add r0, r4, #0
	add r0, #0x18
	bl ov80_0223AD88
	cmp r0, #0
	beq _0223AD4E
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _0223AD2A
	mov r0, #5
	str r0, [r4]
	b _0223AD4E
_0223AD2A:
	mov r0, #1
	str r0, [r4]
	b _0223AD4E
_0223AD30:
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #8]
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0223AD40
	mov r1, #1
	str r1, [r2]
_0223AD40:
	bl SysTask_Destroy
	add r0, r4, #0
	bl Heap_Free
	add sp, #4
	pop {r3, r4, pc}
_0223AD4E:
	add r4, #0x30
	add r0, r4, #0
	bl ov80_0223AD88
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AC68

	thumb_func_start ov80_0223AD5C
ov80_0223AD5C: ; 0x0223AD5C
	push {r3, lr}
	cmp r0, #1
	bne _0223AD6A
	ldr r0, _0223AD74 ; =0x0400006C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
_0223AD6A:
	ldr r0, _0223AD78 ; =0x0400106C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
	nop
_0223AD74: .word 0x0400006C
_0223AD78: .word 0x0400106C
	thumb_func_end ov80_0223AD5C

	thumb_func_start ov80_0223AD7C
ov80_0223AD7C: ; 0x0223AD7C
	push {r3, lr}
	str r3, [r0, #0x14]
	ldr r3, [sp, #8]
	bl ov80_0223ADB8
	pop {r3, pc}
	thumb_func_end ov80_0223AD7C

	thumb_func_start ov80_0223AD88
ov80_0223AD88: ; 0x0223AD88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0223ADC8
	add r4, r0, #0
	ldr r0, _0223ADA0 ; =ov80_0223ADA4
	add r1, r5, #0
	mov r2, #0xa
	bl SysTask_CreateOnVWaitQueue
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223ADA0: .word ov80_0223ADA4
	thumb_func_end ov80_0223AD88

	thumb_func_start ov80_0223ADA4
ov80_0223ADA4: ; 0x0223ADA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1]
	bl ov80_0223AD5C
	add r0, r4, #0
	bl SysTask_Destroy
	pop {r4, pc}
	thumb_func_end ov80_0223ADA4

	thumb_func_start ov80_0223ADB8
ov80_0223ADB8: ; 0x0223ADB8
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov80_0223ADB8

	thumb_func_start ov80_0223ADC8
ov80_0223ADC8: ; 0x0223ADC8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mul r0, r1
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _0223ADEE
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_0223ADEE:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0223ADC8

	thumb_func_start ov80_0223ADF4
ov80_0223ADF4: ; 0x0223ADF4
	push {r4, lr}
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223ADF4

	thumb_func_start ov80_0223AE0C
ov80_0223AE0C: ; 0x0223AE0C
	ldr r3, _0223AE10 ; =Heap_Free
	bx r3
	.balign 4, 0
_0223AE10: .word Heap_Free
	thumb_func_end ov80_0223AE0C

	thumb_func_start ov80_0223AE14
ov80_0223AE14: ; 0x0223AE14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x2e
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0223AE2A
	bl GF_AssertFail
_0223AE2A:
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov80_0223ADB8
	add r0, r5, #0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x14
	add r1, r7, #0
	bl ov80_0223ADB8
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x28]
	add r0, r5, #0
	add r0, #0x2c
	strb r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x28]
	add r0, #0x2d
	strb r1, [r0]
	add r0, sp, #0x2c
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2f
	strb r1, [r0]
	mov r0, #1
	add r5, #0x2e
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AE14

	thumb_func_start ov80_0223AE6C
ov80_0223AE6C: ; 0x0223AE6C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223AE82
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223AE82:
	bl ov80_0223ADC8
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x14
	bl ov80_0223ADC8
	add r0, r5, #0
	add r0, #0x2c
	ldrb r0, [r0]
	ldr r2, [r5]
	ldr r6, [r5, #0x14]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r3, r1, #0x10
	add r1, r5, #0
	add r1, #0x2d
	ldrb r2, [r1]
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsr r1, r2, #1
	str r0, [sp]
	add r0, r5, #0
	sub r1, r6, r1
	add r0, #0x2f
	lsl r1, r1, #0x10
	ldrb r0, [r0]
	asr r1, r1, #0x10
	add r2, r1, r2
	str r0, [sp, #4]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x28]
	asr r2, r2, #0x10
	bl ov80_0223AED4
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AE6C

	thumb_func_start ov80_0223AED4
ov80_0223AED4: ; 0x0223AED4
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x18]
	add r4, r1, #0
	cmp r5, #0
	ble _0223AF2C
	cmp r2, #0
	ble _0223AF2C
	cmp r3, r5
	beq _0223AF2C
	cmp r4, r2
	beq _0223AF2C
	cmp r3, #0
	bge _0223AEF2
	mov r3, #0
_0223AEF2:
	mov r1, #1
	lsl r1, r1, #8
	cmp r5, r1
	ble _0223AEFC
	add r5, r1, #0
_0223AEFC:
	cmp r4, #0
	bge _0223AF02
	mov r4, #0
_0223AF02:
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	ble _0223AF0C
	add r2, r1, #0
_0223AF0C:
	sub r1, r5, r3
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp]
	sub r1, r2, r4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp, #4]
	lsl r2, r3, #0x10
	add r1, sp, #8
	lsl r3, r4, #0x10
	ldrb r1, [r1, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
_0223AF2C:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223AED4

	thumb_func_start ov80_0223AF30
ov80_0223AF30: ; 0x0223AF30
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x19
	lsl r1, r1, #4
	add r6, r0, #0
	bl AllocFromHeap
	mov r2, #0x19
	mov r1, #0
	lsl r2, r2, #4
	add r7, r0, #0
	bl memset
	mov r4, #0
	add r5, r7, #0
_0223AF4C:
	add r0, r6, #0
	bl ov80_0223ADF4
	str r0, [r5, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x60
	blt _0223AF4C
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223AF30

	thumb_func_start ov80_0223AF60
ov80_0223AF60: ; 0x0223AF60
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0223AF68:
	ldr r0, [r5, #4]
	bl ov80_0223AE0C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x60
	blt _0223AF68
	add r0, r6, #0
	bl Heap_Free
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AF60

	thumb_func_start ov80_0223AF80
ov80_0223AF80: ; 0x0223AF80
	push {r3, r4}
	str r3, [r0]
	ldr r3, _0223AFC0 ; =0xFFFFFFF8
	add r3, sp
	ldrb r4, [r3, #0x10]
	mov r3, #0x63
	lsl r3, r3, #2
	strb r4, [r0, r3]
	sub r4, r3, #3
	strb r1, [r0, r4]
	sub r1, r3, #2
	strb r2, [r0, r1]
	add r2, r3, #0
	mov r1, #0
	sub r2, #8
	strb r1, [r0, r2]
	sub r2, r3, #7
	strb r1, [r0, r2]
	sub r2, r3, #6
	strb r1, [r0, r2]
	sub r2, r3, #5
	strb r1, [r0, r2]
	sub r2, r3, #4
	strb r1, [r0, r2]
	sub r2, r3, #1
	strb r1, [r0, r2]
	mov r2, #1
	add r1, r3, #1
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	nop
_0223AFC0: .word 0xFFFFFFF8
	thumb_func_end ov80_0223AF80

	thumb_func_start ov80_0223AFC4
ov80_0223AFC4: ; 0x0223AFC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0223B1C8 ; =0x0000018D
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _0223AFD8
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223AFD8:
	add r1, r0, #0
	sub r1, #9
	ldrb r1, [r5, r1]
	cmp r1, #0x60
	bhs _0223AFF2
	sub r1, r0, #2
	ldrsb r1, [r5, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strb r2, [r5, r1]
	ldrsb r1, [r5, r1]
	cmp r1, #0
	ble _0223AFF4
_0223AFF2:
	b _0223B16E
_0223AFF4:
	sub r1, r0, #3
	ldrb r2, [r5, r1]
	sub r1, r0, #2
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	strb r2, [r5, r1]
	sub r1, r0, #6
	ldrb r1, [r5, r1]
	lsl r4, r1, #4
	add r1, r0, #0
	sub r1, #8
	ldrb r2, [r5, r1]
	add r1, r3, r4
	sub r3, r0, #7
	ldrb r3, [r5, r3]
	sub r4, r0, #4
	ldrb r1, [r2, r1]
	lsl r3, r3, #4
	add r3, #8
	str r3, [sp]
	ldrb r4, [r5, r4]
	lsl r1, r1, #5
	add r2, r1, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	add r2, #0x20
	str r4, [sp, #8]
	mov r4, #0x20
	str r4, [sp, #0xc]
	mov r4, #0x10
	str r4, [sp, #0x10]
	sub r4, r0, #1
	ldrb r4, [r5, r4]
	sub r0, #9
	str r4, [sp, #0x14]
	ldrb r0, [r5, r0]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 ; =0x00000187
	mov r1, #1
	ldrb r2, [r5, r0]
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	eor r1, r2
	lsl r4, r1, #4
	sub r1, r0, #2
	ldrb r2, [r5, r1]
	add r1, r3, r4
	sub r3, r0, #1
	ldrb r4, [r5, r3]
	mov r3, #5
	ldrb r1, [r2, r1]
	sub r3, r3, r4
	lsl r3, r3, #4
	add r3, #8
	str r3, [sp]
	add r4, r0, #2
	ldrb r4, [r5, r4]
	lsl r1, r1, #5
	add r2, r1, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	add r2, #0x20
	str r4, [sp, #8]
	mov r4, #0x20
	str r4, [sp, #0xc]
	mov r4, #0x10
	str r4, [sp, #0x10]
	add r4, r0, #5
	ldrb r4, [r5, r4]
	sub r0, r0, #3
	str r4, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r0, r0, #1
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 ; =0x00000187
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	ldrb r1, [r5, r0]
	lsl r4, r1, #4
	sub r1, r0, #2
	ldrb r2, [r5, r1]
	add r1, r3, r4
	ldrb r1, [r2, r1]
	sub r2, r0, #1
	ldrb r2, [r5, r2]
	lsl r1, r1, #5
	add r2, r2, #6
	lsl r3, r2, #4
	add r3, #8
	str r3, [sp]
	add r2, r0, #2
	ldrb r2, [r5, r2]
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	mov r2, #0x20
	str r2, [sp, #0xc]
	mov r2, #0x10
	str r2, [sp, #0x10]
	add r2, r0, #5
	ldrb r2, [r5, r2]
	sub r0, r0, #3
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r2, #0x20
	add r0, r0, #2
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 ; =0x00000187
	mov r1, #1
	ldrb r2, [r5, r0]
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	eor r1, r2
	lsl r4, r1, #4
	sub r1, r0, #2
	ldrb r2, [r5, r1]
	add r1, r3, r4
	ldrb r1, [r2, r1]
	sub r2, r0, #1
	ldrb r3, [r5, r2]
	mov r2, #0xb
	lsl r1, r1, #5
	sub r2, r2, r3
	lsl r3, r2, #4
	add r3, #8
	str r3, [sp]
	add r2, r0, #2
	ldrb r2, [r5, r2]
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	mov r2, #0x20
	str r2, [sp, #0xc]
	mov r2, #0x10
	str r2, [sp, #0x10]
	add r2, r0, #5
	ldrb r2, [r5, r2]
	sub r0, r0, #3
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r2, #0x20
	add r0, r0, #3
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	mov r1, #0x61
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	add r0, r0, #4
	strb r0, [r5, r1]
	add r0, r1, #1
	ldrb r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #1
	strb r2, [r5, r0]
	ldrb r0, [r5, r0]
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1d
	sub r2, r2, r3
	mov r0, #0x1d
	ror r2, r0
	add r0, r3, r2
	bne _0223B16E
	add r0, r1, #3
	ldrb r2, [r5, r0]
	mov r0, #1
	eor r2, r0
	add r0, r1, #3
	strb r2, [r5, r0]
	add r0, r1, #2
	ldrb r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #2
	strb r2, [r5, r0]
	mov r2, #0
	add r0, r1, #1
	strb r2, [r5, r0]
_0223B16E:
	mov r0, #0x62
	lsl r0, r0, #2
	ldrb r4, [r5, r0]
	sub r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _0223B1A4
	lsl r0, r4, #2
	mov r7, #0x62
	add r6, r5, r0
	lsl r7, r7, #2
_0223B184:
	ldr r0, [r6, #4]
	bl ov80_0223AE6C
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B196
	ldrb r0, [r5, r7]
	add r0, r0, #1
	strb r0, [r5, r7]
_0223B196:
	mov r0, #0x61
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, r0
	blt _0223B184
_0223B1A4:
	mov r1, #0x62
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	cmp r0, #0x60
	blo _0223B1C0
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B1C0
	mov r2, #0
	add r0, r1, #5
	strb r2, [r5, r0]
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B1C0:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223B1C8: .word 0x0000018D
_0223B1CC: .word ov80_0223DBEC
_0223B1D0: .word 0x00000187
	thumb_func_end ov80_0223AFC4

	thumb_func_start ov80_0223B1D4
ov80_0223B1D4: ; 0x0223B1D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0223B3DC ; =0x0000018D
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _0223B1E8
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B1E8:
	add r1, r0, #0
	sub r1, #9
	ldrb r1, [r5, r1]
	cmp r1, #0x60
	bhs _0223B202
	sub r1, r0, #2
	ldrsb r1, [r5, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strb r2, [r5, r1]
	ldrsb r1, [r5, r1]
	cmp r1, #0
	ble _0223B204
_0223B202:
	b _0223B384
_0223B204:
	sub r1, r0, #3
	ldrb r2, [r5, r1]
	sub r1, r0, #2
	ldr r4, _0223B3E0 ; =ov80_0223DBE0
	strb r2, [r5, r1]
	sub r2, r0, #6
	ldrb r3, [r5, r2]
	mov r2, #6
	add r1, r0, #0
	mul r2, r3
	sub r3, r0, #7
	ldrb r3, [r5, r3]
	add r2, r4, r2
	sub r1, #8
	ldrb r2, [r3, r2]
	ldrb r1, [r5, r1]
	lsl r3, r2, #5
	add r2, r3, #0
	add r2, #0x20
	str r2, [sp]
	sub r2, r0, #4
	ldrb r2, [r5, r2]
	lsl r1, r1, #4
	add r1, #8
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	mov r2, #0x10
	str r2, [sp, #0xc]
	mov r2, #0x20
	str r2, [sp, #0x10]
	sub r2, r0, #1
	ldrb r2, [r5, r2]
	sub r0, #9
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r2, r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 ; =0x00000185
	mov r0, #7
	ldrb r1, [r5, r2]
	sub r0, r0, r1
	lsl r1, r0, #4
	add r0, r2, #2
	ldrb r3, [r5, r0]
	mov r0, #1
	add r1, #8
	eor r3, r0
	mov r0, #6
	mul r0, r3
	add r3, r2, #1
	ldrb r3, [r5, r3]
	add r0, r4, r0
	ldrb r0, [r3, r0]
	lsl r3, r0, #5
	add r0, r3, #0
	add r0, #0x20
	str r0, [sp]
	add r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	sub r0, r2, #1
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r0, r0, #1
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 ; =0x00000185
	ldrb r0, [r5, r2]
	add r0, #8
	lsl r1, r0, #4
	add r0, r2, #2
	ldrb r3, [r5, r0]
	mov r0, #6
	add r1, #8
	mul r0, r3
	add r3, r2, #1
	ldrb r3, [r5, r3]
	add r0, r4, r0
	ldrb r0, [r3, r0]
	lsl r3, r0, #5
	add r0, r3, #0
	add r0, #0x20
	str r0, [sp]
	add r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	sub r0, r2, #1
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r0, r0, #2
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 ; =0x00000185
	mov r0, #0xf
	ldrb r1, [r5, r2]
	sub r0, r0, r1
	lsl r1, r0, #4
	add r0, r2, #2
	ldrb r3, [r5, r0]
	mov r0, #1
	add r1, #8
	eor r3, r0
	mov r0, #6
	mul r0, r3
	add r3, r2, #1
	ldrb r3, [r5, r3]
	add r0, r4, r0
	ldrb r0, [r3, r0]
	lsl r3, r0, #5
	add r0, r3, #0
	add r0, #0x20
	str r0, [sp]
	add r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	sub r0, r2, #1
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r0, r0, #3
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	mov r0, #0x61
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r1, r1, #4
	strb r1, [r5, r0]
	add r1, r0, #2
	ldrb r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #2
	strb r2, [r5, r1]
	add r0, r0, #2
	ldrb r0, [r5, r0]
	mov r1, #6
	bl _s32_div_f
	cmp r1, #0
	bne _0223B384
	ldr r1, _0223B3E8 ; =0x00000187
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	sub r0, r1, #2
	ldrb r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #2
	strb r2, [r5, r0]
	mov r2, #0
	sub r0, r1, #1
	strb r2, [r5, r0]
_0223B384:
	mov r0, #0x62
	lsl r0, r0, #2
	ldrb r4, [r5, r0]
	sub r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _0223B3BA
	lsl r0, r4, #2
	mov r7, #0x62
	add r6, r5, r0
	lsl r7, r7, #2
_0223B39A:
	ldr r0, [r6, #4]
	bl ov80_0223AE6C
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B3AC
	ldrb r0, [r5, r7]
	add r0, r0, #1
	strb r0, [r5, r7]
_0223B3AC:
	mov r0, #0x61
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, r0
	blt _0223B39A
_0223B3BA:
	mov r1, #0x62
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	cmp r0, #0x60
	blo _0223B3D6
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B3D6
	mov r2, #0
	add r0, r1, #5
	strb r2, [r5, r0]
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B3D6:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B3DC: .word 0x0000018D
_0223B3E0: .word ov80_0223DBE0
_0223B3E4: .word 0x00000185
_0223B3E8: .word 0x00000187
	thumb_func_end ov80_0223B1D4

	thumb_func_start ov80_0223B3EC
ov80_0223B3EC: ; 0x0223B3EC
	ldr r3, _0223B3F8 ; =SysTask_CreateOnVBlankQueue
	mov r2, #1
	add r1, r0, #0
	ldr r0, _0223B3FC ; =ov80_0223B400
	lsl r2, r2, #0xa
	bx r3
	.balign 4, 0
_0223B3F8: .word SysTask_CreateOnVBlankQueue
_0223B3FC: .word ov80_0223B400
	thumb_func_end ov80_0223B3EC

	thumb_func_start ov80_0223B400
ov80_0223B400: ; 0x0223B400
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #2
	blo _0223B414
	ldr r0, [r4]
	bl sub_02014C08
	mov r0, #0
	str r0, [r4, #8]
_0223B414:
	ldr r0, [r4]
	bl sub_02014C40
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B400

	thumb_func_start ov80_0223B424
ov80_0223B424: ; 0x0223B424
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_02014AD8
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov80_0223B3EC
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B424

	thumb_func_start ov80_0223B440
ov80_0223B440: ; 0x0223B440
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x20]
	add r5, sp, #0x10
	str r4, [sp]
	mov r4, #0x14
	ldrsh r4, [r5, r4]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	ldr r0, [r0]
	bl sub_02014B08
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B440

	thumb_func_start ov80_0223B468
ov80_0223B468: ; 0x0223B468
	push {r3, lr}
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0223B47C
	mov r0, #1
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0x10]
	blx r1
	pop {r3, pc}
_0223B47C:
	bl sub_02014AA0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B468

	thumb_func_start ov80_0223B484
ov80_0223B484: ; 0x0223B484
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223B49E
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0223B49E
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x14]
	blx r1
	mov r0, #0
	str r0, [r4, #0xc]
_0223B49E:
	pop {r4, pc}
	thumb_func_end ov80_0223B484

	thumb_func_start ov80_0223B4A0
ov80_0223B4A0: ; 0x0223B4A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _0223B4B2
	bl GF_AssertFail
_0223B4B2:
	mov r0, #1
	str r0, [r5, #8]
	mov r2, #0
	str r2, [r5, #0xc]
	str r4, [r5, #0x18]
	str r6, [r5, #0x10]
	ldr r0, gApp_MainMenu_SelectOption_MigrateFromAgb ; =ov80_0223B468
	str r7, [r5, #0x14]
	add r1, r5, #0
	bl SysTask_CreateOnVWaitQueue
	str r0, [r5, #4]
	ldr r0, _0223B4DC ; =ov80_0223B484
	add r1, r5, #0
	mov r2, #0
	bl SysTask_CreateOnVBlankQueue
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
gApp_MainMenu_SelectOption_MigrateFromAgb: .word ov80_0223B468
_0223B4DC: .word ov80_0223B484
	thumb_func_end ov80_0223B4A0

	thumb_func_start ov80_0223B4E0
ov80_0223B4E0: ; 0x0223B4E0
	push {r4, lr}
	add r4, r0, #0
	bne _0223B4EA
	bl GF_AssertFail
_0223B4EA:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0223B4F4
	bl SysTask_Destroy
_0223B4F4:
	ldr r0, [r4]
	cmp r0, #0
	beq _0223B4FE
	bl SysTask_Destroy
_0223B4FE:
	bl sub_02014AA0
	pop {r4, pc}
	thumb_func_end ov80_0223B4E0

	thumb_func_start ov80_0223B504
ov80_0223B504: ; 0x0223B504
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014A60
	add r5, r0, #0
	bl sub_02014AA0
	ldr r1, _0223B524 ; =0x00003020
	add r0, r5, #0
	ldr r1, [r4, r1]
	mov r2, #0x20
	mov r3, #1
	bl sub_02014AB0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B524: .word 0x00003020
	thumb_func_end ov80_0223B504

	thumb_func_start ov80_0223B528
ov80_0223B528: ; 0x0223B528
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014A8C
	add r0, r4, #0
	bl ov80_0223B504
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B528

	thumb_func_start ov80_0223B53C
ov80_0223B53C: ; 0x0223B53C
	ldr r3, _0223B540 ; =ov80_0223B504
	bx r3
	.balign 4, 0
_0223B540: .word ov80_0223B504
	thumb_func_end ov80_0223B53C

	thumb_func_start ov80_0223B544
ov80_0223B544: ; 0x0223B544
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r2, #0
	add r4, r0, #0
	ldr r1, _0223B5D4 ; =0x00003024
	add r0, r5, #0
	bl AllocFromHeap
	ldr r2, _0223B5D4 ; =0x00003024
	str r0, [sp]
	mov r1, #0
	bl memset
	ldr r0, [sp]
	cmp r0, #0
	bne _0223B568
	bl GF_AssertFail
_0223B568:
	ldr r1, [sp]
	ldr r3, _0223B5D8 ; =0x00001820
	ldr r2, [sp]
	add r0, r5, #0
	add r1, #0x20
	add r2, r2, r3
	bl sub_02014A08
	ldr r1, [sp]
	cmp r0, #0
	str r0, [r1, #0x1c]
	bne _0223B584
	bl GF_AssertFail
_0223B584:
	ldr r0, [sp]
	ldr r1, _0223B5DC ; =0x00003020
	mov r5, #0
	str r4, [r0, r1]
	add r6, r0, #0
_0223B58E:
	add r3, r6, #0
	add r4, r7, #0
	add r3, #0x20
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _0223B5D8 ; =0x00001820
	add r3, r7, #0
	add r4, r6, r0
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	add r5, r5, #1
	add r6, r2, #0
	stmia r4!, {r0, r1}
	cmp r5, #0xc0
	blt _0223B58E
	ldr r0, [sp]
	ldr r2, _0223B5E0 ; =ov80_0223B528
	ldr r3, _0223B5E4 ; =ov80_0223B53C
	add r1, r0, #0
	bl ov80_0223B4A0
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B5D4: .word 0x00003024
_0223B5D8: .word 0x00001820
_0223B5DC: .word 0x00003020
_0223B5E0: .word ov80_0223B528
_0223B5E4: .word ov80_0223B53C
	thumb_func_end ov80_0223B544

	thumb_func_start ov80_0223B5E8
ov80_0223B5E8: ; 0x0223B5E8
	push {r4, lr}
	add r4, r0, #0
	bne _0223B5F2
	bl GF_AssertFail
_0223B5F2:
	add r0, r4, #0
	bl ov80_0223B4E0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0223B602
	bl sub_02014A38
_0223B602:
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B5E8

	thumb_func_start ov80_0223B60C
ov80_0223B60C: ; 0x0223B60C
	push {r4, lr}
	add r4, r0, #0
	bne _0223B616
	bl GF_AssertFail
_0223B616:
	ldr r0, [r4, #0x1c]
	bl sub_02014A4C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B60C

    .rodata

ov80_0223DBE0: ; 0x0223DBE0
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00

ov80_0223DBEC: ; 0x0223DBEC
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x06, 0x05, 0x04
	.byte 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
