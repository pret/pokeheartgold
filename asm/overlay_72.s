	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov72_022378C0
ov72_022378C0: ; 0x022378C0
	push {r3, r4}
	ldr r3, _022378D8 ; =_0223B820
	mov r4, #1
	str r4, [r3]
	mov r4, #0
	str r4, [r3, #4]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	pop {r3, r4}
	bx lr
	nop
_022378D8: .word _0223B820
	thumb_func_end ov72_022378C0

	thumb_func_start ov72_022378DC
ov72_022378DC: ; 0x022378DC
	push {r3, lr}
	ldr r1, _02237B48 ; =_0223B820
	ldr r0, [r1]
	cmp r0, #0xc
	bls _022378E8
	b _02237B44
_022378E8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022378F4: ; jump table
	.short _02237B44 - _022378F4 - 2 ; case 0
	.short _02237B44 - _022378F4 - 2 ; case 1
	.short _0223790E - _022378F4 - 2 ; case 2
	.short _02237B38 - _022378F4 - 2 ; case 3
	.short _02237958 - _022378F4 - 2 ; case 4
	.short _02237B38 - _022378F4 - 2 ; case 5
	.short _022379C8 - _022378F4 - 2 ; case 6
	.short _02237B38 - _022378F4 - 2 ; case 7
	.short _02237A3A - _022378F4 - 2 ; case 8
	.short _02237B38 - _022378F4 - 2 ; case 9
	.short _02237AAC - _022378F4 - 2 ; case 10
	.short _02237B38 - _022378F4 - 2 ; case 11
	.short _02237B44 - _022378F4 - 2 ; case 12
_0223790E:
	bl ov38_0221BF48
	cmp r0, #1
	beq _0223791C
	cmp r0, #7
	beq _02237934
	pop {r3, pc}
_0223791C:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 ; =_0223B820
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237934:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C020
	cmp r0, #0
	ble _0223794A
	ldr r0, _02237B4C ; =ov72_0223B920
	ldrb r1, [r0, #3]
	ldr r0, _02237B48 ; =_0223B820
	b _02237950
_0223794A:
	mov r1, #1
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
_02237950:
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237958:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237966
	cmp r0, #7
	beq _0223797E
	pop {r3, pc}
_02237966:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 ; =_0223B820
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_0223797E:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C020
	ldr r1, _02237B50 ; =0x00000A38
	cmp r0, r1
	bne _02237996
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0
	str r1, [r0, #4]
	b _022379C2
_02237996:
	ldr r0, _02237B4C ; =ov72_0223B920
	ldr r0, [r0, #8]
	ldrb r0, [r0]
	cmp r0, #2
	beq _022379A6
	cmp r0, #5
	beq _022379B0
	b _022379BA
_022379A6:
	mov r1, #2
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
	b _022379C2
_022379B0:
	mov r1, #1
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
	b _022379C2
_022379BA:
	mov r1, #4
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
_022379C2:
	bl ov38_0221BFEC
	pop {r3, pc}
_022379C8:
	bl ov38_0221BF48
	cmp r0, #1
	beq _022379D6
	cmp r0, #7
	beq _022379EE
	pop {r3, pc}
_022379D6:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 ; =_0223B820
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_022379EE:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	ldr r2, _02237B4C ; =ov72_0223B920
	str r1, [r0]
	ldrb r2, [r2, #3]
	cmp r2, #5
	bhi _02237A2C
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02237A08: ; jump table
	.short _02237A2C - _02237A08 - 2 ; case 0
	.short _02237A14 - _02237A08 - 2 ; case 1
	.short _02237A1A - _02237A08 - 2 ; case 2
	.short _02237A2C - _02237A08 - 2 ; case 3
	.short _02237A20 - _02237A08 - 2 ; case 4
	.short _02237A26 - _02237A08 - 2 ; case 5
_02237A14:
	mov r1, #0
	str r1, [r0, #4]
	b _02237A34
_02237A1A:
	sub r1, #0xf
	str r1, [r0, #4]
	b _02237A34
_02237A20:
	sub r1, #0xd
	str r1, [r0, #4]
	b _02237A34
_02237A26:
	sub r1, #0xe
	str r1, [r0, #4]
	b _02237A34
_02237A2C:
	mov r1, #4
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
_02237A34:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237A3A:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237A48
	cmp r0, #7
	beq _02237A60
	pop {r3, pc}
_02237A48:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 ; =_0223B820
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237A60:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	ldr r2, _02237B4C ; =ov72_0223B920
	str r1, [r0]
	ldrb r2, [r2, #3]
	cmp r2, #5
	bhi _02237A9E
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02237A7A: ; jump table
	.short _02237A9E - _02237A7A - 2 ; case 0
	.short _02237A86 - _02237A7A - 2 ; case 1
	.short _02237A9E - _02237A7A - 2 ; case 2
	.short _02237A8C - _02237A7A - 2 ; case 3
	.short _02237A92 - _02237A7A - 2 ; case 4
	.short _02237A98 - _02237A7A - 2 ; case 5
_02237A86:
	mov r1, #0
	str r1, [r0, #4]
	b _02237AA6
_02237A8C:
	mov r1, #1
	str r1, [r0, #4]
	b _02237AA6
_02237A92:
	mov r1, #2
	str r1, [r0, #4]
	b _02237AA6
_02237A98:
	sub r1, #0xe
	str r1, [r0, #4]
	b _02237AA6
_02237A9E:
	mov r1, #4
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
_02237AA6:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237AAC:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237ABA
	cmp r0, #7
	beq _02237AD2
	pop {r3, pc}
_02237ABA:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 ; =_0223B820
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237AD2:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	bl ov38_0221C020
	cmp r0, #8
	bne _02237AE8
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0
	str r1, [r0, #4]
	b _02237B32
_02237AE8:
	ldr r0, _02237B4C ; =ov72_0223B920
	ldrb r0, [r0, #3]
	cmp r0, #5
	bhi _02237B2A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237AFC: ; jump table
	.short _02237B2A - _02237AFC - 2 ; case 0
	.short _02237B08 - _02237AFC - 2 ; case 1
	.short _02237B2A - _02237AFC - 2 ; case 2
	.short _02237B10 - _02237AFC - 2 ; case 3
	.short _02237B18 - _02237AFC - 2 ; case 4
	.short _02237B20 - _02237AFC - 2 ; case 5
_02237B08:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #0
	str r1, [r0, #4]
	b _02237B32
_02237B10:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #1
	str r1, [r0, #4]
	b _02237B32
_02237B18:
	ldr r0, _02237B48 ; =_0223B820
	mov r1, #2
	str r1, [r0, #4]
	b _02237B32
_02237B20:
	mov r1, #1
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
	b _02237B32
_02237B2A:
	mov r1, #4
	ldr r0, _02237B48 ; =_0223B820
	mvn r1, r1
	str r1, [r0, #4]
_02237B32:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237B38:
	mov r0, #0xc
	str r0, [r1]
	sub r0, #0x10
	str r0, [r1, #4]
	bl ov38_0221BFEC
_02237B44:
	pop {r3, pc}
	nop
_02237B48: .word _0223B820
_02237B4C: .word ov72_0223B920
_02237B50: .word 0x00000A38
	thumb_func_end ov72_022378DC

	thumb_func_start ov72_02237B54
ov72_02237B54: ; 0x02237B54
	ldr r1, _02237B70 ; =_0223B820
	ldr r0, [r1]
	cmp r0, #1
	beq _02237B62
	cmp r0, #0xc
	beq _02237B66
	b _02237B6C
_02237B62:
	mov r0, #1
	bx lr
_02237B66:
	mov r0, #1
	str r0, [r1]
	bx lr
_02237B6C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02237B70: .word _0223B820
	thumb_func_end ov72_02237B54

	thumb_func_start ov72_02237B74
ov72_02237B74: ; 0x02237B74
	ldr r0, _02237B7C ; =_0223B820
	ldr r0, [r0, #4]
	bx lr
	nop
_02237B7C: .word _0223B820
	thumb_func_end ov72_02237B74

	thumb_func_start ov72_02237B80
ov72_02237B80: ; 0x02237B80
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov38_0221BE84
	ldr r0, _02237BC0 ; =_0223B820
	sub r1, r4, #1
	strb r1, [r0, #0x14]
	mov r0, #2
	str r0, [sp]
	ldr r0, _02237BC4 ; =_0223B4E0
	ldr r1, _02237BC8 ; =ov72_0223B834
	ldr r3, _02237BCC ; =ov72_0223B923
	mov r2, #1
	bl ov72_02237D50
	cmp r0, #0
	beq _02237BAE
	ldr r0, _02237BC0 ; =_0223B820
	mov r1, #2
	str r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
_02237BAE:
	ldr r0, _02237BC0 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	sub r1, #0x11
	str r1, [r0, #4]
	bl ov38_0221BFEC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02237BC0: .word _0223B820
_02237BC4: .word _0223B4E0
_02237BC8: .word ov72_0223B834
_02237BCC: .word ov72_0223B923
	thumb_func_end ov72_02237B80

	thumb_func_start ov72_02237BD0
ov72_02237BD0: ; 0x02237BD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _02237C1C ; =ov72_0223B920
	add r6, r2, #0
	add r4, r1, #0
	str r6, [r0, #8]
	bl ov38_0221BE84
	ldr r0, _02237C20 ; =_0223B820
	sub r1, r5, #1
	strb r1, [r0, #0x14]
	sub r1, r4, #1
	strb r1, [r0, #0x15]
	ldr r0, _02237C24 ; =0x00000A38
	ldr r1, _02237C28 ; =ov72_0223B834
	str r0, [sp]
	ldr r0, _02237C2C ; =ov72_0223B52C
	mov r2, #2
	add r3, r6, #0
	bl ov72_02237D50
	cmp r0, #0
	beq _02237C0A
	ldr r0, _02237C20 ; =_0223B820
	mov r1, #4
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02237C0A:
	ldr r0, _02237C20 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	sub r1, #0x11
	str r1, [r0, #4]
	bl ov38_0221BFEC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02237C1C: .word ov72_0223B920
_02237C20: .word _0223B820
_02237C24: .word 0x00000A38
_02237C28: .word ov72_0223B834
_02237C2C: .word ov72_0223B52C
	thumb_func_end ov72_02237BD0

	thumb_func_start ov72_02237C30
ov72_02237C30: ; 0x02237C30
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl ov38_0221BE84
	ldr r0, _02237C94 ; =ov72_0223B834
	add r1, r4, #0
	mov r2, #0xe4
	bl memcpy
	ldr r0, _02237C98 ; =ov72_0223B900
	sub r1, r5, #1
	strb r1, [r0, #0x18]
	sub r1, r6, #1
	strb r1, [r0, #0x19]
	ldr r3, _02237C9C ; =ov72_0223B91B
	ldr r2, _02237CA0 ; =ov72_0223B82C
	strb r7, [r0, #0x1a]
	mov r1, #8
_02237C5A:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _02237C5A
	mov r0, #2
	str r0, [sp]
	ldr r0, _02237CA4 ; =ov72_0223B578
	ldr r1, _02237C94 ; =ov72_0223B834
	ldr r3, _02237CA8 ; =ov72_0223B923
	mov r2, #0xef
	bl ov72_02237D50
	cmp r0, #0
	beq _02237C82
	ldr r0, _02237CAC ; =_0223B820
	mov r1, #6
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_02237C82:
	ldr r0, _02237CAC ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	sub r1, #0x11
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237C94: .word ov72_0223B834
_02237C98: .word ov72_0223B900
_02237C9C: .word ov72_0223B91B
_02237CA0: .word ov72_0223B82C
_02237CA4: .word ov72_0223B578
_02237CA8: .word ov72_0223B923
_02237CAC: .word _0223B820
	thumb_func_end ov72_02237C30

	thumb_func_start ov72_02237CB0
ov72_02237CB0: ; 0x02237CB0
	push {r3, lr}
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	ldr r0, _02237CE4 ; =ov72_0223B5C4
	ldr r1, _02237CE8 ; =ov72_0223B834
	ldr r3, _02237CEC ; =ov72_0223B923
	mov r2, #0
	bl ov72_02237D50
	cmp r0, #0
	beq _02237CD2
	ldr r0, _02237CF0 ; =_0223B820
	mov r1, #8
	str r1, [r0]
	pop {r3, pc}
_02237CD2:
	ldr r0, _02237CF0 ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	sub r1, #0x11
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	nop
_02237CE4: .word ov72_0223B5C4
_02237CE8: .word ov72_0223B834
_02237CEC: .word ov72_0223B923
_02237CF0: .word _0223B820
	thumb_func_end ov72_02237CB0

	thumb_func_start ov72_02237CF4
ov72_02237CF4: ; 0x02237CF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x1c
	add r4, r1, #0
	bl OS_GetMacAddress
	ldr r0, _02237D40 ; =ov72_0223B834
	add r1, r5, #0
	mov r2, #0x64
	bl memcpy
	ldr r0, _02237D44 ; =ov72_0223B920
	str r4, [r0, #8]
	bl ov38_0221BE84
	mov r0, #8
	str r0, [sp]
	ldr r3, _02237D44 ; =ov72_0223B920
	ldr r0, _02237D48 ; =ov72_0223B60C
	ldr r1, _02237D40 ; =ov72_0223B834
	ldr r3, [r3, #8]
	mov r2, #0x64
	bl ov72_02237D50
	cmp r0, #0
	beq _02237D30
	ldr r0, _02237D4C ; =_0223B820
	mov r1, #0xa
	str r1, [r0]
	pop {r3, r4, r5, pc}
_02237D30:
	ldr r0, _02237D4C ; =_0223B820
	mov r1, #0xc
	str r1, [r0]
	sub r1, #0x11
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02237D40: .word ov72_0223B834
_02237D44: .word ov72_0223B920
_02237D48: .word ov72_0223B60C
_02237D4C: .word _0223B820
	thumb_func_end ov72_02237CF4

	thumb_func_start ov72_02237D50
ov72_02237D50: ; 0x02237D50
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, [sp, #0x18]
	str r3, [sp]
	str r1, [sp, #4]
	add r4, r2, #0
	ldr r1, _02237D84 ; =_0223B820
	add r2, r5, #0
	ldr r1, [r1, #8]
	add r3, r4, #0
	bl ov38_0221BEA8
	cmp r0, #0
	beq _02237D76
	cmp r0, #1
	beq _02237D7C
	cmp r0, #2
	b _02237D7C
_02237D76:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_02237D7C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02237D84: .word _0223B820
	thumb_func_end ov72_02237D50

	thumb_func_start ov72_02237D88
ov72_02237D88: ; 0x02237D88
	push {r4, lr}
	cmp r0, #0x20
	bhi _02237E00
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237D9A: ; jump table
	.short _02237DDC - _02237D9A - 2 ; case 0
	.short _02237DDC - _02237D9A - 2 ; case 1
	.short _02237DE2 - _02237D9A - 2 ; case 2
	.short _02237DDC - _02237D9A - 2 ; case 3
	.short _02237DDC - _02237D9A - 2 ; case 4
	.short _02237DDC - _02237D9A - 2 ; case 5
	.short _02237DDC - _02237D9A - 2 ; case 6
	.short _02237E00 - _02237D9A - 2 ; case 7
	.short _02237DE2 - _02237D9A - 2 ; case 8
	.short _02237DDC - _02237D9A - 2 ; case 9
	.short _02237DDC - _02237D9A - 2 ; case 10
	.short _02237DE8 - _02237D9A - 2 ; case 11
	.short _02237DEE - _02237D9A - 2 ; case 12
	.short _02237DEE - _02237D9A - 2 ; case 13
	.short _02237DDC - _02237D9A - 2 ; case 14
	.short _02237DFA - _02237D9A - 2 ; case 15
	.short _02237DF4 - _02237D9A - 2 ; case 16
	.short _02237DF4 - _02237D9A - 2 ; case 17
	.short _02237DF4 - _02237D9A - 2 ; case 18
	.short _02237DF4 - _02237D9A - 2 ; case 19
	.short _02237DDC - _02237D9A - 2 ; case 20
	.short _02237DDC - _02237D9A - 2 ; case 21
	.short _02237DDC - _02237D9A - 2 ; case 22
	.short _02237DDC - _02237D9A - 2 ; case 23
	.short _02237E00 - _02237D9A - 2 ; case 24
	.short _02237DE2 - _02237D9A - 2 ; case 25
	.short _02237DF4 - _02237D9A - 2 ; case 26
	.short _02237DF4 - _02237D9A - 2 ; case 27
	.short _02237DF4 - _02237D9A - 2 ; case 28
	.short _02237DF4 - _02237D9A - 2 ; case 29
	.short _02237DFA - _02237D9A - 2 ; case 30
	.short _02237DF4 - _02237D9A - 2 ; case 31
	.short _02237DDC - _02237D9A - 2 ; case 32
_02237DDC:
	mov r4, #4
	mvn r4, r4
	b _02237E04
_02237DE2:
	mov r4, #4
	mvn r4, r4
	b _02237E04
_02237DE8:
	mov r4, #6
	mvn r4, r4
	b _02237E04
_02237DEE:
	mov r4, #6
	mvn r4, r4
	b _02237E04
_02237DF4:
	mov r4, #1
	mvn r4, r4
	b _02237E04
_02237DFA:
	mov r4, #1
	mvn r4, r4
	b _02237E04
_02237E00:
	mov r4, #4
	mvn r4, r4
_02237E04:
	mov r0, #4
	mvn r0, r0
	cmp r4, r0
	beq _02237E1C
	bl WCM_GetPhase
	cmp r0, #9
	beq _02237E18
	mov r4, #5
	mvn r4, r4
_02237E18:
	bl ov00_021EC210
_02237E1C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov72_02237D88

	thumb_func_start ov72_02237E20
ov72_02237E20: ; 0x02237E20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02237E36
	cmp r0, #1
	bne _02237E34
	b _02237F4A
_02237E34:
	b _02237F60
_02237E36:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02237F68 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02237F6C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r2, #5
	mov r0, #3
	mov r1, #0x43
	lsl r2, r2, #0x10
	bl CreateHeap
	bl LoadDwcOverlay
	bl LoadOVY38
	mov r0, #0x43
	bl sub_02039FD8
	ldr r1, _02237F70 ; =0x000013A4
	add r0, r6, #0
	mov r2, #0x43
	bl OverlayManager_CreateAndGetData
	ldr r2, _02237F70 ; =0x000013A4
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x43
	bl BgConfig_Alloc
	str r0, [r4, #4]
	ldr r0, _02237F74 ; =ov72_0223B92C
	add r2, sp, #0
	ldr r3, _02237F78 ; =ov72_0223B354
	str r4, [r0, #4]
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r7, #0
	bl SetBothScreensModesAndDisable
	mov r0, #0xb
	mov r1, #0x20
	mov r2, #0x43
	bl ScrStrBufs_new_custom
	mov r1, #0xbd
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _02237F7C ; =0x00000306
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x43
	bl NewMsgDataFromNarc
	ldr r1, _02237F80 ; =0x00000BD4
	ldr r2, _02237F84 ; =0x0000030A
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x43
	bl NewMsgDataFromNarc
	ldr r1, _02237F88 ; =0x00000BD8
	str r0, [r4, r1]
	mov r2, #0x32
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	mov r3, #0x43
	bl NewMsgDataFromNarc
	ldr r1, _02237F8C ; =0x00000BDC
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	add r1, r6, #0
	bl ov72_02238144
	add r0, r4, #0
	bl ov72_022387D8
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	ldr r1, _02237F90 ; =0x00020020
	mov r0, #0x43
	bl AllocFromHeap
	str r0, [r4, #0x24]
	add r0, #0x1f
	mov r1, #0x1f
	bic r0, r1
	mov r1, #2
	lsl r1, r1, #0x10
	mov r2, #0
	bl NNS_FndCreateExpHeapEx
	str r0, [r4, #0x28]
	ldr r1, _02237F94 ; =0x0000047D
	mov r0, #0xb
	mov r2, #1
	bl sub_02004EC4
	mov r0, #1
	bl sub_02002B8C
	ldr r2, _02237F98 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #1
	str r0, [r5]
	b _02237F60
_02237F4A:
	bl sub_02034D8C
	mov r0, #4
	mov r1, #0x43
	bl FontID_Alloc
	mov r0, #0
	str r0, [r5]
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02237F60:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237F68: .word 0xFFFFE0FF
_02237F6C: .word 0x04001000
_02237F70: .word 0x000013A4
_02237F74: .word ov72_0223B92C
_02237F78: .word ov72_0223B354
_02237F7C: .word 0x00000306
_02237F80: .word 0x00000BD4
_02237F84: .word 0x0000030A
_02237F88: .word 0x00000BD8
_02237F8C: .word 0x00000BDC
_02237F90: .word 0x00020020
_02237F94: .word 0x0000047D
_02237F98: .word 0x04000304
	thumb_func_end ov72_02237E20

	thumb_func_start ov72_02237F9C
ov72_02237F9C: ; 0x02237F9C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	bl ov00_021ECB40
	bl ov72_022378DC
	bl ov00_021ECB40
	ldr r1, [r4]
	cmp r1, #5
	bhi _02238044
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237FC4: ; jump table
	.short _02237FD0 - _02237FC4 - 2 ; case 0
	.short _02237FEC - _02237FC4 - 2 ; case 1
	.short _02238000 - _02237FC4 - 2 ; case 2
	.short _0223800E - _02237FC4 - 2 ; case 3
	.short _02238022 - _02237FC4 - 2 ; case 4
	.short _02238040 - _02237FC4 - 2 ; case 5
_02237FD0:
	bl sub_02034DB8
	cmp r0, #0
	beq _02238044
	ldr r1, [r5, #0x28]
	ldr r0, _02238054 ; =ov72_0223B92C
	str r1, [r0]
	ldr r0, _02238058 ; =ov72_02238778
	ldr r1, _0223805C ; =ov72_022387A0
	bl ov00_021EC294
	mov r0, #1
	str r0, [r4]
	b _02238044
_02237FEC:
	ldr r3, [r5, #0x10]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _02238060 ; =ov72_0223B654
	add r0, r5, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r4]
	b _02238044
_02238000:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02238044
	mov r0, #3
	str r0, [r4]
	b _02238044
_0223800E:
	ldr r3, [r5, #0x10]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _02238064 ; =ov72_0223B658
	add r0, r5, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r4]
	b _02238044
_02238022:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02238044
	ldr r3, [r5, #0x10]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _02238068 ; =ov72_0223B65C
	ldr r1, [r4]
	ldr r2, [r2, r6]
	add r0, r5, #0
	blx r2
	str r0, [r4]
	b _02238044
_02238040:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02238044:
	ldr r0, _0223806C ; =0x00000BF8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02238050
	bl sub_0202457C
_02238050:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02238054: .word ov72_0223B92C
_02238058: .word ov72_02238778
_0223805C: .word ov72_022387A0
_02238060: .word ov72_0223B654
_02238064: .word ov72_0223B658
_02238068: .word ov72_0223B65C
_0223806C: .word 0x00000BF8
	thumb_func_end ov72_02237F9C

	thumb_func_start ov72_02238070
ov72_02238070: ; 0x02238070
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _02238086
	mov r0, #0
	pop {r3, r4, r5, pc}
_02238086:
	mov r0, #0
	bl sub_02002B8C
	mov r0, #4
	bl FontID_Release
	ldr r0, [r4, #0x24]
	bl FreeToHeap
	bl UnloadOVY38
	bl UnloadDwcOverlay
	add r0, r4, #0
	bl ov72_02238800
	ldr r0, _022380F0 ; =0x00000BDC
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _022380F4 ; =0x00000BD8
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _022380F8 ; =0x00000BD4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl ov72_02238160
	bl sub_02034DE0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x43
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022380F0: .word 0x00000BDC
_022380F4: .word 0x00000BD8
_022380F8: .word 0x00000BD4
	thumb_func_end ov72_02238070

	thumb_func_start ov72_022380FC
ov72_022380FC: ; 0x022380FC
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _0223811C ; =0x027E0000
	ldr r1, _02238120 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_0223811C: .word 0x027E0000
_02238120: .word 0x00003FF8
	thumb_func_end ov72_022380FC

	thumb_func_start ov72_02238124
ov72_02238124: ; 0x02238124
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02238140 ; =ov72_0223B37C
	add r3, sp, #0
	mov r2, #5
_0223812E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0223812E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_02238140: .word ov72_0223B37C
	thumb_func_end ov72_02238124

	thumb_func_start ov72_02238144
ov72_02238144: ; 0x02238144
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetParentWork
	mov r1, #0
	str r0, [r4]
	add r0, r4, #0
	add r2, r1, #0
	str r1, [r4, #0x10]
	bl ov72_022387D0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_02238144

	thumb_func_start ov72_02238160
ov72_02238160: ; 0x02238160
	bx lr
	.balign 4, 0
	thumb_func_end ov72_02238160

	thumb_func_start ov72_02238164
ov72_02238164: ; 0x02238164
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02238190 ; =ov72_0223B344
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x43
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02238190: .word ov72_0223B344
	thumb_func_end ov72_02238164

	thumb_func_start ov72_02238194
ov72_02238194: ; 0x02238194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0xef
	mov r1, #0x43
	bl NARC_ctor
	str r0, [sp, #0x14]
	mov r0, #0xee
	mov r1, #0x43
	bl NARC_ctor
	add r7, r0, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x43
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	ldr r1, _022383AC ; =0x00000BFC
	mov r0, #0x14
	add r1, r5, r1
	mov r2, #0x43
	bl G2dRenderer_Init
	ldr r1, _022383B0 ; =0x00000BF8
	mov r2, #1
	str r0, [r5, r1]
	add r0, r1, #4
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r6, #0
	add r4, r5, #0
_022381EC:
	mov r0, #3
	add r1, r6, #0
	mov r2, #0x43
	bl Create2DGfxResObjMan
	ldr r1, _022383B4 ; =0x00000D24
	add r6, r6, #1
	str r0, [r4, r1]
	add r4, r4, #4
	cmp r6, #4
	blt _022381EC
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x43
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #1
	bl AddCharResObjFromOpenNarc
	ldr r1, _022383B8 ; =0x00000D34
	mov r2, #0
	str r0, [r5, r1]
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x43
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
	ldr r1, _022383BC ; =0x00000D38
	mov r3, #0
	str r0, [r5, r1]
	str r3, [sp]
	mov r2, #2
	str r2, [sp, #4]
	mov r0, #0x43
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _022383C0 ; =0x00000D3C
	mov r3, #0
	str r0, [r5, r1]
	str r3, [sp]
	mov r2, #3
	str r2, [sp, #4]
	mov r0, #0x43
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x35
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x43
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #5
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	ldr r1, _022383C4 ; =0x00000D44
	mov r2, #4
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x43
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	ldr r1, _022383C8 ; =0x00000D48
	mov r2, #6
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x43
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _022383CC ; =0x00000D4C
	mov r2, #7
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x43
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xd5
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x43
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	mov r2, #0xc
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	ldr r1, _022383D0 ; =0x00000D54
	mov r2, #0xb
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x43
	sub r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	ldr r1, _022383D4 ; =0x00000D58
	mov r2, #0xd
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x43
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _022383D8 ; =0x00000D5C
	mov r2, #0xe
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x43
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xd6
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r1, #0x2c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	ldr r0, _022383C4 ; =0x00000D44
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	ldr r0, _022383D0 ; =0x00000D54
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	ldr r0, _022383BC ; =0x00000D38
	ldr r0, [r5, r0]
	bl sub_0200AF94
	ldr r0, _022383C8 ; =0x00000D48
	ldr r0, [r5, r0]
	bl sub_0200AF94
	ldr r0, _022383D4 ; =0x00000D58
	ldr r0, [r5, r0]
	bl sub_0200AF94
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022383AC: .word 0x00000BFC
_022383B0: .word 0x00000BF8
_022383B4: .word 0x00000D24
_022383B8: .word 0x00000D34
_022383BC: .word 0x00000D38
_022383C0: .word 0x00000D3C
_022383C4: .word 0x00000D44
_022383C8: .word 0x00000D48
_022383CC: .word 0x00000D4C
_022383D0: .word 0x00000D54
_022383D4: .word 0x00000D58
_022383D8: .word 0x00000D5C
	thumb_func_end ov72_02238194

	thumb_func_start ov72_022383DC
ov72_022383DC: ; 0x022383DC
	push {r3, r4}
	ldr r4, _02238404 ; =0x00000BF8
	ldr r1, [r1, r4]
	str r1, [r0]
	str r2, [r0, #4]
	mov r2, #0
	mov r1, #1
	str r2, [r0, #0x10]
	lsl r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	mov r1, #1
	str r1, [r0, #0x24]
	str r3, [r0, #0x28]
	mov r1, #0x43
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02238404: .word 0x00000BF8
	thumb_func_end ov72_022383DC

	thumb_func_start ov72_02238408
ov72_02238408: ; 0x02238408
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _02238638 ; =0x00000D24
	str r1, [sp, #0x10]
	ldr r0, [r6, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r6, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r6, r0]
	add r2, #0x40
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r6, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, _02238638 ; =0x00000D24
	str r0, [sp, #0x10]
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r6, r2]
	add r3, #0x64
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	mov r1, #2
	str r1, [sp]
	sub r0, r1, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, _02238638 ; =0x00000D24
	str r0, [sp, #0x10]
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r6, r2]
	add r3, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r2, _0223863C ; =0x00000D64
	add r0, sp, #0x2c
	add r1, r6, #0
	add r2, r6, r2
	mov r3, #2
	bl ov72_022383DC
	ldr r4, _02238640 ; =ov72_0223B364
	mov r7, #0
	add r5, r6, #0
_022384D4:
	ldrh r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #2]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, _02238644 ; =0x00000DF4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02238644 ; =0x00000DF4
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02238644 ; =0x00000DF4
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #3
	blt _022384D4
	ldr r2, _02238648 ; =0x00000D88
	add r0, sp, #0x2c
	add r1, r6, #0
	add r2, r6, r2
	mov r3, #2
	bl ov72_022383DC
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r0, _0223864C ; =0x00151000
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xe
	lsl r1, r1, #8
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xe
	lsl r0, r0, #8
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xe
	lsl r0, r0, #8
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r0, _02238650 ; =0x00129000
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, _02238654 ; =0x00000E04
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02238654 ; =0x00000E04
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02238654 ; =0x00000E04
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	ldr r4, _02238658 ; =ov72_0223B338
	mov r7, #0
	add r5, r6, #0
_02238592:
	ldrh r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #2]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, _0223865C ; =0x00000E08
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0223865C ; =0x00000E08
	mov r1, #3
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223865C ; =0x00000E08
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024A04
	ldr r0, _0223865C ; =0x00000E08
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #3
	blt _02238592
	ldr r2, _02238660 ; =0x00000DAC
	add r0, sp, #0x2c
	add r1, r6, #0
	add r2, r6, r2
	mov r3, #2
	bl ov72_022383DC
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x34]
	ldr r0, _0223864C ; =0x00151000
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, _02238664 ; =0x00000E14
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02238664 ; =0x00000E14
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02238664 ; =0x00000E14
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	bl sub_0203A880
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02238638: .word 0x00000D24
_0223863C: .word 0x00000D64
_02238640: .word ov72_0223B364
_02238644: .word 0x00000DF4
_02238648: .word 0x00000D88
_0223864C: .word 0x00151000
_02238650: .word 0x00129000
_02238654: .word 0x00000E04
_02238658: .word ov72_0223B338
_0223865C: .word 0x00000E08
_02238660: .word 0x00000DAC
_02238664: .word 0x00000E14
	thumb_func_end ov72_02238408

	thumb_func_start ov72_02238668
ov72_02238668: ; 0x02238668
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020168F4
	add r4, r0, #0
	beq _0223867A
	add r0, r5, #0
	bl sub_02016624
_0223867A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov72_02238668

	thumb_func_start ov72_02238680
ov72_02238680: ; 0x02238680
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end ov72_02238680

	thumb_func_start ov72_02238688
ov72_02238688: ; 0x02238688
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #0
	ble _022386A6
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022386B4
_022386A6:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022386B4:
	bl _ffix
	str r0, [sp]
	cmp r5, #0
	ble _022386D0
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022386DE
_022386D0:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022386DE:
	bl _ffix
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov72_02238688

	thumb_func_start ov72_022386F4
ov72_022386F4: ; 0x022386F4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02238728 ; =ov72_0223B3A4
	lsl r3, r4, #2
	ldr r2, _0223872C ; =ov72_0223B3A6
	ldrh r1, [r1, r3]
	ldrh r3, [r2, r3]
	mov r2, #1
	lsl r2, r2, #8
	add r2, r3, r2
	add r5, r0, #0
	bl ov72_02238688
	cmp r4, #0xa
	bge _0223871C
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_0223871C:
	add r0, r5, #0
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
	nop
_02238728: .word ov72_0223B3A4
_0223872C: .word ov72_0223B3A6
	thumb_func_end ov72_022386F4

	thumb_func_start ov72_02238730
ov72_02238730: ; 0x02238730
	push {r4, lr}
	add r4, r2, #0
	mov r3, #0xc
	mul r4, r3
	ldr r3, _02238748 ; =ov72_0223B364
	lsl r2, r1, #2
	add r1, r3, r4
	ldrh r1, [r2, r1]
	ldr r2, _0223874C ; =0x00000129
	bl ov72_02238688
	pop {r4, pc}
	.balign 4, 0
_02238748: .word ov72_0223B364
_0223874C: .word 0x00000129
	thumb_func_end ov72_02238730

	thumb_func_start ov72_02238750
ov72_02238750: ; 0x02238750
	push {r3, r4, r5, lr}
	add r3, r2, #0
	mov r5, #0xc
	lsl r4, r1, #2
	mul r3, r5
	ldr r2, _02238770 ; =ov72_0223B366
	ldr r1, _02238774 ; =ov72_0223B364
	add r2, r2, r3
	add r1, r1, r3
	ldrh r2, [r4, r2]
	add r5, #0xf4
	ldrh r1, [r4, r1]
	add r2, r2, r5
	bl ov72_02238688
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238770: .word ov72_0223B366
_02238774: .word ov72_0223B364
	thumb_func_end ov72_02238750

	thumb_func_start ov72_02238778
ov72_02238778: ; 0x02238778
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl OS_DisableInterrupts
	add r6, r0, #0
	ldr r0, _0223879C ; =ov72_0223B92C
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r4, #0
	bl NNS_FndAllocFromExpHeapEx
	add r4, r0, #0
	add r0, r6, #0
	bl OS_RestoreInterrupts
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223879C: .word ov72_0223B92C
	thumb_func_end ov72_02238778

	thumb_func_start ov72_022387A0
ov72_022387A0: ; 0x022387A0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	beq _022387BC
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _022387C0 ; =ov72_0223B92C
	add r1, r5, #0
	ldr r0, [r0]
	bl NNS_FndFreeToExpHeap
	add r0, r4, #0
	bl OS_RestoreInterrupts
_022387BC:
	pop {r3, r4, r5, pc}
	nop
_022387C0: .word ov72_0223B92C
	thumb_func_end ov72_022387A0

	thumb_func_start ov72_022387C4
ov72_022387C4: ; 0x022387C4
	push {r3, lr}
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	pop {r3, pc}
	thumb_func_end ov72_022387C4

	thumb_func_start ov72_022387D0
ov72_022387D0: ; 0x022387D0
	str r1, [r0, #0x14]
	str r2, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov72_022387D0

	thumb_func_start ov72_022387D8
ov72_022387D8: ; 0x022387D8
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02238124
	bl ov72_02238164
	add r0, r4, #0
	bl ov72_02238194
	add r0, r4, #0
	bl ov72_02238408
	ldr r0, _022387FC ; =ov72_022380FC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	nop
_022387FC: .word ov72_022380FC
	thumb_func_end ov72_022387D8

	thumb_func_start ov72_02238800
ov72_02238800: ; 0x02238800
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02238854 ; =0x00000D34
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	ldr r0, _02238858 ; =0x00000D44
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	ldr r0, _0223885C ; =0x00000D38
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	ldr r0, _02238860 ; =0x00000D48
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	ldr r7, _02238864 ; =0x00000D24
	mov r4, #0
	add r5, r6, #0
_0223882A:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223882A
	ldr r0, _02238868 ; =0x00000BF8
	ldr r0, [r6, r0]
	bl sub_02024504
	ldr r0, _02238868 ; =0x00000BF8
	mov r1, #0
	str r1, [r6, r0]
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238854: .word 0x00000D34
_02238858: .word 0x00000D44
_0223885C: .word 0x00000D38
_02238860: .word 0x00000D48
_02238864: .word 0x00000D24
_02238868: .word 0x00000BF8
	thumb_func_end ov72_02238800

	thumb_func_start ov72_0223886C
ov72_0223886C: ; 0x0223886C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov72_02239040
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x43
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	bl ov72_022389C8
	add r0, r4, #0
	bl ov72_02238BEC
	add r0, r4, #0
	bl ov72_02238EE4
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0202D488
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x90
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x9c
	str r1, [r0]
	ldr r0, _02238940 ; =0x00000F4C
	mov r1, #0
	str r1, [r4, r0]
	bl ov00_021EC5B4
	cmp r0, #0
	bne _0223892E
	ldr r1, [r4]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	beq _02238922
	ldr r0, [r1, #0xc]
	bl sub_02039418
	ldr r0, _02238944 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _02238948 ; =0x00000BD8
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #2
	bl ov72_02238680
	add r0, r4, #0
	bl ov72_0223A420
	b _0223893A
_02238922:
	mov r0, #4
	bl Sys_ClearSleepDisableFlag
	mov r0, #0
	str r0, [r4, #0x1c]
	b _0223893A
_0223892E:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_02039418
	mov r0, #0x33
	str r0, [r4, #0x1c]
_0223893A:
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02238940: .word 0x00000F4C
_02238944: .word 0x00000F0F
_02238948: .word 0x00000BD8
	thumb_func_end ov72_0223886C

	thumb_func_start ov72_0223894C
ov72_0223894C: ; 0x0223894C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov72_022387C4
	bl sub_0203A930
	ldr r4, [r5, #0x1c]
	ldr r1, _02238978 ; =ov72_0223B660
	lsl r2, r4, #2
	ldr r1, [r1, r2]
	add r0, r5, #0
	blx r1
	ldr r1, [r5, #0x1c]
	cmp r4, r1
	beq _02238976
	mov r1, #0xfd
	mov r2, #0
	lsl r1, r1, #4
	strh r2, [r5, r1]
	add r1, r1, #2
	strh r2, [r5, r1]
_02238976:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238978: .word ov72_0223B660
	thumb_func_end ov72_0223894C

	thumb_func_start ov72_0223897C
ov72_0223897C: ; 0x0223897C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _022389C0 ; =0x00000FD8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238996
	bl DestroySysTask
	ldr r0, _022389C0 ; =0x00000FD8
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_02238996:
	add r0, r4, #0
	bl ov72_02239098
	add r0, r4, #0
	bl ov72_02238FFC
	ldr r0, [r4, #4]
	bl ov72_02238AEC
	ldr r0, _022389C4 ; =0x00000FDC
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x10]
	cmp r0, #0
	bne _022389BA
	mov r0, #5
	pop {r4, pc}
_022389BA:
	mov r0, #1
	pop {r4, pc}
	nop
_022389C0: .word 0x00000FD8
_022389C4: .word 0x00000FDC
	thumb_func_end ov72_0223897C

	thumb_func_start ov72_022389C8
ov72_022389C8: ; 0x022389C8
	push {r4, r5, lr}
	sub sp, #0x8c
	ldr r5, _02238AD8 ; =ov72_0223B42C
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x70
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02238ADC ; =ov72_0223B410
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r5, _02238AE0 ; =ov72_0223B448
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02238AE4 ; =ov72_0223B3D8
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r5, _02238AE8 ; =ov72_0223B3F4
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x43
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x43
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x43
	bl BG_ClearCharDataRange
	add sp, #0x8c
	pop {r4, r5, pc}
	nop
_02238AD8: .word ov72_0223B42C
_02238ADC: .word ov72_0223B410
_02238AE0: .word ov72_0223B448
_02238AE4: .word ov72_0223B3D8
_02238AE8: .word ov72_0223B3F4
	thumb_func_end ov72_022389C8

	thumb_func_start ov72_02238AEC
ov72_02238AEC: ; 0x02238AEC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov72_02238AEC

	thumb_func_start ov72_02238B18
ov72_02238B18: ; 0x02238B18
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5, #4]
	cmp r1, #0
	bne _02238B86
	mov r0, #0x58
	mov r1, #0x43
	bl NARC_ctor
	mov r1, #1
	lsl r1, r1, #8
	str r1, [sp]
	mov r1, #0x43
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #4
	mov r3, #0
	add r6, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xb
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xc
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, _02238BE8 ; =0x00001304
	mov r1, #0
	str r1, [r5, r0]
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
_02238B86:
	mov r0, #0xee
	mov r1, #0x43
	bl NARC_ctor
	ldr r1, _02238BE8 ; =0x00001304
	mov r2, #1
	str r2, [r5, r1]
	mov r1, #0x40
	str r1, [sp]
	mov r1, #0x43
	str r1, [sp, #4]
	mov r1, #8
	mov r2, #4
	mov r3, #0
	add r6, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #9
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xa
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02238BE8: .word 0x00001304
	thumb_func_end ov72_02238B18

	thumb_func_start ov72_02238BEC
ov72_02238BEC: ; 0x02238BEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	mov r0, #0x58
	mov r1, #0x43
	bl NARC_ctor
	mov r2, #0
	str r2, [sp]
	mov r1, #0x43
	str r1, [sp, #4]
	mov r1, #3
	add r3, r2, #0
	str r0, [sp, #0x2c]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x43
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r1, #3
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x43
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x43
	bl LoadFontPal1
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x43
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x43
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x43
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #2
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #6
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #0xb
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #0xc
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r2, #0x33
	ldr r1, _02238E28 ; =0x00000FD8
	ldr r0, [sp, #0x10]
	lsl r2, r2, #4
	add r0, r0, r1
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x2c]
	mov r1, #5
	add r2, sp, #0x38
	mov r3, #0x43
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r4, r0, #0
	ldr r0, [sp, #0x38]
	mov r2, #0xfe
	ldr r1, [sp, #0x10]
	lsl r2, r2, #4
	add r1, r1, r2
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x38]
	ldr r2, _02238E2C ; =0x00001060
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	add r1, r1, r2
	mov r2, #0x80
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, _02238E2C ; =0x00001060
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	sub r1, #0x80
	add r0, r0, r1
	str r0, [sp, #0x14]
_02238D5E:
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r1, r0, #5
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x30]
_02238D70:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _02238D7A
	bl GF_AssertFail
_02238D7A:
	ldr r0, [sp, #0x30]
	mov r7, #1
	add r4, r0, #2
	ldr r0, [sp, #0x18]
	add r6, r0, #2
	ldr r0, [sp, #0x14]
	add r5, r0, #2
	ldr r0, [sp, #0x20]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x34]
_02238D92:
	mov r0, #0xfe
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	bl sub_02003DE8
	add r7, r7, #1
	add r4, r4, #2
	add r6, r6, #2
	add r5, r5, #2
	cmp r7, #0x10
	blt _02238D92
	ldr r0, [sp, #0x18]
	add r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _02238DDE
	mov r0, #3
	ldr r1, [sp, #0x20]
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02238D70
	str r0, [sp, #0x20]
	mov r0, #1
	str r0, [sp, #0x1c]
	b _02238D70
_02238DDE:
	ldr r0, [sp, #0x14]
	add r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02238D5E
	ldr r1, _02238E2C ; =0x00001060
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r1, _02238E30 ; =0x00000FDC
	ldr r0, [sp, #0x10]
	mov r2, #1
	str r2, [r0, r1]
	ldr r2, _02238E34 ; =0x00001304
	mov r3, #0
	str r3, [r0, r2]
	sub r2, r1, #4
	ldr r1, [sp, #0x10]
	ldr r0, _02238E38 ; =ov72_02238E3C
	add r1, r1, r2
	mov r2, #0x14
	bl sub_0200E33C
	ldr r2, _02238E28 ; =0x00000FD8
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [sp, #0x2c]
	bl NARC_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02238E28: .word 0x00000FD8
_02238E2C: .word 0x00001060
_02238E30: .word 0x00000FDC
_02238E34: .word 0x00001304
_02238E38: .word ov72_02238E3C
	thumb_func_end ov72_02238BEC

	thumb_func_start ov72_02238E3C
ov72_02238E3C: ; 0x02238E3C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02238EDA
	ldr r1, _02238EDC ; =0x0000032B
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _02238EDA
	add r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _02238E72
	sub r0, r1, #3
	ldrsh r0, [r4, r0]
	add r2, r4, #0
	add r2, #0x88
	lsl r0, r0, #5
	add r0, r2, r0
	mov r1, #0
	mov r2, #0x20
	bl GX_LoadBGPltt
_02238E72:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238E80
	cmp r0, #2
	bne _02238E96
_02238E80:
	mov r0, #0xca
	lsl r0, r0, #2
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x88
	lsl r0, r0, #5
	add r0, r1, r0
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
_02238E96:
	ldr r0, _02238EE0 ; =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _02238EBE
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _02238EDA
	mov r2, #0x13
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	mov r1, #1
	eor r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_02238EBE:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _02238EDA
	mov r2, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eor r1, r2
	strb r1, [r4, r0]
_02238EDA:
	pop {r4, pc}
	.balign 4, 0
_02238EDC: .word 0x0000032B
_02238EE0: .word 0x0000032A
	thumb_func_end ov72_02238E3C

	thumb_func_start ov72_02238EE4
ov72_02238EE4: ; 0x02238EE4
	push {r3, r4, lr}
	sub sp, #0x14
	mov r3, #4
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xa4
	ldr r1, _02238FE0 ; =0x00000E58
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	bl AddWindowParameterized
	ldr r0, _02238FE0 ; =0x00000E58
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x94
	ldr r1, _02238FE4 ; =0x00000E38
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x1a
	bl AddWindowParameterized
	ldr r0, _02238FE4 ; =0x00000E38
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x9c
	ldr r1, _02238FE8 ; =0x00000E28
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x1a
	bl AddWindowParameterized
	ldr r0, _02238FE8 ; =0x00000E28
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r1, _02238FEC ; =0x00000E48
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #4
	bl AddWindowParameterized
	ldr r0, _02238FEC ; =0x00000E48
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #1
	ldr r0, _02238FF0 ; =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _02238FF4 ; =0x00000BE4
	ldr r0, _02238FEC ; =0x00000E48
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0
	bl ov72_0223A3E0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	ldr r1, _02238FF8 ; =0x00000E18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _02238FF8 ; =0x00000E18
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_02238FE0: .word 0x00000E58
_02238FE4: .word 0x00000E38
_02238FE8: .word 0x00000E28
_02238FEC: .word 0x00000E48
_02238FF0: .word 0x000F0E00
_02238FF4: .word 0x00000BE4
_02238FF8: .word 0x00000E18
	thumb_func_end ov72_02238EE4

	thumb_func_start ov72_02238FFC
ov72_02238FFC: ; 0x02238FFC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223902C ; =0x00000E18
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _02239030 ; =0x00000E48
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _02239034 ; =0x00000E28
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _02239038 ; =0x00000E38
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223903C ; =0x00000E58
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	nop
_0223902C: .word 0x00000E18
_02239030: .word 0x00000E48
_02239034: .word 0x00000E28
_02239038: .word 0x00000E38
_0223903C: .word 0x00000E58
	thumb_func_end ov72_02238FFC

	thumb_func_start ov72_02239040
ov72_02239040: ; 0x02239040
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x43
	bl String_ctor
	mov r1, #0xbe
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #0x43
	bl String_ctor
	ldr r1, _0223908C ; =0x00000BE8
	str r0, [r4, r1]
	mov r0, #3
	mov r1, #0x43
	bl String_ctor
	ldr r1, _02239090 ; =0x00000BEC
	str r0, [r4, r1]
	sub r1, #0x18
	ldr r0, [r4, r1]
	mov r1, #0xc
	bl NewString_ReadMsgData
	ldr r1, _02239094 ; =0x00000BE4
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x43
	bl String_ctor
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0223908C: .word 0x00000BE8
_02239090: .word 0x00000BEC
_02239094: .word 0x00000BE4
	thumb_func_end ov72_02239040

	thumb_func_start ov72_02239098
ov72_02239098: ; 0x02239098
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _022390CC ; =0x00000BE4
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _022390D0 ; =0x00000BEC
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _022390D4 ; =0x00000BE8
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0xbe
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_022390CC: .word 0x00000BE4
_022390D0: .word 0x00000BEC
_022390D4: .word 0x00000BE8
	thumb_func_end ov72_02239098

	thumb_func_start ov72_022390D8
ov72_022390D8: ; 0x022390D8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239100 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239104 ; =0x00000BDC
	mov r2, #0x11
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #1
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239100: .word 0x00000F0F
_02239104: .word 0x00000BDC
	thumb_func_end ov72_022390D8

	thumb_func_start ov72_02239108
ov72_02239108: ; 0x02239108
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _0223915C ; =0x0000136C
	add r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _02239154
	cmp r0, #2
	bne _02239132
	bl sub_0203946C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov72_022387D0
	mov r0, #0x2e
	str r0, [r4, #0x1c]
	b _02239154
_02239132:
	ldr r0, _02239160 ; =0x00000F0F
	ldr r1, _02239164 ; =0x00000BD8
	str r0, [sp]
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r3, r2, #0
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #2
	bl ov72_02238680
	add r0, r4, #0
	bl ov72_0223A420
_02239154:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223915C: .word 0x0000136C
_02239160: .word 0x00000F0F
_02239164: .word 0x00000BD8
	thumb_func_end ov72_02239108

	thumb_func_start ov72_02239168
ov72_02239168: ; 0x02239168
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239190 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239194 ; =0x00000BD8
	mov r2, #0xc
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0x34
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239190: .word 0x00000F0F
_02239194: .word 0x00000BD8
	thumb_func_end ov72_02239168

	thumb_func_start ov72_02239198
ov72_02239198: ; 0x02239198
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _022391E4 ; =0x0000136C
	add r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _022391E0
	cmp r0, #2
	bne _022391C0
	bl ov00_021EC5B4
	cmp r0, #0
	bne _022391BA
	mov r0, #0
	str r0, [r4, #0x1c]
	b _022391E0
_022391BA:
	mov r0, #0x29
	str r0, [r4, #0x1c]
	b _022391E0
_022391C0:
	bl ov00_021EC5B4
	cmp r0, #0
	bne _022391D6
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov72_022387D0
	mov r0, #0x2e
	b _022391D8
_022391D6:
	mov r0, #0x29
_022391D8:
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x20]
_022391E0:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_022391E4: .word 0x0000136C
	thumb_func_end ov72_02239198

	thumb_func_start ov72_022391E8
ov72_022391E8: ; 0x022391E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_02039418
	mov r0, #4
	bl Sys_SetSleepDisableFlag
	add r0, r4, #0
	bl ov72_0223A414
	add r0, r4, #0
	add r0, #0x2c
	mov r1, #2
	mov r2, #1
	mov r3, #0x14
	bl ov00_021EC3F0
	mov r0, #2
	bl ov00_021EC454
	bl ov00_021EC4A4
	mov r0, #3
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_022391E8

	thumb_func_start ov72_02239220
ov72_02239220: ; 0x02239220
	push {r3, r4, lr}
	sub sp, #0x44
	add r4, r0, #0
	bl ov00_021EC60C
	bl ov00_021EC5B4
	cmp r0, #0
	beq _022392A0
	bl ov00_021EC724
	cmp r0, #8
	bhi _0223927E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02239246: ; jump table
	.short _0223927E - _02239246 - 2 ; case 0
	.short _0223927E - _02239246 - 2 ; case 1
	.short _0223927E - _02239246 - 2 ; case 2
	.short _0223927E - _02239246 - 2 ; case 3
	.short _02239296 - _02239246 - 2 ; case 4
	.short _0223927E - _02239246 - 2 ; case 5
	.short _0223927E - _02239246 - 2 ; case 6
	.short _02239258 - _02239246 - 2 ; case 7
	.short _0223927E - _02239246 - 2 ; case 8
_02239258:
	add r0, sp, #4
	bl ov00_021EC0FC
	mov r1, #0xf5
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, [sp, #4]
	add r0, r1, #4
	str r2, [r4, r0]
	bl ov00_021EC210
	bl ov00_021EC8D8
	add r0, r4, #0
	bl ov72_0223A444
	mov r0, #0x37
	str r0, [r4, #0x1c]
	b _022392A0
_0223927E:
	add r0, sp, #0
	bl ov00_021EC0FC
	add r0, r4, #0
	bl ov72_0223A444
	mov r1, #0x35
	str r1, [r4, #0x1c]
	ldr r0, _022392A8 ; =0x00000F5C
	sub r1, #0x37
	str r1, [r4, r0]
	b _022392A0
_02239296:
	add r0, sp, #8
	bl ov00_021EC9E0
	mov r0, #4
	str r0, [r4, #0x1c]
_022392A0:
	mov r0, #3
	add sp, #0x44
	pop {r3, r4, pc}
	nop
_022392A8: .word 0x00000F5C
	thumb_func_end ov72_02239220

	thumb_func_start ov72_022392AC
ov72_022392AC: ; 0x022392AC
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021ECD04
	mov r0, #5
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov72_022392AC

	thumb_func_start ov72_022392BC
ov72_022392BC: ; 0x022392BC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov00_021ECDC8
	cmp r0, #5
	bhi _02239362
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022392D6: ; jump table
	.short _022392E8 - _022392D6 - 2 ; case 0
	.short _02239362 - _022392D6 - 2 ; case 1
	.short _02239362 - _022392D6 - 2 ; case 2
	.short _022392E2 - _022392D6 - 2 ; case 3
	.short _022392E8 - _022392D6 - 2 ; case 4
	.short _022392E8 - _022392D6 - 2 ; case 5
_022392E2:
	mov r0, #6
	str r0, [r4, #0x1c]
	b _02239362
_022392E8:
	add r0, r4, #0
	bl ov72_0223A444
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	mov r1, #0xf5
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, [sp, #4]
	add r0, r1, #4
	str r2, [r4, r0]
	bl ov00_021EC210
	bl ov00_021EC8D8
	mov r0, #0x37
	str r0, [r4, #0x1c]
	ldr r1, [sp]
	cmp r1, #7
	bhi _02239350
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02239320: ; jump table
	.short _02239350 - _02239320 - 2 ; case 0
	.short _02239330 - _02239320 - 2 ; case 1
	.short _02239330 - _02239320 - 2 ; case 2
	.short _02239342 - _02239320 - 2 ; case 3
	.short _02239334 - _02239320 - 2 ; case 4
	.short _0223934C - _02239320 - 2 ; case 5
	.short _0223933E - _02239320 - 2 ; case 6
	.short _0223934C - _02239320 - 2 ; case 7
_02239330:
	str r0, [r4, #0x1c]
	b _02239350
_02239334:
	bl ov00_021FA0D8
	mov r0, #0x37
	str r0, [r4, #0x1c]
	b _02239350
_0223933E:
	str r0, [r4, #0x1c]
	b _02239350
_02239342:
	bl ov00_021ED9B4
	mov r0, #0x37
	str r0, [r4, #0x1c]
	b _02239350
_0223934C:
	bl sub_020399EC
_02239350:
	ldr r1, [sp, #4]
	ldr r0, _02239368 ; =0xFFFFB1E0
	cmp r1, r0
	bge _02239362
	ldr r0, _0223936C ; =0xFFFF8AD1
	cmp r1, r0
	blt _02239362
	mov r0, #0x37
	str r0, [r4, #0x1c]
_02239362:
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02239368: .word 0xFFFFB1E0
_0223936C: .word 0xFFFF8AD1
	thumb_func_end ov72_022392BC

	thumb_func_start ov72_02239370
ov72_02239370: ; 0x02239370
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl Sav2_SysInfo_GetField4C
	cmp r0, #0
	bne _0223938A
	ldr r1, [r5]
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x1c]
	bl Sav2_SysInfo_SetField4C
_0223938A:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl Sav2_SysInfo_GetField4C
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	bl DWC_CreateFriendKey
	add r3, r0, #0
	add r2, r1, #0
	add r0, r4, #0
	add r1, r3, #0
	bl ov72_022378C0
	mov r0, #7
	str r0, [r5, #0x1c]
	mov r0, #3
	pop {r3, r4, r5, pc}
	thumb_func_end ov72_02239370

	thumb_func_start ov72_022393B0
ov72_022393B0: ; 0x022393B0
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237CB0
	mov r0, #8
	str r0, [r4, #0x1c]
	ldr r0, _022393C8 ; =0x00000FD4
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_022393C8: .word 0x00000FD4
	thumb_func_end ov72_022393B0

	thumb_func_start ov72_022393CC
ov72_022393CC: ; 0x022393CC
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _02239484
	bl ov72_02237B74
	ldr r1, _022394A0 ; =0x00000FD4
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #9
	bhi _02239478
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022393F4: ; jump table
	.short _02239458 - _022393F4 - 2 ; case 0
	.short _02239468 - _022393F4 - 2 ; case 1
	.short _02239478 - _022393F4 - 2 ; case 2
	.short _02239458 - _022393F4 - 2 ; case 3
	.short _02239478 - _022393F4 - 2 ; case 4
	.short _02239468 - _022393F4 - 2 ; case 5
	.short _02239448 - _022393F4 - 2 ; case 6
	.short _02239408 - _022393F4 - 2 ; case 7
	.short _02239438 - _022393F4 - 2 ; case 8
	.short _02239448 - _022393F4 - 2 ; case 9
_02239408:
	add r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02239420
	cmp r0, #1
	beq _0223942C
	cmp r0, #2
	beq _02239432
	b _0223949A
_02239420:
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xd
	bl ov72_02238680
	b _0223949A
_0223942C:
	mov r0, #0x19
	str r0, [r4, #0x1c]
	b _0223949A
_02239432:
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	b _0223949A
_02239438:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239448:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239458:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239468:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239478:
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _0223949A
_02239484:
	ldr r0, _022394A0 ; =0x00000FD4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _0223949A
	bl sub_020399EC
_0223949A:
	mov r0, #3
	pop {r4, pc}
	nop
_022394A0: .word 0x00000FD4
	thumb_func_end ov72_022393CC

	thumb_func_start ov72_022394A4
ov72_022394A4: ; 0x022394A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _022394D0 ; =0x00000F64
	ldr r0, [r0, #0xc]
	add r1, r4, r1
	bl sub_0203189C
	ldr r1, _022394D0 ; =0x00000F64
	add r0, r4, r1
	add r1, #0x64
	add r1, r4, r1
	bl ov72_02237CF4
	mov r0, #0xa
	str r0, [r4, #0x1c]
	ldr r0, _022394D4 ; =0x00000FD4
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_022394D0: .word 0x00000F64
_022394D4: .word 0x00000FD4
	thumb_func_end ov72_022394A4

	thumb_func_start ov72_022394D8
ov72_022394D8: ; 0x022394D8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	bne _022394E6
	b _022395EE
_022394E6:
	bl ov72_02237B74
	add r5, r0, #0
	ldr r0, _02239608 ; =0x00000FD4
	mov r1, #0
	str r1, [r4, r0]
	add r1, r5, #7
	cmp r1, #9
	bhi _022395E2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02239504: ; jump table
	.short _022395C2 - _02239504 - 2 ; case 0
	.short _022395D2 - _02239504 - 2 ; case 1
	.short _022395E2 - _02239504 - 2 ; case 2
	.short _022395C2 - _02239504 - 2 ; case 3
	.short _022395E2 - _02239504 - 2 ; case 4
	.short _022395D2 - _02239504 - 2 ; case 5
	.short _022395B2 - _02239504 - 2 ; case 6
	.short _02239518 - _02239504 - 2 ; case 7
	.short _022395A2 - _02239504 - 2 ; case 8
	.short _022395B2 - _02239504 - 2 ; case 9
_02239518:
	add r0, r4, #0
	bl ov72_0223A444
	ldr r0, _0223960C ; =0x00000FC8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02239530
	cmp r1, #1
	beq _02239586
	cmp r1, #2
	beq _02239586
	b _02239596
_02239530:
	add r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #3
	bhi _02239604
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02239544: ; jump table
	.short _0223954C - _02239544 - 2 ; case 0
	.short _02239576 - _02239544 - 2 ; case 1
	.short _02239576 - _02239544 - 2 ; case 2
	.short _02239576 - _02239544 - 2 ; case 3
_0223954C:
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0223955E
	cmp r0, #1
	beq _0223956A
	cmp r0, #2
	beq _02239570
	b _02239604
_0223955E:
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xd
	bl ov72_02238680
	b _02239604
_0223956A:
	mov r0, #0x19
	str r0, [r4, #0x1c]
	b _02239604
_02239570:
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	b _02239604
_02239576:
	sub r0, #0x6c
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239604
_02239586:
	ldr r0, _02239610 ; =0x00000F5C
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239604
_02239596:
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _02239604
_022395A2:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395B2:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395C2:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395D2:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395E2:
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _02239604
_022395EE:
	ldr r0, _02239608 ; =0x00000FD4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02239604
	bl sub_020399EC
_02239604:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239608: .word 0x00000FD4
_0223960C: .word 0x00000FC8
_02239610: .word 0x00000F5C
	thumb_func_end ov72_022394D8

	thumb_func_start ov72_02239614
ov72_02239614: ; 0x02239614
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov72_02237B80
	mov r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, _02239634 ; =0x00000FD4
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov72_0223A420
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02239634: .word 0x00000FD4
	thumb_func_end ov72_02239614

	thumb_func_start ov72_02239638
ov72_02239638: ; 0x02239638
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _022396CA
	bl ov72_02237B74
	ldr r1, _022396E4 ; =0x00000FD4
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #6
	bhi _022396B4
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02239660: ; jump table
	.short _02239696 - _02239660 - 2 ; case 0
	.short _0223968C - _02239660 - 2 ; case 1
	.short _022396A0 - _02239660 - 2 ; case 2
	.short _02239696 - _02239660 - 2 ; case 3
	.short _02239682 - _02239660 - 2 ; case 4
	.short _02239678 - _02239660 - 2 ; case 5
	.short _0223966E - _02239660 - 2 ; case 6
_0223966E:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_02239678:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_02239682:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_0223968C:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_02239696:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_022396A0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _022396C2
_022396B4:
	cmp r0, #0
	ble _022396C2
	add r1, r4, #0
	add r1, #0x98
	str r0, [r1]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_022396C2:
	add r0, r4, #0
	bl ov72_0223A444
	b _022396E0
_022396CA:
	ldr r0, _022396E4 ; =0x00000FD4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _022396E0
	bl sub_020399EC
_022396E0:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_022396E4: .word 0x00000FD4
	thumb_func_end ov72_02239638

	thumb_func_start ov72_022396E8
ov72_022396E8: ; 0x022396E8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x98
	ldr r2, [r0]
	cmp r2, #0x64
	blt _02239720
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _02239758 ; =0x00000F0F
	ldr r1, _0223975C ; =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0xb
	mov r3, #1
	bl ov72_0223A280
	b _02239746
_02239720:
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferIntegerAsString
	ldr r0, _02239758 ; =0x00000F0F
	ldr r1, _0223975C ; =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	mov r3, #1
	bl ov72_0223A280
_02239746:
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0xe
	bl ov72_02238680
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_02239758: .word 0x00000F0F
_0223975C: .word 0x00000BD4
	thumb_func_end ov72_022396E8

	thumb_func_start ov72_02239760
ov72_02239760: ; 0x02239760
	push {r4, lr}
	add r4, r0, #0
	add r2, r4, #0
	add r2, #0x98
	ldr r2, [r2]
	mov r1, #1
	bl ov72_0223A520
	mov r0, #0xf
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov72_0223A41C
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_02239760

	thumb_func_start ov72_02239784
ov72_02239784: ; 0x02239784
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	bl ov72_0223A588
	add r4, r0, #0
	beq _022397E0
	cmp r4, #0
	ble _022397D2
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov00_021ECB94
	add r0, r5, #0
	add r0, #0x9c
	add r1, r5, #0
	add r2, r5, #0
	str r4, [r0]
	add r1, #0x94
	add r2, #0x9c
	ldr r0, [r5]
	ldr r1, [r1]
	ldr r2, [r2]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r0, #4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, sp, #0
	bl sub_0202D720
	cmp r0, #0
	beq _022397CC
	mov r0, #0x14
	str r0, [r5, #0x1c]
	b _022397E0
_022397CC:
	mov r0, #0x10
	str r0, [r5, #0x1c]
	b _022397E0
_022397D2:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov72_0223A41C
	mov r0, #0x15
	str r0, [r5, #0x1c]
_022397E0:
	mov r0, #3
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov72_02239784

	thumb_func_start ov72_022397E8
ov72_022397E8: ; 0x022397E8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	add r2, r4, #0
	lsl r0, r0, #4
	add r2, #0x9c
	ldr r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r3, #2
	mov r0, #0xbd
	add r2, r4, #0
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	lsl r0, r0, #4
	add r2, #0x94
	ldr r0, [r4, r0]
	ldr r2, [r2]
	bl BufferIntegerAsString
	ldr r0, _02239850 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _02239854 ; =0x00000BD4
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov72_0223A280
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x11
	bl ov72_02238680
	add r4, #0xa0
	ldr r2, _02239858 ; =0x00000A38
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02239850: .word 0x00000F0F
_02239854: .word 0x00000BD4
_02239858: .word 0x00000A38
	thumb_func_end ov72_022397E8

	thumb_func_start ov72_0223985C
ov72_0223985C: ; 0x0223985C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239884 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239888 ; =0x00000BD4
	mov r2, #2
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A280
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0xd
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239884: .word 0x00000F0F
_02239888: .word 0x00000BD4
	thumb_func_end ov72_0223985C

	thumb_func_start ov72_0223988C
ov72_0223988C: ; 0x0223988C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x90
	add r1, #0x9c
	add r2, r4, #0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, #0xa0
	bl ov72_02237BD0
	add r0, r4, #0
	bl ov72_0223A420
	mov r0, #0x12
	str r0, [r4, #0x1c]
	ldr r0, _022398B8 ; =0x00000FD4
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_022398B8: .word 0x00000FD4
	thumb_func_end ov72_0223988C

	thumb_func_start ov72_022398BC
ov72_022398BC: ; 0x022398BC
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _022399AA
	bl ov72_02237B74
	ldr r1, _022399C8 ; =0x00000FD4
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #7
	bhi _022399C0
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022398E6: ; jump table
	.short _02239986 - _022398E6 - 2 ; case 0
	.short _02239976 - _022398E6 - 2 ; case 1
	.short _02239996 - _022398E6 - 2 ; case 2
	.short _02239966 - _022398E6 - 2 ; case 3
	.short _02239966 - _022398E6 - 2 ; case 4
	.short _02239956 - _022398E6 - 2 ; case 5
	.short _02239946 - _022398E6 - 2 ; case 6
	.short _022398F6 - _022398E6 - 2 ; case 7
_022398F6:
	add r2, r4, #0
	add r3, r4, #0
	add r2, #0x90
	add r3, #0x9c
	ldr r0, [r4]
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	add r1, #0xa0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0202D7C0
	add r0, r4, #0
	mov r1, #0x27
	mov r2, #0x13
	bl ov72_02238680
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov00_021ECB94
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x94
	add r4, #0x9c
	ldr r1, [r1]
	ldr r2, [r4]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r0, #4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, sp, #0
	bl sub_0202D678
	b _022399C0
_02239946:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239956:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239966:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0xb
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239976:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239986:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239996:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _022399C0
_022399AA:
	ldr r0, _022399C8 ; =0x00000FD4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _022399C0
	bl sub_020399EC
_022399C0:
	mov r0, #3
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_022399C8: .word 0x00000FD4
	thumb_func_end ov72_022398BC

	thumb_func_start ov72_022399CC
ov72_022399CC: ; 0x022399CC
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239A00 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239A04 ; =0x00000BD4
	mov r2, #3
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2d
	bl ov72_02238680
	add r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x20]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239A00: .word 0x00000F0F
_02239A04: .word 0x00000BD4
	thumb_func_end ov72_022399CC

	thumb_func_start ov72_02239A08
ov72_02239A08: ; 0x02239A08
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239A34 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239A38 ; =0x00000BD4
	mov r2, #7
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x1a
	bl ov72_02238680
	add r0, r4, #0
	bl ov72_0223A420
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02239A34: .word 0x00000F0F
_02239A38: .word 0x00000BD4
	thumb_func_end ov72_02239A08

	thumb_func_start ov72_02239A3C
ov72_02239A3C: ; 0x02239A3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0202D568
	add r4, r0, #0
	ldr r0, [r5]
	add r1, sp, #0
	ldr r0, [r0, #4]
	bl sub_0202D7F0
	ldr r0, [r5]
	ldr r2, _02239A80 ; =0x00000AD8
	ldr r0, [r0, #0xc]
	mov r1, #1
	add r2, r5, r2
	bl sub_02069528
	add r1, sp, #0
	ldrb r0, [r1]
	ldr r3, _02239A80 ; =0x00000AD8
	ldrb r1, [r1, #1]
	add r2, r4, #0
	add r3, r5, r3
	bl ov72_02237C30
	mov r0, #0x1b
	str r0, [r5, #0x1c]
	ldr r0, _02239A84 ; =0x00000FD4
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239A80: .word 0x00000AD8
_02239A84: .word 0x00000FD4
	thumb_func_end ov72_02239A3C

	thumb_func_start ov72_02239A88
ov72_02239A88: ; 0x02239A88
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _02239B3C
	bl ov72_02237B74
	ldr r1, _02239B58 ; =0x00000FD4
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #7
	bhi _02239B52
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02239AB0: ; jump table
	.short _02239B18 - _02239AB0 - 2 ; case 0
	.short _02239B08 - _02239AB0 - 2 ; case 1
	.short _02239B28 - _02239AB0 - 2 ; case 2
	.short _02239B18 - _02239AB0 - 2 ; case 3
	.short _02239AF8 - _02239AB0 - 2 ; case 4
	.short _02239AE8 - _02239AB0 - 2 ; case 5
	.short _02239AD8 - _02239AB0 - 2 ; case 6
	.short _02239AC0 - _02239AB0 - 2 ; case 7
_02239AC0:
	ldr r0, [r4]
	mov r1, #5
	ldr r0, [r0]
	mov r2, #2
	bl sub_0202D5DC
	add r0, r4, #0
	mov r1, #0x27
	mov r2, #0x1c
	bl ov72_02238680
	b _02239B52
_02239AD8:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239AE8:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239AF8:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239B08:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239B18:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239B28:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _02239B52
_02239B3C:
	ldr r0, _02239B58 ; =0x00000FD4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02239B52
	bl sub_020399EC
_02239B52:
	mov r0, #3
	pop {r4, pc}
	nop
_02239B58: .word 0x00000FD4
	thumb_func_end ov72_02239A88

	thumb_func_start ov72_02239B5C
ov72_02239B5C: ; 0x02239B5C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239B90 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239B94 ; =0x00000BD4
	mov r2, #8
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2d
	bl ov72_02238680
	add r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x20]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239B90: .word 0x00000F0F
_02239B94: .word 0x00000BD4
	thumb_func_end ov72_02239B5C

	thumb_func_start ov72_02239B98
ov72_02239B98: ; 0x02239B98
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239BC0 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239BC4 ; =0x00000BD4
	mov r2, #5
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x1e
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239BC0: .word 0x00000F0F
_02239BC4: .word 0x00000BD4
	thumb_func_end ov72_02239B98

	thumb_func_start ov72_02239BC8
ov72_02239BC8: ; 0x02239BC8
	push {r4, lr}
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #1
	add r2, #0x94
	str r1, [r2]
	add r2, r1, #0
	bl ov72_0223A41C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xa
	bl ov72_0223A520
	mov r0, #0x1f
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov72_02239BC8

	thumb_func_start ov72_02239BEC
ov72_02239BEC: ; 0x02239BEC
	push {r4, lr}
	add r4, r0, #0
	bl ov72_0223A588
	cmp r0, #0
	beq _02239C10
	ble _02239C0C
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0x20
	bl ov72_02238680
	b _02239C10
_02239C0C:
	mov r0, #0x17
	str r0, [r4, #0x1c]
_02239C10:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov72_02239BEC

	thumb_func_start ov72_02239C14
ov72_02239C14: ; 0x02239C14
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x98
	ldr r2, [r0]
	cmp r2, #0x64
	blt _02239C4C
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _02239C84 ; =0x00000F0F
	ldr r1, _02239C88 ; =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #1
	bl ov72_0223A280
	b _02239C72
_02239C4C:
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferIntegerAsString
	ldr r0, _02239C84 ; =0x00000F0F
	ldr r1, _02239C88 ; =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #6
	mov r3, #1
	bl ov72_0223A280
_02239C72:
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x21
	bl ov72_02238680
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_02239C84: .word 0x00000F0F
_02239C88: .word 0x00000BD4
	thumb_func_end ov72_02239C14

	thumb_func_start ov72_02239C8C
ov72_02239C8C: ; 0x02239C8C
	push {r4, lr}
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #1
	add r2, #0x9c
	str r1, [r2]
	add r2, r4, #0
	add r2, #0x98
	ldr r2, [r2]
	bl ov72_0223A520
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov72_0223A41C
	mov r0, #0x22
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov72_02239C8C

	thumb_func_start ov72_02239CB4
ov72_02239CB4: ; 0x02239CB4
	push {r4, lr}
	add r4, r0, #0
	bl ov72_0223A588
	cmp r0, #0
	beq _02239CD2
	ble _02239CCE
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	mov r0, #0x23
	str r0, [r4, #0x1c]
	b _02239CD2
_02239CCE:
	mov r0, #0x1d
	str r0, [r4, #0x1c]
_02239CD2:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_02239CB4

	thumb_func_start ov72_02239CD8
ov72_02239CD8: ; 0x02239CD8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	add r2, r4, #0
	lsl r0, r0, #4
	add r2, #0x9c
	ldr r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r3, #2
	mov r0, #0xbd
	add r2, r4, #0
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	lsl r0, r0, #4
	add r2, #0x94
	ldr r0, [r4, r0]
	ldr r2, [r2]
	bl BufferIntegerAsString
	ldr r0, _02239D34 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _02239D38 ; =0x00000BD4
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov72_0223A280
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x24
	bl ov72_02238680
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02239D34: .word 0x00000F0F
_02239D38: .word 0x00000BD4
	thumb_func_end ov72_02239CD8

	thumb_func_start ov72_02239D3C
ov72_02239D3C: ; 0x02239D3C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x94
	add r1, #0x9c
	add r2, r4, #0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, #0xa0
	bl ov72_02237BD0
	mov r0, #0x25
	str r0, [r4, #0x1c]
	ldr r0, _02239D68 ; =0x00000FD4
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov72_0223A420
	mov r0, #3
	pop {r4, pc}
	nop
_02239D68: .word 0x00000FD4
	thumb_func_end ov72_02239D3C

	thumb_func_start ov72_02239D6C
ov72_02239D6C: ; 0x02239D6C
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _02239E34
	bl ov72_02237B74
	ldr r1, _02239E50 ; =0x00000FD4
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #7
	bhi _02239E4A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02239D94: ; jump table
	.short _02239E10 - _02239D94 - 2 ; case 0
	.short _02239E00 - _02239D94 - 2 ; case 1
	.short _02239E20 - _02239D94 - 2 ; case 2
	.short _02239E10 - _02239D94 - 2 ; case 3
	.short _02239DF0 - _02239D94 - 2 ; case 4
	.short _02239DE0 - _02239D94 - 2 ; case 5
	.short _02239DD0 - _02239D94 - 2 ; case 6
	.short _02239DA4 - _02239D94 - 2 ; case 7
_02239DA4:
	add r2, r4, #0
	add r3, r4, #0
	add r2, #0x94
	add r3, #0x9c
	ldr r0, [r4]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r1, _02239E54 ; =0x000006DC
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	add r1, r4, r1
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0202D8A4
	add r0, r4, #0
	mov r1, #0x27
	mov r2, #0x26
	bl ov72_02238680
	b _02239E4A
_02239DD0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239DE0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239DF0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0xb
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239E00:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239E10:
	mov r2, #0xb
	str r2, [r4, #0x1c]
	sub r1, #0x78
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239E20:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
	bl sub_020399EC
	b _02239E4A
_02239E34:
	ldr r0, _02239E50 ; =0x00000FD4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02239E4A
	bl sub_020399EC
_02239E4A:
	mov r0, #3
	pop {r4, pc}
	nop
_02239E50: .word 0x00000FD4
_02239E54: .word 0x000006DC
	thumb_func_end ov72_02239D6C

	thumb_func_start ov72_02239E58
ov72_02239E58: ; 0x02239E58
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239E8C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239E90 ; =0x00000BD4
	mov r2, #3
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2d
	bl ov72_02238680
	add r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x20]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239E8C: .word 0x00000F0F
_02239E90: .word 0x00000BD4
	thumb_func_end ov72_02239E58

	thumb_func_start ov72_02239E94
ov72_02239E94: ; 0x02239E94
	mov r1, #0x29
	str r1, [r0, #0x1c]
	mov r0, #3
	bx lr
	thumb_func_end ov72_02239E94

	thumb_func_start ov72_02239E9C
ov72_02239E9C: ; 0x02239E9C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0, #0xc]
	bl Save_PrepareForAsyncWrite
	mov r0, #0x28
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_02239E9C

	thumb_func_start ov72_02239EB4
ov72_02239EB4: ; 0x02239EB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Save_WriteFileAsync
	cmp r0, #2
	bne _02239ECE
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov72_0223A444
_02239ECE:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_02239EB4

	thumb_func_start ov72_02239ED4
ov72_02239ED4: ; 0x02239ED4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239EFC ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239F00 ; =0x00000BD4
	mov r2, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0x16
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239EFC: .word 0x00000F0F
_02239F00: .word 0x00000BD4
	thumb_func_end ov72_02239ED4

	thumb_func_start ov72_02239F04
ov72_02239F04: ; 0x02239F04
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02239F2C ; =0x0000136C
	add r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _02239F28
	cmp r0, #2
	bne _02239F1E
	mov r0, #0xd
	str r0, [r4, #0x1c]
	b _02239F28
_02239F1E:
	mov r0, #0x29
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x20]
_02239F28:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02239F2C: .word 0x0000136C
	thumb_func_end ov72_02239F04

	thumb_func_start ov72_02239F30
ov72_02239F30: ; 0x02239F30
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239F58 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239F5C ; =0x00000BD4
	mov r2, #9
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0x18
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239F58: .word 0x00000F0F
_02239F5C: .word 0x00000BD4
	thumb_func_end ov72_02239F30

	thumb_func_start ov72_02239F60
ov72_02239F60: ; 0x02239F60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02239F88 ; =0x0000136C
	add r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _02239F84
	cmp r0, #2
	bne _02239F7A
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	b _02239F84
_02239F7A:
	mov r0, #0x29
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x20]
_02239F84:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02239F88: .word 0x0000136C
	thumb_func_end ov72_02239F60

	thumb_func_start ov72_02239F8C
ov72_02239F8C: ; 0x02239F8C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239FB4 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02239FB8 ; =0x00000BDC
	mov r2, #0x1a
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2a
	bl ov72_02238680
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239FB4: .word 0x00000F0F
_02239FB8: .word 0x00000BDC
	thumb_func_end ov72_02239F8C

	thumb_func_start ov72_02239FBC
ov72_02239FBC: ; 0x02239FBC
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021EC8D8
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov72_022387D0
	mov r0, #0x2b
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_02239FBC

	thumb_func_start ov72_02239FD8
ov72_02239FD8: ; 0x02239FD8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223A008 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _0223A00C ; =0x00000BDC
	mov r2, #0x1b
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	add r0, r4, #0
	mov r1, #0x31
	mov r2, #0x2e
	bl ov72_02238680
	mov r0, #0xf6
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223A008: .word 0x00000F0F
_0223A00C: .word 0x00000BDC
	thumb_func_end ov72_02239FD8

	thumb_func_start ov72_0223A010
ov72_0223A010: ; 0x0223A010
	mov r0, #3
	bx lr
	thumb_func_end ov72_0223A010

	thumb_func_start ov72_0223A014
ov72_0223A014: ; 0x0223A014
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0203A914
	bl sub_0203946C
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x43
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #0x1c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov72_0223A014

	thumb_func_start ov72_0223A044
ov72_0223A044: ; 0x0223A044
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A068 ; =0x00001308
	ldr r0, [r4, r0]
	bl ov72_02238668
	cmp r0, #0
	beq _0223A062
	cmp r0, #2
	bne _0223A05E
	mov r0, #0
	str r0, [r4, #0x1c]
	b _0223A062
_0223A05E:
	mov r0, #0x29
	str r0, [r4, #0x1c]
_0223A062:
	mov r0, #3
	pop {r4, pc}
	nop
_0223A068: .word 0x00001308
	thumb_func_end ov72_0223A044

	thumb_func_start ov72_0223A06C
ov72_0223A06C: ; 0x0223A06C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0223A0D4 ; =0x00000F5C
	mov r4, #0
	ldr r0, [r5, r0]
	add r0, r0, #7
	cmp r0, #9
	bhi _0223A0AE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A088: ; jump table
	.short _0223A0A8 - _0223A088 - 2 ; case 0
	.short _0223A09C - _0223A088 - 2 ; case 1
	.short _0223A0AE - _0223A088 - 2 ; case 2
	.short _0223A0A8 - _0223A088 - 2 ; case 3
	.short _0223A0AC - _0223A088 - 2 ; case 4
	.short _0223A09C - _0223A088 - 2 ; case 5
	.short _0223A0A4 - _0223A088 - 2 ; case 6
	.short _0223A0AE - _0223A088 - 2 ; case 7
	.short _0223A0A0 - _0223A088 - 2 ; case 8
	.short _0223A0A4 - _0223A088 - 2 ; case 9
_0223A09C:
	mov r4, #0xf
	b _0223A0AE
_0223A0A0:
	mov r4, #0xd
	b _0223A0AE
_0223A0A4:
	mov r4, #0xe
	b _0223A0AE
_0223A0A8:
	mov r4, #0x10
	b _0223A0AE
_0223A0AC:
	mov r4, #0x11
_0223A0AE:
	add r0, r5, #0
	bl ov72_0223A444
	ldr r0, _0223A0D8 ; =0x00000F0F
	ldr r1, _0223A0DC ; =0x00000BD4
	str r0, [sp]
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl ov72_0223A350
	add r0, r5, #0
	mov r1, #0x2f
	mov r2, #0x36
	bl ov72_02238680
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A0D4: .word 0x00000F5C
_0223A0D8: .word 0x00000F0F
_0223A0DC: .word 0x00000BD4
	thumb_func_end ov72_0223A06C

	thumb_func_start ov72_0223A0E0
ov72_0223A0E0: ; 0x0223A0E0
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0xfd
	add r4, r0, #0
	lsl r1, r1, #4
	ldrsh r2, [r4, r1]
	cmp r2, #3
	bhi _0223A17C
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223A0FC: ; jump table
	.short _0223A104 - _0223A0FC - 2 ; case 0
	.short _0223A120 - _0223A0FC - 2 ; case 1
	.short _0223A144 - _0223A0FC - 2 ; case 2
	.short _0223A160 - _0223A0FC - 2 ; case 3
_0223A104:
	sub r1, #0xc1
	str r1, [sp]
	ldr r1, _0223A1A0 ; =0x00000BD4
	mov r2, #0x12
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	mov r0, #0xfd
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A120:
	ldr r0, _0223A1A4 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A198
	bl sub_0203946C
	bl ov00_021EC8D8
	mov r0, #0xfd
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A144:
	sub r1, #0xc1
	str r1, [sp]
	ldr r1, _0223A1A0 ; =0x00000BD4
	mov r2, #0x13
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov72_0223A350
	mov r0, #0xfd
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A160:
	ldr r0, _0223A1A4 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A198
	mov r0, #0xfd
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A17C:
	ldr r0, _0223A1A8 ; =0x00000FD2
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _0223A198
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov72_022387D0
	mov r0, #0x2e
	str r0, [r4, #0x1c]
_0223A198:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223A1A0: .word 0x00000BD4
_0223A1A4: .word 0x00000BF4
_0223A1A8: .word 0x00000FD2
	thumb_func_end ov72_0223A0E0

	thumb_func_start ov72_0223A1AC
ov72_0223A1AC: ; 0x0223A1AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A1C8 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A1C4
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_0223A1C4:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223A1C8: .word 0x00000BF4
	thumb_func_end ov72_0223A1AC

	thumb_func_start ov72_0223A1CC
ov72_0223A1CC: ; 0x0223A1CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A1FC ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A1F8
	mov r0, #0xf6
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _0223A1EE
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_0223A1EE:
	mov r0, #0xf6
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_0223A1F8:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223A1FC: .word 0x00000BF4
	thumb_func_end ov72_0223A1CC

	thumb_func_start ov72_0223A200
ov72_0223A200: ; 0x0223A200
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A274 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A26E
	ldr r0, _0223A278 ; =0x00000E14
	ldr r1, [r4, r0]
	ldr r0, _0223A27C ; =0x00001370
	str r1, [r4, r0]
	ldr r2, [r4, #4]
	sub r1, r0, #4
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0x43
	add r1, #0x24
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x28
	strb r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0xa
	add r1, #0x2a
	strb r2, [r4, r1]
	add r1, r0, #0
	mov r2, #6
	add r1, #0x2b
	strb r2, [r4, r1]
	add r1, r0, #0
	mov r2, #4
	add r1, #0x2e
	strb r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0xb
	add r1, #0x2c
	strb r2, [r4, r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0x2d
	strb r2, [r4, r1]
	add r1, r0, #0
	sub r0, r0, #4
	add r2, #0xff
	add r1, #0x30
	add r0, r4, r0
	str r2, [r4, r1]
	bl ov72_0223AF1C
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_0223A26E:
	mov r0, #3
	pop {r4, pc}
	nop
_0223A274: .word 0x00000BF4
_0223A278: .word 0x00000E14
_0223A27C: .word 0x00001370
	thumb_func_end ov72_0223A200

	thumb_func_start ov72_0223A280
ov72_0223A280: ; 0x0223A280
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl NewString_ReadMsgData
	mov r1, #0xbd
	add r6, r0, #0
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, #0x10
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, _0223A2E0 ; =0x00000E18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223A2E0 ; =0x00000E18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	mov r2, #0xbe
	ldr r0, _0223A2E0 ; =0x00000E18
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0223A2E4 ; =0x00000BF4
	str r0, [r5, r1]
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223A2E0: .word 0x00000E18
_0223A2E4: .word 0x00000BF4
	thumb_func_end ov72_0223A280

	thumb_func_start ov72_0223A2E8
ov72_0223A2E8: ; 0x0223A2E8
	push {r4, lr}
	ldr r1, _0223A310 ; =0x00000F54
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	neg r0, r0
	bl ov00_021E6A70
	ldr r2, _0223A310 ; =0x00000F54
	add r1, r0, #0
	ldr r2, [r4, r2]
	add r0, r4, #0
	neg r2, r2
	bl ov72_0223A4DC
	mov r0, #0x38
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223A310: .word 0x00000F54
	thumb_func_end ov72_0223A2E8

	thumb_func_start ov72_0223A314
ov72_0223A314: ; 0x0223A314
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A344 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _0223A330
	mov r0, #2
	tst r0, r1
	bne _0223A330
	ldr r0, _0223A348 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0223A33E
_0223A330:
	ldr r0, _0223A34C ; =0x00000E58
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	mov r0, #0
	str r0, [r4, #0x1c]
_0223A33E:
	mov r0, #3
	pop {r4, pc}
	nop
_0223A344: .word gSystem
_0223A348: .word gSystem + 0x40
_0223A34C: .word 0x00000E58
	thumb_func_end ov72_0223A314

	thumb_func_start ov72_0223A350
ov72_0223A350: ; 0x0223A350
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xbe
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r4, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, _0223A3A0 ; =0x00000E18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223A3A0 ; =0x00000E18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	mov r2, #0xbe
	ldr r0, _0223A3A0 ; =0x00000E18
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0223A3A4 ; =0x00000BF4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223A3A0: .word 0x00000E18
_0223A3A4: .word 0x00000BF4
	thumb_func_end ov72_0223A350

	thumb_func_start ov72_0223A3A8
ov72_0223A3A8: ; 0x0223A3A8
	push {r4, lr}
	add r4, r0, #0
	cmp r3, #1
	beq _0223A3B6
	cmp r3, #2
	beq _0223A3CC
	b _0223A3DA
_0223A3B6:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	b _0223A3DA
_0223A3CC:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r2, r1, r0
_0223A3DA:
	add r0, r2, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_0223A3A8

	thumb_func_start ov72_0223A3E0
ov72_0223A3E0: ; 0x0223A3E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x24]
	add r5, r0, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	add r6, r1, #0
	bl ov72_0223A3A8
	add r3, r0, #0
	str r4, [sp]
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov72_0223A3E0

	thumb_func_start ov72_0223A414
ov72_0223A414: ; 0x0223A414
	ldr r3, _0223A418 ; =sub_0203A880
	bx r3
	.balign 4, 0
_0223A418: .word sub_0203A880
	thumb_func_end ov72_0223A414

	thumb_func_start ov72_0223A41C
ov72_0223A41C: ; 0x0223A41C
	bx lr
	.balign 4, 0
	thumb_func_end ov72_0223A41C

	thumb_func_start ov72_0223A420
ov72_0223A420: ; 0x0223A420
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A43C ; =0x00000F4C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223A43A
	ldr r0, _0223A440 ; =0x00000E18
	mov r1, #1
	add r0, r4, r0
	bl sub_0200F0AC
	ldr r1, _0223A43C ; =0x00000F4C
	str r0, [r4, r1]
_0223A43A:
	pop {r4, pc}
	.balign 4, 0
_0223A43C: .word 0x00000F4C
_0223A440: .word 0x00000E18
	thumb_func_end ov72_0223A420

	thumb_func_start ov72_0223A444
ov72_0223A444: ; 0x0223A444
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A45C ; =0x00000F4C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223A45A
	bl sub_0200F450
	ldr r0, _0223A45C ; =0x00000F4C
	mov r1, #0
	str r1, [r4, r0]
_0223A45A:
	pop {r4, pc}
	.balign 4, 0
_0223A45C: .word 0x00000F4C
	thumb_func_end ov72_0223A444

	thumb_func_start ov72_0223A460
ov72_0223A460: ; 0x0223A460
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	add r6, r1, #0
	lsl r0, r0, #8
	mov r1, #0x43
	bl String_ctor
	add r4, r0, #0
	ldr r0, _0223A4D0 ; =0x00000BDC
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0xbd
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, #0x20
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _0223A4D4 ; =0x00000E58
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223A4D4 ; =0x00000E58
	mov r1, #1
	add r0, r5, r0
	mov r2, #0x1f
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r2, #0xbf
	ldr r0, _0223A4D4 ; =0x00000E58
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0223A4D8 ; =0x00000BF4
	str r0, [r5, r1]
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0223A4D0: .word 0x00000BDC
_0223A4D4: .word 0x00000E58
_0223A4D8: .word 0x00000BF4
	thumb_func_end ov72_0223A460

	thumb_func_start ov72_0223A4DC
ov72_0223A4DC: ; 0x0223A4DC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	cmp r4, r0
	bne _0223A4EE
	mov r4, #0xb
_0223A4EE:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, _0223A51C ; =0x00000E18
	mov r1, #1
	add r0, r5, r0
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r1, r4, #0
	bl ov72_0223A460
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223A51C: .word 0x00000E18
	thumb_func_end ov72_0223A4DC

	thumb_func_start ov72_0223A520
ov72_0223A520: ; 0x0223A520
	push {r4, lr}
	ldr r3, _0223A580 ; =0x0000130C
	mov r4, #0
	strb r1, [r0, r3]
	add r1, r3, #1
	strb r2, [r0, r1]
	add r1, r3, #2
	strb r4, [r0, r1]
	add r1, r3, #3
	strb r4, [r0, r1]
	cmp r2, #0x64
	beq _0223A544
	add r1, r3, #4
	mov r2, #1
	strh r2, [r0, r1]
	add r3, #0x5c
	str r2, [r0, r3]
	b _0223A54C
_0223A544:
	add r1, r3, #4
	strh r4, [r0, r1]
	add r3, #0x5c
	str r4, [r0, r3]
_0223A54C:
	ldr r3, _0223A584 ; =0x00001312
	mov r1, #0
	strb r1, [r0, r3]
	sub r4, r1, #1
	add r2, r3, #2
	strb r4, [r0, r2]
	add r2, r3, #3
	strb r4, [r0, r2]
	add r2, r3, #4
	strb r4, [r0, r2]
	add r2, r3, #0
	add r2, #0x52
	strh r1, [r0, r2]
	mov r2, #1
	add r3, #0x54
	strh r2, [r0, r3]
	mov r2, #0xe
	lsl r2, r2, #8
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _0223A57A
	bl ov72_022386F4
_0223A57A:
	mov r0, #1
	pop {r4, pc}
	nop
_0223A580: .word 0x0000130C
_0223A584: .word 0x00001312
	thumb_func_end ov72_0223A520

	thumb_func_start ov72_0223A588
ov72_0223A588: ; 0x0223A588
	push {r4, lr}
	ldr r1, _0223A5A8 ; =0x00001312
	add r4, r0, #0
	ldrb r1, [r4, r1]
	lsl r2, r1, #2
	ldr r1, _0223A5AC ; =ov72_0223B744
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0223A5A2
	ldr r0, _0223A5B0 ; =0x0000130E
	ldrsb r0, [r4, r0]
	pop {r4, pc}
_0223A5A2:
	mov r0, #0
	pop {r4, pc}
	nop
_0223A5A8: .word 0x00001312
_0223A5AC: .word ov72_0223B744
_0223A5B0: .word 0x0000130E
	thumb_func_end ov72_0223A588

	thumb_func_start ov72_0223A5B4
ov72_0223A5B4: ; 0x0223A5B4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0x43
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223A5DC ; =0x00001312
	mov r1, #1
	strb r1, [r4, r0]
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223A5DC: .word 0x00001312
	thumb_func_end ov72_0223A5B4

	thumb_func_start ov72_0223A5E0
ov72_0223A5E0: ; 0x0223A5E0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A65E
	add r0, r4, #0
	bl ov72_0223A680
	ldr r2, _0223A664 ; =0x00001310
	ldr r0, _0223A668 ; =0x00000E04
	ldrsh r1, [r4, r2]
	add r2, #0x58
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	bl ov72_02238730
	add r0, r4, #0
	mov r1, #1
	bl ov72_02238B18
	add r0, r4, #0
	bl ov72_0223ACA8
	ldr r1, _0223A66C ; =0x00000BD4
	ldr r0, _0223A670 ; =0x00001328
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0x14
	bl ov72_0223AD20
	ldr r1, _0223A66C ; =0x00000BD4
	ldr r0, _0223A674 ; =0x00001338
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0x15
	bl ov72_0223AD20
	ldr r1, _0223A66C ; =0x00000BD4
	ldr r0, _0223A678 ; =0x00001348
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0x16
	bl ov72_0223AD20
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r2, #0x43
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223A67C ; =0x00001312
	mov r1, #2
	strb r1, [r4, r0]
_0223A65E:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223A664: .word 0x00001310
_0223A668: .word 0x00000E04
_0223A66C: .word 0x00000BD4
_0223A670: .word 0x00001328
_0223A674: .word 0x00001338
_0223A678: .word 0x00001348
_0223A67C: .word 0x00001312
	thumb_func_end ov72_0223A5E0

	thumb_func_start ov72_0223A680
ov72_0223A680: ; 0x0223A680
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0223A6FC ; =0x0000130D
	ldrb r0, [r6, r0]
	cmp r0, #0x64
	bne _0223A696
	ldr r0, _0223A700 ; =0x00000DF4
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
_0223A696:
	ldr r0, _0223A704 ; =0x00000DF8
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223A708 ; =0x00000DFC
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	ldr r7, _0223A70C ; =0x00001368
	mov r4, #0
	add r5, r6, #0
_0223A6B0:
	ldr r0, _0223A700 ; =0x00000DF4
	ldr r2, [r6, r7]
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov72_02238750
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0223A6B0
	mov r0, #0xe
	lsl r0, r0, #8
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223A710 ; =0x00000E04
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223A714 ; =0x00000E08
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223A718 ; =0x00000E0C
	mov r1, #1
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0xe1
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223A6FC: .word 0x0000130D
_0223A700: .word 0x00000DF4
_0223A704: .word 0x00000DF8
_0223A708: .word 0x00000DFC
_0223A70C: .word 0x00001368
_0223A710: .word 0x00000E04
_0223A714: .word 0x00000E08
_0223A718: .word 0x00000E0C
	thumb_func_end ov72_0223A680

	thumb_func_start ov72_0223A71C
ov72_0223A71C: ; 0x0223A71C
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A72E
	ldr r0, _0223A734 ; =0x00001312
	mov r1, #3
	strb r1, [r4, r0]
_0223A72E:
	mov r0, #0
	pop {r4, pc}
	nop
_0223A734: .word 0x00001312
	thumb_func_end ov72_0223A71C

	thumb_func_start ov72_0223A738
ov72_0223A738: ; 0x0223A738
	push {r3, lr}
	ldr r1, _0223A754 ; =0x0000130D
	ldrb r0, [r0, r1]
	cmp r0, #0x64
	bne _0223A74A
	ldr r0, _0223A758 ; =ov72_0223B774
	bl sub_02025224
	pop {r3, pc}
_0223A74A:
	ldr r0, _0223A75C ; =ov72_0223B7B8
	bl sub_02025224
	pop {r3, pc}
	nop
_0223A754: .word 0x0000130D
_0223A758: .word ov72_0223B774
_0223A75C: .word ov72_0223B7B8
	thumb_func_end ov72_0223A738

	thumb_func_start ov72_0223A760
ov72_0223A760: ; 0x0223A760
	push {r3, r4}
	ldr r3, _0223A7E0 ; =ov72_0223B48C
	lsl r4, r0, #2
	add r3, r3, r4
	ldrb r1, [r1, r3]
	cmp r1, #0xd
	bne _0223A776
	ldrh r1, [r2]
	ldr r0, _0223A7E4 ; =ov72_0223B464
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A776:
	cmp r1, #0xe
	bne _0223A782
	ldrh r1, [r2]
	ldr r0, _0223A7E8 ; =ov72_0223B466
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A782:
	cmp r1, #0xf
	bne _0223A78E
	ldrh r1, [r2, #2]
	ldr r0, _0223A7EC ; =ov72_0223B468
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A78E:
	cmp r1, #0x10
	bne _0223A79A
	ldrh r1, [r2, #2]
	ldr r0, _0223A7F0 ; =ov72_0223B46A
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A79A:
	cmp r1, #0xa
	bne _0223A7BA
	cmp r0, #5
	beq _0223A7A6
	cmp r0, #0
	bne _0223A7AC
_0223A7A6:
	mov r0, #0
	strh r0, [r2]
	b _0223A7D8
_0223A7AC:
	cmp r0, #1
	beq _0223A7B4
	cmp r0, #6
	bne _0223A7D8
_0223A7B4:
	mov r0, #1
	strh r0, [r2]
	b _0223A7D8
_0223A7BA:
	cmp r1, #0xc
	bne _0223A7D8
	cmp r0, #3
	beq _0223A7C6
	cmp r0, #8
	bne _0223A7CC
_0223A7C6:
	mov r0, #0
	strh r0, [r2, #2]
	b _0223A7D8
_0223A7CC:
	cmp r0, #4
	beq _0223A7D4
	cmp r0, #9
	bne _0223A7D8
_0223A7D4:
	mov r0, #1
	strh r0, [r2, #2]
_0223A7D8:
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0223A7E0: .word ov72_0223B48C
_0223A7E4: .word ov72_0223B464
_0223A7E8: .word ov72_0223B466
_0223A7EC: .word ov72_0223B468
_0223A7F0: .word ov72_0223B46A
	thumb_func_end ov72_0223A760

	thumb_func_start ov72_0223A7F4
ov72_0223A7F4: ; 0x0223A7F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r0, #0
	add r6, r1, #0
	mov r0, #0x64
	mov r4, #3
	mov r1, #0
	add r2, sp, #0x18
	mov r3, #8
_0223A806:
	add r5, r7, r1
	ldrsb r5, [r5, r3]
	add r1, r1, #1
	cmp r1, #3
	stmia r2!, {r5}
	blt _0223A806
	mov r1, #0
	mvn r1, r1
	cmp r6, r1
	beq _0223A824
	mov r1, #4
	ldrsh r1, [r7, r1]
	lsl r2, r1, #2
	add r1, sp, #0x18
	str r6, [r1, r2]
_0223A824:
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	add r5, r1, #0
	add r6, sp, #0x18
_0223A82E:
	add r2, r7, r5
	mov r1, #8
	ldrsb r1, [r2, r1]
	cmp r1, #0
	bne _0223A83E
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0223A844
_0223A83E:
	ldr r2, [r6]
	cmp r2, #0
	bge _0223A84E
_0223A844:
	mov r1, #0xa
	bl _s32_div_f
	sub r4, r4, #1
	b _0223A860
_0223A84E:
	mov r1, #1
	ldr r3, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r3, r3, #1
	str r3, [sp, #4]
	lsl r1, r1, #2
	add r3, sp, #0xc
	str r2, [r3, r1]
_0223A860:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #3
	blt _0223A82E
	mov r6, #0
	str r6, [sp]
	cmp r4, #0
	ble _0223A88A
	add r5, sp, #0xc
_0223A872:
	ldr r1, [r5]
	mul r1, r0
	add r6, r6, r1
	mov r1, #0xa
	bl _s32_div_f
	ldr r1, [sp]
	add r5, r5, #4
	add r1, r1, #1
	str r1, [sp]
	cmp r1, r4
	blt _0223A872
_0223A88A:
	ldrb r0, [r7, #1]
	cmp r6, r0
	ble _0223A898
	mov r0, #0
	add sp, #0x24
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_0223A898:
	add r0, r6, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov72_0223A7F4

	thumb_func_start ov72_0223A8A0
ov72_0223A8A0: ; 0x0223A8A0
	ldrb r1, [r0, #1]
	cmp r1, #0x64
	beq _0223A8BA
	mov r1, #9
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _0223A8D6
	mov r1, #0xa
	ldrsb r0, [r0, r1]
	cmp r0, #0
	blt _0223A8D6
	mov r0, #1
	bx lr
_0223A8BA:
	mov r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _0223A8D6
	mov r1, #9
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _0223A8D6
	mov r1, #0xa
	ldrsb r0, [r0, r1]
	cmp r0, #0
	blt _0223A8D6
	mov r0, #1
	bx lr
_0223A8D6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov72_0223A8A0

	thumb_func_start ov72_0223A8DC
ov72_0223A8DC: ; 0x0223A8DC
	push {r4, lr}
	add r4, r0, #0
	bl ov72_0223A8A0
	cmp r0, #0
	beq _0223A8EC
	mov r0, #0xb
	pop {r4, pc}
_0223A8EC:
	ldrb r0, [r4, #3]
	pop {r4, pc}
	thumb_func_end ov72_0223A8DC

	thumb_func_start ov72_0223A8F0
ov72_0223A8F0: ; 0x0223A8F0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0xf
	bls _0223A8FC
	b _0223AA6A
_0223A8FC:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A908: ; jump table
	.short _0223AA6A - _0223A908 - 2 ; case 0
	.short _0223AA6A - _0223A908 - 2 ; case 1
	.short _0223AA6A - _0223A908 - 2 ; case 2
	.short _0223A928 - _0223A908 - 2 ; case 3
	.short _0223A928 - _0223A908 - 2 ; case 4
	.short _0223A928 - _0223A908 - 2 ; case 5
	.short _0223A928 - _0223A908 - 2 ; case 6
	.short _0223A928 - _0223A908 - 2 ; case 7
	.short _0223A928 - _0223A908 - 2 ; case 8
	.short _0223A928 - _0223A908 - 2 ; case 9
	.short _0223A928 - _0223A908 - 2 ; case 10
	.short _0223A928 - _0223A908 - 2 ; case 11
	.short _0223A928 - _0223A908 - 2 ; case 12
	.short _0223A9A2 - _0223A908 - 2 ; case 13
	.short _0223A9F4 - _0223A908 - 2 ; case 14
	.short _0223AA38 - _0223A908 - 2 ; case 15
_0223A928:
	ldr r0, _0223AA6C ; =0x0000130C
	sub r1, r5, #3
	add r0, r4, r0
	bl ov72_0223A7F4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0223A99A
	ldr r1, _0223AA70 ; =0x00001310
	sub r3, r5, #3
	ldrsh r0, [r4, r1]
	add r2, r4, r0
	add r0, r1, #4
	strb r3, [r2, r0]
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bge _0223A950
	add r0, r0, #1
	strh r0, [r4, r1]
_0223A950:
	ldr r2, _0223AA70 ; =0x00001310
	ldr r0, _0223AA74 ; =0x00000E04
	ldrsh r1, [r4, r2]
	add r2, #0x58
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	bl ov72_02238730
	ldr r0, _0223AA78 ; =0x0000130F
	sub r1, r5, #3
	strb r1, [r4, r0]
	sub r0, r0, #3
	add r0, r4, r0
	bl ov72_0223A8DC
	ldr r1, _0223AA78 ; =0x0000130F
	strb r0, [r4, r1]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AA7C ; =0x000005DC
	bl PlaySE
	sub r0, r5, #3
	lsl r3, r0, #1
	ldr r1, _0223AA80 ; =ov72_0223B478
	ldr r2, _0223AA84 ; =ov72_0223B479
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	add r0, r4, #0
	mov r3, #3
	bl ov72_0223AED0
	pop {r3, r4, r5, pc}
_0223A99A:
	ldr r0, _0223AA88 ; =0x000005F2
	bl PlaySE
	pop {r3, r4, r5, pc}
_0223A9A2:
	ldr r1, _0223AA70 ; =0x00001310
	mov r3, #0
	ldrsh r0, [r4, r1]
	mvn r3, r3
	add r2, r4, r0
	add r0, r1, #4
	strb r3, [r2, r0]
	ldrsh r0, [r4, r1]
	sub r0, r0, #1
	strh r0, [r4, r1]
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	cmp r0, #0x64
	ldrsh r0, [r4, r1]
	bne _0223A9CA
	cmp r0, #0
	bge _0223A9D2
	mov r0, #0
	strh r0, [r4, r1]
	b _0223A9D2
_0223A9CA:
	cmp r0, #1
	bge _0223A9D2
	mov r0, #1
	strh r0, [r4, r1]
_0223A9D2:
	ldr r0, _0223AA7C ; =0x000005DC
	bl PlaySE
	ldr r2, _0223AA70 ; =0x00001310
	ldr r0, _0223AA74 ; =0x00000E04
	ldrsh r1, [r4, r2]
	add r2, #0x58
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	bl ov72_02238730
	ldr r0, _0223AA8C ; =0x00000E08
	mov r1, #5
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_0223A9F4:
	ldr r1, _0223AA78 ; =0x0000130F
	sub r0, r5, #3
	strb r0, [r4, r1]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AA6C ; =0x0000130C
	mov r1, #0
	add r0, r4, r0
	mvn r1, r1
	bl ov72_0223A7F4
	ldr r1, _0223AA90 ; =0x0000130E
	strb r0, [r4, r1]
	ldrsb r0, [r4, r1]
	cmp r0, #0
	bgt _0223AA20
	mov r0, #1
	strb r0, [r4, r1]
_0223AA20:
	ldr r0, _0223AA94 ; =0x00001312
	mov r1, #7
	strb r1, [r4, r0]
	ldr r0, _0223AA7C ; =0x000005DC
	bl PlaySE
	ldr r0, _0223AA98 ; =0x00000E0C
	mov r1, #5
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_0223AA38:
	ldr r1, _0223AA78 ; =0x0000130F
	sub r0, r5, #3
	mov r2, #0
	strb r0, [r4, r1]
	mvn r2, r2
	sub r0, r1, #1
	strb r2, [r4, r0]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AA94 ; =0x00001312
	mov r1, #7
	strb r1, [r4, r0]
	ldr r0, _0223AA7C ; =0x000005DC
	bl PlaySE
	mov r0, #0xe1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
_0223AA6A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223AA6C: .word 0x0000130C
_0223AA70: .word 0x00001310
_0223AA74: .word 0x00000E04
_0223AA78: .word 0x0000130F
_0223AA7C: .word 0x000005DC
_0223AA80: .word ov72_0223B478
_0223AA84: .word ov72_0223B479
_0223AA88: .word 0x000005F2
_0223AA8C: .word 0x00000E08
_0223AA90: .word 0x0000130E
_0223AA94: .word 0x00001312
_0223AA98: .word 0x00000E0C
	thumb_func_end ov72_0223A8F0

	thumb_func_start ov72_0223AA9C
ov72_0223AA9C: ; 0x0223AA9C
	push {r4, lr}
	ldr r1, _0223AB78 ; =gSystem
	mov r3, #0x40
	ldr r2, [r1, #0x4c]
	add r4, r0, #0
	tst r3, r2
	beq _0223AAD0
	ldr r2, _0223AB7C ; =0x0000130F
	mov r1, #0
	ldrb r0, [r4, r2]
	add r2, #0x55
	add r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C ; =0x0000130F
	strb r0, [r4, r1]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 ; =0x000005DC
	bl PlaySE
	b _0223AB74
_0223AAD0:
	mov r3, #0x80
	tst r3, r2
	beq _0223AAFC
	ldr r2, _0223AB7C ; =0x0000130F
	mov r1, #1
	ldrb r0, [r4, r2]
	add r2, #0x55
	add r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C ; =0x0000130F
	strb r0, [r4, r1]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 ; =0x000005DC
	bl PlaySE
	b _0223AB74
_0223AAFC:
	mov r3, #0x20
	tst r3, r2
	beq _0223AB28
	ldr r2, _0223AB7C ; =0x0000130F
	mov r1, #2
	ldrb r0, [r4, r2]
	add r2, #0x55
	add r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C ; =0x0000130F
	strb r0, [r4, r1]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 ; =0x000005DC
	bl PlaySE
	b _0223AB74
_0223AB28:
	mov r3, #0x10
	tst r2, r3
	beq _0223AB54
	ldr r2, _0223AB7C ; =0x0000130F
	mov r1, #3
	ldrb r0, [r4, r2]
	add r2, #0x55
	add r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C ; =0x0000130F
	strb r0, [r4, r1]
	mov r0, #0xe
	lsl r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 ; =0x000005DC
	bl PlaySE
	b _0223AB74
_0223AB54:
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _0223AB68
	ldr r1, _0223AB7C ; =0x0000130F
	ldrb r1, [r4, r1]
	add r1, r1, #3
	bl ov72_0223A8F0
	b _0223AB74
_0223AB68:
	mov r1, #2
	tst r1, r2
	beq _0223AB74
	mov r1, #0xd
	bl ov72_0223A8F0
_0223AB74:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223AB78: .word gSystem
_0223AB7C: .word 0x0000130F
_0223AB80: .word 0x000005DC
	thumb_func_end ov72_0223AA9C

	thumb_func_start ov72_0223AB84
ov72_0223AB84: ; 0x0223AB84
	push {r4, lr}
	add r4, r0, #0
	bl ov72_0223A738
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0223AB9E
	add r0, r4, #0
	bl ov72_0223AA9C
	b _0223ABA4
_0223AB9E:
	add r0, r4, #0
	bl ov72_0223A8F0
_0223ABA4:
	add r0, r4, #0
	bl ov72_0223ABB0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_0223AB84

	thumb_func_start ov72_0223ABB0
ov72_0223ABB0: ; 0x0223ABB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	sub r7, r4, #1
_0223ABBA:
	ldr r0, _0223ABEC ; =0x00001314
	add r1, r6, r4
	ldrsb r1, [r1, r0]
	cmp r1, r7
	bne _0223ABD0
	ldr r0, _0223ABF0 ; =0x00000DF4
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	b _0223ABE2
_0223ABD0:
	cmp r1, #0
	blt _0223ABE2
	cmp r1, #9
	bgt _0223ABE2
	ldr r0, _0223ABF0 ; =0x00000DF4
	add r1, r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
_0223ABE2:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0223ABBA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223ABEC: .word 0x00001314
_0223ABF0: .word 0x00000DF4
	thumb_func_end ov72_0223ABB0

	thumb_func_start ov72_0223ABF4
ov72_0223ABF4: ; 0x0223ABF4
	mov r0, #0
	bx lr
	thumb_func_end ov72_0223ABF4

	thumb_func_start ov72_0223ABF8
ov72_0223ABF8: ; 0x0223ABF8
	mov r0, #0
	bx lr
	thumb_func_end ov72_0223ABF8

	thumb_func_start ov72_0223ABFC
ov72_0223ABFC: ; 0x0223ABFC
	mov r0, #0
	bx lr
	thumb_func_end ov72_0223ABFC

	thumb_func_start ov72_0223AC00
ov72_0223AC00: ; 0x0223AC00
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0x43
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223AC28 ; =0x00001312
	mov r1, #8
	strb r1, [r4, r0]
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223AC28: .word 0x00001312
	thumb_func_end ov72_0223AC00

	thumb_func_start ov72_0223AC2C
ov72_0223AC2C: ; 0x0223AC2C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223AC62
	add r0, r4, #0
	bl ov72_0223AD94
	add r0, r4, #0
	mov r1, #0
	bl ov72_02238B18
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r2, #0x43
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223AC68 ; =0x00001312
	mov r1, #9
	strb r1, [r4, r0]
_0223AC62:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223AC68: .word 0x00001312
	thumb_func_end ov72_0223AC2C

	thumb_func_start ov72_0223AC6C
ov72_0223AC6C: ; 0x0223AC6C
	push {r4, lr}
	add r4, r0, #0
	bl ov72_0223AE6C
	cmp r0, #0
	bne _0223AC80
	ldr r0, _0223AC84 ; =0x00001313
	ldrb r1, [r4, r0]
	sub r0, r0, #1
	strb r1, [r4, r0]
_0223AC80:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223AC84: .word 0x00001313
	thumb_func_end ov72_0223AC6C

	thumb_func_start ov72_0223AC88
ov72_0223AC88: ; 0x0223AC88
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223AC9A
	ldr r0, _0223ACA0 ; =0x00001312
	mov r1, #0xb
	strb r1, [r4, r0]
_0223AC9A:
	mov r0, #0
	pop {r4, pc}
	nop
_0223ACA0: .word 0x00001312
	thumb_func_end ov72_0223AC88

	thumb_func_start ov72_0223ACA4
ov72_0223ACA4: ; 0x0223ACA4
	mov r0, #1
	bx lr
	thumb_func_end ov72_0223ACA4

	thumb_func_start ov72_0223ACA8
ov72_0223ACA8: ; 0x0223ACA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r1, _0223AD14 ; =0x00001328
	ldr r5, _0223AD18 ; =ov72_0223B46C
	str r0, [sp, #0x14]
	mov r7, #0
	mov r4, #0x1f
	add r6, r0, r1
_0223ACB8:
	mov r0, #0x15
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0, #4]
	lsl r3, r3, #0x18
	add r1, r6, #0
	mov r2, #4
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r7, r7, #1
	add r4, #0x40
	add r5, r5, #4
	add r6, #0x10
	cmp r7, #3
	blt _0223ACB8
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x4f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, _0223AD1C ; =0x00001318
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #4]
	add r1, r1, r3
	mov r3, #2
	bl AddWindowParameterized
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223AD14: .word 0x00001328
_0223AD18: .word ov72_0223B46C
_0223AD1C: .word 0x00001318
	thumb_func_end ov72_0223ACA8

	thumb_func_start ov72_0223AD20
ov72_0223AD20: ; 0x0223AD20
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _0223AD60 ; =0x000F0200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #4
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223AD60: .word 0x000F0200
	thumb_func_end ov72_0223AD20

	thumb_func_start ov72_0223AD64
ov72_0223AD64: ; 0x0223AD64
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0223AD8C ; =0x00001328
	mov r4, #0
	add r5, r6, r0
_0223AD6E:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0223AD6E
	ldr r0, _0223AD90 ; =0x00001318
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223AD8C: .word 0x00001328
_0223AD90: .word 0x00001318
	thumb_func_end ov72_0223AD64

	thumb_func_start ov72_0223AD94
ov72_0223AD94: ; 0x0223AD94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov72_0223AD64
	ldr r0, _0223AE08 ; =0x00000DF4
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223AE0C ; =0x00000DF8
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223AE10 ; =0x00000DFC
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0xe
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223AE14 ; =0x00000E04
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223AE18 ; =0x00000E08
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0223AE1C ; =0x00000E0C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0xe1
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r4, #0
	ldr r6, _0223AE08 ; =0x00000DF4
	add r7, r4, #0
_0223ADF6:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0223ADF6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223AE08: .word 0x00000DF4
_0223AE0C: .word 0x00000DF8
_0223AE10: .word 0x00000DFC
_0223AE14: .word 0x00000E04
_0223AE18: .word 0x00000E08
_0223AE1C: .word 0x00000E0C
	thumb_func_end ov72_0223AD94

	thumb_func_start ov72_0223AE20
ov72_0223AE20: ; 0x0223AE20
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223AE64 ; =0x00001358
	add r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0223AE42
	ldrb r0, [r4, #2]
	lsl r0, r0, #2
	add r2, r5, r0
	ldr r0, _0223AE68 ; =0x00000DF4
	ldr r0, [r2, r0]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
_0223AE42:
	ldrb r0, [r4, #4]
	str r0, [sp]
	ldrb r0, [r4, #5]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	ldr r0, [r5, #4]
	bl BgTilemapRectChangePalette
	ldrb r1, [r4, #2]
	ldr r0, [r5, #4]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223AE64: .word 0x00001358
_0223AE68: .word 0x00000DF4
	thumb_func_end ov72_0223AE20

	thumb_func_start ov72_0223AE6C
ov72_0223AE6C: ; 0x0223AE6C
	push {r4, lr}
	ldr r1, _0223AECC ; =0x00001358
	add r4, r0, r1
	ldrb r1, [r4, #1]
	cmp r1, #0
	beq _0223AE82
	cmp r1, #1
	beq _0223AE94
	cmp r1, #2
	beq _0223AEB6
	b _0223AEC6
_0223AE82:
	ldrh r1, [r4, #8]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov72_0223AE20
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	b _0223AEC6
_0223AE94:
	ldrb r1, [r4, #3]
	add r1, r1, #1
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	cmp r1, #4
	bne _0223AEC6
	ldrh r1, [r4, #0xa]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov72_0223AE20
	mov r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	b _0223AEC6
_0223AEB6:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _0223AEC6
	mov r0, #0
	pop {r4, pc}
_0223AEC6:
	mov r0, #1
	pop {r4, pc}
	nop
_0223AECC: .word 0x00001358
	thumb_func_end ov72_0223AE6C

	thumb_func_start ov72_0223AED0
ov72_0223AED0: ; 0x0223AED0
	push {r4, r5, r6, r7}
	ldr r4, _0223AF18 ; =0x00001358
	mov r5, #1
	strb r5, [r0, r4]
	mov r5, #0
	add r6, r4, #3
	strb r5, [r0, r6]
	add r6, r4, #1
	strb r5, [r0, r6]
	mov r7, #5
	add r6, r4, #2
	strb r7, [r0, r6]
	add r7, r4, #0
	add r7, #8
	mov r6, #1
	strh r6, [r0, r7]
	add r6, r4, #0
	add r6, #0xa
	strh r5, [r0, r6]
	add r5, r4, #6
	strb r1, [r0, r5]
	add r1, r4, #7
	strb r2, [r0, r1]
	mov r2, #6
	add r1, r4, #4
	strb r2, [r0, r1]
	add r1, r4, #5
	strb r2, [r0, r1]
	add r1, r4, #0
	sub r1, #0x45
	strb r3, [r0, r1]
	mov r1, #0xa
	sub r4, #0x46
	strb r1, [r0, r4]
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0223AF18: .word 0x00001358
	thumb_func_end ov72_0223AED0

	thumb_func_start ov72_0223AF1C
ov72_0223AF1C: ; 0x0223AF1C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	mov r2, #0
	add r1, #0x2d
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0x2c
	ldrb r2, [r1]
	add r1, r4, #0
	add r1, #0x33
	strb r2, [r1]
	bl ov72_0223B0C4
	add r0, r4, #0
	bl ov72_0223B1C8
	add r0, r4, #0
	bl ov72_0223B2E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov72_0223AF1C

	thumb_func_start ov72_0223AF48
ov72_0223AF48: ; 0x0223AF48
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x2d
	ldrb r1, [r1]
	lsl r2, r1, #2
	ldr r1, _0223AF6C ; =ov72_0223B7FC
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0223AF66
	add r4, #0x33
	ldrb r0, [r4]
	add r0, r0, #1
	pop {r4, pc}
_0223AF66:
	mov r0, #0
	pop {r4, pc}
	nop
_0223AF6C: .word ov72_0223B7FC
	thumb_func_end ov72_0223AF48

	thumb_func_start ov72_0223AF70
ov72_0223AF70: ; 0x0223AF70
	mov r1, #1
	add r0, #0x2d
	strb r1, [r0]
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov72_0223AF70

	thumb_func_start ov72_0223AF7C
ov72_0223AF7C: ; 0x0223AF7C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0223B078 ; =ov72_0223B4C8
	bl sub_02025224
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0223AFE6
	ldr r0, _0223B07C ; =0x000005DC
	bl PlaySE
	cmp r5, #0
	bne _0223AFBE
	add r0, r4, #0
	mov r1, #0
	add r0, #0x33
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x33
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov72_0223B2FC
	ldr r0, [r4, #4]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #3
	add r4, #0x2d
	strb r0, [r4]
	b _0223B074
_0223AFBE:
	cmp r5, #1
	bne _0223B074
	add r0, r4, #0
	mov r1, #1
	add r0, #0x33
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x33
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov72_0223B2FC
	ldr r0, [r4, #4]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #3
	add r4, #0x2d
	strb r0, [r4]
	b _0223B074
_0223AFE6:
	ldr r0, _0223B080 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0223B00A
	add r0, r4, #0
	mov r1, #0
	add r0, #0x33
	strb r1, [r0]
	add r0, r4, #0
	add r4, #0x33
	ldrb r1, [r4]
	bl ov72_0223B2FC
	ldr r0, _0223B07C ; =0x000005DC
	bl PlaySE
	b _0223B074
_0223B00A:
	mov r1, #0x80
	tst r1, r0
	beq _0223B02A
	add r0, r4, #0
	mov r1, #1
	add r0, #0x33
	strb r1, [r0]
	add r0, r4, #0
	add r4, #0x33
	ldrb r1, [r4]
	bl ov72_0223B2FC
	ldr r0, _0223B07C ; =0x000005DC
	bl PlaySE
	b _0223B074
_0223B02A:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _0223B048
	ldr r0, [r4, #4]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #3
	add r4, #0x2d
	strb r0, [r4]
	ldr r0, _0223B07C ; =0x000005DC
	bl PlaySE
	b _0223B074
_0223B048:
	mov r1, #2
	tst r0, r1
	beq _0223B074
	add r0, r4, #0
	add r0, #0x33
	add r1, r4, #0
	strb r2, [r0]
	add r1, #0x33
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov72_0223B2FC
	add r0, r4, #0
	mov r1, #3
	add r0, #0x2d
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223B07C ; =0x000005DC
	bl PlaySE
_0223B074:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B078: .word ov72_0223B4C8
_0223B07C: .word 0x000005DC
_0223B080: .word gSystem
	thumb_func_end ov72_0223AF7C

	thumb_func_start ov72_0223B084
ov72_0223B084: ; 0x0223B084
	mov r0, #0
	bx lr
	thumb_func_end ov72_0223B084

	thumb_func_start ov72_0223B088
ov72_0223B088: ; 0x0223B088
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl sub_02024B68
	cmp r0, #0
	beq _0223B09A
	mov r0, #0
	pop {r4, pc}
_0223B09A:
	add r0, r4, #0
	add r0, #0x2f
	ldrb r0, [r0]
	mov r1, #0
	bl ToggleBgLayer
	add r0, r4, #0
	add r0, #0x32
	ldrb r0, [r0]
	mov r1, #0
	bl ToggleBgLayer
	add r0, r4, #0
	bl ov72_0223B2C0
	ldr r0, [r4, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov72_0223B088

	thumb_func_start ov72_0223B0C4
ov72_0223B0C4: ; 0x0223B0C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r1, [r4, #0x28]
	mov r0, #0xef
	bl NARC_ctor
	add r1, r4, #0
	add r1, #0x2f
	ldrb r1, [r1]
	str r0, [sp, #0x14]
	cmp r1, #3
	bhi _0223B108
	mov r1, #0x20
	str r1, [sp]
	ldr r1, [r4, #0x28]
	add r3, r4, #0
	str r1, [sp, #4]
	add r3, #0x2e
	ldrb r3, [r3]
	mov r1, #0
	add r2, r1, #0
	lsl r3, r3, #5
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add r1, r4, #0
	add r1, #0x30
	ldrb r1, [r1]
	ldr r2, [r4, #0x28]
	mov r0, #0
	lsl r1, r1, #5
	bl LoadFontPal0
	b _0223B130
_0223B108:
	mov r1, #0x20
	str r1, [sp]
	ldr r1, [r4, #0x28]
	add r3, r4, #0
	str r1, [sp, #4]
	add r3, #0x2e
	ldrb r3, [r3]
	mov r1, #0
	mov r2, #4
	lsl r3, r3, #5
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add r1, r4, #0
	add r1, #0x30
	ldrb r1, [r1]
	ldr r2, [r4, #0x28]
	mov r0, #4
	lsl r1, r1, #5
	bl LoadFontPal0
_0223B130:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x28]
	add r3, r4, #0
	str r0, [sp, #0xc]
	add r3, #0x2f
	ldrb r3, [r3]
	ldr r0, [sp, #0x14]
	ldr r2, [r4]
	mov r1, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, [r4, #0x28]
	mov r1, #0xa
	str r0, [sp]
	ldr r0, [sp, #0x14]
	mov r2, #0
	add r3, sp, #0x18
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	add r1, r4, #0
	add r1, #0x2f
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldr r0, [r4]
	bl GetBgTilemapBuffer
	ldr r2, [sp, #0x18]
	mov r5, #3
	ldr r7, _0223B1C4 ; =0x00000FFF
	add r3, r0, #0
	mov r1, #0
	add r2, #0xc
	lsl r5, r5, #8
_0223B178:
	add r0, r4, #0
	add r0, #0x2e
	ldrh r6, [r2]
	ldrb r0, [r0]
	add r1, r1, #1
	and r6, r7
	lsl r0, r0, #0xc
	orr r0, r6
	strh r0, [r3]
	add r2, r2, #2
	add r3, r3, #2
	cmp r1, r5
	blt _0223B178
	add r1, r4, #0
	add r1, #0x2f
	ldrb r1, [r1]
	ldr r0, [r4]
	bl BgCommitTilemapBufferToVram
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	add r0, r4, #0
	add r0, #0x2f
	ldrb r0, [r0]
	mov r1, #1
	bl ToggleBgLayer
	add r4, #0x32
	ldrb r0, [r4]
	mov r1, #1
	bl ToggleBgLayer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B1C4: .word 0x00000FFF
	thumb_func_end ov72_0223B0C4

	thumb_func_start ov72_0223B1C8
ov72_0223B1C8: ; 0x0223B1C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r3, [r5, #0x28]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r2, r5, #0
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x31
	ldrb r0, [r0]
	add r2, #0x32
	add r1, #8
	str r0, [sp, #0x10]
	ldrb r2, [r2]
	ldr r0, [r5]
	mov r3, #0xc
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r2, r5, #0
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x31
	ldrb r0, [r0]
	add r2, #0x32
	add r1, #0x18
	add r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r2, [r2]
	ldr r0, [r5]
	mov r3, #0xc
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x18
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #0x2e
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2f
	bl NewString_ReadMsgData
	mov r3, #0
	add r7, r0, #0
	str r3, [sp]
	ldr r0, _0223B2BC ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #8
	mov r1, #4
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r3, #0
	str r3, [sp]
	ldr r0, _0223B2BC ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x18
	mov r1, #4
	add r2, r7, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	add r0, #8
	bl CopyWindowToVram
	add r5, #0x18
	add r0, r5, #0
	bl CopyWindowToVram
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl DestroyMsgData
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223B2BC: .word 0x000F0100
	thumb_func_end ov72_0223B1C8

	thumb_func_start ov72_0223B2C0
ov72_0223B2C0: ; 0x0223B2C0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x18
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #8
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x18
	bl RemoveWindow
	add r4, #8
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov72_0223B2C0

	thumb_func_start ov72_0223B2E4
ov72_0223B2E4: ; 0x0223B2E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r4, #0x2c
	ldrb r1, [r4]
	bl ov72_0223B2FC
	pop {r4, pc}
	thumb_func_end ov72_0223B2E4

	thumb_func_start ov72_0223B2FC
ov72_0223B2FC: ; 0x0223B2FC
	push {lr}
	sub sp, #0xc
	lsl r3, r1, #2
	ldr r1, _0223B328 ; =ov72_0223B4C0
	ldrh r1, [r1, r3]
	lsl r1, r1, #0xc
	str r1, [sp]
	ldr r1, _0223B32C ; =ov72_0223B4C2
	ldr r2, [r0, #0x34]
	ldrh r1, [r1, r3]
	add r1, r2, r1
	lsl r1, r1, #0xc
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	nop
_0223B328: .word ov72_0223B4C0
_0223B32C: .word ov72_0223B4C2
	thumb_func_end ov72_0223B2FC

	.rodata

_0223B330:
	.byte 0x00, 0x17, 0x0D, 0x07, 0x04, 0x0D, 0x00, 0x00

ov72_0223B338: ; 0x0223B338
	.byte 0x28, 0x00, 0xB0, 0x00, 0x80, 0x00, 0xB0, 0x00
	.byte 0xD8, 0x00, 0xB0, 0x00

ov72_0223B344: ; 0x0223B344
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x43, 0x00, 0x00, 0x00

ov72_0223B354: ; 0x0223B354
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov72_0223B364: ; 0x0223B364
	.byte 0x60, 0x00

ov72_0223B366: ; 0x0223B366
	.byte 0x1D, 0x00, 0x80, 0x00, 0x1D, 0x00, 0xA0, 0x00, 0x1D, 0x00
	.byte 0x50, 0x00, 0x1D, 0x00, 0x70, 0x00, 0x1D, 0x00, 0x90, 0x00, 0x1D, 0x00

ov72_0223B37C: ; 0x0223B37C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov72_0223B3A4: ; 0x0223B3A4
	.byte 0x20, 0x00

ov72_0223B3A6: ; 0x0223B3A6
	.byte 0x51, 0x00, 0x50, 0x00, 0x51, 0x00, 0x80, 0x00, 0x51, 0x00
	.byte 0xAE, 0x00, 0x51, 0x00, 0xE0, 0x00, 0x51, 0x00, 0x20, 0x00, 0x80, 0x00, 0x50, 0x00, 0x80, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0xAE, 0x00, 0x80, 0x00, 0xE0, 0x00, 0x80, 0x00, 0x28, 0x00, 0xB0, 0x00
	.byte 0x80, 0x00, 0xB0, 0x00, 0xD8, 0x00, 0xB0, 0x00

ov72_0223B3D8: ; 0x0223B3D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov72_0223B3F4: ; 0x0223B3F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov72_0223B410: ; 0x0223B410
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov72_0223B42C: ; 0x0223B42C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov72_0223B448: ; 0x0223B448
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov72_0223B464: ; 0x0223B464
	.byte 0x05, 0x06

ov72_0223B466: ; 0x0223B466
	.byte 0x00, 0x01

ov72_0223B468: ; 0x0223B468
	.byte 0x08, 0x09

ov72_0223B46A: ; 0x0223B46A
	.byte 0x03, 0x04

ov72_0223B46C: ; 0x0223B46C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00

ov72_0223B478: ; 0x0223B478
	.byte 0x01

ov72_0223B479: ; 0x0223B479
	.byte 0x07, 0x07, 0x07, 0x0D, 0x07, 0x13, 0x07
	.byte 0x19, 0x07, 0x01, 0x0D, 0x07, 0x0D, 0x0D, 0x0D, 0x13, 0x0D, 0x19, 0x0D

ov72_0223B48C: ; 0x0223B48C
	.byte 0x0A, 0x05, 0x04, 0x01
	.byte 0x0A, 0x06, 0x00, 0x02, 0x0B, 0x07, 0x01, 0x03, 0x0C, 0x08, 0x02, 0x04, 0x0C, 0x09, 0x03, 0x00
	.byte 0x00, 0x0A, 0x09, 0x06, 0x01, 0x0A, 0x05, 0x07, 0x02, 0x0B, 0x06, 0x08, 0x03, 0x0C, 0x07, 0x09
	.byte 0x04, 0x0C, 0x08, 0x05, 0x0D, 0x0E, 0x0C, 0x0B, 0x07, 0x02, 0x0A, 0x0C, 0x0F, 0x10, 0x0B, 0x0A

ov72_0223B4C0: ; 0x0223B4C0
	.byte 0x80, 0x00

ov72_0223B4C2: ; 0x0223B4C2
	.byte 0x48, 0x00, 0x80, 0x00, 0x78, 0x00

ov72_0223B4C8: ; 0x0223B4C8
	.byte 0x32, 0x5C, 0x03, 0xFB, 0x63, 0x8C, 0x03, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00

	.data

_0223B4E0:
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/battletower/roomnum.asp"
	.balign 4, 0

ov72_0223B52C: ; 0x0223B52C
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/battletower/download.asp"
	.balign 4, 0

ov72_0223B578: ; 0x0223B578
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/battletower/upload.asp"
	.balign 4, 0

ov72_0223B5C4: ; 0x0223B5C4
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/battletower/info.asp"
	.balign 4, 0

ov72_0223B60C: ; 0x0223B60C
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/common/setProfile.asp"
	.balign 4, 0

ov72_0223B654: ; 0x0223B654
	.word ov72_0223886C

ov72_0223B658: ; 0x0223B658
	.word ov72_0223894C

ov72_0223B65C: ; 0x0223B65C
	.word ov72_0223897C

ov72_0223B660: ; 0x0223B660
	.word ov72_022390D8
	.word ov72_02239108
	.word ov72_022391E8
	.word ov72_02239220
	.word ov72_022392AC
	.word ov72_022392BC
	.word ov72_02239370
	.word ov72_022393B0
	.word ov72_022393CC
	.word ov72_022394A4
	.word ov72_022394D8
	.word ov72_02239614
	.word ov72_02239638
	.word ov72_022396E8
	.word ov72_02239760
	.word ov72_02239784
	.word ov72_022397E8
	.word ov72_0223988C
	.word ov72_022398BC
	.word ov72_022399CC
	.word ov72_0223985C
	.word ov72_02239ED4
	.word ov72_02239F04
	.word ov72_02239F30
	.word ov72_02239F60
	.word ov72_02239A08
	.word ov72_02239A3C
	.word ov72_02239A88
	.word ov72_02239B5C
	.word ov72_02239B98
	.word ov72_02239BC8
	.word ov72_02239BEC
	.word ov72_02239C14
	.word ov72_02239C8C
	.word ov72_02239CB4
	.word ov72_02239CD8
	.word ov72_02239D3C
	.word ov72_02239D6C
	.word ov72_02239E58
	.word ov72_02239E9C
	.word ov72_02239EB4
	.word ov72_02239F8C
	.word ov72_02239FBC
	.word ov72_02239FD8
	.word ov72_0223A010
	.word ov72_02239E94
	.word ov72_0223A014
	.word ov72_0223A1AC
	.word ov72_0223A200
	.word ov72_0223A1CC
	.word ov72_0223A044
	.word ov72_02239168
	.word ov72_02239198
	.word ov72_0223A06C
	.word ov72_0223A0E0
	.word ov72_0223A2E8
	.word ov72_0223A314

ov72_0223B744: ; 0x0223B744
	.word ov72_0223A5B4
	.word ov72_0223A5E0
	.word ov72_0223A71C
	.word ov72_0223AB84
	.word ov72_0223ABF4
	.word ov72_0223ABF8
	.word ov72_0223ABFC
	.word ov72_0223AC00
	.word ov72_0223AC2C
	.word ov72_0223AC88
	.word ov72_0223AC6C
	.word ov72_0223ACA4

ov72_0223B774: ; 0x0223B774
	.byte 0x0E, 0x2F, 0x58, 0x77, 0x0E, 0x2F, 0x78, 0x97, 0x0E, 0x2F, 0x98, 0xB7
	.byte 0x3C, 0x63, 0x0C, 0x33, 0x3C, 0x63, 0x3C, 0x63, 0x3C, 0x63, 0x6C, 0x93, 0x3C, 0x63, 0x9E, 0xC3
	.byte 0x3C, 0x63, 0xCC, 0xF3, 0x6C, 0x93, 0x0C, 0x33, 0x6C, 0x93, 0x3C, 0x63, 0x6C, 0x93, 0x6C, 0x93
	.byte 0x6C, 0x93, 0x9E, 0xC3, 0x6C, 0x93, 0xCC, 0xF3, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0x5C, 0xA3
	.byte 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00

ov72_0223B7B8: ; 0x0223B7B8
	.byte 0x0E, 0x2F, 0x48, 0x67, 0x0E, 0x2F, 0x68, 0x87
	.byte 0x0E, 0x2F, 0x88, 0xA7, 0x3C, 0x63, 0x0C, 0x33, 0x3C, 0x63, 0x3C, 0x63, 0x3C, 0x63, 0x6C, 0x93
	.byte 0x3C, 0x63, 0x9E, 0xC3, 0x3C, 0x63, 0xCC, 0xF3, 0x6C, 0x93, 0x0C, 0x33, 0x6C, 0x93, 0x3C, 0x63
	.byte 0x6C, 0x93, 0x6C, 0x93, 0x6C, 0x93, 0x9E, 0xC3, 0x6C, 0x93, 0xCC, 0xF3, 0xA4, 0xBB, 0x04, 0x4B
	.byte 0xA4, 0xBB, 0x5C, 0xA3, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00

ov72_0223B7FC: ; 0x0223B7FC
	.word ov72_0223AF70, ov72_0223AF7C, ov72_0223B084, ov72_0223B088

	.bss

_0223B820:
	.space 0xC

ov72_0223B82C: ; 0x0223B82C
	.space 0x8

ov72_0223B834: ; 0x0223B834
	.space 0xCC

ov72_0223B900: ; 0x0223B900
	.space 0x1B

ov72_0223B91B: ; 0x0223B91B
	.space 0x5

ov72_0223B920: ; 0x0223B920
	.space 0x3

ov72_0223B923: ; 0x0223B923
	.space 0x9

ov72_0223B92C: ; 0x0223B92C
	.space 0x14
