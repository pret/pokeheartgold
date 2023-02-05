	.include "asm/macros.inc"
	.include "overlay_38_thumb.inc"
	.include "global.inc"

	.text

	thumb_func_start ov38_0221BA00
ov38_0221BA00: ; 0x0221BA00
	lsl r1, r0, #0x10
	orr r1, r0
	ldr r0, _0221BA0C ; =_02226020
	str r1, [r0]
	bx lr
	nop
_0221BA0C: .word _02226020
	thumb_func_end ov38_0221BA00

	thumb_func_start ov38_0221BA10
ov38_0221BA10: ; 0x0221BA10
	ldr r1, _0221BA2C ; =_02226020
	mov r0, #0x45
	ldr r2, [r1]
	add r3, r2, #0
	mul r3, r0
	ldr r0, _0221BA30 ; =0x00001111
	add r2, r3, r0
	ldr r0, _0221BA34 ; =0x7FFFFFFF
	and r0, r2
	str r0, [r1]
	asr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	.balign 4, 0
_0221BA2C: .word _02226020
_0221BA30: .word 0x00001111
_0221BA34: .word 0x7FFFFFFF
	thumb_func_end ov38_0221BA10

	thumb_func_start ov38_0221BA38
ov38_0221BA38: ; 0x0221BA38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0
	add r5, r2, #0
	str r0, [sp, #0x14]
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, #8
	add r7, r1, #0
	str r3, [sp]
	str r0, [sp, #0x10]
	bl ov38_0221BB44
	ldr r1, [sp, #0x30]
	add r0, r0, #1
	cmp r1, r0
	bge _0221BA62
	add sp, #0x18
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221BA62:
	ldr r1, [sp, #0x10]
	mov r0, #0xa
	bl ov00_021EC2A8
	add r6, r0, #0
	bne _0221BA74
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221BA74:
	lsr r0, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	lsr r1, r4, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #8]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r0, r0, r1
	lsr r1, r4, #8
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r0, r0, r1
	lsl r1, r4, #0x18
	lsr r4, r1, #0x18
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	add r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, #0
	cmp r5, #0
	ble _0221BAC0
_0221BAB2:
	ldrb r2, [r7, r0]
	ldr r1, [sp, #0x14]
	add r0, r0, #1
	add r1, r1, r2
	str r1, [sp, #0x14]
	cmp r0, r5
	blt _0221BAB2
_0221BAC0:
	ldr r0, [sp, #0x14]
	bl ov38_0221BA00
	bl ov38_0221BA10
	eor r0, r4
	strb r0, [r6, #4]
	bl ov38_0221BA10
	ldr r1, [sp, #0xc]
	eor r0, r1
	strb r0, [r6, #5]
	bl ov38_0221BA10
	ldr r1, [sp, #8]
	eor r0, r1
	strb r0, [r6, #6]
	bl ov38_0221BA10
	ldr r1, [sp, #4]
	mov r4, #0
	eor r0, r1
	strb r0, [r6, #7]
	cmp r5, #0
	ble _0221BB04
_0221BAF2:
	bl ov38_0221BA10
	ldrb r1, [r7, r4]
	eor r1, r0
	add r0, r6, r4
	add r4, r4, #1
	strb r1, [r0, #8]
	cmp r4, r5
	blt _0221BAF2
_0221BB04:
	ldr r1, _0221BB40 ; =0x4A3B2C1D
	ldr r0, [sp, #0x14]
	add r5, #8
	eor r1, r0
	lsr r0, r1, #0x18
	strb r0, [r6]
	lsr r0, r1, #0x10
	strb r0, [r6, #1]
	lsr r0, r1, #8
	strb r0, [r6, #2]
	strb r1, [r6, #3]
	ldr r1, [sp]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #2
	bl ov00_021FFC18
	ldr r0, [sp, #0x10]
	bl ov38_0221BB44
	ldr r1, [sp]
	mov r2, #0
	strb r2, [r1, r0]
	mov r0, #0xa
	add r1, r6, #0
	bl ov00_021EC2EC
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221BB40: .word 0x4A3B2C1D
	thumb_func_end ov38_0221BA38

	thumb_func_start ov38_0221BB44
ov38_0221BB44: ; 0x0221BB44
	push {r3, r4, r5, lr}
	mov r1, #3
	add r5, r0, #0
	bl _u32_div_f
	cmp r1, #0
	beq _0221BB56
	mov r4, #1
	b _0221BB58
_0221BB56:
	mov r4, #0
_0221BB58:
	add r0, r5, #0
	mov r1, #3
	bl _u32_div_f
	add r0, r0, r4
	lsl r0, r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov38_0221BB44

	thumb_func_start ov38_0221BB68
ov38_0221BB68: ; 0x0221BB68
	add r0, #8
	cmp r0, #7
	bhi _0221BBC2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221BB7A: ; jump table
	.short _0221BB8A - _0221BB7A - 2 ; case 0
	.short _0221BBC2 - _0221BB7A - 2 ; case 1
	.short _0221BB92 - _0221BB7A - 2 ; case 2
	.short _0221BB9A - _0221BB7A - 2 ; case 3
	.short _0221BBA2 - _0221BB7A - 2 ; case 4
	.short _0221BBAA - _0221BB7A - 2 ; case 5
	.short _0221BBB2 - _0221BB7A - 2 ; case 6
	.short _0221BBBA - _0221BB7A - 2 ; case 7
_0221BB8A:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #0
	str r1, [r0, #8]
	bx lr
_0221BB92:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #1
	str r1, [r0, #8]
	bx lr
_0221BB9A:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #2
	str r1, [r0, #8]
	bx lr
_0221BBA2:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #3
	str r1, [r0, #8]
	bx lr
_0221BBAA:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #4
	str r1, [r0, #8]
	bx lr
_0221BBB2:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #5
	str r1, [r0, #8]
	bx lr
_0221BBBA:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #6
	str r1, [r0, #8]
	bx lr
_0221BBC2:
	ldr r0, _0221BBCC ; =_02225040
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	nop
_0221BBCC: .word _02225040
	thumb_func_end ov38_0221BB68

	thumb_func_start ov38_0221BBD0
ov38_0221BBD0: ; 0x0221BBD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r4, r1, #0
	mov r3, #0
	ldr r1, _0221BE58 ; =_02225040
	mvn r3, r3
	str r3, [r1, #4]
	ldr r3, [r1]
	add r6, r0, #0
	cmp r3, #1
	bne _0221BBE8
	b _0221BE52
_0221BBE8:
	cmp r2, #0
	beq _0221BBEE
	b _0221BDA2
_0221BBEE:
	cmp r3, #4
	beq _0221BBFA
	cmp r3, #6
	beq _0221BCC6
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BBFA:
	cmp r4, #0x20
	bne _0221BCBE
	ldr r5, [r1, #0x28]
	ldr r3, _0221BE5C ; =_02224E4C
	add r5, #0x14
	add r2, sp, #4
	mov r1, #0x11
_0221BC08:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0221BC08
	add r3, sp, #0x14
	ldr r2, _0221BE60 ; =ov38_02225074
	add r3, #1
	mov r1, #0x15
_0221BC1C:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _0221BC1C
	add r0, sp, #0x14
	add r0, #1
	add r1, r6, #0
	add r2, r4, #0
	bl strncat
	add r0, sp, #0x14
	add r0, #1
	bl strlen
	add r1, sp, #0x14
	add r2, r0, #0
	add r0, r5, #0
	add r1, #1
	bl MATH_CalcSHA1
	ldr r0, _0221BE58 ; =_02225040
	ldr r1, _0221BE64 ; =ov38_0222508C
	ldr r0, [r0, #0x24]
	bl strcat
	mov r2, #0
	ldr r4, _0221BE58 ; =_02225040
	add r3, r2, #0
	add r1, sp, #4
	mov r7, #0xf
_0221BC5C:
	ldrb r0, [r5, r2]
	asr r0, r0, #4
	ldrsb r6, [r1, r0]
	ldr r0, [r4, #0x28]
	strb r6, [r0, r3]
	ldrb r0, [r5, r2]
	ldr r6, [r4, #0x28]
	add r2, r2, #1
	and r0, r7
	ldrsb r0, [r1, r0]
	add r6, r6, r3
	add r3, r3, #2
	strb r0, [r6, #1]
	cmp r2, #0x14
	blt _0221BC5C
	ldr r0, _0221BE58 ; =_02225040
	mov r2, #0
	ldr r1, [r0, #0x28]
	add r1, #0x28
	strb r2, [r1]
	ldr r0, [r0, #0x24]
	ldr r1, _0221BE68 ; =ov38_02225094
	bl strcat
	ldr r3, _0221BE58 ; =_02225040
	ldr r0, [r3, #0x30]
	str r0, [sp]
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	ldr r2, [r3, #0x18]
	ldr r3, [r3, #0x2c]
	bl ov38_0221BA38
	cmp r0, #0
	beq _0221BCB4
	cmp r0, #1
	beq _0221BCAA
	cmp r0, #2
	bne _0221BCB4
_0221BCAA:
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCB4:
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #5
	str r1, [r0]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCBE:
	mov r0, #1
	str r0, [r1]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCC6:
	cmp r4, #0x16
	bne _0221BD70
	ldr r1, _0221BE6C ; =ov38_0222509C
	mov r2, #0x16
	bl strncmp
	cmp r0, #0
	bne _0221BCE4
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x1a
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCE4:
	ldr r1, _0221BE70 ; =ov38_022250B4
	add r0, r6, #0
	mov r2, #0x16
	bl strncmp
	cmp r0, #0
	bne _0221BD00
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x1b
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD00:
	ldr r1, _0221BE74 ; =ov38_022250CC
	add r0, r6, #0
	mov r2, #0x16
	bl strncmp
	cmp r0, #0
	bne _0221BD1C
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x1c
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD1C:
	ldr r1, _0221BE78 ; =ov38_022250E4
	add r0, r6, #0
	mov r2, #0x16
	bl strncmp
	cmp r0, #0
	bne _0221BD38
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x1d
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD38:
	ldr r1, _0221BE7C ; =ov38_022250FC
	add r0, r6, #0
	mov r2, #0x16
	bl strncmp
	cmp r0, #0
	bne _0221BD54
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x1e
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD54:
	ldr r1, _0221BE80 ; =ov38_02225114
	add r0, r6, #0
	mov r2, #0x16
	bl strncmp
	cmp r0, #0
	bne _0221BD70
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x1f
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD70:
	ldr r0, _0221BE58 ; =_02225040
	ldr r2, [r0, #0x20]
	cmp r4, r2
	ldr r0, [r0, #0x1c]
	bgt _0221BD8A
	add r1, r6, #0
	add r2, r4, #0
	bl memcpy
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #7
	str r1, [r0]
	b _0221BD9A
_0221BD8A:
	add r1, r6, #0
	bl memcpy
	ldr r0, _0221BE58 ; =_02225040
	mov r1, #1
	str r1, [r0]
	mov r1, #0x20
	str r1, [r0, #8]
_0221BD9A:
	ldr r0, _0221BE58 ; =_02225040
	add sp, #0x4c
	str r4, [r0, #0xc]
	pop {r4, r5, r6, r7, pc}
_0221BDA2:
	mov r0, #1
	str r0, [r1]
	cmp r2, #0x13
	bhi _0221BE52
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221BDB6: ; jump table
	.short _0221BE52 - _0221BDB6 - 2 ; case 0
	.short _0221BDDE - _0221BDB6 - 2 ; case 1
	.short _0221BDE6 - _0221BDB6 - 2 ; case 2
	.short _0221BDEE - _0221BDB6 - 2 ; case 3
	.short _0221BDF6 - _0221BDB6 - 2 ; case 4
	.short _0221BDFE - _0221BDB6 - 2 ; case 5
	.short _0221BE06 - _0221BDB6 - 2 ; case 6
	.short _0221BE0E - _0221BDB6 - 2 ; case 7
	.short _0221BE16 - _0221BDB6 - 2 ; case 8
	.short _0221BE1E - _0221BDB6 - 2 ; case 9
	.short _0221BE26 - _0221BDB6 - 2 ; case 10
	.short _0221BE2E - _0221BDB6 - 2 ; case 11
	.short _0221BE36 - _0221BDB6 - 2 ; case 12
	.short _0221BE52 - _0221BDB6 - 2 ; case 13
	.short _0221BE52 - _0221BDB6 - 2 ; case 14
	.short _0221BE3E - _0221BDB6 - 2 ; case 15
	.short _0221BE46 - _0221BDB6 - 2 ; case 16
	.short _0221BE52 - _0221BDB6 - 2 ; case 17
	.short _0221BE52 - _0221BDB6 - 2 ; case 18
	.short _0221BE4E - _0221BDB6 - 2 ; case 19
_0221BDDE:
	mov r0, #8
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDE6:
	mov r0, #9
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDEE:
	mov r0, #0xa
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDF6:
	mov r0, #0xb
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDFE:
	mov r0, #0xc
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE06:
	mov r0, #0xd
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE0E:
	mov r0, #0xe
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE16:
	mov r0, #0xf
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE1E:
	mov r0, #0x10
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE26:
	mov r0, #0x11
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE2E:
	mov r0, #0x12
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE36:
	mov r0, #0x13
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE3E:
	mov r0, #0x16
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE46:
	mov r0, #0x17
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE4E:
	mov r0, #0x19
	str r0, [r1, #8]
_0221BE52:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_0221BE58: .word _02225040
_0221BE5C: .word _02224E4C
_0221BE60: .word ov38_02225074
_0221BE64: .word ov38_0222508C
_0221BE68: .word ov38_02225094
_0221BE6C: .word ov38_0222509C
_0221BE70: .word ov38_022250B4
_0221BE74: .word ov38_022250CC
_0221BE78: .word ov38_022250E4
_0221BE7C: .word ov38_022250FC
_0221BE80: .word ov38_02225114
	thumb_func_end ov38_0221BBD0

	thumb_func_start ov38_0221BE84
ov38_0221BE84: ; 0x0221BE84
	push {r3, lr}
	ldr r0, _0221BEA4 ; =_02225040
	mov r1, #2
	str r1, [r0]
	sub r1, r1, #3
	str r1, [r0, #4]
	mov r0, #0
	bl ov00_021FA0B4
	cmp r0, #0
	bne _0221BEA0
	ldr r0, _0221BEA4 ; =_02225040
	mov r1, #1
	str r1, [r0]
_0221BEA0:
	pop {r3, pc}
	nop
_0221BEA4: .word _02225040
	thumb_func_end ov38_0221BE84

	thumb_func_start ov38_0221BEA8
ov38_0221BEA8: ; 0x0221BEA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _0221BF38 ; =_02225040
	add r4, r3, #0
	ldr r3, [r1]
	add r7, r0, #0
	cmp r3, #2
	beq _0221BEBC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221BEBC:
	str r5, [r1, #0x10]
	str r2, [r1, #0x14]
	str r4, [r1, #0x18]
	ldr r2, [sp, #0x18]
	add r4, #8
	str r2, [r1, #0x1c]
	ldr r2, [sp, #0x1c]
	str r2, [r1, #0x20]
	bl strlen
	add r6, r0, #0
	add r0, r4, #0
	bl ov38_0221BB44
	add r1, r0, #0
	add r6, #0x45
	mov r0, #0xa
	add r1, r6, r1
	bl ov00_021EC2A8
	ldr r1, _0221BF38 ; =_02225040
	cmp r0, #0
	str r0, [r1, #0x24]
	bne _0221BEF0
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221BEF0:
	ldr r1, _0221BF3C ; =ov38_0222512C
	add r2, r7, #0
	add r3, r5, #0
	bl sprintf
	ldr r0, _0221BF38 ; =_02225040
	ldr r6, [r0, #0x24]
	add r0, r6, #0
	bl strlen
	add r5, r0, #0
	ldr r0, _0221BF40 ; =ov38_0222508C
	bl strlen
	add r1, r6, r5
	add r1, r1, r0
	ldr r0, _0221BF38 ; =_02225040
	str r1, [r0, #0x28]
	ldr r0, _0221BF44 ; =ov38_02225094
	bl strlen
	ldr r1, _0221BF38 ; =_02225040
	ldr r2, [r1, #0x28]
	add r2, #0x28
	add r0, r2, r0
	str r0, [r1, #0x2c]
	add r0, r4, #0
	bl ov38_0221BB44
	add r1, r0, #1
	ldr r0, _0221BF38 ; =_02225040
	str r1, [r0, #0x30]
	mov r1, #3
	str r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221BF38: .word _02225040
_0221BF3C: .word ov38_0222512C
_0221BF40: .word ov38_0222508C
_0221BF44: .word ov38_02225094
	thumb_func_end ov38_0221BEA8

	thumb_func_start ov38_0221BF48
ov38_0221BF48: ; 0x0221BF48
	push {r3, lr}
	ldr r1, _0221BFE0 ; =_02225040
	ldr r0, [r1]
	cmp r0, #7
	bhi _0221BFD8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221BF5E: ; jump table
	.short _0221BFD8 - _0221BF5E - 2 ; case 0
	.short _0221BFD8 - _0221BF5E - 2 ; case 1
	.short _0221BFD8 - _0221BF5E - 2 ; case 2
	.short _0221BF6E - _0221BF5E - 2 ; case 3
	.short _0221BF94 - _0221BF5E - 2 ; case 4
	.short _0221BFA4 - _0221BF5E - 2 ; case 5
	.short _0221BFCA - _0221BF5E - 2 ; case 6
	.short _0221BFD8 - _0221BF5E - 2 ; case 7
_0221BF6E:
	ldr r0, [r1, #0x24]
	ldr r1, _0221BFE4 ; =ov38_0221BBD0
	ldr r2, _0221BFE8 ; =_02225040
	bl ov00_021FA21C
	ldr r1, _0221BFE0 ; =_02225040
	str r0, [r1, #4]
	bl ov38_0221BB68
	ldr r0, _0221BFE0 ; =_02225040
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _0221BF8E
	mov r1, #4
	str r1, [r0]
	b _0221BFD8
_0221BF8E:
	mov r1, #1
	str r1, [r0]
	b _0221BFD8
_0221BF94:
	bl ov00_021FA118
	cmp r0, #0
	bne _0221BFD8
	ldr r0, _0221BFE0 ; =_02225040
	mov r1, #1
	str r1, [r0]
	b _0221BFD8
_0221BFA4:
	ldr r0, [r1, #0x24]
	ldr r1, _0221BFE4 ; =ov38_0221BBD0
	ldr r2, _0221BFE8 ; =_02225040
	bl ov00_021FA21C
	ldr r1, _0221BFE0 ; =_02225040
	str r0, [r1, #4]
	bl ov38_0221BB68
	ldr r0, _0221BFE0 ; =_02225040
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _0221BFC4
	mov r1, #6
	str r1, [r0]
	b _0221BFD8
_0221BFC4:
	mov r1, #1
	str r1, [r0]
	b _0221BFD8
_0221BFCA:
	bl ov00_021FA118
	cmp r0, #0
	bne _0221BFD8
	ldr r0, _0221BFE0 ; =_02225040
	mov r1, #1
	str r1, [r0]
_0221BFD8:
	ldr r0, _0221BFE0 ; =_02225040
	ldr r0, [r0]
	pop {r3, pc}
	nop
_0221BFE0: .word _02225040
_0221BFE4: .word ov38_0221BBD0
_0221BFE8: .word _02225040
	thumb_func_end ov38_0221BF48

	thumb_func_start ov38_0221BFEC
ov38_0221BFEC: ; 0x0221BFEC
	push {r3, lr}
	ldr r0, _0221C010 ; =_02225040
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _0221C004
	mov r0, #0xa
	mov r2, #0
	bl ov00_021EC2EC
	ldr r0, _0221C010 ; =_02225040
	mov r1, #0
	str r1, [r0, #0x24]
_0221C004:
	bl ov00_021FA0D8
	ldr r0, _0221C010 ; =_02225040
	mov r1, #1
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_0221C010: .word _02225040
	thumb_func_end ov38_0221BFEC

	thumb_func_start ov38_0221C014
ov38_0221C014: ; 0x0221C014
	ldr r0, _0221C01C ; =_02225040
	ldr r0, [r0, #8]
	bx lr
	nop
_0221C01C: .word _02225040
	thumb_func_end ov38_0221C014

	thumb_func_start ov38_0221C020
ov38_0221C020: ; 0x0221C020
	ldr r0, _0221C028 ; =_02225040
	ldr r0, [r0, #0xc]
	bx lr
	nop
_0221C028: .word _02225040
	thumb_func_end ov38_0221C020

	.rodata

_02224E4C:
	.byte 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x00, 0x00, 0x00, 0x00

	.data

_02225040:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov38_02225074: ; 0x02225074
	.byte 0x73, 0x41, 0x64, 0x65, 0x71, 0x57, 0x6F, 0x33, 0x76, 0x6F, 0x4C, 0x65
	.byte 0x43, 0x35, 0x72, 0x31, 0x36, 0x44, 0x59, 0x76, 0x00, 0x00, 0x00, 0x00

ov38_0222508C: ; 0x0222508C
	.byte 0x26, 0x68, 0x61, 0x73
	.byte 0x68, 0x3D, 0x00, 0x00

ov38_02225094: ; 0x02225094
	.byte 0x26, 0x64, 0x61, 0x74, 0x61, 0x3D, 0x00, 0x00

ov38_0222509C: ; 0x0222509C
	.byte 0x65, 0x72, 0x72, 0x6F
	.byte 0x72, 0x3A, 0x20, 0x63, 0x68, 0x65, 0x63, 0x6B, 0x20, 0x73, 0x75, 0x6D, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00

ov38_022250B4: ; 0x022250B4
	.byte 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x70, 0x69, 0x64, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00

ov38_022250CC: ; 0x022250CC
	.byte 0x65, 0x72, 0x72, 0x6F
	.byte 0x72, 0x3A, 0x20, 0x64, 0x61, 0x74, 0x61, 0x20, 0x6C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00

ov38_022250E4: ; 0x022250E4
	.byte 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x74, 0x6F, 0x6B, 0x65, 0x6E
	.byte 0x20, 0x6E, 0x6F, 0x74, 0x20, 0x66, 0x6F, 0x75, 0x6E, 0x64, 0x00, 0x00

ov38_022250FC: ; 0x022250FC
	.byte 0x65, 0x72, 0x72, 0x6F
	.byte 0x72, 0x3A, 0x20, 0x74, 0x6F, 0x6B, 0x65, 0x6E, 0x20, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x64
	.byte 0x20, 0x20, 0x00, 0x00

ov38_02225114: ; 0x02225114
	.byte 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x69, 0x6E, 0x63, 0x6F, 0x72
	.byte 0x72, 0x65, 0x63, 0x74, 0x20, 0x68, 0x61, 0x73, 0x68, 0x20, 0x00, 0x00

ov38_0222512C: ; 0x0222512C
	.byte 0x25, 0x73, 0x3F, 0x70
	.byte 0x69, 0x64, 0x3D, 0x25, 0x64, 0x00, 0x00, 0x00

	.bss

_02226020:
	.space 0x4
