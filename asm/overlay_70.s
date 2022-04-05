	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov70_022378C0
ov70_022378C0: ; 0x022378C0
	push {r3, r4}
	ldr r3, _022378D8 ; =_02246800
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
_022378D8: .word _02246800
	thumb_func_end ov70_022378C0

	thumb_func_start ov70_022378DC
ov70_022378DC: ; 0x022378DC
	push {r3, lr}
	ldr r1, _02237BC0 ; =_02246800
	ldr r0, [r1]
	cmp r0, #0x18
	bls _022378E8
	b _02237F24
_022378E8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022378F4: ; jump table
	.short _02237F24 - _022378F4 - 2 ; case 0
	.short _02237F24 - _022378F4 - 2 ; case 1
	.short _02237926 - _022378F4 - 2 ; case 2
	.short _02237F18 - _022378F4 - 2 ; case 3
	.short _022379D4 - _022378F4 - 2 ; case 4
	.short _02237F18 - _022378F4 - 2 ; case 5
	.short _02237A5A - _022378F4 - 2 ; case 6
	.short _02237F18 - _022378F4 - 2 ; case 7
	.short _02237ADA - _022378F4 - 2 ; case 8
	.short _02237F18 - _022378F4 - 2 ; case 9
	.short _02237B6E - _022378F4 - 2 ; case 10
	.short _02237F18 - _022378F4 - 2 ; case 11
	.short _02237BEC - _022378F4 - 2 ; case 12
	.short _02237F18 - _022378F4 - 2 ; case 13
	.short _02237C72 - _022378F4 - 2 ; case 14
	.short _02237F18 - _022378F4 - 2 ; case 15
	.short _02237CEA - _022378F4 - 2 ; case 16
	.short _02237F18 - _022378F4 - 2 ; case 17
	.short _02237DBC - _022378F4 - 2 ; case 18
	.short _02237F18 - _022378F4 - 2 ; case 19
	.short _02237E10 - _022378F4 - 2 ; case 20
	.short _02237F18 - _022378F4 - 2 ; case 21
	.short _02237E80 - _022378F4 - 2 ; case 22
	.short _02237F18 - _022378F4 - 2 ; case 23
	.short _02237F24 - _022378F4 - 2 ; case 24
_02237926:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237934
	cmp r0, #7
	beq _0223794C
	pop {r3, pc}
_02237934:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_0223794C:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	ldr r2, _02237BC4 ; =ov70_02246920
	str r1, [r0]
	ldrb r2, [r2, #0x1c]
	cmp r2, #0xe
	bhi _022379C6
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02237966: ; jump table
	.short _022379C6 - _02237966 - 2 ; case 0
	.short _02237984 - _02237966 - 2 ; case 1
	.short _0223798A - _02237966 - 2 ; case 2
	.short _02237990 - _02237966 - 2 ; case 3
	.short _022379C6 - _02237966 - 2 ; case 4
	.short _022379C6 - _02237966 - 2 ; case 5
	.short _022379C6 - _02237966 - 2 ; case 6
	.short _02237996 - _02237966 - 2 ; case 7
	.short _022379A8 - _02237966 - 2 ; case 8
	.short _022379AE - _02237966 - 2 ; case 9
	.short _022379B4 - _02237966 - 2 ; case 10
	.short _022379BA - _02237966 - 2 ; case 11
	.short _0223799C - _02237966 - 2 ; case 12
	.short _022379A2 - _02237966 - 2 ; case 13
	.short _022379C0 - _02237966 - 2 ; case 14
_02237984:
	mov r1, #0
	str r1, [r0, #4]
	b _022379CE
_0223798A:
	sub r1, #0x1d
	str r1, [r0, #4]
	b _022379CE
_02237990:
	sub r1, #0x1c
	str r1, [r0, #4]
	b _022379CE
_02237996:
	sub r1, #0x19
	str r1, [r0, #4]
	b _022379CE
_0223799C:
	sub r1, #0x1e
	str r1, [r0, #4]
	b _022379CE
_022379A2:
	sub r1, #0x1f
	str r1, [r0, #4]
	b _022379CE
_022379A8:
	sub r1, #0x20
	str r1, [r0, #4]
	b _022379CE
_022379AE:
	sub r1, #0x21
	str r1, [r0, #4]
	b _022379CE
_022379B4:
	sub r1, #0x22
	str r1, [r0, #4]
	b _022379CE
_022379BA:
	sub r1, #0x23
	str r1, [r0, #4]
	b _022379CE
_022379C0:
	sub r1, #0x1a
	str r1, [r0, #4]
	b _022379CE
_022379C6:
	mov r1, #0xc
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_022379CE:
	bl ov38_0221BFEC
	pop {r3, pc}
_022379D4:
	bl ov38_0221BF48
	cmp r0, #1
	beq _022379E2
	cmp r0, #7
	beq _022379FA
	pop {r3, pc}
_022379E2:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_022379FA:
	ldr r0, _02237BC0 ; =_02246800
	mov r2, #0x18
	ldr r1, _02237BC4 ; =ov70_02246920
	str r2, [r0]
	ldrb r1, [r1, #0x1c]
	cmp r1, #5
	bgt _02237A24
	cmp r1, #0
	blt _02237A4C
	add r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02237A18: ; jump table
	.short _02237A4C - _02237A18 - 2 ; case 0
	.short _02237A2A - _02237A18 - 2 ; case 1
	.short _02237A30 - _02237A18 - 2 ; case 2
	.short _02237A36 - _02237A18 - 2 ; case 3
	.short _02237A4C - _02237A18 - 2 ; case 4
	.short _02237A3C - _02237A18 - 2 ; case 5
_02237A24:
	cmp r1, #0xe
	beq _02237A42
	b _02237A4C
_02237A2A:
	mov r1, #0
	str r1, [r0, #4]
	b _02237A54
_02237A30:
	sub r2, #0x1d
	str r2, [r0, #4]
	b _02237A54
_02237A36:
	sub r2, #0x1c
	str r2, [r0, #4]
	b _02237A54
_02237A3C:
	sub r2, #0x1b
	str r2, [r0, #4]
	b _02237A54
_02237A42:
	mov r1, #1
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237A54
_02237A4C:
	mov r1, #0xc
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237A54:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237A5A:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237A68
	cmp r0, #7
	beq _02237A80
	pop {r3, pc}
_02237A68:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237A80:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C020
	mov r1, #0x49
	lsl r1, r1, #2
	cmp r0, r1
	bne _02237A9A
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0
	str r1, [r0, #4]
	b _02237AD4
_02237A9A:
	ldr r0, _02237BC8 ; =ov70_02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #3
	beq _02237AB8
	cmp r0, #5
	beq _02237AAE
	cmp r0, #0xe
	beq _02237AC2
	b _02237ACC
_02237AAE:
	mov r1, #2
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237AD4
_02237AB8:
	mov r1, #3
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237AD4
_02237AC2:
	mov r1, #1
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237AD4
_02237ACC:
	mov r1, #0xc
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237AD4:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237ADA:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237AE8
	cmp r0, #7
	beq _02237B00
	pop {r3, pc}
_02237AE8:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237B00:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C020
	mov r1, #0x49
	lsl r1, r1, #2
	cmp r0, r1
	bne _02237B1A
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #1
	str r1, [r0, #4]
	b _02237B68
_02237B1A:
	ldr r0, _02237BC8 ; =ov70_02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #5
	bgt _02237B34
	cmp r0, #3
	blt _02237B60
	beq _02237B44
	cmp r0, #4
	beq _02237B4E
	cmp r0, #5
	beq _02237B3A
	b _02237B60
_02237B34:
	cmp r0, #0xe
	beq _02237B56
	b _02237B60
_02237B3A:
	mov r1, #2
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237B68
_02237B44:
	mov r1, #3
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237B68
_02237B4E:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0
	str r1, [r0, #4]
	b _02237B68
_02237B56:
	mov r1, #1
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237B68
_02237B60:
	mov r1, #0xc
	ldr r0, _02237BC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237B68:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237B6E:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237B7C
	cmp r0, #7
	beq _02237B94
	pop {r3, pc}
_02237B7C:
	ldr r0, _02237BC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237B94:
	ldr r1, _02237BC0 ; =_02246800
	mov r2, #0x18
	ldr r0, _02237BC4 ; =ov70_02246920
	str r2, [r1]
	ldrb r0, [r0, #0x1c]
	cmp r0, #5
	bgt _02237BB2
	cmp r0, #1
	blt _02237BDE
	beq _02237BB8
	cmp r0, #3
	beq _02237BD2
	cmp r0, #5
	beq _02237BCC
	b _02237BDE
_02237BB2:
	cmp r0, #0xe
	beq _02237BD8
	b _02237BDE
_02237BB8:
	mov r0, #0
	str r0, [r1, #4]
	b _02237BE6
	nop
_02237BC0: .word _02246800
_02237BC4: .word ov70_02246920
_02237BC8: .word ov70_02246900
_02237BCC:
	sub r2, #0x1b
	str r2, [r1, #4]
	b _02237BE6
_02237BD2:
	sub r2, #0x1c
	str r2, [r1, #4]
	b _02237BE6
_02237BD8:
	sub r2, #0x1a
	str r2, [r1, #4]
	b _02237BE6
_02237BDE:
	mov r1, #0xc
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237BE6:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237BEC:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237BFA
	cmp r0, #7
	beq _02237C12
	pop {r3, pc}
_02237BFA:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237C12:
	ldr r0, _02237EC0 ; =_02246800
	mov r2, #0x18
	ldr r1, _02237EC4 ; =ov70_02246920
	str r2, [r0]
	ldrb r1, [r1, #0x1c]
	cmp r1, #5
	bgt _02237C3C
	cmp r1, #0
	blt _02237C64
	add r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02237C30: ; jump table
	.short _02237C64 - _02237C30 - 2 ; case 0
	.short _02237C42 - _02237C30 - 2 ; case 1
	.short _02237C4E - _02237C30 - 2 ; case 2
	.short _02237C54 - _02237C30 - 2 ; case 3
	.short _02237C64 - _02237C30 - 2 ; case 4
	.short _02237C48 - _02237C30 - 2 ; case 5
_02237C3C:
	cmp r1, #0xe
	beq _02237C5A
	b _02237C64
_02237C42:
	mov r1, #0
	str r1, [r0, #4]
	b _02237C6C
_02237C48:
	sub r2, #0x1b
	str r2, [r0, #4]
	b _02237C6C
_02237C4E:
	sub r2, #0x1d
	str r2, [r0, #4]
	b _02237C6C
_02237C54:
	sub r2, #0x1c
	str r2, [r0, #4]
	b _02237C6C
_02237C5A:
	mov r1, #1
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237C6C
_02237C64:
	mov r1, #0xc
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237C6C:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237C72:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237C80
	cmp r0, #7
	beq _02237C98
	pop {r3, pc}
_02237C80:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237C98:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C020
	mov r1, #0x49
	lsl r1, r1, #2
	cmp r0, r1
	blo _02237CBC
	bl ov38_0221C020
	mov r1, #0x49
	lsl r1, r1, #2
	bl _u32_div_f
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	b _02237CE4
_02237CBC:
	cmp r0, #0
	bne _02237CC8
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0
	str r1, [r0, #4]
	b _02237CE4
_02237CC8:
	ldr r0, _02237EC8 ; =ov70_02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _02237CDC
	mov r1, #1
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237CE4
_02237CDC:
	mov r1, #0xc
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237CE4:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237CEA:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237CF8
	cmp r0, #7
	beq _02237D10
	pop {r3, pc}
_02237CF8:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237D10:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C020
	mov r1, #0x49
	lsl r1, r1, #2
	cmp r0, r1
	bne _02237D2A
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0
	str r1, [r0, #4]
	b _02237DB6
_02237D2A:
	ldr r0, _02237EC8 ; =ov70_02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _02237DAE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237D40: ; jump table
	.short _02237DAE - _02237D40 - 2 ; case 0
	.short _02237DAE - _02237D40 - 2 ; case 1
	.short _02237D5E - _02237D40 - 2 ; case 2
	.short _02237DAE - _02237D40 - 2 ; case 3
	.short _02237DAE - _02237D40 - 2 ; case 4
	.short _02237DAE - _02237D40 - 2 ; case 5
	.short _02237DAE - _02237D40 - 2 ; case 6
	.short _02237DAE - _02237D40 - 2 ; case 7
	.short _02237D7C - _02237D40 - 2 ; case 8
	.short _02237D86 - _02237D40 - 2 ; case 9
	.short _02237D90 - _02237D40 - 2 ; case 10
	.short _02237D9A - _02237D40 - 2 ; case 11
	.short _02237D68 - _02237D40 - 2 ; case 12
	.short _02237D72 - _02237D40 - 2 ; case 13
	.short _02237DA4 - _02237D40 - 2 ; case 14
_02237D5E:
	mov r1, #4
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D68:
	mov r1, #5
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D72:
	mov r1, #6
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D7C:
	mov r1, #7
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D86:
	mov r1, #8
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D90:
	mov r1, #9
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D9A:
	mov r1, #0xa
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237DA4:
	mov r1, #1
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237DAE:
	mov r1, #0xc
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237DB6:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237DBC:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237DCA
	cmp r0, #7
	beq _02237DE2
	pop {r3, pc}
_02237DCA:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237DE2:
	ldr r1, _02237EC0 ; =_02246800
	mov r2, #0x18
	ldr r0, _02237EC4 ; =ov70_02246920
	str r2, [r1]
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	beq _02237DFA
	cmp r0, #2
	beq _02237E06
	cmp r0, #0xe
	beq _02237E00
	b _02237E0A
_02237DFA:
	mov r0, #0
	str r0, [r1, #4]
	b _02237E0A
_02237E00:
	sub r2, #0x1a
	str r2, [r1, #4]
	b _02237E0A
_02237E06:
	sub r2, #0x1d
	str r2, [r1, #4]
_02237E0A:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237E10:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237E1E
	cmp r0, #7
	beq _02237E36
	pop {r3, pc}
_02237E1E:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237E36:
	ldr r1, _02237EC0 ; =_02246800
	mov r2, #0x18
	ldr r0, _02237EC4 ; =ov70_02246920
	str r2, [r1]
	ldrb r0, [r0, #0x1c]
	cmp r0, #7
	bgt _02237E54
	cmp r0, #1
	blt _02237E72
	beq _02237E5A
	cmp r0, #6
	beq _02237E60
	cmp r0, #7
	beq _02237E66
	b _02237E72
_02237E54:
	cmp r0, #0xe
	beq _02237E6C
	b _02237E72
_02237E5A:
	mov r0, #0
	str r0, [r1, #4]
	b _02237E7A
_02237E60:
	mov r0, #1
	str r0, [r1, #4]
	b _02237E7A
_02237E66:
	mov r0, #2
	str r0, [r1, #4]
	b _02237E7A
_02237E6C:
	sub r2, #0x1a
	str r2, [r1, #4]
	b _02237E7A
_02237E72:
	mov r1, #0xc
	ldr r0, _02237EC0 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237E7A:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237E80:
	bl ov38_0221BF48
	cmp r0, #1
	beq _02237E8E
	cmp r0, #7
	beq _02237EA6
	pop {r3, pc}
_02237E8E:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 ; =_02246800
	str r0, [r1, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
_02237EA6:
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	bl ov38_0221C020
	cmp r0, #8
	bne _02237EBC
	ldr r0, _02237EC0 ; =_02246800
	mov r1, #0
	str r1, [r0, #4]
	b _02237F12
_02237EBC:
	ldr r0, _02237EC4 ; =ov70_02246920
	b _02237ECC
	.balign 4, 0
_02237EC0: .word _02246800
_02237EC4: .word ov70_02246920
_02237EC8: .word ov70_02246900
_02237ECC:
	ldrb r0, [r0, #0x1c]
	cmp r0, #7
	bgt _02237EE2
	cmp r0, #1
	blt _02237F0A
	beq _02237EE8
	cmp r0, #6
	beq _02237EF0
	cmp r0, #7
	beq _02237EF8
	b _02237F0A
_02237EE2:
	cmp r0, #0xe
	beq _02237F00
	b _02237F0A
_02237EE8:
	ldr r0, _02237F28 ; =_02246800
	mov r1, #0
	str r1, [r0, #4]
	b _02237F12
_02237EF0:
	ldr r0, _02237F28 ; =_02246800
	mov r1, #1
	str r1, [r0, #4]
	b _02237F12
_02237EF8:
	ldr r0, _02237F28 ; =_02246800
	mov r1, #2
	str r1, [r0, #4]
	b _02237F12
_02237F00:
	mov r1, #1
	ldr r0, _02237F28 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
	b _02237F12
_02237F0A:
	mov r1, #0xc
	ldr r0, _02237F28 ; =_02246800
	mvn r1, r1
	str r1, [r0, #4]
_02237F12:
	bl ov38_0221BFEC
	pop {r3, pc}
_02237F18:
	mov r0, #0x18
	str r0, [r1]
	sub r0, #0x24
	str r0, [r1, #4]
	bl ov38_0221BFEC
_02237F24:
	pop {r3, pc}
	nop
_02237F28: .word _02246800
	thumb_func_end ov70_022378DC

	thumb_func_start ov70_02237F2C
ov70_02237F2C: ; 0x02237F2C
	ldr r0, _02237F34 ; =_02246800
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_02237F34: .word _02246800
	thumb_func_end ov70_02237F2C

	thumb_func_start ov70_02237F38
ov70_02237F38: ; 0x02237F38
	ldr r1, _02237F54 ; =_02246800
	ldr r0, [r1]
	cmp r0, #1
	beq _02237F46
	cmp r0, #0x18
	beq _02237F4A
	b _02237F50
_02237F46:
	mov r0, #1
	bx lr
_02237F4A:
	mov r0, #1
	str r0, [r1]
	bx lr
_02237F50:
	mov r0, #0
	bx lr
	.balign 4, 0
_02237F54: .word _02246800
	thumb_func_end ov70_02237F38

	thumb_func_start ov70_02237F58
ov70_02237F58: ; 0x02237F58
	ldr r0, _02237F60 ; =_02246800
	ldr r0, [r0, #4]
	bx lr
	nop
_02237F60: .word _02246800
	thumb_func_end ov70_02237F58

	thumb_func_start ov70_02237F64
ov70_02237F64: ; 0x02237F64
	push {r3, lr}
	add r1, r0, #0
	mov r2, #0x49
	ldr r0, _02237FA4 ; =ov70_02246814
	lsl r2, r2, #2
	bl memcpy
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	mov r2, #0x49
	ldr r0, _02237FA8 ; =ov70_022460A0
	ldr r1, _02237FA4 ; =ov70_02246814
	ldr r3, _02237FAC ; =ov70_0224693C
	lsl r2, r2, #2
	bl ov70_02238360
	cmp r0, #0
	beq _02237F94
	ldr r0, _02237FB0 ; =_02246800
	mov r1, #2
	str r1, [r0]
	pop {r3, pc}
_02237F94:
	ldr r0, _02237FB0 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	.balign 4, 0
_02237FA4: .word ov70_02246814
_02237FA8: .word ov70_022460A0
_02237FAC: .word ov70_0224693C
_02237FB0: .word _02246800
	thumb_func_end ov70_02237F64

	thumb_func_start ov70_02237FB4
ov70_02237FB4: ; 0x02237FB4
	push {r3, lr}
	ldr r0, _02237FF4 ; =ov70_0224680C
	ldr r2, _02237FF8 ; =ov70_02246814
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r2]
	str r0, [r2, #4]
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	ldr r0, _02237FFC ; =ov70_022460EC
	ldr r1, _02237FF8 ; =ov70_02246814
	ldr r3, _02238000 ; =ov70_0224693C
	mov r2, #8
	bl ov70_02238360
	cmp r0, #0
	beq _02237FE2
	ldr r0, _02238004 ; =_02246800
	mov r1, #4
	str r1, [r0]
	pop {r3, pc}
_02237FE2:
	ldr r0, _02238004 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	nop
_02237FF4: .word ov70_0224680C
_02237FF8: .word ov70_02246814
_02237FFC: .word ov70_022460EC
_02238000: .word ov70_0224693C
_02238004: .word _02246800
	thumb_func_end ov70_02237FB4

	thumb_func_start ov70_02238008
ov70_02238008: ; 0x02238008
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _02238048 ; =ov70_02246900
	str r4, [r0, #0x40]
	bl ov38_0221BE84
	mov r0, #0x49
	lsl r0, r0, #2
	str r0, [sp]
	ldr r0, _0223804C ; =ov70_0224613C
	ldr r1, _02238050 ; =ov70_02246814
	mov r2, #0
	add r3, r4, #0
	bl ov70_02238360
	cmp r0, #0
	beq _02238036
	ldr r0, _02238054 ; =_02246800
	mov r1, #6
	str r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
_02238036:
	ldr r0, _02238054 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02238048: .word ov70_02246900
_0223804C: .word ov70_0224613C
_02238050: .word ov70_02246814
_02238054: .word _02246800
	thumb_func_end ov70_02238008

	thumb_func_start ov70_02238058
ov70_02238058: ; 0x02238058
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _02238098 ; =ov70_02246900
	str r4, [r0, #0x40]
	bl ov38_0221BE84
	mov r0, #0x49
	lsl r0, r0, #2
	str r0, [sp]
	ldr r0, _0223809C ; =ov70_02246184
	ldr r1, _022380A0 ; =ov70_02246814
	mov r2, #0
	add r3, r4, #0
	bl ov70_02238360
	cmp r0, #0
	beq _02238086
	ldr r0, _022380A4 ; =_02246800
	mov r1, #8
	str r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
_02238086:
	ldr r0, _022380A4 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02238098: .word ov70_02246900
_0223809C: .word ov70_02246184
_022380A0: .word ov70_02246814
_022380A4: .word _02246800
	thumb_func_end ov70_02238058

	thumb_func_start ov70_022380A8
ov70_022380A8: ; 0x022380A8
	push {r3, lr}
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	ldr r0, _022380DC ; =ov70_022461D0
	ldr r1, _022380E0 ; =ov70_02246814
	ldr r3, _022380E4 ; =ov70_0224693C
	mov r2, #0
	bl ov70_02238360
	cmp r0, #0
	beq _022380CA
	ldr r0, _022380E8 ; =_02246800
	mov r1, #0xa
	str r1, [r0]
	pop {r3, pc}
_022380CA:
	ldr r0, _022380E8 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	nop
_022380DC: .word ov70_022461D0
_022380E0: .word ov70_02246814
_022380E4: .word ov70_0224693C
_022380E8: .word _02246800
	thumb_func_end ov70_022380A8

	thumb_func_start ov70_022380EC
ov70_022380EC: ; 0x022380EC
	push {r3, lr}
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	ldr r0, _02238120 ; =ov70_0224621C
	ldr r1, _02238124 ; =ov70_02246814
	ldr r3, _02238128 ; =ov70_0224693C
	mov r2, #0
	bl ov70_02238360
	cmp r0, #0
	beq _0223810E
	ldr r0, _0223812C ; =_02246800
	mov r1, #0xc
	str r1, [r0]
	pop {r3, pc}
_0223810E:
	ldr r0, _0223812C ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	nop
_02238120: .word ov70_0224621C
_02238124: .word ov70_02246814
_02238128: .word ov70_0224693C
_0223812C: .word _02246800
	thumb_func_end ov70_022380EC

	thumb_func_start ov70_02238130
ov70_02238130: ; 0x02238130
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _02238194 ; =ov70_02246900
	add r6, r2, #0
	str r6, [r0, #0x40]
	add r4, r1, #0
	bl ov38_0221BE84
	ldrb r0, [r5]
	ldr r1, _02238198 ; =ov70_02246814
	mov r2, #7
	strb r0, [r1]
	ldrb r0, [r5, #1]
	add r3, r6, #0
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	ldrb r0, [r5, #4]
	strb r0, [r1, #4]
	ldrb r0, [r5, #5]
	strb r0, [r1, #5]
	ldr r0, _0223819C ; =_02246800
	strb r4, [r0, #0x1a]
	mov r0, #0x49
	lsl r0, r0, #2
	mul r0, r4
	str r0, [sp]
	ldr r0, _022381A0 ; =ov70_02246268
	bl ov70_02238360
	cmp r0, #0
	beq _02238180
	ldr r0, _0223819C ; =_02246800
	mov r1, #0xe
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02238180:
	ldr r0, _0223819C ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02238194: .word ov70_02246900
_02238198: .word ov70_02246814
_0223819C: .word _02246800
_022381A0: .word ov70_02246268
	thumb_func_end ov70_02238130

	thumb_func_start ov70_022381A4
ov70_022381A4: ; 0x022381A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022381F8 ; =ov70_02246900
	add r4, r1, #0
	str r4, [r0, #0x40]
	bl ov38_0221BE84
	ldr r3, _022381FC ; =ov70_02246814
	add r2, r5, #0
	mov r1, #8
_022381B8:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _022381B8
	mov r0, #6
	ldrsb r1, [r5, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	mul r0, r1
	str r0, [sp]
	ldr r0, _02238200 ; =ov70_02246268
	ldr r1, _022381FC ; =ov70_02246814
	mov r2, #8
	add r3, r4, #0
	bl ov70_02238360
	cmp r0, #0
	beq _022381E8
	ldr r0, _02238204 ; =_02246800
	mov r1, #0xe
	str r1, [r0]
	pop {r3, r4, r5, pc}
_022381E8:
	ldr r0, _02238204 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022381F8: .word ov70_02246900
_022381FC: .word ov70_02246814
_02238200: .word ov70_02246268
_02238204: .word _02246800
	thumb_func_end ov70_022381A4

	thumb_func_start ov70_02238208
ov70_02238208: ; 0x02238208
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0223825C ; =ov70_02246900
	add r6, r2, #0
	add r4, r1, #0
	str r6, [r0, #0x40]
	bl ov38_0221BE84
	mov r2, #0x49
	ldr r0, _02238260 ; =ov70_02246814
	add r1, r4, #0
	lsl r2, r2, #2
	bl memcpy
	ldr r0, _0223825C ; =ov70_02246900
	mov r2, #0x49
	str r5, [r0, #0x38]
	lsl r2, r2, #2
	str r2, [sp]
	ldr r0, _02238264 ; =ov70_022462B4
	ldr r1, _02238260 ; =ov70_02246814
	add r2, r2, #4
	add r3, r6, #0
	bl ov70_02238360
	cmp r0, #0
	beq _0223824A
	ldr r0, _02238268 ; =_02246800
	mov r1, #0x10
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0223824A:
	ldr r0, _02238268 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223825C: .word ov70_02246900
_02238260: .word ov70_02246814
_02238264: .word ov70_022462B4
_02238268: .word _02246800
	thumb_func_end ov70_02238208

	thumb_func_start ov70_0223826C
ov70_0223826C: ; 0x0223826C
	push {r3, lr}
	ldr r0, _022382AC ; =ov70_0224680C
	ldr r2, _022382B0 ; =ov70_02246814
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r2]
	str r0, [r2, #4]
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	ldr r0, _022382B4 ; =ov70_02246304
	ldr r1, _022382B0 ; =ov70_02246814
	ldr r3, _022382B8 ; =ov70_0224693C
	mov r2, #8
	bl ov70_02238360
	cmp r0, #0
	beq _0223829A
	ldr r0, _022382BC ; =_02246800
	mov r1, #0x12
	str r1, [r0]
	pop {r3, pc}
_0223829A:
	ldr r0, _022382BC ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	nop
_022382AC: .word ov70_0224680C
_022382B0: .word ov70_02246814
_022382B4: .word ov70_02246304
_022382B8: .word ov70_0224693C
_022382BC: .word _02246800
	thumb_func_end ov70_0223826C

	thumb_func_start ov70_022382C0
ov70_022382C0: ; 0x022382C0
	push {r3, lr}
	bl ov38_0221BE84
	mov r0, #2
	str r0, [sp]
	ldr r0, _022382F4 ; =ov70_02246358
	ldr r1, _022382F8 ; =ov70_02246814
	ldr r3, _022382FC ; =ov70_0224693C
	mov r2, #0
	bl ov70_02238360
	cmp r0, #0
	beq _022382E2
	ldr r0, _02238300 ; =_02246800
	mov r1, #0x14
	str r1, [r0]
	pop {r3, pc}
_022382E2:
	ldr r0, _02238300 ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, pc}
	nop
_022382F4: .word ov70_02246358
_022382F8: .word ov70_02246814
_022382FC: .word ov70_0224693C
_02238300: .word _02246800
	thumb_func_end ov70_022382C0

	thumb_func_start ov70_02238304
ov70_02238304: ; 0x02238304
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x1c
	add r4, r1, #0
	bl OS_GetMacAddress
	ldr r0, _02238350 ; =ov70_02246814
	add r1, r5, #0
	mov r2, #0x64
	bl memcpy
	ldr r0, _02238354 ; =ov70_02246900
	str r4, [r0, #0x40]
	bl ov38_0221BE84
	mov r0, #8
	str r0, [sp]
	ldr r3, _02238354 ; =ov70_02246900
	ldr r0, _02238358 ; =ov70_022463A4
	ldr r1, _02238350 ; =ov70_02246814
	ldr r3, [r3, #0x40]
	mov r2, #0x64
	bl ov70_02238360
	cmp r0, #0
	beq _02238340
	ldr r0, _0223835C ; =_02246800
	mov r1, #0x16
	str r1, [r0]
	pop {r3, r4, r5, pc}
_02238340:
	ldr r0, _0223835C ; =_02246800
	mov r1, #0x18
	str r1, [r0]
	sub r1, #0x25
	str r1, [r0, #4]
	bl ov38_0221BFEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238350: .word ov70_02246814
_02238354: .word ov70_02246900
_02238358: .word ov70_022463A4
_0223835C: .word _02246800
	thumb_func_end ov70_02238304

	thumb_func_start ov70_02238360
ov70_02238360: ; 0x02238360
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, [sp, #0x18]
	str r3, [sp]
	str r1, [sp, #4]
	add r4, r2, #0
	ldr r1, _02238394 ; =_02246800
	add r2, r5, #0
	ldr r1, [r1, #8]
	add r3, r4, #0
	bl ov38_0221BEA8
	cmp r0, #0
	beq _02238386
	cmp r0, #1
	beq _0223838C
	cmp r0, #2
	b _0223838C
_02238386:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223838C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02238394: .word _02246800
	thumb_func_end ov70_02238360

	thumb_func_start ov70_02238398
ov70_02238398: ; 0x02238398
	push {r4, lr}
	cmp r0, #0x20
	bhi _02238410
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022383AA: ; jump table
	.short _022383EC - _022383AA - 2 ; case 0
	.short _022383EC - _022383AA - 2 ; case 1
	.short _022383F2 - _022383AA - 2 ; case 2
	.short _022383EC - _022383AA - 2 ; case 3
	.short _022383EC - _022383AA - 2 ; case 4
	.short _022383EC - _022383AA - 2 ; case 5
	.short _022383EC - _022383AA - 2 ; case 6
	.short _02238410 - _022383AA - 2 ; case 7
	.short _022383F2 - _022383AA - 2 ; case 8
	.short _022383EC - _022383AA - 2 ; case 9
	.short _022383EC - _022383AA - 2 ; case 10
	.short _022383F8 - _022383AA - 2 ; case 11
	.short _022383FE - _022383AA - 2 ; case 12
	.short _022383FE - _022383AA - 2 ; case 13
	.short _022383EC - _022383AA - 2 ; case 14
	.short _0223840A - _022383AA - 2 ; case 15
	.short _02238404 - _022383AA - 2 ; case 16
	.short _02238404 - _022383AA - 2 ; case 17
	.short _02238404 - _022383AA - 2 ; case 18
	.short _02238404 - _022383AA - 2 ; case 19
	.short _022383EC - _022383AA - 2 ; case 20
	.short _022383EC - _022383AA - 2 ; case 21
	.short _022383EC - _022383AA - 2 ; case 22
	.short _022383EC - _022383AA - 2 ; case 23
	.short _02238410 - _022383AA - 2 ; case 24
	.short _022383F2 - _022383AA - 2 ; case 25
	.short _02238404 - _022383AA - 2 ; case 26
	.short _02238404 - _022383AA - 2 ; case 27
	.short _02238404 - _022383AA - 2 ; case 28
	.short _02238404 - _022383AA - 2 ; case 29
	.short _0223840A - _022383AA - 2 ; case 30
	.short _02238404 - _022383AA - 2 ; case 31
	.short _022383EC - _022383AA - 2 ; case 32
_022383EC:
	mov r4, #0xc
	mvn r4, r4
	b _02238414
_022383F2:
	mov r4, #0xc
	mvn r4, r4
	b _02238414
_022383F8:
	mov r4, #0xe
	mvn r4, r4
	b _02238414
_022383FE:
	mov r4, #0xe
	mvn r4, r4
	b _02238414
_02238404:
	mov r4, #1
	mvn r4, r4
	b _02238414
_0223840A:
	mov r4, #1
	mvn r4, r4
	b _02238414
_02238410:
	mov r4, #0xc
	mvn r4, r4
_02238414:
	mov r0, #0xc
	mvn r0, r0
	cmp r4, r0
	beq _0223842C
	bl WCM_GetPhase
	cmp r0, #9
	beq _02238428
	mov r4, #0xd
	mvn r4, r4
_02238428:
	bl ov00_021EC210
_0223842C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov70_02238398

	thumb_func_start ov70_02238430
ov70_02238430: ; 0x02238430
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02238446
	cmp r0, #1
	bne _02238444
	b _0223856E
_02238444:
	b _02238582
_02238446:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02238588 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0223858C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl ov70_02238880
	mov r2, #7
	mov r0, #3
	mov r1, #0x3d
	lsl r2, r2, #0x10
	bl CreateHeap
	bl LoadDwcOverlay
	bl LoadOVY38
	mov r0, #0x3d
	bl sub_02039FD8
	ldr r1, _02238590 ; =0x00001608
	add r0, r6, #0
	mov r2, #0x3d
	bl OverlayManager_CreateAndGetData
	ldr r2, _02238590 ; =0x00001608
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x3d
	bl BgConfig_Alloc
	str r0, [r4, #4]
	ldr r0, _02238594 ; =ov70_02246944
	add r2, sp, #0
	ldr r3, _02238598 ; =ov70_022451F8
	str r4, [r0, #4]
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r7, #0
	bl SetBothScreensModesAndDisable
	mov r0, #4
	mov r1, #0x3d
	bl FontID_Alloc
	mov r0, #0xb
	mov r1, #0x40
	mov r2, #0x3d
	bl ScrStrBufs_new_custom
	ldr r1, _0223859C ; =0x00000B9C
	ldr r2, _022385A0 ; =0x00000307
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x3d
	bl NewMsgDataFromNarc
	mov r1, #0xba
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _022385A4 ; =0x0000030A
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x3d
	bl NewMsgDataFromNarc
	ldr r1, _022385A8 ; =0x00000BA8
	mov r2, #0x32
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	mov r3, #0x3d
	bl NewMsgDataFromNarc
	ldr r1, _022385AC ; =0x00000BAC
	mov r2, #0xed
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x3d
	bl NewMsgDataFromNarc
	ldr r1, _022385B0 ; =0x00000BA4
	ldr r2, _022385B4 ; =0x0000031E
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x3d
	bl NewMsgDataFromNarc
	mov r1, #0xbb
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	add r1, r6, #0
	bl ov70_02238818
	add r0, r4, #0
	bl ov70_02238E70
	ldr r1, _022385B8 ; =0x0000047D
	mov r0, #0xb
	mov r2, #1
	bl sub_02004EC4
	ldr r1, _022385BC ; =0x00020020
	mov r0, #0x3d
	bl AllocFromHeap
	str r0, [r4, #0x4c]
	add r0, #0x1f
	mov r1, #0x1f
	bic r0, r1
	mov r1, #2
	lsl r1, r1, #0x10
	mov r2, #0
	bl NNS_FndCreateExpHeapEx
	str r0, [r4, #0x50]
	mov r0, #1
	str r0, [r5]
	b _02238582
_0223856E:
	bl sub_02034D8C
	mov r0, #1
	bl sub_02002B8C
	mov r0, #0
	str r0, [r5]
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02238582:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238588: .word 0xFFFFE0FF
_0223858C: .word 0x04001000
_02238590: .word 0x00001608
_02238594: .word ov70_02246944
_02238598: .word ov70_022451F8
_0223859C: .word 0x00000B9C
_022385A0: .word 0x00000307
_022385A4: .word 0x0000030A
_022385A8: .word 0x00000BA8
_022385AC: .word 0x00000BAC
_022385B0: .word 0x00000BA4
_022385B4: .word 0x0000031E
_022385B8: .word 0x0000047D
_022385BC: .word 0x00020020
	thumb_func_end ov70_02238430

	thumb_func_start ov70_022385C0
ov70_022385C0: ; 0x022385C0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov00_021ECB40
	bl ov70_022378DC
	ldr r1, [r5]
	cmp r1, #5
	bhi _022386BA
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022385E4: ; jump table
	.short _022385F0 - _022385E4 - 2 ; case 0
	.short _0223860C - _022385E4 - 2 ; case 1
	.short _02238634 - _022385E4 - 2 ; case 2
	.short _02238642 - _022385E4 - 2 ; case 3
	.short _02238656 - _022385E4 - 2 ; case 4
	.short _022386B6 - _022385E4 - 2 ; case 5
_022385F0:
	bl sub_02034DB8
	cmp r0, #0
	beq _022386BA
	ldr r1, [r4, #0x50]
	ldr r0, _022386D8 ; =ov70_02246944
	str r1, [r0]
	ldr r0, _022386DC ; =ov70_02238DF8
	ldr r1, _022386E0 ; =ov70_02238E20
	bl ov00_021EC294
	mov r0, #1
	str r0, [r5]
	b _022386BA
_0223860C:
	ldr r3, [r4, #0x14]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _022386E4 ; =ov70_022463EC
	add r0, r4, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r5]
	bl ov70_02238880
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022386BA
	add r0, r4, #0
	bl ov70_02238E98
	b _022386BA
_02238634:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022386BA
	mov r0, #3
	str r0, [r5]
	b _022386BA
_02238642:
	ldr r3, [r4, #0x14]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _022386E8 ; =ov70_022463EC + 4
	add r0, r4, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r5]
	b _022386BA
_02238656:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022386BA
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022386A0
	add r0, r4, #0
	bl ov70_02238E70
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r4, #0
	bl ov70_02240D74
	mov r1, #0x4a
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	bl ov70_02241184
	add r0, r4, #0
	bl ov70_02239C6C
	add r0, r4, #0
	bl ov70_02239CF8
	mov r0, #0x45
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_022386A0:
	ldr r3, [r4, #0x14]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _022386EC ; =ov70_022463EC + 8
	ldr r1, [r5]
	ldr r2, [r2, r6]
	add r0, r4, #0
	blx r2
	str r0, [r5]
	b _022386BA
_022386B6:
	mov r0, #1
	pop {r4, r5, r6, pc}
_022386BA:
	add r0, r4, #0
	bl ov70_02238F04
	add r0, r4, #0
	bl ov70_02238F24
	ldr r0, _022386F0 ; =0x00000BF4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022386D2
	bl sub_0202457C
_022386D2:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_022386D8: .word ov70_02246944
_022386DC: .word ov70_02238DF8
_022386E0: .word ov70_02238E20
_022386E4: .word ov70_022463EC
_022386E8: .word ov70_022463EC + 4
_022386EC: .word ov70_022463EC + 8
_022386F0: .word 0x00000BF4
	thumb_func_end ov70_022385C0

	thumb_func_start ov70_022386F4
ov70_022386F4: ; 0x022386F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FreeToHeap
	bl UnloadOVY38
	bl UnloadDwcOverlay
	add r0, r4, #0
	bl ov70_02238E98
	ldr r0, _02238794 ; =0x00000BA4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _02238798 ; =0x00000BAC
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _0223879C ; =0x00000BA8
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xbb
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _022387A0 ; =0x00000B9C
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl ov70_0223887C
	bl sub_02034DE0
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r4, #4]
	bl FreeToHeap
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #4
	bl FontID_Release
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022387A4 ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _022387A8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x3d
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238794: .word 0x00000BA4
_02238798: .word 0x00000BAC
_0223879C: .word 0x00000BA8
_022387A0: .word 0x00000B9C
_022387A4: .word 0xFFFF1FFF
_022387A8: .word 0x04001000
	thumb_func_end ov70_022386F4

	thumb_func_start ov70_022387AC
ov70_022387AC: ; 0x022387AC
	push {r4, lr}
	ldr r1, _022387E8 ; =0x00001204
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _022387C0
	blx r1
	ldr r0, _022387E8 ; =0x00001204
	mov r1, #0
	str r1, [r4, r0]
_022387C0:
	ldr r0, _022387EC ; =0x00001208
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _022387CC
	add r0, r4, #0
	blx r1
_022387CC:
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _022387F0 ; =0x027E0000
	ldr r1, _022387F4 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_022387E8: .word 0x00001204
_022387EC: .word 0x00001208
_022387F0: .word 0x027E0000
_022387F4: .word 0x00003FF8
	thumb_func_end ov70_022387AC

	thumb_func_start ov70_022387F8
ov70_022387F8: ; 0x022387F8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02238814 ; =ov70_02245218
	add r3, sp, #0
	mov r2, #5
_02238802:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238802
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_02238814: .word ov70_02245218
	thumb_func_end ov70_022387F8

	thumb_func_start ov70_02238818
ov70_02238818: ; 0x02238818
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetParentWork
	mov r1, #0
	str r0, [r4]
	add r0, r4, #0
	add r2, r1, #0
	str r1, [r4, #0x14]
	bl ov70_02238E50
	mov r1, #0x47
	mov r0, #0
	lsl r1, r1, #2
	strh r0, [r4, r1]
	ldr r1, _02238874 ; =0x00000B8A
	mov r3, #3
	strh r0, [r4, r1]
	add r2, r1, #2
	strb r3, [r4, r2]
	add r2, r1, #3
	strb r0, [r4, r2]
	add r2, r1, #4
	strb r0, [r4, r2]
	add r1, r1, #6
	ldr r2, _02238878 ; =0x000011DC
	strh r0, [r4, r1]
	mov r3, #0x12
	strh r0, [r4, r2]
	lsl r1, r3, #4
	strh r3, [r4, r1]
	add r1, r2, #0
	add r1, #0x1c
	strh r0, [r4, r1]
	add r1, r2, #0
	add r1, #0x1e
	strh r0, [r4, r1]
	add r1, r2, #2
	strh r0, [r4, r1]
	add r1, r2, #0
	sub r1, #0x20
	str r0, [r4, r1]
	add r2, #0xf0
	str r0, [r4, r2]
	pop {r4, pc}
	.balign 4, 0
_02238874: .word 0x00000B8A
_02238878: .word 0x000011DC
	thumb_func_end ov70_02238818

	thumb_func_start ov70_0223887C
ov70_0223887C: ; 0x0223887C
	bx lr
	.balign 4, 0
	thumb_func_end ov70_0223887C

	thumb_func_start ov70_02238880
ov70_02238880: ; 0x02238880
	ldr r3, _022388C0 ; =0x04001000
	ldr r0, _022388C4 ; =0xFFFF1FFF
	ldr r1, [r3]
	lsl r2, r3, #0xe
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r1, r0
	lsr r0, r3, #0xd
	orr r0, r1
	str r0, [r2]
	ldr r0, _022388C8 ; =0x04000048
	mov r1, #0x3f
	ldrh r3, [r0]
	mov r2, #0x1f
	bic r3, r1
	orr r3, r2
	strh r3, [r0]
	ldrh r3, [r0, #2]
	bic r3, r1
	orr r2, r3
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0, #2]
	add r1, r0, #0
	ldr r2, _022388CC ; =0x0000F0FF
	sub r1, #8
	strh r2, [r1]
	mov r1, #0x10
	sub r0, r0, #4
	strh r1, [r0]
	bx lr
	.balign 4, 0
_022388C0: .word 0x04001000
_022388C4: .word 0xFFFF1FFF
_022388C8: .word 0x04000048
_022388CC: .word 0x0000F0FF
	thumb_func_end ov70_02238880

	thumb_func_start ov70_022388D0
ov70_022388D0: ; 0x022388D0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _022388FC ; =ov70_02245208
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x3d
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_022388FC: .word ov70_02245208
	thumb_func_end ov70_022388D0

	thumb_func_start ov70_02238900
ov70_02238900: ; 0x02238900
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0x64
	mov r1, #0x3d
	bl NARC_ctor
	str r0, [sp, #0x18]
	bl NNS_G2dInitOamManagerModule
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02238B2C ; =0xFFCFFFEF
	add r3, r1, #0
	and r3, r0
	mov r1, #0x10
	orr r3, r1
	str r3, [r2]
	ldr r3, _02238B30 ; =0x04001000
	ldr r2, [r3]
	and r0, r2
	orr r0, r1
	str r0, [r3]
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r1, #0x3d
	str r1, [sp, #0x10]
	mov r1, #0x7a
	add r2, r0, #0
	bl OamManager_Create
	ldr r1, _02238B34 ; =0x00000BF8
	mov r0, #0x54
	add r1, r5, r1
	mov r2, #0x3d
	bl G2dRenderer_Init
	ldr r1, _02238B38 ; =0x00000BF4
	mov r2, #1
	str r0, [r5, r1]
	add r0, r1, #4
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0xd2
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #4
_02238970:
	mov r0, #3
	add r1, r6, #0
	mov r2, #0x3d
	bl Create2DGfxResObjMan
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02238970
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0xd2
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	mov r2, #0x15
	bl AddCharResObjFromOpenNarc
	mov r1, #0xd3
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x3d
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r2, #0xa
	bl AddPlttResObjFromOpenNarc
	ldr r1, _02238B3C ; =0x00000D34
	mov r2, #0x16
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x3d
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02238B40 ; =0x00000D38
	mov r2, #0x17
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x3d
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02238B44 ; =0x00000D3C
	mov r3, #1
	str r0, [r5, r1]
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x3d
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r2, #0x2b
	bl AddCharResObjFromOpenNarc
	mov r1, #0x35
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #0x3d
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r2, #9
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	ldr r1, _02238B48 ; =0x00000D44
	mov r3, #1
	str r0, [r5, r1]
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x3d
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r2, #0x2c
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02238B4C ; =0x00000D48
	mov r3, #1
	str r0, [r5, r1]
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x3d
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	mov r2, #0x2d
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02238B50 ; =0x00000D4C
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	mov r0, #0x35
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	ldr r0, _02238B3C ; =0x00000D34
	ldr r0, [r5, r0]
	bl sub_0200AF94
	ldr r0, _02238B48 ; =0x00000D44
	ldr r0, [r5, r0]
	bl sub_0200AF94
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0x14
	add r2, sp, #0x1c
	mov r3, #0x3d
	bl GfGfxLoader_GetPlttData
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	mov r1, #0x60
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp, #0x1c]
	mov r1, #0x60
	ldr r0, [r0, #0xc]
	add r2, r1, #0
	bl GX_LoadOBJPltt
	ldr r0, [sp, #0x1c]
	mov r7, #0x1f
	ldr r4, [r0, #0xc]
	mov r3, #0
	add r5, r7, #0
_02238ACC:
	ldrh r2, [r4]
	mov r0, #0x1f
	add r3, r3, #1
	add r1, r2, #0
	and r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	asr r0, r2, #0xa
	add r6, r0, #0
	and r6, r7
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r2, r2, #5
	add r6, r2, #0
	and r6, r5
	lsr r2, r6, #0x1f
	add r2, r6, r2
	asr r0, r0, #1
	asr r2, r2, #1
	lsl r0, r0, #0xa
	lsl r2, r2, #5
	orr r0, r2
	orr r0, r1
	strh r0, [r4]
	add r4, r4, #2
	cmp r3, #0x30
	blt _02238ACC
	ldr r0, [sp, #0x1c]
	mov r1, #0x60
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp, #0x1c]
	mov r1, #0xc0
	ldr r0, [r0, #0xc]
	mov r2, #0x60
	bl GX_LoadOBJPltt
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238B2C: .word 0xFFCFFFEF
_02238B30: .word 0x04001000
_02238B34: .word 0x00000BF8
_02238B38: .word 0x00000BF4
_02238B3C: .word 0x00000D34
_02238B40: .word 0x00000D38
_02238B44: .word 0x00000D3C
_02238B48: .word 0x00000D44
_02238B4C: .word 0x00000D48
_02238B50: .word 0x00000D4C
	thumb_func_end ov70_02238900

	thumb_func_start ov70_02238B54
ov70_02238B54: ; 0x02238B54
	push {r3, r4}
	ldr r4, _02238B7C ; =0x00000BF4
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
	mov r1, #0x3d
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02238B7C: .word 0x00000BF4
	thumb_func_end ov70_02238B54

	thumb_func_start ov70_02238B80
ov70_02238B80: ; 0x02238B80
	push {r3, r4, lr}
	sub sp, #0x2c
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r2, #0xd2
	str r1, [sp, #0x10]
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r4, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	add r2, #0x40
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r4, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	mov r3, #0xd2
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #4
	ldr r2, [r4, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r4, r2]
	add r3, #0x64
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r4, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x2c
	pop {r3, r4, pc}
	thumb_func_end ov70_02238B80

	thumb_func_start ov70_02238C14
ov70_02238C14: ; 0x02238C14
	push {r4, lr}
	sub sp, #8
	mov r4, #0
	str r4, [sp]
	add r4, sp, #0
	ldrb r4, [r4, #0x10]
	str r4, [sp, #4]
	bl ov70_02238C2C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02238C14

	thumb_func_start ov70_02238C2C
ov70_02238C2C: ; 0x02238C2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x3d
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0201660C
	str r0, [sp]
	add r0, sp, #0x20
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _02238C56
	ldr r1, [sp, #0x30]
	mov r0, #0
	cmp r1, #3
	bgt _02238C52
	mov r0, #1
_02238C52:
	bl ov70_02238FB4
_02238C56:
	ldr r0, [sp, #0x30]
	str r5, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	str r7, [sp, #0x10]
	mov r0, #0x18
	add r1, sp, #4
	strb r0, [r1, #0x10]
	strb r4, [r1, #0x11]
	ldrb r2, [r1, #0x12]
	mov r0, #0xf
	bic r2, r0
	strb r2, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	mov r0, #0xf0
	bic r2, r0
	strb r2, [r1, #0x12]
	mov r0, #0
	strb r0, [r1, #0x13]
	ldr r0, [sp]
	add r1, sp, #4
	bl sub_020166FC
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov70_02238C2C

	thumb_func_start ov70_02238C8C
ov70_02238C8C: ; 0x02238C8C
	push {r4, lr}
	ldr r1, _02238CA8 ; =0x000011C8
	ldr r0, [r0, r1]
	bl sub_020168F4
	add r4, r0, #0
	sub r0, r4, #1
	cmp r0, #1
	bhi _02238CA2
	bl ov70_02238FE0
_02238CA2:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02238CA8: .word 0x000011C8
	thumb_func_end ov70_02238C8C

	thumb_func_start ov70_02238CAC
ov70_02238CAC: ; 0x02238CAC
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x3d
	mov r1, #0
	add r6, r2, #0
	bl sub_02018424
	ldr r1, _02238D28 ; =0x000011CC
	mov r2, #0x18
	str r0, [r5, r1]
	add r0, sp, #0x18
	mov r1, #0
	bl MI_CpuFill8
	ldr r2, _02238D2C ; =_022451EC
	add r0, sp, #0x18
	ldrh r3, [r2]
	add r1, sp, #0x18
	strh r3, [r0]
	ldrh r3, [r2, #2]
	strh r3, [r0, #2]
	ldrh r3, [r2, #4]
	strh r3, [r0, #4]
	ldrh r3, [r2, #6]
	strh r3, [r0, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #8]
	ldr r3, _02238D30 ; =0x000011AC
	strh r2, [r0, #0xa]
	ldr r2, [r5, r3]
	add r3, #0x20
	str r2, [sp, #0x24]
	ldr r2, [r5, #4]
	str r2, [sp, #0x28]
	strb r4, [r0, #0x14]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, _02238D34 ; =ov70_02238D38
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [r5, r3]
	mov r3, #0x14
	bl sub_02018648
	add r4, r0, #0
	mov r0, #1
	bl ov70_02238FB4
	add r0, r4, #0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_02238D28: .word 0x000011CC
_02238D2C: .word _022451EC
_02238D30: .word 0x000011AC
_02238D34: .word ov70_02238D38
	thumb_func_end ov70_02238CAC

	thumb_func_start ov70_02238D38
ov70_02238D38: ; 0x02238D38
	push {r3, lr}
	cmp r3, #3
	bhi _02238D58
	add r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02238D4A: ; jump table
	.short _02238D58 - _02238D4A - 2 ; case 0
	.short _02238D52 - _02238D4A - 2 ; case 1
	.short _02238D52 - _02238D4A - 2 ; case 2
	.short _02238D52 - _02238D4A - 2 ; case 3
_02238D52:
	ldr r0, _02238D5C ; =0x000005DC
	bl PlaySE
_02238D58:
	pop {r3, pc}
	nop
_02238D5C: .word 0x000005DC
	thumb_func_end ov70_02238D38

	thumb_func_start ov70_02238D60
ov70_02238D60: ; 0x02238D60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02238D7C ; =0x000011D0
	ldr r0, [r4, r0]
	bl sub_02018680
	ldr r0, _02238D80 ; =0x000011CC
	ldr r0, [r4, r0]
	bl sub_02018474
	bl ov70_02238FE0
	pop {r4, pc}
	nop
_02238D7C: .word 0x000011D0
_02238D80: .word 0x000011CC
	thumb_func_end ov70_02238D60

	thumb_func_start ov70_02238D84
ov70_02238D84: ; 0x02238D84
	str r1, [r0, #0x2c]
	str r2, [r0, #0x30]
	bx lr
	.balign 4, 0
	thumb_func_end ov70_02238D84

	thumb_func_start ov70_02238D8C
ov70_02238D8C: ; 0x02238D8C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #0
	ble _02238DAA
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02238DB8
_02238DAA:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02238DB8:
	bl _ffix
	str r0, [sp]
	cmp r5, #0
	ble _02238DD4
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02238DE2
_02238DD4:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02238DE2:
	bl _ffix
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov70_02238D8C

	thumb_func_start ov70_02238DF8
ov70_02238DF8: ; 0x02238DF8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl OS_DisableInterrupts
	add r6, r0, #0
	ldr r0, _02238E1C ; =ov70_02246944
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
_02238E1C: .word ov70_02246944
	thumb_func_end ov70_02238DF8

	thumb_func_start ov70_02238E20
ov70_02238E20: ; 0x02238E20
	push {r3, r4, r5, lr}
	add r5, r1, #0
	beq _02238E3C
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _02238E40 ; =ov70_02246944
	add r1, r5, #0
	ldr r0, [r0]
	bl NNS_FndFreeToExpHeap
	add r0, r4, #0
	bl OS_RestoreInterrupts
_02238E3C:
	pop {r3, r4, r5, pc}
	nop
_02238E40: .word ov70_02246944
	thumb_func_end ov70_02238E20

	thumb_func_start ov70_02238E44
ov70_02238E44: ; 0x02238E44
	push {r3, lr}
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	pop {r3, pc}
	thumb_func_end ov70_02238E44

	thumb_func_start ov70_02238E50
ov70_02238E50: ; 0x02238E50
	str r1, [r0, #0x18]
	str r2, [r0, #0x24]
	bx lr
	.balign 4, 0
	thumb_func_end ov70_02238E50

	thumb_func_start ov70_02238E58
ov70_02238E58: ; 0x02238E58
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x20]
	ldr r1, [r0, #0x18]
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov70_02238E58

	thumb_func_start ov70_02238E64
ov70_02238E64: ; 0x02238E64
	ldr r0, [r0]
	ldr r3, _02238E6C ; =Options_GetTextFrameDelay
	ldr r0, [r0, #0x24]
	bx r3
	.balign 4, 0
_02238E6C: .word Options_GetTextFrameDelay
	thumb_func_end ov70_02238E64

	thumb_func_start ov70_02238E70
ov70_02238E70: ; 0x02238E70
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022387F8
	bl ov70_022388D0
	add r0, r4, #0
	bl ov70_02238900
	add r0, r4, #0
	bl ov70_02238B80
	ldr r0, _02238E94 ; =ov70_022387AC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	nop
_02238E94: .word ov70_022387AC
	thumb_func_end ov70_02238E70

	thumb_func_start ov70_02238E98
ov70_02238E98: ; 0x02238E98
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl ov70_02241308
	mov r0, #0xd3
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x35
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	ldr r0, _02238EF8 ; =0x00000D34
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	ldr r0, _02238EFC ; =0x00000D44
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0xd2
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #4
_02238ECC:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02238ECC
	ldr r0, _02238F00 ; =0x00000BF4
	ldr r0, [r6, r0]
	bl sub_02024504
	ldr r0, _02238F00 ; =0x00000BF4
	mov r1, #0
	str r1, [r6, r0]
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238EF8: .word 0x00000D34
_02238EFC: .word 0x00000D44
_02238F00: .word 0x00000BF4
	thumb_func_end ov70_02238E98

	thumb_func_start ov70_02238F04
ov70_02238F04: ; 0x02238F04
	ldrh r1, [r0, #0x3a]
	cmp r1, #0
	beq _02238F0E
	sub r1, r1, #1
	strh r1, [r0, #0x3a]
_02238F0E:
	bx lr
	thumb_func_end ov70_02238F04

	thumb_func_start ov70_02238F10
ov70_02238F10: ; 0x02238F10
	ldr r1, _02238F20 ; =0x000011FA
	mov r2, #1
	strh r2, [r0, r1]
	mov r2, #0
	sub r1, r1, #2
	strh r2, [r0, r1]
	bx lr
	nop
_02238F20: .word 0x000011FA
	thumb_func_end ov70_02238F10

	thumb_func_start ov70_02238F24
ov70_02238F24: ; 0x02238F24
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02238F5C ; =0x000011FA
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _02238F58
	ldr r0, [r4]
	sub r1, r1, #1
	ldr r0, [r0, #0xc]
	bl PCStorage_CountMonsAndEggsInBox
	ldr r1, _02238F60 ; =0x000011F8
	ldrh r2, [r4, r1]
	add r0, r2, r0
	strh r0, [r4, r1]
	add r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrh r0, [r4, r0]
	cmp r0, #0x13
	bne _02238F58
	mov r2, #0
	add r0, r1, #2
	strh r2, [r4, r0]
_02238F58:
	pop {r4, pc}
	nop
_02238F5C: .word 0x000011FA
_02238F60: .word 0x000011F8
	thumb_func_end ov70_02238F24

	thumb_func_start ov70_02238F64
ov70_02238F64: ; 0x02238F64
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02238F78 ; =0x00000F18
	mov r1, #1
	add r0, r4, r0
	bl sub_0200F0AC
	ldr r1, _02238F7C ; =0x000011BC
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_02238F78: .word 0x00000F18
_02238F7C: .word 0x000011BC
	thumb_func_end ov70_02238F64

	thumb_func_start ov70_02238F80
ov70_02238F80: ; 0x02238F80
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02238F98 ; =0x000011BC
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238F96
	bl sub_0200F450
	ldr r0, _02238F98 ; =0x000011BC
	mov r1, #0
	str r1, [r4, r0]
_02238F96:
	pop {r4, pc}
	.balign 4, 0
_02238F98: .word 0x000011BC
	thumb_func_end ov70_02238F80

	thumb_func_start ov70_02238F9C
ov70_02238F9C: ; 0x02238F9C
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	lsl r1, r2, #0xc
	str r1, [sp, #4]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov70_02238F9C

	thumb_func_start ov70_02238FB4
ov70_02238FB4: ; 0x02238FB4
	push {r3, lr}
	cmp r0, #0
	beq _02238FC8
	mov r1, #0x1e
	add r2, r1, #0
	ldr r0, _02238FD8 ; =0x04000050
	sub r2, #0x25
	bl G2x_SetBlendBrightness_
	pop {r3, pc}
_02238FC8:
	mov r1, #0x1e
	add r2, r1, #0
	ldr r0, _02238FDC ; =0x04001050
	sub r2, #0x25
	bl G2x_SetBlendBrightness_
	pop {r3, pc}
	nop
_02238FD8: .word 0x04000050
_02238FDC: .word 0x04001050
	thumb_func_end ov70_02238FB4

	thumb_func_start ov70_02238FE0
ov70_02238FE0: ; 0x02238FE0
	ldr r0, _02238FEC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _02238FF0 ; =0x04001050
	strh r1, [r0]
	bx lr
	.balign 4, 0
_02238FEC: .word 0x04000050
_02238FF0: .word 0x04001050
	thumb_func_end ov70_02238FE0

	thumb_func_start ov70_02238FF4
ov70_02238FF4: ; 0x02238FF4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_02239614
	ldr r2, _022390C8 ; =0x04000304
	ldr r0, _022390CC ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	ldr r0, [r4, #4]
	bl ov70_02239134
	add r0, r4, #0
	bl ov70_02239330
	add r0, r4, #0
	bl ov70_022394B8
	add r0, r4, #0
	bl ov70_02239414
	add r0, r4, #0
	bl ov70_02245124
	add r0, r4, #0
	bl ov70_02239B00
	ldr r1, _022390D0 ; =0x00000484
	mov r0, #0x17
	mov r2, #1
	bl sub_02004EC4
	ldrh r0, [r4, #0x34]
	cmp r0, #0
	bne _02239072
	add r0, r4, #0
	bl ov70_02239304
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #1
	strh r0, [r4, #0x34]
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r4, #0
	bl ov70_02240EF4
	b _022390BC
_02239072:
	ldr r0, _022390D4 ; =0x000011FC
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _022390A2
	ldr r0, _022390D8 ; =0x0400106C
	bl GXx_GetMasterBrightness_
	cmp r0, #0
	beq _022390A2
	add r0, r4, #0
	bl ov70_02241358
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _022390B8
_022390A2:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
_022390B8:
	mov r0, #5
	str r0, [r4, #0x2c]
_022390BC:
	ldr r0, _022390D4 ; =0x000011FC
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_022390C8: .word 0x04000304
_022390CC: .word 0xFFFF7FFF
_022390D0: .word 0x00000484
_022390D4: .word 0x000011FC
_022390D8: .word 0x0400106C
	thumb_func_end ov70_02238FF4

	thumb_func_start ov70_022390DC
ov70_022390DC: ; 0x022390DC
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238E44
	bl sub_0203A930
	ldr r1, [r4, #0x2c]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _022390F8 ; =ov70_02246464
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_022390F8: .word ov70_02246464
	thumb_func_end ov70_022390DC

	thumb_func_start ov70_022390FC
ov70_022390FC: ; 0x022390FC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203A914
	add r0, r4, #0
	bl ov70_022394A8
	add r0, r4, #0
	bl ov70_0223963C
	add r0, r4, #0
	bl ov70_022395C4
	ldr r0, [r4, #4]
	bl ov70_022392E0
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_022390FC

	thumb_func_start ov70_02239134
ov70_02239134: ; 0x02239134
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _022391E0 ; =ov70_0224525C
	add r3, sp, #0x54
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _022391E4 ; =ov70_022452F4
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022391E8 ; =ov70_022452D8
	add r3, sp, #0x1c
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
	ldr r5, _022391EC ; =ov70_02245310
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_022391F0
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x64
	pop {r4, r5, pc}
	.balign 4, 0
_022391E0: .word ov70_0224525C
_022391E4: .word ov70_022452F4
_022391E8: .word ov70_022452D8
_022391EC: .word ov70_02245310
	thumb_func_end ov70_02239134

	thumb_func_start ov70_022391F0
ov70_022391F0: ; 0x022391F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	ldr r3, _022392AC ; =ov70_022452A0
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r2, sp, #0x54
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r3, _022392B0 ; =ov70_02245284
	add r2, sp, #0x38
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #6
	str r0, [r2]
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #0
	bl InitBgFromTemplate
	cmp r6, #0
	bne _02239252
	add r0, r5, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
_02239252:
	ldr r6, _022392B4 ; =ov70_022452BC
	add r3, sp, #0x1c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #5
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	str r4, [sp, #0x20]
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	ldr r4, _022392B8 ; =ov70_0224532C
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #7
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022392AC: .word ov70_022452A0
_022392B0: .word ov70_02245284
_022392B4: .word ov70_022452BC
_022392B8: .word ov70_0224532C
	thumb_func_end ov70_022391F0

	thumb_func_start ov70_022392BC
ov70_022392BC: ; 0x022392BC
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
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov70_022392BC

	thumb_func_start ov70_022392E0
ov70_022392E0: ; 0x022392E0
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022392BC
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_022392E0

	thumb_func_start ov70_02239304
ov70_02239304: ; 0x02239304
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0223932C ; =0x00000DCC
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
	.balign 4, 0
_0223932C: .word 0x00000DCC
	thumb_func_end ov70_02239304

	thumb_func_start ov70_02239330
ov70_02239330: ; 0x02239330
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5, #4]
	mov r0, #0x64
	mov r1, #0x3d
	bl NARC_ctor
	mov r1, #0x60
	str r1, [sp]
	mov r1, #0x3d
	mov r2, #0
	str r1, [sp, #4]
	mov r1, #4
	add r3, r2, #0
	add r6, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x10
	add r2, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x27
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x26
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl ov70_02239C6C
	ldrh r0, [r5, #0x34]
	cmp r0, #0
	beq _02239402
	add r0, r5, #0
	bl ov70_02239CF8
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	b _0223940A
_02239402:
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
_0223940A:
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02239330

	thumb_func_start ov70_02239414
ov70_02239414: ; 0x02239414
	push {r4, lr}
	sub sp, #0x80
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0xd2
	str r1, [sp, #0xc]
	mov r0, #1
	lsl r2, r2, #4
	str r0, [sp, #0x10]
	ldr r0, [r4, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r4, r0]
	add r2, #0xc
	str r0, [sp, #0x1c]
	ldr r0, [r4, r2]
	add r2, r1, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x2c
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	add r0, sp, #0x50
	add r1, r4, #0
	add r2, sp, #0x2c
	mov r3, #1
	bl ov70_02238B54
	mov r0, #0x47
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	lsl r2, r1, #2
	ldr r1, _0223949C ; =ov70_02245240
	ldrh r1, [r1, r2]
	lsl r1, r1, #0xc
	str r1, [sp, #0x58]
	ldrh r0, [r4, r0]
	lsl r1, r0, #2
	ldr r0, _022394A0 ; =ov70_02245242
	ldrh r0, [r0, r1]
	lsl r0, r0, #0xc
	str r0, [sp, #0x5c]
	add r0, sp, #0x50
	bl CreateSprite
	ldr r1, _022394A4 ; =0x00000DCC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _022394A4 ; =0x00000DCC
	mov r1, #0x2b
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	add sp, #0x80
	pop {r4, pc}
	.balign 4, 0
_0223949C: .word ov70_02245240
_022394A0: .word ov70_02245242
_022394A4: .word 0x00000DCC
	thumb_func_end ov70_02239414

	thumb_func_start ov70_022394A8
ov70_022394A8: ; 0x022394A8
	ldr r1, _022394B0 ; =0x00000DCC
	ldr r3, _022394B4 ; =sub_02024758
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_022394B0: .word 0x00000DCC
_022394B4: .word sub_02024758
	thumb_func_end ov70_022394A8

	thumb_func_start ov70_022394B8
ov70_022394B8: ; 0x022394B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r2, #1
	add r7, r0, #0
	str r2, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r3, #2
	ldr r1, _022395B0 ; =0x00000F38
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r7, r1
	bl AddWindowParameterized
	ldr r0, _022395B0 ; =0x00000F38
	mov r1, #0
	add r0, r7, r0
	bl FillWindowPixelBuffer
	mov r0, #2
	str r0, [sp]
	mov r3, #0
	mov r2, #0x2f
	ldr r0, _022395B4 ; =0x000F0600
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _022395B0 ; =0x00000F38
	str r3, [sp, #0xc]
	lsl r2, r2, #6
	ldr r2, [r7, r2]
	add r0, r7, r0
	mov r1, #1
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, _022395B8 ; =0x00000F58
	mov r6, #0x61
	mov r4, #6
	add r5, r7, r0
_02239510:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r5, #0
	mov r2, #1
	mov r3, #9
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r6, #0x1e
	add r0, r0, #1
	add r4, r4, #5
	add r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, #3
	blt _02239510
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	ldr r1, _022395BC ; =0x00000F18
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r7, r1
	mov r2, #0
	bl AddWindowParameterized
	ldr r0, _022395BC ; =0x00000F18
	mov r1, #0xf
	add r0, r7, r0
	bl FillWindowPixelBuffer
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x96
	ldr r1, _022395C0 ; =0x00001158
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r7, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _022395C0 ; =0x00001158
	mov r1, #0xf
	add r0, r7, r0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	mov r1, #0
	bl ov70_02239D44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022395B0: .word 0x00000F38
_022395B4: .word 0x000F0600
_022395B8: .word 0x00000F58
_022395BC: .word 0x00000F18
_022395C0: .word 0x00001158
	thumb_func_end ov70_022394B8

	thumb_func_start ov70_022395C4
ov70_022395C4: ; 0x022395C4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02239600 ; =0x00001198
	add r0, r6, r0
	bl RemoveWindow
	ldr r0, _02239604 ; =0x00001158
	add r0, r6, r0
	bl RemoveWindow
	ldr r0, _02239608 ; =0x00000F18
	add r0, r6, r0
	bl RemoveWindow
	ldr r0, _0223960C ; =0x00000F58
	mov r4, #0
	add r5, r6, r0
_022395E6:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _022395E6
	ldr r0, _02239610 ; =0x00000F38
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	nop
_02239600: .word 0x00001198
_02239604: .word 0x00001158
_02239608: .word 0x00000F18
_0223960C: .word 0x00000F58
_02239610: .word 0x00000F38
	thumb_func_end ov70_022395C4

	thumb_func_start ov70_02239614
ov70_02239614: ; 0x02239614
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _02239638 ; =0x00000BBC
	str r0, [r4, r1]
	sub r1, #0x1c
	ldr r0, [r4, r1]
	mov r1, #0x27
	bl NewString_ReadMsgData
	mov r1, #0x2f
	lsl r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_02239638: .word 0x00000BBC
	thumb_func_end ov70_02239614

	thumb_func_start ov70_0223963C
ov70_0223963C: ; 0x0223963C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02239654 ; =0x00000BBC
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
_02239654: .word 0x00000BBC
	thumb_func_end ov70_0223963C

	thumb_func_start ov70_02239658
ov70_02239658: ; 0x02239658
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02239694 ; =0x000011DC
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0223968E
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #7
	mov r2, #0xb
	bl ov70_02238E50
	mov r0, #1
	str r0, [r4, #0x1c]
	mov r0, #9
	str r0, [r4, #0x2c]
_0223968E:
	mov r0, #3
	pop {r4, pc}
	nop
_02239694: .word 0x000011DC
	thumb_func_end ov70_02239658

	thumb_func_start ov70_02239698
ov70_02239698: ; 0x02239698
	push {r3, lr}
	mov r1, #0xa
	mov r2, #2
	bl ov70_02238D84
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov70_02239698

	thumb_func_start ov70_022396A8
ov70_022396A8: ; 0x022396A8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	mov r0, #3
	str r0, [r4, #0x2c]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_022396A8

	thumb_func_start ov70_022396CC
ov70_022396CC: ; 0x022396CC
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022396DC
	mov r0, #5
	str r0, [r4, #0x2c]
_022396DC:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_022396CC

	thumb_func_start ov70_022396E0
ov70_022396E0: ; 0x022396E0
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022396F0
	mov r0, #5
	str r0, [r4, #0x2c]
_022396F0:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_022396E0

	thumb_func_start ov70_022396F4
ov70_022396F4: ; 0x022396F4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239728 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #4
	mov r2, #1
	mov r3, #0
	bl ov70_02239B84
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #6
	bl ov70_02238D84
	ldr r0, _0223972C ; =0x00000DCC
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	bl ov70_02238F10
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02239728: .word 0x00000F0F
_0223972C: .word 0x00000DCC
	thumb_func_end ov70_022396F4

	thumb_func_start ov70_02239730
ov70_02239730: ; 0x02239730
	ldr r3, _02239738 ; =sub_02025224
	ldr r0, _0223973C ; =ov70_0224524C
	bx r3
	nop
_02239738: .word sub_02025224
_0223973C: .word ov70_0224524C
	thumb_func_end ov70_02239730

	thumb_func_start ov70_02239740
ov70_02239740: ; 0x02239740
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	cmp r1, #0
	beq _02239756
	cmp r1, #1
	beq _022397CC
	cmp r1, #2
	beq _022397E8
	add sp, #4
	pop {r3, r4, pc}
_02239756:
	ldrh r1, [r4, #0x36]
	cmp r1, #0
	bne _02239772
	mov r1, #5
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _0223981C ; =0x000005DC
	bl PlaySE
	add sp, #4
	pop {r3, r4, pc}
_02239772:
	ldrh r1, [r4, #0x3a]
	cmp r1, #0
	bne _02239796
	mov r1, #7
	mov r2, #0xb
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x1c]
	mov r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _02239820 ; =0x00000708
	strh r0, [r4, #0x3a]
	ldr r0, _0223981C ; =0x000005DC
	bl PlaySE
	add sp, #4
	pop {r3, r4, pc}
_02239796:
	ldr r0, _02239824 ; =0x00000DCC
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02239828 ; =0x00000F0F
	mov r1, #0x22
	str r0, [sp]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov70_02239B84
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #5
	bl ov70_02238D84
	ldr r0, _0223982C ; =0x000005F3
	bl PlaySE
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #6
	add sp, #4
	str r1, [r4, r0]
	pop {r3, r4, pc}
_022397CC:
	ldr r1, _02239830 ; =0x000011DE
	mov r2, #0
	strh r2, [r4, r1]
	mov r1, #4
	mov r2, #0xd
	bl ov70_02238E50
	mov r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _0223981C ; =0x000005DC
	bl PlaySE
	add sp, #4
	pop {r3, r4, pc}
_022397E8:
	bl ov70_02238E64
	add r2, r0, #0
	ldr r0, _02239828 ; =0x00000F0F
	mov r1, #7
	str r0, [sp]
	add r0, r4, #0
	mov r3, #0
	bl ov70_02239BDC
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0xc
	bl ov70_02238D84
	ldr r0, _02239824 ; =0x00000DCC
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0223981C ; =0x000005DC
	bl PlaySE
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223981C: .word 0x000005DC
_02239820: .word 0x00000708
_02239824: .word 0x00000DCC
_02239828: .word 0x00000F0F
_0223982C: .word 0x000005F3
_02239830: .word 0x000011DE
	thumb_func_end ov70_02239740

	thumb_func_start ov70_02239834
ov70_02239834: ; 0x02239834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_02239730
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02239876
	mov r0, #0x47
	lsl r0, r0, #2
	strh r4, [r5, r0]
	ldr r0, _0223993C ; =0x000005DC
	bl PlaySE
	mov r0, #0x47
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	ldr r1, _02239940 ; =ov70_02245240
	ldr r3, _02239944 ; =ov70_02245242
	lsl r2, r0, #2
	ldr r0, _02239948 ; =0x00000DCC
	ldrh r1, [r1, r2]
	ldrh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl ov70_02238D8C
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_02239740
	mov r0, #3
	pop {r3, r4, r5, pc}
_02239876:
	ldr r0, _0223994C ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _022398AC
	add r0, r5, #0
	bl ov70_02238E64
	add r2, r0, #0
	ldr r0, _02239950 ; =0x00000F0F
	mov r1, #7
	str r0, [sp]
	add r0, r5, #0
	mov r3, #0
	bl ov70_02239BDC
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0xc
	bl ov70_02238D84
	ldr r0, _02239948 ; =0x00000DCC
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimActiveFlag
	b _02239938
_022398AC:
	mov r1, #1
	tst r1, r0
	beq _022398C0
	mov r1, #0x47
	lsl r1, r1, #2
	ldrh r1, [r5, r1]
	add r0, r5, #0
	bl ov70_02239740
	b _02239938
_022398C0:
	mov r1, #0x40
	add r2, r0, #0
	tst r2, r1
	beq _022398FE
	add r0, r1, #0
	add r0, #0xdc
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _02239938
	add r0, r1, #0
	add r0, #0xdc
	ldrh r0, [r5, r0]
	add r1, #0xdc
	sub r0, r0, #1
	strh r0, [r5, r1]
	ldr r0, _0223993C ; =0x000005DC
	bl PlaySE
	mov r0, #0x47
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	ldr r1, _02239940 ; =ov70_02245240
	ldr r2, _02239944 ; =ov70_02245242
	lsl r3, r0, #2
	ldr r0, _02239948 ; =0x00000DCC
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238D8C
	b _02239938
_022398FE:
	mov r1, #0x80
	tst r0, r1
	beq _02239938
	add r0, r1, #0
	add r0, #0x9c
	ldrh r0, [r5, r0]
	cmp r0, #2
	bhs _02239938
	add r0, r1, #0
	add r0, #0x9c
	ldrh r0, [r5, r0]
	add r1, #0x9c
	add r0, r0, #1
	strh r0, [r5, r1]
	ldr r0, _0223993C ; =0x000005DC
	bl PlaySE
	mov r0, #0x47
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	ldr r1, _02239940 ; =ov70_02245240
	ldr r2, _02239944 ; =ov70_02245242
	lsl r3, r0, #2
	ldr r0, _02239948 ; =0x00000DCC
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238D8C
_02239938:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223993C: .word 0x000005DC
_02239940: .word ov70_02245240
_02239944: .word ov70_02245242
_02239948: .word 0x00000DCC
_0223994C: .word gSystem
_02239950: .word 0x00000F0F
	thumb_func_end ov70_02239834

	thumb_func_start ov70_02239954
ov70_02239954: ; 0x02239954
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r4, #0
	bl ov70_02241004
	mov r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _02239978 ; =0x000011DC
	mov r1, #0
	strh r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_02239978: .word 0x000011DC
	thumb_func_end ov70_02239954

	thumb_func_start ov70_0223997C
ov70_0223997C: ; 0x0223997C
	ldr r1, _0223998C ; =0x000011DC
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02239988
	mov r1, #9
	str r1, [r0, #0x2c]
_02239988:
	mov r0, #3
	bx lr
	.balign 4, 0
_0223998C: .word 0x000011DC
	thumb_func_end ov70_0223997C

	thumb_func_start ov70_02239990
ov70_02239990: ; 0x02239990
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _022399B6
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _022399CE
_022399B6:
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
_022399CE:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_02239990

	thumb_func_start ov70_022399D8
ov70_022399D8: ; 0x022399D8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	mov r1, #0xa
	str r0, [sp]
	add r2, r1, #0
	ldr r0, [r4, #4]
	add r2, #0xf8
	mov r3, #3
	bl ov70_02238C14
	ldr r1, _02239A08 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #0xd
	str r0, [r4, #0x2c]
	ldr r0, _02239A0C ; =0x00000DCC
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02239A08: .word 0x000011C8
_02239A0C: .word 0x00000DCC
	thumb_func_end ov70_022399D8

	thumb_func_start ov70_02239A10
ov70_02239A10: ; 0x02239A10
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _02239A62
	ldr r0, _02239A9C ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _02239AA0 ; =0x00001158
	mov r1, #1
	add r0, r4, r0
	bl ClearFrameAndWindow2
	ldr r0, _02239AA0 ; =0x00001158
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02239AA4 ; =0x00001198
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #7
	str r0, [r4, #0x2c]
	b _02239A98
_02239A62:
	cmp r0, #2
	bne _02239A98
	ldr r0, _02239A9C ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _02239AA0 ; =0x00001158
	mov r1, #1
	add r0, r4, r0
	bl ClearFrameAndWindow2
	ldr r0, _02239AA0 ; =0x00001158
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02239AA8 ; =0x00000DCC
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimActiveFlag
	mov r0, #5
	str r0, [r4, #0x2c]
	ldr r0, _02239AA8 ; =0x00000DCC
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
_02239A98:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02239A9C: .word 0x000011C8
_02239AA0: .word 0x00001158
_02239AA4: .word 0x00001198
_02239AA8: .word 0x00000DCC
	thumb_func_end ov70_02239A10

	thumb_func_start ov70_02239AAC
ov70_02239AAC: ; 0x02239AAC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02239AC6
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02239AC6:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02239AAC

	thumb_func_start ov70_02239ACC
ov70_02239ACC: ; 0x02239ACC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02239AFA
	mov r0, #0x47
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x2d
	ble _02239AFA
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02239AFA:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02239ACC

	thumb_func_start ov70_02239B00
ov70_02239B00: ; 0x02239B00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldr r0, _02239B7C ; =0x00000F58
	ldrh r1, [r7, #0x36]
	add r4, r7, r0
	mov r0, #0xc
	ldr r2, _02239B80 ; =ov70_0224526C
	mul r0, r1
	mov r6, #0
	add r5, r2, r0
_02239B16:
	mov r0, #0x78
	str r0, [sp]
	mov r0, #8
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	mov r0, #0x78
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	mov r3, #8
	bl FillWindowPixelRect
	mov r0, #0x78
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	mov r3, #0xa
	bl FillWindowPixelRect
	mov r0, #0
	str r0, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r7, r1]
	ldr r3, [r5]
	add r0, r4, #0
	mov r2, #4
	bl ov70_02239C34
	add r0, r4, #0
	bl CopyWindowToVram
	add r6, r6, #1
	add r4, #0x10
	add r5, r5, #4
	cmp r6, #3
	blt _02239B16
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239B7C: .word 0x00000F58
_02239B80: .word ov70_0224526C
	thumb_func_end ov70_02239B00

	thumb_func_start ov70_02239B84
ov70_02239B84: ; 0x02239B84
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0xba
	add r5, r0, #0
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x1c
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	ldr r0, _02239BD4 ; =0x00000F18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _02239BD4 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _02239BD4 ; =0x00000F18
	ldr r2, _02239BD8 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02239BD4: .word 0x00000F18
_02239BD8: .word 0x00000BBC
	thumb_func_end ov70_02239B84

	thumb_func_start ov70_02239BDC
ov70_02239BDC: ; 0x02239BDC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0xba
	add r5, r0, #0
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x1c
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	ldr r0, _02239C2C ; =0x00001158
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _02239C2C ; =0x00001158
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _02239C2C ; =0x00001158
	ldr r2, _02239C30 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02239C2C: .word 0x00001158
_02239C30: .word 0x00000BBC
	thumb_func_end ov70_02239BDC

	thumb_func_start ov70_02239C34
ov70_02239C34: ; 0x02239C34
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	add r6, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	ldr r0, _02239C68 ; =0x000A0900
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02239C68: .word 0x000A0900
	thumb_func_end ov70_02239C34

	thumb_func_start ov70_02239C6C
ov70_02239C6C: ; 0x02239C6C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #4]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	mov r0, #0x64
	mov r1, #5
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #0x2a
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0x11
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0x28
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0x11
	mov r2, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl FillBgTilemapRect
	add r0, r4, #0
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	mov r0, #4
	mov r1, #0x20
	mov r2, #0x3d
	bl LoadFontPal1
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02239C6C

	thumb_func_start ov70_02239CF8
ov70_02239CF8: ; 0x02239CF8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x64
	mov r1, #0x12
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x64
	mov r1, #0x29
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02239CF8

	thumb_func_start ov70_02239D44
ov70_02239D44: ; 0x02239D44
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r2, #4
	add r4, r1, #0
	ldr r1, _02239D88 ; =0x00001198
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	add r1, r5, r1
	mov r3, #0xd
	bl AddWindowParameterized
	ldr r0, _02239D88 ; =0x00001198
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0xba
	ldr r0, _02239D88 ; =0x00001198
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, r0
	add r2, r4, #0
	bl ov70_022450EC
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_02239D88: .word 0x00001198
	thumb_func_end ov70_02239D44

	thumb_func_start ov70_02239D8C
ov70_02239D8C: ; 0x02239D8C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_0223A1E4
	ldr r0, [r4, #4]
	bl ov70_02239EAC
	add r0, r4, #0
	bl ov70_02239FA4
	add r0, r4, #0
	bl ov70_0223A0D4
	add r0, r4, #0
	bl ov70_0223A06C
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl Mon_GetBoxMon
	str r0, [sp]
	mov r0, #0x8a
	lsl r0, r0, #2
	mov r2, #0xba
	add r0, r4, r0
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r1, r2, #4
	ldr r0, [r4, r2]
	sub r2, r2, #4
	ldr r3, _02239E58 ; =0x00001058
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r4, r3
	bl ov70_0223A578
	ldr r1, _02239E5C ; =0x00001118
	mov r2, #0x92
	add r0, r4, r1
	str r0, [sp]
	mov r0, #0xba
	lsl r0, r0, #4
	mov r3, #0x4f
	sub r1, #0x50
	lsl r2, r2, #2
	lsl r3, r3, #2
	ldr r0, [r4, r0]
	add r1, r4, r1
	add r2, r4, r2
	add r3, r4, r3
	bl ov70_0223A72C
	ldr r1, _02239E60 ; =0x0000022F
	mov r2, #0
	ldrsb r0, [r4, r1]
	add r1, r1, #1
	ldrsb r1, [r4, r1]
	bl ov70_0223F864
	mov r1, #0x8b
	lsl r1, r1, #2
	ldrsh r2, [r4, r1]
	ldr r3, _02239E64 ; =0x000010E8
	add r1, r1, #2
	str r2, [sp]
	ldrsb r1, [r4, r1]
	mov r2, #0xba
	lsl r2, r2, #4
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r1, r2, #4
	ldr r0, [r4, r2]
	sub r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r4, r3
	bl ov70_0223F470
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_0223A7E4
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02239E58: .word 0x00001058
_02239E5C: .word 0x00001118
_02239E60: .word 0x0000022F
_02239E64: .word 0x000010E8
	thumb_func_end ov70_02239D8C

	thumb_func_start ov70_02239E68
ov70_02239E68: ; 0x02239E68
	push {r3, lr}
	ldr r1, [r0, #0x2c]
	lsl r2, r1, #2
	ldr r1, _02239E78 ; =ov70_022464A8
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_02239E78: .word ov70_022464A8
	thumb_func_end ov70_02239E68

	thumb_func_start ov70_02239E7C
ov70_02239E7C: ; 0x02239E7C
	push {r4, lr}
	add r4, r0, #0
	bl ov70_0223A0C4
	add r0, r4, #0
	bl ov70_0223A224
	add r0, r4, #0
	bl ov70_0223A1A0
	ldr r0, [r4, #4]
	bl ov70_02239F78
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov70_02239E7C

	thumb_func_start ov70_02239EAC
ov70_02239EAC: ; 0x02239EAC
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _02239F68 ; =ov70_0224539C
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02239F6C ; =ov70_02245380
	add r3, sp, #0x38
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
	ldr r5, _02239F70 ; =ov70_02245364
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _02239F74 ; =ov70_02245348
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_022391F0
	add sp, #0x70
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239F68: .word ov70_0224539C
_02239F6C: .word ov70_02245380
_02239F70: .word ov70_02245364
_02239F74: .word ov70_02245348
	thumb_func_end ov70_02239EAC

	thumb_func_start ov70_02239F78
ov70_02239F78: ; 0x02239F78
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022392BC
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02239F78

	thumb_func_start ov70_02239FA4
ov70_02239FA4: ; 0x02239FA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r5, [r6, #4]
	mov r0, #0x64
	mov r1, #0x3d
	bl NARC_ctor
	mov r1, #0x60
	str r1, [sp]
	mov r1, #0x3d
	mov r2, #0
	str r1, [sp, #4]
	mov r1, #8
	add r3, r2, #0
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #5
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x1c
	add r2, r5, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #4
	mov r1, #0x20
	mov r2, #0x3d
	bl LoadFontPal1
	add r0, r6, #0
	bl ov70_02239CF8
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02239FA4

	thumb_func_start ov70_0223A06C
ov70_0223A06C: ; 0x0223A06C
	push {r4, lr}
	sub sp, #0x30
	mov r2, #0xd6
	add r4, r0, #0
	lsl r2, r2, #4
	add r0, sp, #0
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #1
	bl ov70_02238B54
	mov r0, #0xd
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x3a
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	mov r1, #0xee
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xee
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x25
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xee
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	bl sub_0203A880
	add sp, #0x30
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223A06C

	thumb_func_start ov70_0223A0C4
ov70_0223A0C4: ; 0x0223A0C4
	mov r1, #0xee
	lsl r1, r1, #4
	ldr r3, _0223A0D0 ; =sub_02024758
	ldr r0, [r0, r1]
	bx r3
	nop
_0223A0D0: .word sub_02024758
	thumb_func_end ov70_0223A0C4

	thumb_func_start ov70_0223A0D4
ov70_0223A0D4: ; 0x0223A0D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	ldr r1, _0223A190 ; =0x00000F18
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r7, r1
	mov r2, #0
	bl AddWindowParameterized
	ldr r0, _0223A190 ; =0x00000F18
	mov r1, #0
	add r0, r7, r0
	bl FillWindowPixelBuffer
	mov r0, #0xf
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x5e
	ldr r1, _0223A194 ; =0x00000F58
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r7, r1
	mov r2, #0
	mov r3, #0x15
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, _0223A198 ; =0x00001058
	ldr r4, _0223A19C ; =ov70_022453B8
	mov r6, #0x86
	add r5, r7, r0
_0223A132:
	ldr r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r2, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7, #4]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	add r4, #0x10
	mul r0, r1
	add r6, r6, r0
	ldr r0, [sp, #0x14]
	add r5, #0x10
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0xe
	blt _0223A132
	add r0, r7, #0
	mov r1, #2
	bl ov70_02239D44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A190: .word 0x00000F18
_0223A194: .word 0x00000F58
_0223A198: .word 0x00001058
_0223A19C: .word ov70_022453B8
	thumb_func_end ov70_0223A0D4

	thumb_func_start ov70_0223A1A0
ov70_0223A1A0: ; 0x0223A1A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0223A1D4 ; =0x00001198
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0223A1D8 ; =0x00000F18
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0223A1DC ; =0x00000F58
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0223A1E0 ; =0x00001058
	mov r4, #0
	add r5, r5, r0
_0223A1C2:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xe
	blt _0223A1C2
	pop {r3, r4, r5, pc}
	nop
_0223A1D4: .word 0x00001198
_0223A1D8: .word 0x00000F18
_0223A1DC: .word 0x00000F58
_0223A1E0: .word 0x00001058
	thumb_func_end ov70_0223A1A0

	thumb_func_start ov70_0223A1E4
ov70_0223A1E4: ; 0x0223A1E4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223A220 ; =0x00000BBC
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	mov r1, #0x27
	bl NewString_ReadMsgData
	mov r1, #0x2f
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r4, #0
	mov r7, #0x14
	add r6, r1, #4
_0223A20A:
	add r0, r7, #0
	mov r1, #0x3d
	bl String_ctor
	str r0, [r5, r6]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xa
	blt _0223A20A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A220: .word 0x00000BBC
	thumb_func_end ov70_0223A1E4

	thumb_func_start ov70_0223A224
ov70_0223A224: ; 0x0223A224
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r6, _0223A250 ; =0x00000BC4
	mov r4, #0
	add r5, r7, #0
_0223A22E:
	ldr r0, [r5, r6]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xa
	blt _0223A22E
	ldr r0, _0223A254 ; =0x00000BBC
	ldr r0, [r7, r0]
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #6
	ldr r0, [r7, r0]
	bl String_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223A250: .word 0x00000BC4
_0223A254: .word 0x00000BBC
	thumb_func_end ov70_0223A224

	thumb_func_start ov70_0223A258
ov70_0223A258: ; 0x0223A258
	mov r1, #1
	str r1, [r0, #0x2c]
	mov r0, #3
	bx lr
	thumb_func_end ov70_0223A258

	thumb_func_start ov70_0223A260
ov70_0223A260: ; 0x0223A260
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223A2C0 ; =gSystem
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #1
	add r3, r2, #0
	tst r3, r1
	bne _0223A27A
	ldr r3, _0223A2C4 ; =gSystem + 0x40
	ldrh r3, [r3, #0x24]
	cmp r3, #0
	beq _0223A2A4
_0223A27A:
	ldr r0, _0223A2C8 ; =0x00000F0F
	mov r1, #5
	str r0, [sp]
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov70_0223A4F4
	add r0, r4, #0
	mov r1, #3
	mov r2, #7
	bl ov70_02238D84
	ldr r0, _0223A2CC ; =0x000005DC
	bl PlaySE
	b _0223A2B8
_0223A2A4:
	mov r3, #2
	tst r2, r3
	beq _0223A2B8
	mov r2, #0
	str r3, [r4, #0x2c]
	bl ov70_02238E50
	ldr r0, _0223A2CC ; =0x000005DC
	bl PlaySE
_0223A2B8:
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_0223A2C0: .word gSystem
_0223A2C4: .word gSystem + 0x40
_0223A2C8: .word 0x00000F0F
_0223A2CC: .word 0x000005DC
	thumb_func_end ov70_0223A260

	thumb_func_start ov70_0223A2D0
ov70_0223A2D0: ; 0x0223A2D0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #6
	mov r1, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_0223A2D0

	thumb_func_start ov70_0223A2F8
ov70_0223A2F8: ; 0x0223A2F8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223A31C ; =0x0000016A
	mov r1, #0xc
	mov r3, #8
	bl ov70_02238C14
	ldr r1, _0223A320 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #6
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223A31C: .word 0x0000016A
_0223A320: .word 0x000011C8
	thumb_func_end ov70_0223A2F8

	thumb_func_start ov70_0223A324
ov70_0223A324: ; 0x0223A324
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223A354
	ldr r0, _0223A378 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223A37C ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #7
	mov r2, #8
	bl ov70_02238E50
	add r0, r4, #0
	bl ov70_0223A874
	b _0223A372
_0223A354:
	cmp r0, #2
	bne _0223A372
	ldr r0, _0223A378 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _0223A380 ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	str r1, [r4, #0x2c]
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ov70_0223A874
_0223A372:
	mov r0, #3
	pop {r4, pc}
	nop
_0223A378: .word 0x000011C8
_0223A37C: .word 0x000011FC
_0223A380: .word 0x00000F18
	thumb_func_end ov70_0223A324

	thumb_func_start ov70_0223A384
ov70_0223A384: ; 0x0223A384
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	mov r1, #0x3d
	bl ListMenuItems_ctor
	ldr r1, _0223A3D4 ; =0x000011AC
	mov r2, #0x37
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0223A3D4 ; =0x000011AC
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x38
	mov r3, #2
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xd
	bl ov70_02238CAC
	ldr r1, _0223A3D8 ; =0x000011D0
	str r0, [r4, r1]
	mov r0, #1
	bl ov70_02238FB4
	mov r0, #8
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	nop
_0223A3D4: .word 0x000011AC
_0223A3D8: .word 0x000011D0
	thumb_func_end ov70_0223A384

	thumb_func_start ov70_0223A3DC
ov70_0223A3DC: ; 0x0223A3DC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0223A494 ; =0x000011D0
	ldr r0, [r5, r0]
	bl sub_020186A4
	cmp r0, #1
	bne _0223A45E
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223A498 ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r0, #0x4f
	lsl r0, r0, #2
	add r4, r5, r0
	add r0, r4, #0
	bl ov70_0223E76C
	cmp r0, #0
	beq _0223A43A
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #6
	bne _0223A43A
	ldr r0, _0223A49C ; =0x00000F0F
	mov r1, #0x24
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	mov r3, #0
	str r4, [sp, #4]
	bl ov70_0223A4F4
	add r0, r5, #0
	mov r1, #3
	mov r2, #1
	bl ov70_02238D84
	add sp, #8
	mov r0, #3
	pop {r3, r4, r5, pc}
_0223A43A:
	ldr r0, _0223A49C ; =0x00000F0F
	mov r1, #6
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	mov r3, #0
	str r4, [sp, #4]
	bl ov70_0223A4F4
	add r0, r5, #0
	mov r1, #3
	mov r2, #5
	bl ov70_02238D84
	add r0, r5, #0
	bl ov70_0223A874
	b _0223A48C
_0223A45E:
	cmp r0, #2
	beq _0223A46A
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _0223A48C
_0223A46A:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223A498 ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r0, #2
	str r0, [r5, #0x2c]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	add r0, r5, #0
	bl ov70_0223A874
_0223A48C:
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223A494: .word 0x000011D0
_0223A498: .word 0x000011AC
_0223A49C: .word 0x00000F0F
	thumb_func_end ov70_0223A3DC

	thumb_func_start ov70_0223A4A0
ov70_0223A4A0: ; 0x0223A4A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A4BA
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223A4BA:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223A4A0

	thumb_func_start ov70_0223A4C0
ov70_0223A4C0: ; 0x0223A4C0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223A4EE
	mov r0, #0x47
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x2d
	ble _0223A4EE
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223A4EE:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223A4C0

	thumb_func_start ov70_0223A4F4
ov70_0223A4F4: ; 0x0223A4F4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [sp, #0x24]
	add r6, r1, #0
	add r4, r2, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0223A56C ; =0x00000B9C
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonSpeciesName
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r1, _0223A56C ; =0x00000B9C
	add r2, r6, #0
	ldr r0, [r5, r1]
	add r1, #0x20
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	ldr r0, _0223A570 ; =0x00000F18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223A570 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223A570 ; =0x00000F18
	ldr r2, _0223A574 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0223A56C: .word 0x00000B9C
_0223A570: .word 0x00000F18
_0223A574: .word 0x00000BBC
	thumb_func_end ov70_0223A4F4

	thumb_func_start ov70_0223A578
ov70_0223A578: ; 0x0223A578
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	str r1, [sp, #8]
	mov r0, #0x16
	mov r1, #0x3d
	add r7, r2, #0
	add r6, r3, #0
	ldr r4, [sp, #0x54]
	bl String_ctor
	str r0, [sp, #0x1c]
	mov r0, #0x12
	mov r1, #0x3d
	bl String_ctor
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x1c]
	mov r1, #0x77
	bl GetBoxMonData
	mov r2, #0
	ldrsh r0, [r4, r2]
	mov r1, #6
	str r0, [sp, #0x10]
	mov r0, #2
	ldrsb r0, [r4, r0]
	str r0, [sp, #0x14]
	mov r0, #3
	ldrsb r4, [r4, r0]
	ldr r0, [sp, #0x50]
	bl GetBoxMonData
	str r0, [sp, #0x38]
	add r0, r5, #0
	mov r1, #0x49
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	ldr r2, _0223A71C ; =ov70_02245910
	lsl r0, r0, #2
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r2, r1]
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	add r0, r5, #0
	mov r1, #0x6a
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	mov r1, #3
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r4, #0
	add r3, r1, #0
	bl BufferIntegerAsString
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0x6b
	mov r3, #0x3d
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	bl NewString_ReadMsgData
	ldr r1, [sp, #0x38]
	str r0, [sp, #0x34]
	lsl r1, r1, #0x10
	ldr r0, [sp, #0x18]
	lsr r1, r1, #0x10
	mov r2, #0x3d
	bl GetItemNameIntoString
	add r0, r5, #0
	mov r1, #0x3b
	bl NewString_ReadMsgData
	mov r4, #0
	str r0, [sp, #0x20]
	add r5, r6, #0
	add r7, r4, #0
_0223A630:
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _0223A630
	mov r2, #0
	ldr r0, _0223A720 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	add r0, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	ldr r0, [sp, #0x14]
	cmp r0, #3
	beq _0223A66E
	mov r3, #0
	ldr r1, _0223A724 ; =ov70_0224649C
	ldr r0, [sp, #0xc]
	str r3, [sp]
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x30]
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x40
	bl ov70_02245084
_0223A66E:
	mov r2, #0
	ldr r0, _0223A720 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x34]
	add r0, #0x10
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A720 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x2c]
	add r0, #0x20
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A720 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x28]
	add r0, #0x30
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A728 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x24]
	add r0, #0x40
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A720 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x18]
	add r0, #0x50
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A728 ; =0x000F0200
	str r2, [sp]
	add r6, #0x60
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	add r0, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	ldr r0, [sp, #0x24]
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x2c]
	bl String_dtor
	ldr r0, [sp, #0x28]
	bl String_dtor
	ldr r0, [sp, #0x30]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x34]
	bl String_dtor
	ldr r0, [sp, #0x20]
	bl String_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0223A71C: .word ov70_02245910
_0223A720: .word 0x00010200
_0223A724: .word ov70_0224649C
_0223A728: .word 0x000F0200
	thumb_func_end ov70_0223A578

	thumb_func_start ov70_0223A72C
ov70_0223A72C: ; 0x0223A72C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0x10
	mov r1, #0x3d
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0x3d
	bl String_ctor
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #0x31
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r7, #0
	mov r1, #0xb4
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, #0x91
	add r2, r6, #0
	bl GetMonData
	mov r2, #0
	ldr r0, _0223A7DC ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A7E0 ; =0x00010200
	str r2, [sp]
	add r5, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A7DC ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223A7E0 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r6, #0
	add r0, #0x10
	add r3, r2, #0
	bl ov70_02245084
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223A7DC: .word 0x000F0200
_0223A7E0: .word 0x00010200
	thumb_func_end ov70_0223A72C

	thumb_func_start ov70_0223A7E4
ov70_0223A7E4: ; 0x0223A7E4
	push {r4, r5, r6, lr}
	sub sp, #0x30
	mov r1, #0x32
	add r5, r0, #0
	mov r0, #0x3d
	lsl r1, r1, #6
	bl AllocFromHeap
	add r4, r0, #0
	add r0, sp, #0x20
	add r1, r5, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r3, #0
	str r3, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r1, #2
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r1, sp, #0x20
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	mov r2, #0x3d
	bl sub_02014494
	mov r1, #0x32
	add r0, r4, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r1, #0x4a
	mov r2, #0x32
	add r0, r4, #0
	lsl r1, r1, #8
	lsl r2, r2, #6
	bl GX_LoadOBJ
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3d
	mov r3, #0x1a
	str r0, [sp, #4]
	add r1, sp, #0x20
	ldrh r0, [r1]
	ldrh r1, [r1, #4]
	mov r2, #1
	lsl r3, r3, #4
	bl GfGfxLoader_GXLoadPal
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_0223A7E4

	thumb_func_start ov70_0223A874
ov70_0223A874: ; 0x0223A874
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _0223A8B4 ; =0x0000022F
	add r4, r0, #0
	ldrsb r0, [r4, r1]
	add r1, r1, #1
	ldrsb r1, [r4, r1]
	mov r2, #0
	bl ov70_0223F864
	mov r1, #0x8b
	lsl r1, r1, #2
	ldrsh r2, [r4, r1]
	add r1, r1, #2
	ldr r3, _0223A8B8 ; =0x000010E8
	str r2, [sp]
	ldrsb r1, [r4, r1]
	mov r2, #0xba
	lsl r2, r2, #4
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r1, r2, #4
	ldr r0, [r4, r2]
	sub r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r4, r3
	bl ov70_0223F470
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223A8B4: .word 0x0000022F
_0223A8B8: .word 0x000010E8
	thumb_func_end ov70_0223A874

	thumb_func_start ov70_0223A8BC
ov70_0223A8BC: ; 0x0223A8BC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_0223AE98
	ldr r1, _0223AA60 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r2, [r4, r1]
	mov r1, #0x1f
	mvn r1, r1
	sub r1, r1, r2
	bl ov70_0223AB3C
	add r0, r4, #0
	bl ov70_0223ABF4
	add r0, r4, #0
	bl ov70_0223ACF4
	add r0, r4, #0
	bl ov70_0223AC98
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #8
	add r5, r1, #0
	mul r5, r0
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r4, r0
	add r0, r0, r5
	bl Mon_GetBoxMon
	str r0, [sp]
	mov r0, #0xd3
	lsl r0, r0, #2
	add r0, r4, r0
	mov r2, #0xba
	add r0, r0, r5
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r1, r2, #4
	ldr r0, [r4, r2]
	sub r2, r2, #4
	ldr r3, _0223AA64 ; =0x00001058
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r4, r3
	bl ov70_0223A578
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r2, #0xdb
	add r3, r1, #0
	sub r0, #8
	mov r5, #0x26
	lsl r2, r2, #2
	lsl r5, r5, #4
	ldr r1, _0223AA68 ; =0x00001118
	mul r3, r0
	add r0, r4, r1
	str r0, [sp]
	mov r0, #0xba
	lsl r0, r0, #4
	sub r1, #0x50
	add r2, r4, r2
	ldr r0, [r4, r0]
	add r5, r4, r5
	add r2, r2, r3
	add r1, r4, r1
	add r3, r5, r3
	bl ov70_0223A72C
	mov r0, #0x26
	lsl r0, r0, #4
	add r2, r4, r0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #8
	mul r0, r1
	add r0, r2, r0
	bl ov70_0223A7E4
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223AA6C ; =0x00001138
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x4d
	bl ov70_0223B3BC
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223AA70 ; =0x000010E8
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x51
	bl ov70_0223B3BC
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223AA74 ; =0x00000F58
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x58
	bl ov70_0223B3EC
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223AA78 ; =0x00000F68
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x6d
	bl ov70_0223B3EC
	add r0, r4, #0
	bl ov70_0223B258
	ldr r2, _0223AA60 ; =0x00000F14
	mov r1, #0x4b
	lsl r1, r1, #2
	ldr r2, [r4, r2]
	ldr r1, [r4, r1]
	add r0, r4, #0
	neg r2, r2
	bl ov70_02241330
	ldr r1, _0223AA7C ; =ov70_0223B4D4
	ldr r0, _0223AA80 ; =0x00001208
	ldr r2, _0223AA84 ; =0x04000304
	str r1, [r4, r0]
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x24]
	cmp r0, #0x11
	bne _0223AA54
	ldr r0, _0223AA88 ; =0x0400006C
	bl GXx_GetMasterBrightness_
	mov r1, #0xf
	mvn r1, r1
	cmp r0, r1
	bne _0223AA0A
	ldr r0, _0223AA8C ; =0x0400106C
	bl GXx_GetMasterBrightness_
	mov r1, #0xf
	mvn r1, r1
	cmp r0, r1
	beq _0223AA0A
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	b _0223AA54
_0223AA0A:
	ldr r0, _0223AA88 ; =0x0400006C
	bl GXx_GetMasterBrightness_
	mov r1, #0xf
	mvn r1, r1
	cmp r0, r1
	beq _0223AA3E
	ldr r0, _0223AA8C ; =0x0400106C
	bl GXx_GetMasterBrightness_
	mov r1, #0xf
	mvn r1, r1
	cmp r0, r1
	bne _0223AA3E
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #4
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	b _0223AA54
_0223AA3E:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
_0223AA54:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223AA60: .word 0x00000F14
_0223AA64: .word 0x00001058
_0223AA68: .word 0x00001118
_0223AA6C: .word 0x00001138
_0223AA70: .word 0x000010E8
_0223AA74: .word 0x00000F58
_0223AA78: .word 0x00000F68
_0223AA7C: .word ov70_0223B4D4
_0223AA80: .word 0x00001208
_0223AA84: .word 0x04000304
_0223AA88: .word 0x0400006C
_0223AA8C: .word 0x0400106C
	thumb_func_end ov70_0223A8BC

	thumb_func_start ov70_0223AA90
ov70_0223AA90: ; 0x0223AA90
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r1, [r6, #0x2c]
	lsl r2, r1, #2
	ldr r1, _0223AAEC ; =ov70_022464CC
	ldr r1, [r1, r2]
	blx r1
	ldr r7, _0223AAF0 ; =0x0000120E
	str r0, [sp]
	mov r4, #0
	add r5, r6, #0
_0223AAA6:
	ldr r2, _0223AAF4 ; =0x00000F14
	ldr r1, _0223AAF8 ; =0x0000120C
	ldr r3, [r6, r2]
	ldrsh r2, [r5, r7]
	ldr r0, _0223AAFC ; =0x00000EE4
	ldrsh r1, [r5, r1]
	add r2, r3, r2
	ldr r0, [r5, r0]
	add r2, #0x20
	bl ov70_02238F9C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _0223AAA6
	mov r2, #0xee
	lsl r2, r2, #4
	ldr r0, [r6, r2]
	add r2, #0x34
	ldr r3, [r6, r2]
	mov r2, #0x3a
	mov r1, #0xd0
	sub r2, r2, r3
	bl ov70_02238F9C
	mov r1, #0x4b
	ldr r2, _0223AAF4 ; =0x00000F14
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	ldr r2, [r6, r2]
	add r0, r6, #0
	bl ov70_02241330
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223AAEC: .word ov70_022464CC
_0223AAF0: .word 0x0000120E
_0223AAF4: .word 0x00000F14
_0223AAF8: .word 0x0000120C
_0223AAFC: .word 0x00000EE4
	thumb_func_end ov70_0223AA90

	thumb_func_start ov70_0223AB00
ov70_0223AB00: ; 0x0223AB00
	push {r4, lr}
	ldr r1, _0223AB38 ; =0x00001208
	add r4, r0, #0
	mov r2, #0
	str r2, [r4, r1]
	bl ov70_0223ACE4
	add r0, r4, #0
	bl ov70_0223AF30
	add r0, r4, #0
	bl ov70_0223AE40
	ldr r0, [r4, #4]
	bl ov70_0223ABD8
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	nop
_0223AB38: .word 0x00001208
	thumb_func_end ov70_0223AB00

	thumb_func_start ov70_0223AB3C
ov70_0223AB3C: ; 0x0223AB3C
	push {r4, r5, r6, lr}
	sub sp, #0x38
	ldr r6, _0223ABCC ; =ov70_022454D0
	add r3, sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0
	str r0, [r3]
	add r0, r5, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r6, _0223ABD0 ; =ov70_022454B4
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	ldr r0, _0223ABD4 ; =0x0400106C
	bl GXx_GetMasterBrightness_
	cmp r0, #0
	bne _0223ABAE
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov70_022391F0
	b _0223ABB8
_0223ABAE:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov70_022391F0
_0223ABB8:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223ABCC: .word ov70_022454D0
_0223ABD0: .word ov70_022454B4
_0223ABD4: .word 0x0400106C
	thumb_func_end ov70_0223AB3C

	thumb_func_start ov70_0223ABD8
ov70_0223ABD8: ; 0x0223ABD8
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022392BC
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223ABD8

	thumb_func_start ov70_0223ABF4
ov70_0223ABF4: ; 0x0223ABF4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x1a
	add r5, r0, #0
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	ldr r4, [r5, #4]
	bl LoadFontPal1
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0x14
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0x60
	str r0, [sp]
	mov r0, #0x3d
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x64
	mov r1, #8
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0x12
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0x2a
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #4
	mov r1, #0x20
	mov r2, #0x3d
	bl LoadFontPal1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_0223ABF4

	thumb_func_start ov70_0223AC98
ov70_0223AC98: ; 0x0223AC98
	push {r4, lr}
	sub sp, #0x30
	mov r2, #0xd6
	add r4, r0, #0
	lsl r2, r2, #4
	add r0, sp, #0
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #1
	bl ov70_02238B54
	mov r0, #0xd
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x3a
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	mov r1, #0xee
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xee
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x25
	bl Set2dSpriteAnimSeqNo
	bl sub_0203A880
	add sp, #0x30
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223AC98

	thumb_func_start ov70_0223ACE4
ov70_0223ACE4: ; 0x0223ACE4
	mov r1, #0xee
	lsl r1, r1, #4
	ldr r3, _0223ACF0 ; =sub_02024758
	ldr r0, [r0, r1]
	bx r3
	nop
_0223ACF0: .word sub_02024758
	thumb_func_end ov70_0223ACE4

	thumb_func_start ov70_0223ACF4
ov70_0223ACF4: ; 0x0223ACF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	ldr r1, _0223AE2C ; =0x00000F18
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	add r1, r6, r1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _0223AE2C ; =0x00000F18
	mov r1, #0
	add r0, r6, r0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0xd
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r3, #1
	ldr r1, _0223AE30 ; =0x00000F58
	str r3, [sp, #0xc]
	mov r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	add r1, r6, r1
	mov r2, #4
	bl AddWindowParameterized
	ldr r0, _0223AE30 ; =0x00000F58
	mov r1, #0
	add r0, r6, r0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0xd
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0xae
	ldr r1, _0223AE34 ; =0x00000F68
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	add r1, r6, r1
	mov r2, #4
	mov r3, #0x11
	bl AddWindowParameterized
	ldr r0, _0223AE34 ; =0x00000F68
	mov r1, #0
	add r0, r6, r0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0223AE38 ; =0x00001058
	ldr r4, _0223AE3C ; =ov70_022454EC
	mov r7, #0xc8
	add r5, r6, r0
_0223AD8A:
	ldr r2, [r4, #0x10]
	ldr r0, [r4, #4]
	cmp r2, #0
	bne _0223ADD6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	lsl r2, r2, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	lsr r2, r2, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r6, #4]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x14]
	add r0, r0, r2
	str r0, [sp, #0x14]
	b _0223AE10
_0223ADD6:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	lsl r2, r2, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r6, #4]
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mul r0, r1
	add r7, r7, r0
_0223AE10:
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x18]
	add r4, #0x14
	add r0, r0, #1
	add r5, #0x10
	str r0, [sp, #0x18]
	cmp r0, #0x10
	blt _0223AD8A
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223AE2C: .word 0x00000F18
_0223AE30: .word 0x00000F58
_0223AE34: .word 0x00000F68
_0223AE38: .word 0x00001058
_0223AE3C: .word ov70_022454EC
	thumb_func_end ov70_0223ACF4

	thumb_func_start ov70_0223AE40
ov70_0223AE40: ; 0x0223AE40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0223AE88 ; =0x00000F18
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0223AE8C ; =0x00000F68
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0223AE90 ; =0x00000F58
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0223AE8C ; =0x00000F68
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0223AE90 ; =0x00000F58
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0223AE94 ; =0x00001058
	mov r4, #0
	add r5, r5, r0
_0223AE72:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x10
	blt _0223AE72
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223AE88: .word 0x00000F18
_0223AE8C: .word 0x00000F68
_0223AE90: .word 0x00000F58
_0223AE94: .word 0x00001058
	thumb_func_end ov70_0223AE40

	thumb_func_start ov70_0223AE98
ov70_0223AE98: ; 0x0223AE98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x26
	lsl r0, r0, #4
	add r2, r5, r0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r0, #8
	mul r0, r1
	add r4, r2, r0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223AF18 ; =0x00000BBC
	str r0, [r5, r1]
	sub r1, #0x20
	ldr r0, [r5, r1]
	bl ScrStrBufs_ResetBuffers
	ldr r0, _0223AF1C ; =0x0000011E
	ldrb r2, [r4, r0]
	cmp r2, #0
	beq _0223AED4
	ldr r0, _0223AF20 ; =0x00000B9C
	mov r1, #8
	ldr r0, [r5, r0]
	bl BufferCountryName
_0223AED4:
	ldr r2, _0223AF24 ; =0x0000011F
	ldrb r3, [r4, r2]
	cmp r3, #0
	beq _0223AEEA
	ldr r0, _0223AF20 ; =0x00000B9C
	sub r2, r2, #1
	ldrb r2, [r4, r2]
	ldr r0, [r5, r0]
	mov r1, #9
	bl BufferCityName
_0223AEEA:
	ldr r1, _0223AF20 ; =0x00000B9C
	mov r2, #0x52
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r3, #0x3d
	bl ReadMsgData_ExpandPlaceholders
	ldr r1, _0223AF28 ; =0x00000BC4
	mov r2, #0x53
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x28
	sub r1, #0x24
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r3, #0x3d
	bl ReadMsgData_ExpandPlaceholders
	ldr r1, _0223AF2C ; =0x00000BC8
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
	nop
_0223AF18: .word 0x00000BBC
_0223AF1C: .word 0x0000011E
_0223AF20: .word 0x00000B9C
_0223AF24: .word 0x0000011F
_0223AF28: .word 0x00000BC4
_0223AF2C: .word 0x00000BC8
	thumb_func_end ov70_0223AE98

	thumb_func_start ov70_0223AF30
ov70_0223AF30: ; 0x0223AF30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223AF50 ; =0x00000BC4
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _0223AF54 ; =0x00000BC8
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _0223AF58 ; =0x00000BBC
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_0223AF50: .word 0x00000BC4
_0223AF54: .word 0x00000BC8
_0223AF58: .word 0x00000BBC
	thumb_func_end ov70_0223AF30

	thumb_func_start ov70_0223AF5C
ov70_0223AF5C: ; 0x0223AF5C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x24]
	cmp r0, #0x10
	bne _0223AF90
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #7
	str r0, [r4, #0x2c]
	b _0223AF9C
_0223AF90:
	mov r1, #1
	ldr r0, _0223AFA4 ; =0x00000F0C
	str r1, [r4, #0x2c]
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
_0223AF9C:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223AFA4: .word 0x00000F0C
	thumb_func_end ov70_0223AF5C

	thumb_func_start ov70_0223AFA8
ov70_0223AFA8: ; 0x0223AFA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	cmp r4, r0
	beq _0223AFF2
	cmp r4, #0
	blt _0223AFF2
	add r0, r4, #1
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0223AFF4 ; =0x00000EE4
	ldr r0, [r1, r0]
	lsl r1, r4, #2
	add r1, #0x10
	bl Set2dSpriteAnimSeqNo
	mov r0, #2
	str r0, [r5, #0x2c]
	add r0, r5, #0
	mov r1, #3
	mov r2, #0x11
	bl ov70_02238E50
	mov r0, #0x4b
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov70_02241330
	ldr r0, _0223AFF8 ; =0x000005DC
	bl PlaySE
_0223AFF2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223AFF4: .word 0x00000EE4
_0223AFF8: .word 0x000005DC
	thumb_func_end ov70_0223AFA8

	thumb_func_start ov70_0223AFFC
ov70_0223AFFC: ; 0x0223AFFC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _0223B114 ; =gSystem
	mov r2, #1
	ldr r1, [r1, #0x48]
	add r4, r0, #0
	add r3, r1, #0
	tst r3, r2
	beq _0223B02C
	ldr r1, _0223B118 ; =0x00000F0F
	mov r3, #0
	str r1, [sp]
	mov r1, #0x10
	bl ov70_0223B364
	add r0, r4, #0
	mov r1, #3
	mov r2, #4
	bl ov70_02238D84
	ldr r0, _0223B11C ; =0x000005DC
	bl PlaySE
	b _0223B10C
_0223B02C:
	mov r3, #2
	tst r3, r1
	beq _0223B054
	mov r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _0223B11C ; =0x000005DC
	bl PlaySE
	b _0223B10C
_0223B054:
	mov r2, #0x20
	tst r2, r1
	beq _0223B07A
	mov r2, #0x4b
	lsl r2, r2, #2
	ldr r5, [r4, r2]
	ldr r1, _0223B120 ; =ov70_022454A4
	lsl r3, r5, #1
	ldrb r1, [r1, r3]
	cmp r5, r1
	beq _0223B10C
	sub r2, r2, #4
	ldr r3, [r4, r2]
	add r2, r1, #1
	cmp r3, r2
	blt _0223B10C
	bl ov70_0223AFA8
	b _0223B10C
_0223B07A:
	mov r2, #0x10
	tst r1, r2
	beq _0223B0A0
	mov r2, #0x4b
	lsl r2, r2, #2
	ldr r5, [r4, r2]
	ldr r1, _0223B124 ; =ov70_022454A5
	lsl r3, r5, #1
	ldrb r1, [r1, r3]
	cmp r5, r1
	beq _0223B10C
	sub r2, r2, #4
	ldr r3, [r4, r2]
	add r2, r1, #1
	cmp r3, r2
	blt _0223B10C
	bl ov70_0223AFA8
	b _0223B10C
_0223B0A0:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov70_02241164
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0223B0BA
	add r0, r4, #0
	bl ov70_0223AFA8
_0223B0BA:
	ldr r0, _0223B128 ; =ov70_02245498
	bl sub_02025224
	cmp r0, #0
	bne _0223B0E6
	ldr r0, _0223B118 ; =0x00000F0F
	mov r1, #0x10
	str r0, [sp]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov70_0223B364
	add r0, r4, #0
	mov r1, #3
	mov r2, #4
	bl ov70_02238D84
	ldr r0, _0223B11C ; =0x000005DC
	bl PlaySE
	b _0223B10C
_0223B0E6:
	cmp r0, #1
	bne _0223B10C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _0223B11C ; =0x000005DC
	bl PlaySE
_0223B10C:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223B114: .word gSystem
_0223B118: .word 0x00000F0F
_0223B11C: .word 0x000005DC
_0223B120: .word ov70_022454A4
_0223B124: .word ov70_022454A5
_0223B128: .word ov70_02245498
	thumb_func_end ov70_0223AFFC

	thumb_func_start ov70_0223B12C
ov70_0223B12C: ; 0x0223B12C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0223B184 ; =0x00000F0C
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x24]
	cmp r0, #0xf
	beq _0223B178
	cmp r0, #6
	bne _0223B160
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _0223B178
_0223B160:
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
_0223B178:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223B184: .word 0x00000F0C
	thumb_func_end ov70_0223B12C

	thumb_func_start ov70_0223B188
ov70_0223B188: ; 0x0223B188
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r2, _0223B1B0 ; =0x0000012E
	mov r1, #0xa
	mov r3, #3
	bl ov70_02238C2C
	ldr r1, _0223B1B4 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0223B1B0: .word 0x0000012E
_0223B1B4: .word 0x000011C8
	thumb_func_end ov70_0223B188

	thumb_func_start ov70_0223B1B8
ov70_0223B1B8: ; 0x0223B1B8
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223B202
	ldr r0, _0223B240 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #2
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #5
	mov r2, #6
	bl ov70_02238E50
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223B244 ; =0x00001138
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x4d
	bl ov70_0223B3BC
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223B248 ; =0x000010E8
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x51
	bl ov70_0223B3BC
	add r0, r4, #0
	bl ov70_0223B258
	b _0223B23C
_0223B202:
	cmp r0, #2
	bne _0223B23C
	ldr r0, _0223B240 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _0223B24C ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	mov r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223B250 ; =0x00000F58
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x58
	bl ov70_0223B3EC
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r1, _0223B254 ; =0x00000F68
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #0x6d
	bl ov70_0223B3EC
_0223B23C:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223B240: .word 0x000011C8
_0223B244: .word 0x00001138
_0223B248: .word 0x000010E8
_0223B24C: .word 0x00000F18
_0223B250: .word 0x00000F58
_0223B254: .word 0x00000F68
	thumb_func_end ov70_0223B1B8

	thumb_func_start ov70_0223B258
ov70_0223B258: ; 0x0223B258
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x64
	mov r1, #0x24
	bl GfGfxLoader_LoadScrnData
	ldr r2, _0223B2B4 ; =0x00000BC4
	ldr r0, _0223B2B8 ; =0x000010F8
	ldr r1, [r4, r2]
	add r2, r2, #4
	ldr r2, [r4, r2]
	add r0, r4, r0
	bl ov70_0223B484
	mov r2, #0xba
	ldr r0, _0223B2BC ; =0x00001148
	lsl r2, r2, #4
	mov r3, #0x35
	mov r5, #0x4b
	ldr r1, [r4, r2]
	add r2, r2, #4
	lsl r3, r3, #4
	lsl r5, r5, #2
	add r0, r4, r0
	ldr r2, [r4, r2]
	add r3, r4, r3
	ldr r4, [r4, r5]
	sub r5, #8
	mul r5, r4
	add r3, r3, r5
	bl ov70_0223B41C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223B2B4: .word 0x00000BC4
_0223B2B8: .word 0x000010F8
_0223B2BC: .word 0x00001148
	thumb_func_end ov70_0223B258

	thumb_func_start ov70_0223B2C0
ov70_0223B2C0: ; 0x0223B2C0
	push {r4, lr}
	add r4, r0, #0
	bl ov70_0223B258
	mov r0, #1
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_0223B2C0

	thumb_func_start ov70_0223B2D0
ov70_0223B2D0: ; 0x0223B2D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B2FC ; =0x00000F14
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223B2F6
	ldr r0, _0223B2FC ; =0x00000F14
	mov r1, #0
	str r1, [r4, r0]
	mov r1, #1
	str r1, [r4, #0x2c]
	sub r0, #8
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
_0223B2F6:
	mov r0, #3
	pop {r4, pc}
	nop
_0223B2FC: .word 0x00000F14
	thumb_func_end ov70_0223B2D0

	thumb_func_start ov70_0223B300
ov70_0223B300: ; 0x0223B300
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B338 ; =0x00000F14
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223B332
	ldr r2, _0223B33C ; =0x04000304
	ldr r0, _0223B340 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #2
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #4
	mov r2, #0xf
	bl ov70_02238E50
	ldr r0, _0223B338 ; =0x00000F14
	mov r1, #0x10
	str r1, [r4, r0]
_0223B332:
	mov r0, #3
	pop {r4, pc}
	nop
_0223B338: .word 0x00000F14
_0223B33C: .word 0x04000304
_0223B340: .word 0xFFFF7FFF
	thumb_func_end ov70_0223B300

	thumb_func_start ov70_0223B344
ov70_0223B344: ; 0x0223B344
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223B35E
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223B35E:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223B344

	thumb_func_start ov70_0223B364
ov70_0223B364: ; 0x0223B364
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0xba
	add r5, r0, #0
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x1c
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	ldr r0, _0223B3B4 ; =0x00000F18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223B3B4 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #2
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223B3B4 ; =0x00000F18
	ldr r2, _0223B3B8 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223B3B4: .word 0x00000F18
_0223B3B8: .word 0x00000BBC
	thumb_func_end ov70_0223B364

	thumb_func_start ov70_0223B3BC
ov70_0223B3BC: ; 0x0223B3BC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r2, #0
	ldr r0, _0223B3E8 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov70_02245084
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223B3E8: .word 0x000F0200
	thumb_func_end ov70_0223B3BC

	thumb_func_start ov70_0223B3EC
ov70_0223B3EC: ; 0x0223B3EC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _0223B418 ; =0x000F0200
	mov r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov70_022450B8
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B418: .word 0x000F0200
	thumb_func_end ov70_0223B3EC

	thumb_func_start ov70_0223B41C
ov70_0223B41C: ; 0x0223B41C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	mov r1, #0
	add r5, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, _0223B480 ; =0x00010200
	mov r3, #0
	str r0, [sp]
	ldrsh r2, [r4, r3]
	add r0, r5, #0
	add r1, r7, #0
	bl ov70_0223F20C
	mov r0, #0x49
	str r0, [sp]
	mov r3, #0
	ldr r0, _0223B480 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r2, #2
	ldrsb r2, [r4, r2]
	add r0, r5, #0
	add r1, r6, #0
	bl ov70_0223F324
	mov r0, #3
	mov r1, #4
	ldrsb r0, [r4, r0]
	ldrsb r1, [r4, r1]
	mov r2, #0
	bl ov70_0223F864
	add r2, r0, #0
	mov r0, #0x68
	str r0, [sp]
	mov r3, #0
	ldr r0, _0223B480 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	str r3, [sp, #0xc]
	bl ov70_0223F38C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B480: .word 0x00010200
	thumb_func_end ov70_0223B41C

	thumb_func_start ov70_0223B484
ov70_0223B484: ; 0x0223B484
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	add r6, r2, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	beq _0223B4B4
	mov r2, #0
	ldr r0, _0223B4D0 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov70_02245084
_0223B4B4:
	cmp r6, #0
	beq _0223B4CC
	mov r2, #0
	ldr r0, _0223B4D0 ; =0x00010200
	str r2, [sp]
	add r5, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r2, #0
	bl ov70_02245084
_0223B4CC:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223B4D0: .word 0x00010200
	thumb_func_end ov70_0223B484

	thumb_func_start ov70_0223B4D4
ov70_0223B4D4: ; 0x0223B4D4
	push {r3, r4, r5, lr}
	ldr r3, _0223B558 ; =0x00000F14
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #0
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #1
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	mov r1, #3
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #4
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	mov r2, #3
	ldr r5, [r4, r3]
	add r3, r2, #0
	sub r3, #0x23
	ldr r0, [r4, #4]
	mov r1, #5
	sub r3, r3, r5
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #6
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r3, _0223B558 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #7
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, pc}
	nop
_0223B558: .word 0x00000F14
	thumb_func_end ov70_0223B4D4

	thumb_func_start ov70_0223B55C
ov70_0223B55C: ; 0x0223B55C
	push {r3, r4, lr}
	sub sp, #0x3c
	add r4, r0, #0
	bl ov70_0223BC7C
	ldr r0, [r4, #4]
	bl ov70_0223B7CC
	add r0, r4, #0
	bl ov70_0223B8E0
	add r0, r4, #0
	bl ov70_0223BAE0
	add r0, r4, #0
	bl ov70_0223B9C8
	ldr r0, [r4, #4]
	ldr r3, _0223B6AC ; =0x00000F58
	str r0, [sp, #0xc]
	add r0, r4, r3
	str r0, [sp, #0x10]
	ldr r0, _0223B6B0 ; =0x00001168
	add r1, r4, r0
	str r1, [sp, #0x14]
	mov r1, #0xdd
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	sub r1, r1, #4
	str r2, [sp, #0x18]
	add r2, r3, #0
	sub r2, #0x54
	ldr r2, [r4, r2]
	sub r3, #0x50
	str r2, [sp, #0x1c]
	ldr r2, [r4, r3]
	add r0, #0x5c
	str r2, [sp, #0x20]
	ldr r1, [r4, r1]
	mov r2, #0xba
	lsl r2, r2, #4
	str r1, [sp, #0x24]
	ldr r1, [r4, r2]
	str r1, [sp, #0x28]
	add r1, r2, #4
	ldr r1, [r4, r1]
	add r2, #0x10
	str r1, [sp, #0x2c]
	ldr r1, [r4, r2]
	mov r2, #1
	str r1, [sp, #0x30]
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	str r1, [sp, #0x34]
	ldr r0, [r4, r0]
	mov r1, #2
	ldr r0, [r0, #0x14]
	str r0, [sp, #0x38]
	add r0, sp, #0xc
	bl ov70_02242014
	ldr r1, _0223B6B4 ; =0x000011A8
	mov r2, #0xba
	str r0, [r4, r1]
	ldr r0, _0223B6B8 ; =0x00001058
	lsl r2, r2, #4
	sub r1, #0x30
	ldr r2, [r4, r2]
	add r0, r4, r0
	add r1, r4, r1
	bl ov70_0223CB1C
	ldr r3, _0223B6BC ; =0x000011DE
	mov r2, #0xba
	ldr r1, _0223B6C0 ; =0x000010D8
	lsl r2, r2, #4
	ldrh r3, [r4, r3]
	ldr r0, [r4, #4]
	ldr r2, [r4, r2]
	add r1, r4, r1
	bl ov70_0223CC04
	mov r3, #0
	ldr r0, _0223B6C4 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, _0223B6C8 ; =0x00000BA4
	ldr r0, _0223B6CC ; =0x00001068
	ldr r1, [r4, r2]
	sub r2, #0x1a
	ldrsh r2, [r4, r2]
	add r0, r4, r0
	bl ov70_0223F1D8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223B6C4 ; =0x00010200
	mov r2, #0xba
	str r0, [sp, #8]
	lsl r2, r2, #4
	ldr r1, [r4, r2]
	sub r2, #0x14
	ldr r0, _0223B6D0 ; =0x00001088
	ldrsb r2, [r4, r2]
	add r0, r4, r0
	mov r3, #1
	bl ov70_0223F2BC
	ldr r1, _0223B6D4 ; =0x00000B8D
	mov r2, #1
	ldrsb r0, [r4, r1]
	add r1, r1, #1
	ldrsb r1, [r4, r1]
	bl ov70_0223F864
	add r2, r0, #0
	mov r3, #0
	ldr r0, _0223B6C4 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #1
	mov r1, #0xba
	str r0, [sp, #8]
	ldr r0, _0223B6D8 ; =0x000010A8
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, r0
	bl ov70_0223F370
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223B6C4 ; =0x00010200
	mov r2, #0xbb
	str r0, [sp, #8]
	lsl r2, r2, #4
	ldr r3, _0223B6DC ; =0x000012CC
	ldr r0, _0223B6E0 ; =0x00001188
	ldr r1, [r4, r2]
	sub r2, #0x10
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r0, r4, r0
	bl ov70_0223F244
	ldr r1, _0223B6E4 ; =ov70_0223CCA4
	ldr r0, _0223B6E8 ; =0x00001208
	str r1, [r4, r0]
	ldr r0, [r4, #0x24]
	cmp r0, #0xd
	bne _0223B6A2
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
_0223B6A2:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #2
	add sp, #0x3c
	pop {r3, r4, pc}
	.balign 4, 0
_0223B6AC: .word 0x00000F58
_0223B6B0: .word 0x00001168
_0223B6B4: .word 0x000011A8
_0223B6B8: .word 0x00001058
_0223B6BC: .word 0x000011DE
_0223B6C0: .word 0x000010D8
_0223B6C4: .word 0x00010200
_0223B6C8: .word 0x00000BA4
_0223B6CC: .word 0x00001068
_0223B6D0: .word 0x00001088
_0223B6D4: .word 0x00000B8D
_0223B6D8: .word 0x000010A8
_0223B6DC: .word 0x000012CC
_0223B6E0: .word 0x00001188
_0223B6E4: .word ov70_0223CCA4
_0223B6E8: .word 0x00001208
	thumb_func_end ov70_0223B55C

	thumb_func_start ov70_0223B6EC
ov70_0223B6EC: ; 0x0223B6EC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsl r2, r1, #2
	ldr r1, _0223B768 ; =ov70_02246528
	ldr r1, [r1, r2]
	blx r1
	mov r7, #0x6a
	str r0, [sp]
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_0223B704:
	ldr r3, _0223B76C ; =0x0000120E
	ldr r1, _0223B770 ; =0x0000120C
	ldr r2, _0223B774 ; =0x00000F14
	ldr r0, _0223B778 ; =0x00000EE4
	ldrsh r3, [r4, r3]
	ldr r2, [r5, r2]
	ldrsh r1, [r4, r1]
	ldr r0, [r4, r0]
	add r2, r2, r3
	bl ov70_02238F9C
	ldr r2, _0223B774 ; =0x00000F14
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	mov r1, #0x37
	add r2, r2, r7
	bl ov70_02238F9C
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #8
	blt _0223B704
	add r0, r5, #0
	bl ov70_0223C2EC
	add r4, r0, #0
	add r0, r5, #0
	bl ov70_0223C2EC
	add r2, r0, #0
	ldr r0, _0223B77C ; =0x00000DCC
	mov r3, #6
	add r6, r4, #0
	mul r6, r3
	mul r3, r2
	ldr r2, _0223B780 ; =ov70_02246500
	ldr r1, _0223B784 ; =ov70_022464FE
	ldrh r3, [r2, r3]
	ldr r2, _0223B774 ; =0x00000F14
	ldrh r1, [r1, r6]
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	sub r2, r3, r2
	bl ov70_02238F9C
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B768: .word ov70_02246528
_0223B76C: .word 0x0000120E
_0223B770: .word 0x0000120C
_0223B774: .word 0x00000F14
_0223B778: .word 0x00000EE4
_0223B77C: .word 0x00000DCC
_0223B780: .word ov70_02246500
_0223B784: .word ov70_022464FE
	thumb_func_end ov70_0223B6EC

	thumb_func_start ov70_0223B788
ov70_0223B788: ; 0x0223B788
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B7C8 ; =0x00001208
	mov r1, #0
	str r1, [r4, r0]
	sub r0, #0x60
	ldr r0, [r4, r0]
	bl ov70_0224212C
	add r0, r4, #0
	bl ov70_0223BAAC
	add r0, r4, #0
	bl ov70_0223BCD0
	add r0, r4, #0
	bl ov70_0223BC2C
	ldr r0, [r4, #4]
	bl ov70_0223B8B4
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223B7C8: .word 0x00001208
	thumb_func_end ov70_0223B788

	thumb_func_start ov70_0223B7CC
ov70_0223B7CC: ; 0x0223B7CC
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _0223B8A4 ; =ov70_02245690
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223B8A8 ; =ov70_022456AC
	add r3, sp, #0x38
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
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223B8AC ; =ov70_02245674
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223B8B0 ; =ov70_02245658
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_022391F0
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	add sp, #0x70
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B8A4: .word ov70_02245690
_0223B8A8: .word ov70_022456AC
_0223B8AC: .word ov70_02245674
_0223B8B0: .word ov70_02245658
	thumb_func_end ov70_0223B7CC

	thumb_func_start ov70_0223B8B4
ov70_0223B8B4: ; 0x0223B8B4
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022392BC
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223B8B4

	thumb_func_start ov70_0223B8E0
ov70_0223B8E0: ; 0x0223B8E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r5, [r6, #4]
	mov r0, #0x64
	mov r1, #0x3d
	bl NARC_ctor
	mov r1, #0x60
	str r1, [sp]
	mov r1, #0x3d
	mov r2, #0
	str r1, [sp, #4]
	mov r1, #3
	add r3, r2, #0
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #5
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xe
	add r2, r5, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x1d
	add r2, r5, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xf
	add r2, r5, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #4
	mov r1, #0x20
	mov r2, #0x3d
	bl LoadFontPal1
	add r0, r6, #0
	bl ov70_02239CF8
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_0223B8E0

	thumb_func_start ov70_0223B9C8
ov70_0223B9C8: ; 0x0223B9C8
	push {r4, lr}
	sub sp, #0x30
	mov r2, #0xd6
	add r4, r0, #0
	lsl r2, r2, #4
	add r0, sp, #0
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #1
	bl ov70_02238B54
	ldr r0, _0223BA9C ; =ov70_022464F0
	ldrh r1, [r0, #0xe]
	ldrh r0, [r0, #0x10]
	lsl r1, r1, #0xc
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	str r1, [sp, #8]
	bl CreateSprite
	ldr r1, _0223BAA0 ; =0x00000DCC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0223BAA0 ; =0x00000DCC
	mov r1, #0x2d
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223BAA0 ; =0x00000DCC
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _0223BAA0 ; =0x00000DCC
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024B78
	mov r0, #0xa
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	mov r1, #0xdd
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xdd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x39
	lsl r0, r0, #0xe
	str r0, [sp, #8]
	mov r0, #0x75
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223BAA4 ; =0x00000F04
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x26
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223BAA4 ; =0x00000F04
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x23
	lsl r0, r0, #0xe
	str r0, [sp, #8]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223BAA8 ; =0x00000F08
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223BAA8 ; =0x00000F08
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	bl sub_0203A880
	add sp, #0x30
	pop {r4, pc}
	nop
_0223BA9C: .word ov70_022464F0
_0223BAA0: .word 0x00000DCC
_0223BAA4: .word 0x00000F04
_0223BAA8: .word 0x00000F08
	thumb_func_end ov70_0223B9C8

	thumb_func_start ov70_0223BAAC
ov70_0223BAAC: ; 0x0223BAAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223BAD4 ; =0x00000DCC
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0xdd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, _0223BAD8 ; =0x00000F04
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, _0223BADC ; =0x00000F08
	ldr r0, [r4, r0]
	bl sub_02024758
	pop {r4, pc}
	.balign 4, 0
_0223BAD4: .word 0x00000DCC
_0223BAD8: .word 0x00000F04
_0223BADC: .word 0x00000F08
	thumb_func_end ov70_0223BAAC

	thumb_func_start ov70_0223BAE0
ov70_0223BAE0: ; 0x0223BAE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, _0223BC10 ; =0x00000F18
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #4]
	add r1, r1, r2
	mov r2, #0
	bl AddWindowParameterized
	ldr r1, _0223BC10 ; =0x00000F18
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _0223BC14 ; =0x00001058
	ldr r0, [sp, #0x14]
	ldr r4, _0223BC18 ; =ov70_02245640
	mov r7, #0
	mov r6, #1
	add r5, r0, r1
_0223BB22:
	ldrh r0, [r4, #2]
	add r1, r5, #0
	mov r2, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, #0x16
	add r4, r4, #4
	add r5, #0x10
	cmp r7, #6
	blt _0223BB22
	ldr r1, _0223BC1C ; =0x00001178
	ldr r0, [sp, #0x14]
	ldr r4, _0223BC20 ; =ov70_0224562C
	mov r7, #0
	mov r6, #0x85
	add r5, r0, r1
_0223BB6E:
	ldrh r0, [r4, #2]
	add r1, r5, #0
	mov r2, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, #0x38
	add r4, r4, #4
	add r5, #0x10
	cmp r7, #2
	blt _0223BB6E
	ldr r1, _0223BC14 ; =0x00001058
	ldr r0, [sp, #0x14]
	ldr r6, _0223BC24 ; =0x0000011D
	add r0, r0, r1
	ldr r4, _0223BC28 ; =ov70_02245634
	mov r5, #0
	str r0, [sp, #0x18]
_0223BBBC:
	add r0, r5, #6
	lsl r7, r0, #4
	ldrh r0, [r4, #2]
	ldr r1, [sp, #0x18]
	mov r2, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	add r1, r1, r7
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r0, r7
	bl FillWindowPixelBuffer
	add r5, r5, #1
	add r6, #0x14
	add r4, r4, #4
	cmp r5, #3
	blt _0223BBBC
	ldr r0, [sp, #0x14]
	mov r1, #4
	bl ov70_02239D44
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223BC10: .word 0x00000F18
_0223BC14: .word 0x00001058
_0223BC18: .word ov70_02245640
_0223BC1C: .word 0x00001178
_0223BC20: .word ov70_0224562C
_0223BC24: .word 0x0000011D
_0223BC28: .word ov70_02245634
	thumb_func_end ov70_0223BAE0

	thumb_func_start ov70_0223BC2C
ov70_0223BC2C: ; 0x0223BC2C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0223BC6C ; =0x00001198
	add r0, r6, r0
	bl RemoveWindow
	ldr r0, _0223BC70 ; =0x00000F18
	add r0, r6, r0
	bl RemoveWindow
	ldr r0, _0223BC74 ; =0x00001058
	mov r4, #0
	add r5, r6, r0
_0223BC46:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blt _0223BC46
	ldr r0, _0223BC78 ; =0x00001178
	mov r4, #0
	add r5, r6, r0
_0223BC5A:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _0223BC5A
	pop {r4, r5, r6, pc}
	nop
_0223BC6C: .word 0x00001198
_0223BC70: .word 0x00000F18
_0223BC74: .word 0x00001058
_0223BC78: .word 0x00001178
	thumb_func_end ov70_0223BC2C

	thumb_func_start ov70_0223BC7C
ov70_0223BC7C: ; 0x0223BC7C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223BCC8 ; =0x00000BBC
	str r0, [r4, r1]
	sub r1, #0x1c
	ldr r0, [r4, r1]
	mov r1, #0x2a
	bl NewString_ReadMsgData
	mov r1, #0x2f
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0x3d
	mov r1, #0x30
	bl AllocFromHeap
	ldr r1, _0223BCCC ; =0x000011C4
	mov r2, #0x30
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	bl MIi_CpuClearFast
	mov r0, #0x3d
	bl ov70_0223F684
	ldr r1, _0223BCCC ; =0x000011C4
	ldr r2, [r4, r1]
	add r1, #0x70
	str r0, [r2, #0x14]
	add r0, r4, r1
	bl ov70_0223F948
	pop {r4, pc}
	.balign 4, 0
_0223BCC8: .word 0x00000BBC
_0223BCCC: .word 0x000011C4
	thumb_func_end ov70_0223BC7C

	thumb_func_start ov70_0223BCD0
ov70_0223BCD0: ; 0x0223BCD0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223BCFC ; =0x000011C4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl FreeToHeap
	ldr r0, _0223BCFC ; =0x000011C4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _0223BD00 ; =0x00000BBC
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_0223BCFC: .word 0x000011C4
_0223BD00: .word 0x00000BBC
	thumb_func_end ov70_0223BCD0

	thumb_func_start ov70_0223BD04
ov70_0223BD04: ; 0x0223BD04
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0xf
	ldr r1, _0223BD78 ; =0x00000F0F
	bne _0223BD4E
	mov r2, #0
	str r1, [sp]
	mov r1, #0x20
	add r3, r2, #0
	bl ov70_0223CAC4
	ldr r0, _0223BD7C ; =0x0400006C
	bl GXx_GetMasterBrightness_
	mov r1, #0xf
	mvn r1, r1
	cmp r0, r1
	bne _0223BD48
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x1e
	str r0, [r4, #0x2c]
	b _0223BD64
_0223BD48:
	mov r0, #1
	str r0, [r4, #0x2c]
	b _0223BD64
_0223BD4E:
	str r1, [sp]
	mov r1, #8
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
_0223BD64:
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223BD78: .word 0x00000F0F
_0223BD7C: .word 0x0400006C
	thumb_func_end ov70_0223BD04

	thumb_func_start ov70_0223BD80
ov70_0223BD80: ; 0x0223BD80
	ldr r3, _0223BD88 ; =sub_02025224
	ldr r0, _0223BD8C ; =ov70_022456C8
	bx r3
	nop
_0223BD88: .word sub_02025224
_0223BD8C: .word ov70_022456C8
	thumb_func_end ov70_0223BD80

	thumb_func_start ov70_0223BD90
ov70_0223BD90: ; 0x0223BD90
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	cmp r1, #6
	bhi _0223BE70
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223BDA6: ; jump table
	.short _0223BDB4 - _0223BDA6 - 2 ; case 0
	.short _0223BDC2 - _0223BDA6 - 2 ; case 1
	.short _0223BDFE - _0223BDA6 - 2 ; case 2
	.short _0223BE0C - _0223BDA6 - 2 ; case 3
	.short _0223BE1A - _0223BDA6 - 2 ; case 4
	.short _0223BE4A - _0223BDA6 - 2 ; case 5
	.short _0223BE52 - _0223BDA6 - 2 ; case 6
_0223BDB4:
	mov r0, #3
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
	add sp, #0xc
	pop {r3, r4, pc}
_0223BDC2:
	ldr r0, _0223BE78 ; =0x00000B8A
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _0223BDF0
	mov r1, #0x12
	bl GetMonBaseStat
	ldr r1, _0223BE7C ; =0x000011C4
	ldr r2, [r4, r1]
	str r0, [r2, #0x20]
	ldr r1, [r4, r1]
	ldr r0, _0223BE78 ; =0x00000B8A
	ldr r1, [r1, #0x20]
	add r0, r4, r0
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223BDF0
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
	add sp, #0xc
	pop {r3, r4, pc}
_0223BDF0:
	mov r0, #6
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
	add sp, #0xc
	pop {r3, r4, pc}
_0223BDFE:
	mov r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
	add sp, #0xc
	pop {r3, r4, pc}
_0223BE0C:
	mov r0, #0xc
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
	add sp, #0xc
	pop {r3, r4, pc}
_0223BE1A:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223BE70
	mov r0, #0x1d
	str r0, [r4, #0x2c]
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
	add sp, #0xc
	pop {r3, r4, pc}
_0223BE4A:
	mov r0, #0xf
	add sp, #0xc
	str r0, [r4, #0x2c]
	pop {r3, r4, pc}
_0223BE52:
	ldr r1, _0223BE80 ; =0x00000F0F
	mov r2, #1
	str r1, [sp]
	mov r1, #0xf
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #0x17
	bl ov70_02238D84
	ldr r0, _0223BE74 ; =0x000005DC
	bl PlaySE
_0223BE70:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223BE74: .word 0x000005DC
_0223BE78: .word 0x00000B8A
_0223BE7C: .word 0x000011C4
_0223BE80: .word 0x00000F0F
	thumb_func_end ov70_0223BD90

	thumb_func_start ov70_0223BE84
ov70_0223BE84: ; 0x0223BE84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_0223BD80
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0223BEA8
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_0223C420
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_0223BD90
	b _0223BEEE
_0223BEA8:
	add r0, r5, #0
	bl ov70_0223C304
	ldr r0, _0223BEF4 ; =gSystem
	mov r2, #1
	ldr r1, [r0, #0x48]
	add r0, r1, #0
	tst r0, r2
	beq _0223BECA
	add r0, r5, #0
	bl ov70_0223C2EC
	add r1, r0, #0
	add r0, r5, #0
	bl ov70_0223BD90
	b _0223BEEE
_0223BECA:
	mov r0, #2
	tst r0, r1
	beq _0223BEEE
	ldr r0, _0223BEF8 ; =0x00000F0F
	mov r1, #0xf
	str r0, [sp]
	add r0, r5, #0
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r5, #0
	mov r1, #0x15
	mov r2, #0x17
	bl ov70_02238D84
	ldr r0, _0223BEFC ; =0x000005DC
	bl PlaySE
_0223BEEE:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_0223BEF4: .word gSystem
_0223BEF8: .word 0x00000F0F
_0223BEFC: .word 0x000005DC
	thumb_func_end ov70_0223BE84

	thumb_func_start ov70_0223BF00
ov70_0223BF00: ; 0x0223BF00
	push {r3, r4, lr}
	sub sp, #4
	ldr r3, _0223BF94 ; =0x00000B8A
	add r4, r0, #0
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bne _0223BF2E
	ldr r1, _0223BF98 ; =0x00000F0F
	mov r2, #1
	str r1, [sp]
	mov r1, #0xc
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
	ldr r0, _0223BF9C ; =0x000005F3
	bl PlaySE
	b _0223BF8C
_0223BF2E:
	ldr r2, _0223BFA0 ; =0x000012CC
	add r1, r3, #6
	add r0, r4, r3
	add r3, #0xe
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r1, r4, r1
	bl ov70_0223CC68
	cmp r0, #0
	beq _0223BF66
	ldr r0, _0223BF98 ; =0x00000F0F
	mov r1, #0x21
	str r0, [sp]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
	ldr r0, _0223BF9C ; =0x000005F3
	bl PlaySE
	b _0223BF8C
_0223BF66:
	ldr r0, _0223BFA4 ; =0x000005FE
	bl PlaySE
	ldr r0, _0223BF98 ; =0x00000F0F
	mov r1, #0xd
	str r0, [sp]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #0x10
	bl ov70_02238D84
	add r0, r4, #0
	bl ov70_02241234
_0223BF8C:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223BF94: .word 0x00000B8A
_0223BF98: .word 0x00000F0F
_0223BF9C: .word 0x000005F3
_0223BFA0: .word 0x000012CC
_0223BFA4: .word 0x000005FE
	thumb_func_end ov70_0223BF00

	thumb_func_start ov70_0223BFA8
ov70_0223BFA8: ; 0x0223BFA8
	push {r3, r4, lr}
	sub sp, #0x2c
	cmp r1, #1
	ldr r0, [r0]
	bne _0223BFBA
	ldr r0, [r0]
	bl sub_0202DB90
	b _0223BFC0
_0223BFBA:
	ldr r0, [r0]
	bl sub_0202DB80
_0223BFC0:
	lsr r1, r0, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x1c]
	lsr r1, r0, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x20]
	lsr r1, r0, #8
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	str r1, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0xc
	add r1, sp, #0
	bl ov00_021ECB94
	add r0, sp, #0xc
	bl RTC_ConvertDateToDay
	add r4, r0, #0
	add r0, sp, #0x1c
	bl RTC_ConvertDateToDay
	sub r0, r4, r0
	bmi _0223C002
	cmp r0, #3
	bge _0223C002
	add sp, #0x2c
	mov r0, #1
	pop {r3, r4, pc}
_0223C002:
	mov r0, #0
	add sp, #0x2c
	pop {r3, r4, pc}
	thumb_func_end ov70_0223BFA8

	thumb_func_start ov70_0223C008
ov70_0223C008: ; 0x0223C008
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #1
	add r5, r0, #0
	mov r4, #3
	bl ov70_0223BFA8
	cmp r0, #0
	beq _0223C01C
	add r4, r4, #2
_0223C01C:
	add r0, r5, #0
	mov r1, #0
	bl ov70_0223BFA8
	cmp r0, #0
	beq _0223C02A
	add r4, r4, #2
_0223C02A:
	ldr r0, _0223C0BC ; =0x000012CC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223C044
	ldr r0, _0223C0C0 ; =0x00000B8A
	mov r2, #0x26
	lsl r2, r2, #4
	add r0, r5, r0
	add r1, r4, #0
	add r2, r5, r2
	bl ov70_02238130
	b _0223C082
_0223C044:
	add r0, sp, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r1, _0223C0C0 ; =0x00000B8A
	add r0, sp, #0
	ldrsh r2, [r5, r1]
	strh r2, [r0]
	add r2, r1, #2
	ldrsb r2, [r5, r2]
	strb r2, [r0, #2]
	add r2, r1, #3
	ldrsb r2, [r5, r2]
	strb r2, [r0, #3]
	add r2, r1, #4
	ldrsb r2, [r5, r2]
	add r1, r1, #5
	strb r2, [r0, #4]
	ldrsb r1, [r5, r1]
	strb r1, [r0, #5]
	ldr r1, _0223C0BC ; =0x000012CC
	strb r4, [r0, #6]
	ldr r1, [r5, r1]
	strb r1, [r0, #7]
	mov r1, #0x26
	lsl r1, r1, #4
	add r0, sp, #0
	add r1, r5, r1
	bl ov70_022381A4
_0223C082:
	ldr r1, _0223C0C0 ; =0x00000B8A
	ldrh r2, [r5, r1]
	add r0, r1, #6
	strh r2, [r5, r0]
	add r0, r1, #2
	ldrh r2, [r5, r0]
	add r0, r1, #0
	add r0, #8
	strh r2, [r5, r0]
	add r0, r1, #4
	ldrh r2, [r5, r0]
	add r0, r1, #0
	add r0, #0xa
	strh r2, [r5, r0]
	ldr r2, _0223C0BC ; =0x000012CC
	add r1, #0xe
	ldr r0, [r5, r2]
	sub r2, #0xee
	str r0, [r5, r1]
	ldr r0, _0223C0C4 ; =0x00001604
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #0x11
	str r0, [r5, #0x2c]
	strh r1, [r5, r2]
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223C0BC: .word 0x000012CC
_0223C0C0: .word 0x00000B8A
_0223C0C4: .word 0x00001604
	thumb_func_end ov70_0223C008

	thumb_func_start ov70_0223C0C8
ov70_0223C0C8: ; 0x0223C0C8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223C176
	bl ov70_02237F58
	add r5, r0, #0
	ldr r0, _0223C190 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	add r0, r5, #0
	add r0, #0xf
	cmp r0, #0x16
	bhi _0223C18C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223C0F4: ; jump table
	.short _0223C170 - _0223C0F4 - 2 ; case 0
	.short _0223C164 - _0223C0F4 - 2 ; case 1
	.short _0223C16A - _0223C0F4 - 2 ; case 2
	.short _0223C170 - _0223C0F4 - 2 ; case 3
	.short _0223C18C - _0223C0F4 - 2 ; case 4
	.short _0223C18C - _0223C0F4 - 2 ; case 5
	.short _0223C18C - _0223C0F4 - 2 ; case 6
	.short _0223C18C - _0223C0F4 - 2 ; case 7
	.short _0223C18C - _0223C0F4 - 2 ; case 8
	.short _0223C18C - _0223C0F4 - 2 ; case 9
	.short _0223C18C - _0223C0F4 - 2 ; case 10
	.short _0223C18C - _0223C0F4 - 2 ; case 11
	.short _0223C18C - _0223C0F4 - 2 ; case 12
	.short _0223C164 - _0223C0F4 - 2 ; case 13
	.short _0223C18C - _0223C0F4 - 2 ; case 14
	.short _0223C122 - _0223C0F4 - 2 ; case 15
	.short _0223C122 - _0223C0F4 - 2 ; case 16
	.short _0223C122 - _0223C0F4 - 2 ; case 17
	.short _0223C122 - _0223C0F4 - 2 ; case 18
	.short _0223C122 - _0223C0F4 - 2 ; case 19
	.short _0223C122 - _0223C0F4 - 2 ; case 20
	.short _0223C122 - _0223C0F4 - 2 ; case 21
	.short _0223C122 - _0223C0F4 - 2 ; case 22
_0223C122:
	mov r0, #0x4a
	lsl r0, r0, #2
	str r5, [r4, r0]
	ldr r0, _0223C194 ; =0x000005FE
	bl StopSE
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov70_02241184
	cmp r5, #0
	ldr r0, [r4, #4]
	ldr r1, _0223C198 ; =0x000010D8
	bne _0223C150
	mov r2, #0xba
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	add r1, r4, r1
	mov r3, #0
	bl ov70_0223CC04
	b _0223C15E
_0223C150:
	mov r2, #0xba
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	add r1, r4, r1
	mov r3, #1
	bl ov70_0223CC04
_0223C15E:
	mov r0, #0x12
	str r0, [r4, #0x2c]
	b _0223C18C
_0223C164:
	mov r0, #0x1b
	str r0, [r4, #0x2c]
	b _0223C18C
_0223C16A:
	bl sub_020399EC
	b _0223C18C
_0223C170:
	mov r0, #0x14
	str r0, [r4, #0x2c]
	b _0223C18C
_0223C176:
	ldr r0, _0223C190 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _0223C18C
	bl sub_020399EC
_0223C18C:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223C190: .word 0x00001604
_0223C194: .word 0x000005FE
_0223C198: .word 0x000010D8
	thumb_func_end ov70_0223C0C8

	thumb_func_start ov70_0223C19C
ov70_0223C19C: ; 0x0223C19C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0x4a
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	ldr r1, _0223C1F0 ; =0x00000F0F
	bne _0223C1CC
	str r1, [sp]
	mov r1, #0xe
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
	ldr r0, _0223C1F4 ; =0x000005F3
	bl PlaySE
	b _0223C1EA
_0223C1CC:
	str r1, [sp]
	mov r1, #0x1e
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #0x13
	bl ov70_02238D84
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
_0223C1EA:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C1F0: .word 0x00000F0F
_0223C1F4: .word 0x000005F3
	thumb_func_end ov70_0223C19C

	thumb_func_start ov70_0223C1F8
ov70_0223C1F8: ; 0x0223C1F8
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0x47
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	add r2, r2, #1
	str r2, [r4, r1]
	ldr r1, [r4, r1]
	cmp r1, #0x2d
	ble _0223C22C
	ldr r1, _0223C234 ; =0x00000F0F
	mov r2, #1
	str r1, [sp]
	mov r1, #0x20
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
	ldr r0, _0223C238 ; =0x000011DE
	mov r1, #1
	strh r1, [r4, r0]
_0223C22C:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C234: .word 0x00000F0F
_0223C238: .word 0x000011DE
	thumb_func_end ov70_0223C1F8

	thumb_func_start ov70_0223C23C
ov70_0223C23C: ; 0x0223C23C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0xb9
	add r4, r0, #0
	mov r3, #0
	lsl r1, r1, #4
	strh r3, [r4, r1]
	ldr r1, _0223C26C ; =0x00000F0F
	mov r2, #1
	str r1, [sp]
	mov r1, #0x26
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
	ldr r0, _0223C270 ; =0x000005F3
	bl PlaySE
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C26C: .word 0x00000F0F
_0223C270: .word 0x000005F3
	thumb_func_end ov70_0223C23C

	thumb_func_start ov70_0223C274
ov70_0223C274: ; 0x0223C274
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C2A8 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0x99
	mov r2, #4
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0x1c
	bl ov70_02238D84
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	ldr r0, _0223C2AC ; =0x000005F3
	bl PlaySE
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C2A8: .word 0x00000F0F
_0223C2AC: .word 0x000005F3
	thumb_func_end ov70_0223C274

	thumb_func_start ov70_0223C2B0
ov70_0223C2B0: ; 0x0223C2B0
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C2E4 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0x9e
	mov r2, #4
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #2
	bl ov70_02238D84
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	ldr r0, _0223C2E8 ; =0x000005F3
	bl PlaySE
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C2E4: .word 0x00000F0F
_0223C2E8: .word 0x000005F3
	thumb_func_end ov70_0223C2B0

	thumb_func_start ov70_0223C2EC
ov70_0223C2EC: ; 0x0223C2EC
	ldr r1, _0223C300 ; =0x000011C4
	ldr r1, [r0, r1]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	bne _0223C2FA
	ldr r0, [r1, #0x28]
	bx lr
_0223C2FA:
	ldr r0, [r1, #0x2c]
	add r0, r0, #4
	bx lr
	.balign 4, 0
_0223C300: .word 0x000011C4
	thumb_func_end ov70_0223C2EC

	thumb_func_start ov70_0223C304
ov70_0223C304: ; 0x0223C304
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0223C404 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0223C346
	ldr r0, _0223C408 ; =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	bne _0223C32E
	ldr r0, [r1, #0x28]
	cmp r0, #0
	ble _0223C3BE
	sub r0, r0, #1
	str r0, [r1, #0x28]
	ldr r0, _0223C40C ; =0x000005DC
	bl PlaySE
	b _0223C3BE
_0223C32E:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	ble _0223C3BE
	ldr r0, _0223C40C ; =0x000005DC
	bl PlaySE
	ldr r0, _0223C408 ; =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x2c]
	sub r0, r0, #1
	str r0, [r1, #0x2c]
	b _0223C3BE
_0223C346:
	mov r1, #0x80
	tst r1, r0
	beq _0223C380
	ldr r0, _0223C408 ; =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	bne _0223C368
	ldr r0, [r1, #0x28]
	cmp r0, #3
	bge _0223C3BE
	add r0, r0, #1
	str r0, [r1, #0x28]
	ldr r0, _0223C40C ; =0x000005DC
	bl PlaySE
	b _0223C3BE
_0223C368:
	ldr r0, [r1, #0x2c]
	cmp r0, #2
	bge _0223C3BE
	ldr r0, _0223C40C ; =0x000005DC
	bl PlaySE
	ldr r0, _0223C408 ; =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x2c]
	add r0, r0, #1
	str r0, [r1, #0x2c]
	b _0223C3BE
_0223C380:
	mov r1, #0x10
	tst r1, r0
	beq _0223C3A0
	ldr r0, _0223C408 ; =0x000011C4
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x24]
	cmp r0, #1
	beq _0223C396
	ldr r0, _0223C40C ; =0x000005DC
	bl PlaySE
_0223C396:
	ldr r0, _0223C408 ; =0x000011C4
	mov r1, #1
	ldr r0, [r5, r0]
	str r1, [r0, #0x24]
	b _0223C3BE
_0223C3A0:
	mov r1, #0x20
	tst r0, r1
	beq _0223C3BE
	ldr r0, _0223C408 ; =0x000011C4
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0223C3B6
	ldr r0, _0223C40C ; =0x000005DC
	bl PlaySE
_0223C3B6:
	ldr r0, _0223C408 ; =0x000011C4
	mov r1, #0
	ldr r0, [r5, r0]
	str r1, [r0, #0x24]
_0223C3BE:
	add r0, r5, #0
	bl ov70_0223C2EC
	add r4, r0, #0
	add r0, r5, #0
	bl ov70_0223C2EC
	add r2, r0, #0
	ldr r0, _0223C410 ; =0x00000DCC
	mov r3, #6
	add r6, r4, #0
	mul r6, r3
	ldr r1, _0223C414 ; =ov70_022464FE
	mul r3, r2
	ldr r2, _0223C418 ; =ov70_02246500
	ldrh r1, [r1, r6]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238F9C
	add r0, r5, #0
	bl ov70_0223C2EC
	add r3, r0, #0
	ldr r0, _0223C410 ; =0x00000DCC
	mov r1, #6
	add r2, r3, #0
	mul r2, r1
	ldr r1, _0223C41C ; =ov70_02246502
	ldr r0, [r5, r0]
	ldrh r1, [r1, r2]
	bl Set2dSpriteAnimSeqNo
	pop {r4, r5, r6, pc}
	nop
_0223C404: .word gSystem
_0223C408: .word 0x000011C4
_0223C40C: .word 0x000005DC
_0223C410: .word 0x00000DCC
_0223C414: .word ov70_022464FE
_0223C418: .word ov70_02246500
_0223C41C: .word ov70_02246502
	thumb_func_end ov70_0223C304

	thumb_func_start ov70_0223C420
ov70_0223C420: ; 0x0223C420
	push {r4, r5, r6, lr}
	add r5, r0, #0
	lsl r0, r1, #1
	ldr r1, _0223C494 ; =ov70_022464F0
	ldrb r1, [r1, r0]
	cmp r1, #0
	ldr r1, _0223C498 ; =0x000011C4
	bne _0223C440
	ldr r2, [r5, r1]
	mov r3, #0
	str r3, [r2, #0x24]
	ldr r2, _0223C49C ; =ov70_022464F1
	ldrb r2, [r2, r0]
	ldr r0, [r5, r1]
	str r2, [r0, #0x28]
	b _0223C44E
_0223C440:
	ldr r2, [r5, r1]
	mov r3, #1
	str r3, [r2, #0x24]
	ldr r2, _0223C49C ; =ov70_022464F1
	ldrb r2, [r2, r0]
	ldr r0, [r5, r1]
	str r2, [r0, #0x2c]
_0223C44E:
	add r0, r5, #0
	bl ov70_0223C2EC
	add r4, r0, #0
	add r0, r5, #0
	bl ov70_0223C2EC
	add r2, r0, #0
	ldr r0, _0223C4A0 ; =0x00000DCC
	mov r3, #6
	add r6, r4, #0
	mul r6, r3
	ldr r1, _0223C4A4 ; =ov70_022464FE
	mul r3, r2
	ldr r2, _0223C4A8 ; =ov70_02246500
	ldrh r1, [r1, r6]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238F9C
	add r0, r5, #0
	bl ov70_0223C2EC
	add r3, r0, #0
	ldr r0, _0223C4A0 ; =0x00000DCC
	mov r1, #6
	add r2, r3, #0
	mul r2, r1
	ldr r1, _0223C4AC ; =ov70_02246502
	ldr r0, [r5, r0]
	ldrh r1, [r1, r2]
	bl Set2dSpriteAnimSeqNo
	pop {r4, r5, r6, pc}
	nop
_0223C494: .word ov70_022464F0
_0223C498: .word 0x000011C4
_0223C49C: .word ov70_022464F1
_0223C4A0: .word 0x00000DCC
_0223C4A4: .word ov70_022464FE
_0223C4A8: .word ov70_02246500
_0223C4AC: .word ov70_02246502
	thumb_func_end ov70_0223C420

	thumb_func_start ov70_0223C4B0
ov70_0223C4B0: ; 0x0223C4B0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0223C4E0 ; =0x00000F14
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223C4D6
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
_0223C4D6:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223C4E0: .word 0x00000F14
	thumb_func_end ov70_0223C4B0

	thumb_func_start ov70_0223C4E4
ov70_0223C4E4: ; 0x0223C4E4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C508 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #4
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C508: .word 0x00000F0F
	thumb_func_end ov70_0223C4E4

	thumb_func_start ov70_0223C50C
ov70_0223C50C: ; 0x0223C50C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223C528 ; =0x000011A8
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #9
	bl ov70_0223CD28
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223C528: .word 0x000011A8
	thumb_func_end ov70_0223C50C

	thumb_func_start ov70_0223C52C
ov70_0223C52C: ; 0x0223C52C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0223C5FC ; =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _0223C54C
	add r0, r0, #1
	cmp r5, r0
	beq _0223C5F6
	b _0223C56E
_0223C54C:
	mov r0, #0
	bl ov70_0223CD28
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _0223C600 ; =0x000011C4
	ldr r3, [r4, r0]
	add r0, #0x70
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	add r0, r4, r0
	add r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
	b _0223C5F6
_0223C56E:
	mov r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C604 ; =0x00000B8A
	mov r1, #0
	strh r5, [r4, r0]
	ldr r0, _0223C608 ; =0x00001068
	str r1, [r4, #0x2c]
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #0
	ldr r0, _0223C60C ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _0223C610 ; =0x00000BA4
	ldr r0, _0223C608 ; =0x00001068
	ldr r1, [r4, r1]
	add r0, r4, r0
	add r2, r5, #0
	bl ov70_0223F1D8
	add r0, r5, #0
	mov r1, #0x12
	bl GetMonBaseStat
	ldr r1, _0223C600 ; =0x000011C4
	ldr r2, [r4, r1]
	str r0, [r2, #0x20]
	ldr r3, [r4, r1]
	add r1, #0x70
	add r0, r4, r1
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	add r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
	ldr r1, _0223C600 ; =0x000011C4
	ldr r0, _0223C604 ; =0x00000B8A
	ldr r1, [r4, r1]
	add r0, r4, r0
	ldr r1, [r1, #0x20]
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223C5F6
	ldr r0, _0223C614 ; =0x00001088
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C60C ; =0x00010200
	mov r2, #0xba
	str r0, [sp, #8]
	lsl r2, r2, #4
	ldr r1, [r4, r2]
	sub r2, #0x14
	ldr r0, _0223C614 ; =0x00001088
	ldrsb r2, [r4, r2]
	add r0, r4, r0
	mov r3, #1
	bl ov70_0223F2BC
_0223C5F6:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223C5FC: .word 0x000011A8
_0223C600: .word 0x000011C4
_0223C604: .word 0x00000B8A
_0223C608: .word 0x00001068
_0223C60C: .word 0x00010200
_0223C610: .word 0x00000BA4
_0223C614: .word 0x00001088
	thumb_func_end ov70_0223C52C

	thumb_func_start ov70_0223C618
ov70_0223C618: ; 0x0223C618
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C63C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xa
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #7
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C63C: .word 0x00000F0F
	thumb_func_end ov70_0223C618

	thumb_func_start ov70_0223C640
ov70_0223C640: ; 0x0223C640
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223C65C ; =0x000011A8
	mov r1, #1
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #9
	bl ov70_0223CD28
	mov r0, #8
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223C65C: .word 0x000011A8
	thumb_func_end ov70_0223C640

	thumb_func_start ov70_0223C660
ov70_0223C660: ; 0x0223C660
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223C6DC ; =0x000011A8
	ldr r0, [r5, r0]
	bl ov70_02242144
	add r4, r0, #0
	cmp r4, #2
	bhi _0223C682
	cmp r4, #0
	beq _0223C6A0
	cmp r4, #1
	beq _0223C6A0
	cmp r4, #2
	beq _0223C6A0
	b _0223C6D6
_0223C682:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0223C6D6
	mov r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C6E0 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r5, #0x2c]
	b _0223C6D6
_0223C6A0:
	mov r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C6E4 ; =0x00000B8C
	add r1, r4, #1
	strb r1, [r5, r0]
	ldr r0, _0223C6E8 ; =0x00001088
	mov r1, #0
	add r0, r5, r0
	str r1, [r5, #0x2c]
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C6EC ; =0x00010200
	mov r2, #0xba
	str r0, [sp, #8]
	lsl r2, r2, #4
	ldr r1, [r5, r2]
	sub r2, #0x14
	ldr r0, _0223C6E8 ; =0x00001088
	ldrsb r2, [r5, r2]
	add r0, r5, r0
	mov r3, #1
	bl ov70_0223F2BC
_0223C6D6:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223C6DC: .word 0x000011A8
_0223C6E0: .word 0x00000F18
_0223C6E4: .word 0x00000B8C
_0223C6E8: .word 0x00001088
_0223C6EC: .word 0x00010200
	thumb_func_end ov70_0223C660

	thumb_func_start ov70_0223C6F0
ov70_0223C6F0: ; 0x0223C6F0
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C714 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xb
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #0xa
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C714: .word 0x00000F0F
	thumb_func_end ov70_0223C6F0

	thumb_func_start ov70_0223C718
ov70_0223C718: ; 0x0223C718
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x46
	ldr r1, _0223C73C ; =0x0000FFFF
	lsl r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0223C740 ; =0x000011A8
	mov r1, #2
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #9
	bl ov70_0223CD28
	mov r0, #0xb
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223C73C: .word 0x0000FFFF
_0223C740: .word 0x000011A8
	thumb_func_end ov70_0223C718

	thumb_func_start ov70_0223C744
ov70_0223C744: ; 0x0223C744
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223C7B4 ; =0x000011A8
	ldr r0, [r5, r0]
	bl ov70_02242144
	add r4, r0, #0
	cmp r4, #0xb
	beq _0223C768
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0223C768
	add r0, r0, #1
	cmp r4, r0
	beq _0223C7AE
	b _0223C774
_0223C768:
	mov r0, #0
	bl ov70_0223CD28
	mov r0, #0
	str r0, [r5, #0x2c]
	b _0223C7AE
_0223C774:
	mov r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C7B8 ; =0x00000B8A
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #1
	bl ov70_0223F828
	ldr r0, _0223C7BC ; =0x000010A8
	mov r1, #0
	add r0, r5, r0
	str r1, [r5, #0x2c]
	bl FillWindowPixelBuffer
	mov r3, #0
	mov r1, #0xba
	ldr r0, _0223C7C0 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _0223C7BC ; =0x000010A8
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, r0
	add r2, r4, #0
	bl ov70_0223F370
_0223C7AE:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223C7B4: .word 0x000011A8
_0223C7B8: .word 0x00000B8A
_0223C7BC: .word 0x000010A8
_0223C7C0: .word 0x00010200
	thumb_func_end ov70_0223C744

	thumb_func_start ov70_0223C7C4
ov70_0223C7C4: ; 0x0223C7C4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C7E8 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xb0
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #0xd
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C7E8: .word 0x00000F0F
	thumb_func_end ov70_0223C7C4

	thumb_func_start ov70_0223C7EC
ov70_0223C7EC: ; 0x0223C7EC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x46
	ldr r1, _0223C810 ; =0x0000FFFF
	lsl r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0223C814 ; =0x000011A8
	mov r1, #3
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #9
	bl ov70_0223CD28
	mov r0, #0xe
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223C810: .word 0x0000FFFF
_0223C814: .word 0x000011A8
	thumb_func_end ov70_0223C7EC

	thumb_func_start ov70_0223C818
ov70_0223C818: ; 0x0223C818
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223C898 ; =0x000011A8
	ldr r0, [r5, r0]
	bl ov70_02242144
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0223C890
	sub r0, r0, #1
	cmp r4, r0
	beq _0223C840
	ldr r0, _0223C89C ; =ov70_0224590C
	ldr r0, [r0]
	add r0, r0, #1
	cmp r4, r0
	bne _0223C856
_0223C840:
	mov r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C8A0 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r5, #0x2c]
	b _0223C890
_0223C856:
	mov r0, #0
	bl ov70_0223CD28
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_0223F8A8
	ldr r0, _0223C8A4 ; =0x00001188
	mov r1, #0
	add r0, r5, r0
	str r1, [r5, #0x2c]
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C8A8 ; =0x00010200
	mov r2, #0xbb
	str r0, [sp, #8]
	lsl r2, r2, #4
	ldr r3, _0223C8AC ; =0x000012CC
	ldr r0, _0223C8A4 ; =0x00001188
	ldr r1, [r5, r2]
	sub r2, #0x10
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r0, r5, r0
	bl ov70_0223F244
_0223C890:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223C898: .word 0x000011A8
_0223C89C: .word ov70_0224590C
_0223C8A0: .word 0x00000F18
_0223C8A4: .word 0x00001188
_0223C8A8: .word 0x00010200
_0223C8AC: .word 0x000012CC
	thumb_func_end ov70_0223C818

	thumb_func_start ov70_0223C8B0
ov70_0223C8B0: ; 0x0223C8B0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r2, #0x12
	ldr r0, [r4, #4]
	mov r1, #0xc
	lsl r2, r2, #4
	mov r3, #3
	bl ov70_02238C14
	ldr r1, _0223C8D8 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #0x18
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C8D8: .word 0x000011C8
	thumb_func_end ov70_0223C8B0

	thumb_func_start ov70_0223C8DC
ov70_0223C8DC: ; 0x0223C8DC
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223C90E
	ldr r0, _0223C924 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #2
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	add r0, r4, #0
	bl ov70_02241234
	mov r0, #0x4a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0223C91E
_0223C90E:
	cmp r0, #2
	bne _0223C91E
	ldr r0, _0223C924 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0
	str r0, [r4, #0x2c]
_0223C91E:
	mov r0, #3
	pop {r4, pc}
	nop
_0223C924: .word 0x000011C8
	thumb_func_end ov70_0223C8DC

	thumb_func_start ov70_0223C928
ov70_0223C928: ; 0x0223C928
	mov r1, #1
	str r1, [r0, #0x2c]
	mov r0, #3
	bx lr
	thumb_func_end ov70_0223C928

	thumb_func_start ov70_0223C930
ov70_0223C930: ; 0x0223C930
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C954 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0x98
	mov r2, #1
	mov r3, #0
	bl ov70_0223CAC4
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223C954: .word 0x00000F0F
	thumb_func_end ov70_0223C930

	thumb_func_start ov70_0223C958
ov70_0223C958: ; 0x0223C958
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223C972
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223C972:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223C958

	thumb_func_start ov70_0223C978
ov70_0223C978: ; 0x0223C978
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223C9A6
	mov r0, #0x47
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x2d
	ble _0223C9A6
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223C9A6:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223C978

	thumb_func_start ov70_0223C9AC
ov70_0223C9AC: ; 0x0223C9AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223CA0C ; =0x00000F14
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223CA06
	ldr r2, _0223CA10 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r1, #0xf
	ldr r0, _0223CA0C ; =0x00000F14
	mvn r1, r1
	str r1, [r4, r0]
	ldr r1, _0223CA14 ; =0x000011DE
	ldrh r1, [r4, r1]
	cmp r1, #0
	beq _0223C9FA
	sub r0, #0x2c
	ldr r0, [r4, r0]
	mov r1, #0x10
	bl Set2dSpriteAnimSeqNo
	mov r0, #2
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x10
	bl ov70_02238E50
	mov r0, #0x4b
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0223C9FA:
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0223CA06:
	mov r0, #3
	pop {r4, pc}
	nop
_0223CA0C: .word 0x00000F14
_0223CA10: .word 0x04000304
_0223CA14: .word 0x000011DE
	thumb_func_end ov70_0223C9AC

	thumb_func_start ov70_0223CA18
ov70_0223CA18: ; 0x0223CA18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223CA3C ; =0x00000F14
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223CA36
	ldr r0, _0223CA3C ; =0x00000F14
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	str r0, [r4, #0x2c]
_0223CA36:
	mov r0, #3
	pop {r4, pc}
	nop
_0223CA3C: .word 0x00000F14
	thumb_func_end ov70_0223CA18

	thumb_func_start ov70_0223CA40
ov70_0223CA40: ; 0x0223CA40
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223CAB4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r1, r0
	beq _0223CA68
	mov r1, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _0223CAAC
_0223CA68:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov70_02241164
	add r4, r0, #0
	ldr r0, _0223CAB8 ; =0x000011DE
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0223CAAC
	cmp r4, #0
	blt _0223CAAC
	add r0, r4, #1
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0223CABC ; =0x00000EE4
	ldr r0, [r1, r0]
	lsl r1, r4, #2
	add r1, #0x10
	bl Set2dSpriteAnimSeqNo
	mov r0, #2
	str r0, [r5, #0x2c]
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	bl ov70_02238E50
	mov r0, #0x4b
	lsl r0, r0, #2
	str r4, [r5, r0]
	ldr r0, _0223CAC0 ; =0x000005DC
	bl PlaySE
_0223CAAC:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223CAB4: .word gSystem
_0223CAB8: .word 0x000011DE
_0223CABC: .word 0x00000EE4
_0223CAC0: .word 0x000005DC
	thumb_func_end ov70_0223CA40

	thumb_func_start ov70_0223CAC4
ov70_0223CAC4: ; 0x0223CAC4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0xba
	add r5, r0, #0
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x1c
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	ldr r0, _0223CB14 ; =0x00000F18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223CB14 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223CB14 ; =0x00000F18
	ldr r2, _0223CB18 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223CB14: .word 0x00000F18
_0223CB18: .word 0x00000BBC
	thumb_func_end ov70_0223CAC4

	thumb_func_start ov70_0223CB1C
ov70_0223CB1C: ; 0x0223CB1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	add r0, r4, #0
	mov r1, #0x3d
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r2, #0
	ldr r0, _0223CC00 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0x3f
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r2, #0
	ldr r0, _0223CC00 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x20
	add r1, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0x41
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r2, #0
	ldr r0, _0223CC00 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x40
	add r1, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0xab
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r2, #0
	ldr r0, _0223CC00 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0x43
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r2, #0
	ldr r0, _0223CC00 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x60
	add r1, r6, #0
	add r3, r2, #0
	bl ov70_022450B8
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0xee
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r2, #0
	ldr r0, _0223CC00 ; =0x000F0200
	str r2, [sp]
	add r5, #0x70
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov70_022450B8
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223CC00: .word 0x000F0200
	thumb_func_end ov70_0223CB1C

	thumb_func_start ov70_0223CC04
ov70_0223CC04: ; 0x0223CC04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	ldr r4, _0223CC60 ; =0x00010200
	cmp r3, #0
	beq _0223CC1A
	ldr r4, _0223CC64 ; =0x000F0200
	mov r1, #0
	b _0223CC1C
_0223CC1A:
	mov r1, #2
_0223CC1C:
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x12
	mov r3, #2
	bl BgTilemapRectChangePalette
	add r0, r5, #0
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	add r0, r6, #0
	mov r1, #0x45
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r2, #0
	str r2, [sp]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r2, #0
	str r4, [sp, #4]
	bl ov70_022450B8
	add r0, r5, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223CC60: .word 0x00010200
_0223CC64: .word 0x000F0200
	thumb_func_end ov70_0223CC04

	thumb_func_start ov70_0223CC68
ov70_0223CC68: ; 0x0223CC68
	push {r4, r5}
	mov r4, #0
	ldrsh r5, [r0, r4]
	ldrsh r4, [r1, r4]
	cmp r5, r4
	bne _0223CC9C
	mov r4, #2
	ldrsb r5, [r0, r4]
	ldrsb r4, [r1, r4]
	cmp r5, r4
	bne _0223CC9C
	mov r4, #3
	ldrsb r5, [r0, r4]
	ldrsb r4, [r1, r4]
	cmp r5, r4
	bne _0223CC9C
	mov r4, #4
	ldrsb r5, [r0, r4]
	ldrsb r0, [r1, r4]
	cmp r5, r0
	bne _0223CC9C
	cmp r2, r3
	bne _0223CC9C
	mov r0, #1
	pop {r4, r5}
	bx lr
_0223CC9C:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov70_0223CC68

	thumb_func_start ov70_0223CCA4
ov70_0223CCA4: ; 0x0223CCA4
	push {r4, lr}
	ldr r3, _0223CD24 ; =0x00000F14
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #0
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #1
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	mov r1, #3
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #4
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #5
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #6
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r3, _0223CD24 ; =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r1, #7
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	pop {r4, pc}
	nop
_0223CD24: .word 0x00000F14
	thumb_func_end ov70_0223CCA4

	thumb_func_start ov70_0223CD28
ov70_0223CD28: ; 0x0223CD28
	push {r3, lr}
	add r2, r0, #0
	ldr r0, _0223CD40 ; =0x04000050
	beq _0223CD38
	mov r1, #0xa
	bl G2x_SetBlendBrightness_
	pop {r3, pc}
_0223CD38:
	mov r1, #0
	strh r1, [r0]
	pop {r3, pc}
	nop
_0223CD40: .word 0x04000050
	thumb_func_end ov70_0223CD28

	thumb_func_start ov70_0223CD44
ov70_0223CD44: ; 0x0223CD44
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_0223D3BC
	ldr r2, _0223CDCC ; =0x04000304
	ldr r0, _0223CDD0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	ldr r0, [r4, #4]
	bl ov70_0223CE44
	add r0, r4, #0
	bl ov70_0223CF74
	add r0, r4, #0
	bl ov70_0223D26C
	add r0, r4, #0
	bl ov70_0223D058
	add r0, r4, #0
	bl ov70_02241358
	ldr r0, _0223CDD4 ; =0x0400106C
	bl GXx_GetMasterBrightness_
	cmp r0, #0
	bne _0223CD98
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	b _0223CDAE
_0223CD98:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
_0223CDAE:
	mov r1, #0x12
	lsl r1, r1, #4
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov70_0223E264
	add r0, r4, #0
	bl ov70_02245124
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223CDCC: .word 0x04000304
_0223CDD0: .word 0xFFFF7FFF
_0223CDD4: .word 0x0400106C
	thumb_func_end ov70_0223CD44

	thumb_func_start ov70_0223CDD8
ov70_0223CDD8: ; 0x0223CDD8
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238E44
	bl sub_0203A930
	ldr r1, [r4, #0x2c]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0223CDF4 ; =ov70_022465A8
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0223CDF4: .word ov70_022465A8
	thumb_func_end ov70_0223CDD8

	thumb_func_start ov70_0223CDF8
ov70_0223CDF8: ; 0x0223CDF8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203A914
	ldr r0, _0223CE40 ; =0x0400106C
	bl GXx_GetMasterBrightness_
	cmp r0, #0
	beq _0223CE10
	add r0, r4, #0
	bl ov70_02241380
_0223CE10:
	add r0, r4, #0
	bl ov70_0223D208
	add r0, r4, #0
	bl ov70_0223D414
	add r0, r4, #0
	bl ov70_0223D378
	ldr r0, [r4, #4]
	bl ov70_0223CF48
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	nop
_0223CE40: .word 0x0400106C
	thumb_func_end ov70_0223CDF8

	thumb_func_start ov70_0223CE44
ov70_0223CE44: ; 0x0223CE44
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0223CF34 ; =ov70_022456F0
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	mov r0, #0x16
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r5, _0223CF38 ; =ov70_02245768
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223CF3C ; =ov70_02245730
	add r3, sp, #0x38
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
	ldr r5, _0223CF40 ; =ov70_0224574C
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223CF44 ; =ov70_02245714
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_022391F0
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223CF34: .word ov70_022456F0
_0223CF38: .word ov70_02245768
_0223CF3C: .word ov70_02245730
_0223CF40: .word ov70_0224574C
_0223CF44: .word ov70_02245714
	thumb_func_end ov70_0223CE44

	thumb_func_start ov70_0223CF48
ov70_0223CF48: ; 0x0223CF48
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022392BC
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223CF48

	thumb_func_start ov70_0223CF74
ov70_0223CF74: ; 0x0223CF74
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r5, [r6, #4]
	mov r0, #0x64
	mov r1, #0x3d
	bl NARC_ctor
	mov r1, #0x60
	str r1, [sp]
	mov r1, #0x3d
	mov r2, #0
	str r1, [sp, #4]
	mov r1, #2
	add r3, r2, #0
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #5
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xd
	add r2, r5, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x1b
	add r2, r5, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x26
	add r2, r5, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r6, #0
	bl ov70_02239C6C
	add r0, r6, #0
	bl ov70_02239CF8
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_0223CF74

	thumb_func_start ov70_0223D058
ov70_0223D058: ; 0x0223D058
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r2, #0xd6
	add r7, r0, #0
	lsl r2, r2, #4
	add r0, sp, #0
	add r1, r7, #0
	add r2, r7, r2
	mov r3, #1
	bl ov70_02238B54
	ldr r0, _0223D1E8 ; =0x00000122
	ldrh r1, [r7, r0]
	lsl r2, r1, #2
	ldr r1, _0223D1EC ; =ov70_02245784
	ldrh r1, [r1, r2]
	lsl r1, r1, #0xc
	str r1, [sp, #8]
	ldrh r0, [r7, r0]
	lsl r1, r0, #2
	ldr r0, _0223D1F0 ; =ov70_02245786
	ldrh r0, [r0, r1]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223D1F4 ; =0x00000DCC
	str r0, [r7, r1]
	ldr r0, [r7, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0223D1F4 ; =0x00000DCC
	mov r1, #4
	ldr r0, [r7, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223D1E8 ; =0x00000122
	ldrh r0, [r7, r0]
	cmp r0, #0x1f
	beq _0223D0B0
	cmp r0, #5
	bhi _0223D0BC
_0223D0B0:
	ldr r0, _0223D1F4 ; =0x00000DCC
	mov r1, #0
	ldr r0, [r7, r0]
	bl sub_02024A04
	b _0223D0C6
_0223D0BC:
	ldr r0, _0223D1F4 ; =0x00000DCC
	mov r1, #1
	ldr r0, [r7, r0]
	bl sub_02024A04
_0223D0C6:
	ldr r4, _0223D1EC ; =ov70_02245784
	mov r6, #0
	add r5, r7, #0
_0223D0CC:
	ldrh r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0x14
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223D1F8 ; =0x00000DD8
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r6, #6
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223D1F8 ; =0x00000DD8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024A04
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #0x1e
	blt _0223D0CC
	ldr r4, _0223D1EC ; =ov70_02245784
	mov r6, #0
	add r5, r7, #0
_0223D10A:
	ldrh r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	add r0, r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl CreateSprite
	mov r1, #0xe5
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0x28
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xe5
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024A04
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #0x1e
	blt _0223D10A
	ldr r4, _0223D1EC ; =ov70_02245784
	mov r6, #0
	add r5, r7, #0
_0223D14E:
	ldrh r0, [r4]
	add r0, #8
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	add r0, r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223D1FC ; =0x00000EC8
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0x2a
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223D1FC ; =0x00000EC8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024A04
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #6
	blt _0223D14E
	ldr r4, _0223D200 ; =ov70_022456E8
	mov r6, #0
	add r5, r7, #0
_0223D190:
	ldrh r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223D204 ; =0x00000F04
	str r0, [r5, r1]
	add r0, r1, #0
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r1, #0x26
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223D204 ; =0x00000F04
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024A04
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #2
	blt _0223D190
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #4
	mov r2, #0x6a
	ldr r0, [r7, r0]
	mov r1, #0x37
	lsl r2, r2, #2
	bl ov70_02238F9C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D1E8: .word 0x00000122
_0223D1EC: .word ov70_02245784
_0223D1F0: .word ov70_02245786
_0223D1F4: .word 0x00000DCC
_0223D1F8: .word 0x00000DD8
_0223D1FC: .word 0x00000EC8
_0223D200: .word ov70_022456E8
_0223D204: .word 0x00000F04
	thumb_func_end ov70_0223D058

	thumb_func_start ov70_0223D208
ov70_0223D208: ; 0x0223D208
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r7, _0223D25C ; =0x00000F04
	mov r6, #0
	add r4, r5, #0
_0223D212:
	ldr r0, [r4, r7]
	bl sub_02024758
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #2
	blt _0223D212
	ldr r0, _0223D260 ; =0x00000DCC
	ldr r0, [r5, r0]
	bl sub_02024758
	mov r7, #0xe5
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #4
_0223D230:
	ldr r0, _0223D264 ; =0x00000DD8
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, [r4, r7]
	bl sub_02024758
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x1e
	blt _0223D230
	ldr r6, _0223D268 ; =0x00000EC8
	mov r4, #0
_0223D24A:
	ldr r0, [r5, r6]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _0223D24A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D25C: .word 0x00000F04
_0223D260: .word 0x00000DCC
_0223D264: .word 0x00000DD8
_0223D268: .word 0x00000EC8
	thumb_func_end ov70_0223D208

	thumb_func_start ov70_0223D26C
ov70_0223D26C: ; 0x0223D26C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xd
	ldr r1, _0223D358 ; =0x00000F48
	str r0, [sp, #4]
	mov r2, #3
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r3, #4
	bl AddWindowParameterized
	ldr r0, _0223D358 ; =0x00000F48
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223D358 ; =0x00000F48
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	ldr r1, _0223D35C ; =0x00000F18
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	add r0, #0xfc
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	bl AddWindowParameterized
	ldr r0, _0223D35C ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0223D360 ; =0x0000013F
	ldr r1, _0223D364 ; =0x00001158
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _0223D364 ; =0x00001158
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0223D368 ; =0x00000165
	ldr r1, _0223D36C ; =0x00000F68
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #1
	mov r3, #0x18
	bl AddWindowParameterized
	ldr r0, _0223D36C ; =0x00000F68
	mov r1, #6
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #1
	ldr r0, _0223D370 ; =0x00010306
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _0223D374 ; =0x00000BB8
	ldr r0, _0223D36C ; =0x00000F68
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0
	bl ov70_02245084
	ldr r0, [r4, #0x24]
	cmp r0, #5
	bne _0223D34C
	add r0, r4, #0
	mov r1, #3
	bl ov70_02239D44
	add sp, #0x14
	pop {r3, r4, pc}
_0223D34C:
	add r0, r4, #0
	mov r1, #1
	bl ov70_02239D44
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0223D358: .word 0x00000F48
_0223D35C: .word 0x00000F18
_0223D360: .word 0x0000013F
_0223D364: .word 0x00001158
_0223D368: .word 0x00000165
_0223D36C: .word 0x00000F68
_0223D370: .word 0x00010306
_0223D374: .word 0x00000BB8
	thumb_func_end ov70_0223D26C

	thumb_func_start ov70_0223D378
ov70_0223D378: ; 0x0223D378
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223D3A8 ; =0x00001198
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223D3AC ; =0x00001158
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223D3B0 ; =0x00000F68
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223D3B4 ; =0x00000F18
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223D3B8 ; =0x00000F48
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	nop
_0223D3A8: .word 0x00001198
_0223D3AC: .word 0x00001158
_0223D3B0: .word 0x00000F68
_0223D3B4: .word 0x00000F18
_0223D3B8: .word 0x00000F48
	thumb_func_end ov70_0223D378

	thumb_func_start ov70_0223D3BC
ov70_0223D3BC: ; 0x0223D3BC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x12
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223D400 ; =0x00000BB4
	str r0, [r4, r1]
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223D404 ; =0x00000BBC
	str r0, [r4, r1]
	sub r1, #0x1c
	ldr r0, [r4, r1]
	mov r1, #0x6d
	bl NewString_ReadMsgData
	ldr r1, _0223D408 ; =0x00000BB8
	str r0, [r4, r1]
	ldr r0, _0223D40C ; =0x00000122
	ldrh r1, [r4, r0]
	cmp r1, #0x1e
	bne _0223D3F2
	mov r1, #0
	strh r1, [r4, r0]
_0223D3F2:
	mov r0, #0x3d
	mov r1, #0x78
	bl AllocFromHeap
	ldr r1, _0223D410 ; =0x000011F4
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0223D400: .word 0x00000BB4
_0223D404: .word 0x00000BBC
_0223D408: .word 0x00000BB8
_0223D40C: .word 0x00000122
_0223D410: .word 0x000011F4
	thumb_func_end ov70_0223D3BC

	thumb_func_start ov70_0223D414
ov70_0223D414: ; 0x0223D414
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223D43C ; =0x000011F4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _0223D440 ; =0x00000BB4
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _0223D444 ; =0x00000BBC
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _0223D448 ; =0x00000BB8
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_0223D43C: .word 0x000011F4
_0223D440: .word 0x00000BB4
_0223D444: .word 0x00000BBC
_0223D448: .word 0x00000BB8
	thumb_func_end ov70_0223D414

	thumb_func_start ov70_0223D44C
ov70_0223D44C: ; 0x0223D44C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223D486
	ldr r0, [r5, #0x24]
	cmp r0, #5
	bne _0223D464
	mov r4, #0x15
	b _0223D46A
_0223D464:
	cmp r0, #6
	bne _0223D46A
	mov r4, #0x11
_0223D46A:
	ldr r0, _0223D48C ; =0x00000F0F
	mov r3, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	str r3, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #3
	mov r2, #1
	bl ov70_02238D84
_0223D486:
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223D48C: .word 0x00000F0F
	thumb_func_end ov70_0223D44C

	thumb_func_start ov70_0223D490
ov70_0223D490: ; 0x0223D490
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223D578 ; =0x00000122
	add r4, r0, #0
	ldrh r1, [r4, r1]
	cmp r1, #0x1e
	bne _0223D4B4
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223D57C ; =0x000005DC
	bl PlaySE
	add sp, #8
	pop {r4, pc}
_0223D4B4:
	cmp r1, #0x1f
	beq _0223D572
	ldr r0, _0223D57C ; =0x000005DC
	bl PlaySE
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E5C8
	cmp r0, #1
	beq _0223D4DE
	cmp r0, #2
	beq _0223D556
	add sp, #8
	pop {r4, pc}
_0223D4DE:
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E4DC
	cmp r0, #0
	beq _0223D536
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	add r2, r0, #0
	ldr r0, _0223D580 ; =0x00000B9C
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r0, _0223D584 ; =0x00000F0F
	mov r3, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #1
	str r3, [sp, #4]
	bl ov70_0223E01C
	add r0, r4, #0
	mov r1, #3
	mov r2, #7
	bl ov70_02238D84
	add sp, #8
	pop {r4, pc}
_0223D536:
	ldr r0, _0223D584 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x1a
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	add sp, #8
	pop {r4, pc}
_0223D556:
	ldr r0, _0223D584 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x1b
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
_0223D572:
	add sp, #8
	pop {r4, pc}
	nop
_0223D578: .word 0x00000122
_0223D57C: .word 0x000005DC
_0223D580: .word 0x00000B9C
_0223D584: .word 0x00000F0F
	thumb_func_end ov70_0223D490

	thumb_func_start ov70_0223D588
ov70_0223D588: ; 0x0223D588
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r2, _0223D670 ; =0x00000122
	add r5, r0, #0
	ldrh r3, [r5, r2]
	cmp r3, #0x1e
	bne _0223D5A0
	mov r1, #6
	bl ov70_0223D690
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D5A0:
	cmp r3, #0x1f
	beq _0223D66C
	ldr r1, [r5]
	sub r2, r2, #2
	ldr r0, [r1, #8]
	ldrh r2, [r5, r2]
	ldr r1, [r1, #0xc]
	bl ov70_0223E5C8
	cmp r0, #0
	beq _0223D666
	cmp r0, #1
	beq _0223D5C2
	cmp r0, #2
	beq _0223D666
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D5C2:
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	mov r1, #0x35
	lsl r1, r1, #4
	add r3, r5, r1
	mov r1, #0x4b
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	sub r1, #8
	mul r1, r2
	add r1, r3, r1
	add r4, r0, #0
	bl ov70_0223E658
	cmp r0, #0
	beq _0223D65C
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E4DC
	cmp r0, #0
	beq _0223D63C
	ldr r0, _0223D674 ; =0x00000B9C
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferBoxMonNickname
	ldr r0, _0223D678 ; =0x00000F0F
	mov r3, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #1
	str r3, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #3
	mov r2, #9
	bl ov70_02238D84
	ldr r0, _0223D67C ; =0x000005DC
	bl PlaySE
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D63C:
	ldr r0, _0223D678 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x1a
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D65C:
	ldr r0, _0223D67C ; =0x000005DC
	bl PlaySE
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D666:
	ldr r0, _0223D67C ; =0x000005DC
	bl PlaySE
_0223D66C:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223D670: .word 0x00000122
_0223D674: .word 0x00000B9C
_0223D678: .word 0x00000F0F
_0223D67C: .word 0x000005DC
	thumb_func_end ov70_0223D588

	thumb_func_start ov70_0223D680
ov70_0223D680: ; 0x0223D680
	ldr r3, _0223D688 ; =sub_02025224
	ldr r0, _0223D68C ; =ov70_02245884
	bx r3
	nop
_0223D688: .word sub_02025224
_0223D68C: .word ov70_02245884
	thumb_func_end ov70_0223D680

	thumb_func_start ov70_0223D690
ov70_0223D690: ; 0x0223D690
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #5
	bne _0223D6AC
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223D6C4 ; =0x000005DC
	bl PlaySE
	pop {r4, pc}
_0223D6AC:
	cmp r1, #6
	bne _0223D6C2
	mov r1, #3
	mov r2, #0x11
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223D6C4 ; =0x000005DC
	bl PlaySE
_0223D6C2:
	pop {r4, pc}
	.balign 4, 0
_0223D6C4: .word 0x000005DC
	thumb_func_end ov70_0223D690

	thumb_func_start ov70_0223D6C8
ov70_0223D6C8: ; 0x0223D6C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_0223D680
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0223D79A
	cmp r4, #0x1e
	beq _0223D75A
	cmp r4, #0x1f
	beq _0223D6E8
	cmp r4, #0x20
	beq _0223D720
	b _0223D772
_0223D6E8:
	ldr r0, _0223D7F0 ; =0x00000F04
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0223D7F0 ; =0x00000F04
	mov r1, #0x26
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x12
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	mov r1, #0x13
	mov r2, #1
	bl ov70_0223D924
	mov r1, #0x12
	lsl r1, r1, #4
	strh r0, [r5, r1]
	ldrh r1, [r5, r1]
	add r0, r5, #0
	bl ov70_0223E264
	ldr r0, _0223D7F4 ; =0x000005DC
	bl PlaySE
	b _0223D7EC
_0223D720:
	ldr r0, _0223D7F8 ; =0x00000F08
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0223D7F8 ; =0x00000F08
	mov r1, #0x27
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x12
	lsl r0, r0, #4
	mov r1, #0x13
	add r2, r1, #0
	ldrh r0, [r5, r0]
	sub r2, #0x14
	bl ov70_0223D924
	mov r1, #0x12
	lsl r1, r1, #4
	strh r0, [r5, r1]
	ldrh r1, [r5, r1]
	add r0, r5, #0
	bl ov70_0223E264
	ldr r0, _0223D7F4 ; =0x000005DC
	bl PlaySE
	b _0223D7EC
_0223D75A:
	ldr r1, [r5, #0x24]
	add r0, r5, #0
	bl ov70_0223D690
	ldr r1, _0223D7FC ; =0x00000122
	ldr r0, _0223D800 ; =0x00000DCC
	strh r4, [r5, r1]
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ov70_0223D8E8
	b _0223D7EC
_0223D772:
	ldr r1, _0223D7FC ; =0x00000122
	ldr r0, _0223D800 ; =0x00000DCC
	strh r4, [r5, r1]
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ov70_0223D8E8
	ldr r0, [r5, #0x24]
	cmp r0, #5
	bne _0223D78E
	add r0, r5, #0
	bl ov70_0223D490
	b _0223D7EC
_0223D78E:
	cmp r0, #6
	bne _0223D7EC
	add r0, r5, #0
	bl ov70_0223D588
	b _0223D7EC
_0223D79A:
	add r0, r5, #0
	bl ov70_0223D808
	ldr r0, [r5, #0x24]
	cmp r0, #5
	bne _0223D7C8
	ldr r0, _0223D804 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0223D7BA
	add r0, r5, #0
	mov r1, #5
	bl ov70_0223D690
	b _0223D7EC
_0223D7BA:
	mov r0, #1
	tst r0, r1
	beq _0223D7EC
	add r0, r5, #0
	bl ov70_0223D490
	b _0223D7EC
_0223D7C8:
	cmp r0, #6
	bne _0223D7EC
	ldr r0, _0223D804 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0223D7E0
	add r0, r5, #0
	mov r1, #6
	bl ov70_0223D690
	b _0223D7EC
_0223D7E0:
	mov r0, #1
	tst r0, r1
	beq _0223D7EC
	add r0, r5, #0
	bl ov70_0223D588
_0223D7EC:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223D7F0: .word 0x00000F04
_0223D7F4: .word 0x000005DC
_0223D7F8: .word 0x00000F08
_0223D7FC: .word 0x00000122
_0223D800: .word 0x00000DCC
_0223D804: .word gSystem
	thumb_func_end ov70_0223D6C8

	thumb_func_start ov70_0223D808
ov70_0223D808: ; 0x0223D808
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0223D8D0 ; =gSystem
	mov r7, #0
	ldr r0, [r0, #0x48]
	mov r1, #0x40
	add r4, r7, #0
	tst r1, r0
	beq _0223D820
	mov r4, #1
	b _0223D83C
_0223D820:
	mov r1, #0x80
	tst r1, r0
	beq _0223D82A
	mov r4, #2
	b _0223D83C
_0223D82A:
	mov r1, #0x20
	tst r1, r0
	beq _0223D834
	mov r4, #3
	b _0223D83C
_0223D834:
	mov r1, #0x10
	tst r0, r1
	beq _0223D83C
	mov r4, #4
_0223D83C:
	cmp r4, #0
	beq _0223D8B4
	ldr r0, _0223D8D4 ; =0x00000122
	ldr r1, _0223D8D8 ; =ov70_02245804
	ldrh r3, [r5, r0]
	sub r4, r4, #1
	lsl r2, r3, #2
	add r1, r1, r2
	ldrb r4, [r4, r1]
	cmp r4, r3
	beq _0223D8B4
	cmp r4, #0x63
	beq _0223D85A
	cmp r4, #0x65
	bne _0223D8B0
_0223D85A:
	cmp r4, #0x65
	beq _0223D862
	mov r0, #1
	b _0223D864
_0223D862:
	mov r0, #0
_0223D864:
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, _0223D8DC ; =0x00000F04
	add r0, r5, r0
	str r0, [sp]
	lsl r0, r6, #2
	ldr r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r6, #0x26
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x12
	lsl r0, r0, #4
	sub r4, #0x64
	ldrh r0, [r5, r0]
	mov r1, #0x13
	add r2, r4, #0
	bl ov70_0223D924
	mov r1, #0x12
	lsl r1, r1, #4
	strh r0, [r5, r1]
	ldrh r1, [r5, r1]
	add r0, r5, #0
	bl ov70_0223E264
	ldr r0, _0223D8E0 ; =0x000005DC
	bl PlaySE
	b _0223D8B4
_0223D8B0:
	mov r7, #1
	strh r4, [r5, r0]
_0223D8B4:
	cmp r7, #0
	beq _0223D8BE
	ldr r0, _0223D8E0 ; =0x000005DC
	bl PlaySE
_0223D8BE:
	ldr r1, _0223D8D4 ; =0x00000122
	ldr r0, _0223D8E4 ; =0x00000DCC
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ov70_0223D8E8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D8D0: .word gSystem
_0223D8D4: .word 0x00000122
_0223D8D8: .word ov70_02245804
_0223D8DC: .word 0x00000F04
_0223D8E0: .word 0x000005DC
_0223D8E4: .word 0x00000DCC
	thumb_func_end ov70_0223D808

	thumb_func_start ov70_0223D8E8
ov70_0223D8E8: ; 0x0223D8E8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _0223D91C ; =ov70_02245784
	lsl r3, r4, #2
	ldr r2, _0223D920 ; =ov70_02245786
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	add r5, r0, #0
	bl ov70_02238D8C
	cmp r4, #0x1f
	beq _0223D908
	cmp r4, #0
	blt _0223D912
	cmp r4, #5
	bgt _0223D912
_0223D908:
	add r0, r5, #0
	mov r1, #0
	bl sub_02024A04
	pop {r3, r4, r5, pc}
_0223D912:
	add r0, r5, #0
	mov r1, #1
	bl sub_02024A04
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223D91C: .word ov70_02245784
_0223D920: .word ov70_02245786
	thumb_func_end ov70_0223D8E8

	thumb_func_start ov70_0223D924
ov70_0223D924: ; 0x0223D924
	add r0, r0, r2
	bpl _0223D92C
	sub r0, r1, #1
	bx lr
_0223D92C:
	cmp r0, r1
	bne _0223D932
	mov r0, #0
_0223D932:
	bx lr
	thumb_func_end ov70_0223D924

	thumb_func_start ov70_0223D934
ov70_0223D934: ; 0x0223D934
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x3d
	bl ListMenuItems_ctor
	ldr r1, _0223D990 ; =0x000011AC
	mov r2, #0x62
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0223D990 ; =0x000011AC
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x63
	mov r3, #2
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0223D990 ; =0x000011AC
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x64
	mov r3, #3
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #0
	mov r1, #3
	mov r2, #0xa
	bl ov70_02238CAC
	ldr r1, _0223D994 ; =0x000011D0
	str r0, [r4, r1]
	mov r0, #8
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	nop
_0223D990: .word 0x000011AC
_0223D994: .word 0x000011D0
	thumb_func_end ov70_0223D934

	thumb_func_start ov70_0223D998
ov70_0223D998: ; 0x0223D998
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0223DB1C ; =0x000011D0
	ldr r0, [r5, r0]
	bl sub_020186A4
	cmp r0, #3
	bhi _0223D9BA
	cmp r0, #1
	blo _0223D9B8
	beq _0223D9C6
	cmp r0, #2
	beq _0223D9EE
	cmp r0, #3
	beq _0223D9C2
_0223D9B8:
	b _0223DB16
_0223D9BA:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _0223D9C4
_0223D9C2:
	b _0223DAFA
_0223D9C4:
	b _0223DB16
_0223D9C6:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DB20 ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, _0223DB24 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	bl ClearFrameAndWindow2
	mov r0, #2
	str r0, [r5, #0x2c]
	add r0, r5, #0
	mov r1, #8
	mov r2, #5
	bl ov70_02238E50
	b _0223DB16
_0223D9EE:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DB20 ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	add r4, r0, #0
	bl ov70_0223E4FC
	cmp r0, #0
	beq _0223DA38
	ldr r0, _0223DB28 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x25
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	b _0223DB16
_0223DA38:
	add r0, r4, #0
	bl ov70_0223E538
	cmp r0, #0
	beq _0223DA76
	cmp r0, #1
	ldr r0, _0223DB28 ; =0x00000F0F
	bne _0223DA5A
	str r0, [sp]
	mov r2, #1
	add r0, r5, #0
	mov r1, #0xb1
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	b _0223DA6A
_0223DA5A:
	str r0, [sp]
	mov r2, #1
	add r0, r5, #0
	mov r1, #0xb2
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
_0223DA6A:
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	b _0223DB16
_0223DA76:
	add r0, r4, #0
	bl ov70_0223E59C
	cmp r0, #0
	beq _0223DA9E
	ldr r0, _0223DB28 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xb3
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	b _0223DB16
_0223DA9E:
	mov r0, #0x12
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	mov r4, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223DACC
	ldr r1, _0223DB2C ; =0x00000122
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl GetPartyMonByIndex
	mov r1, #0xa2
	add r2, r4, #0
	bl GetMonData
	cmp r0, #0
	beq _0223DACC
	mov r0, #0xe
	mov r4, #1
	str r0, [r5, #0x2c]
_0223DACC:
	cmp r4, #0
	bne _0223DB16
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [r5, #0x2c]
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov70_02238E50
	b _0223DB16
_0223DAFA:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DB20 ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, _0223DB24 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r5, #0x2c]
_0223DB16:
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223DB1C: .word 0x000011D0
_0223DB20: .word 0x000011AC
_0223DB24: .word 0x00000F18
_0223DB28: .word 0x00000F0F
_0223DB2C: .word 0x00000122
	thumb_func_end ov70_0223D998

	thumb_func_start ov70_0223DB30
ov70_0223DB30: ; 0x0223DB30
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x3d
	bl ListMenuItems_ctor
	ldr r1, _0223DB8C ; =0x000011AC
	mov r2, #0x57
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0223DB8C ; =0x000011AC
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x58
	mov r3, #2
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0223DB8C ; =0x000011AC
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x59
	mov r3, #3
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #0
	mov r1, #3
	mov r2, #0xa
	bl ov70_02238CAC
	ldr r1, _0223DB90 ; =0x000011D0
	str r0, [r4, r1]
	mov r0, #0xa
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	nop
_0223DB8C: .word 0x000011AC
_0223DB90: .word 0x000011D0
	thumb_func_end ov70_0223DB30

	thumb_func_start ov70_0223DB94
ov70_0223DB94: ; 0x0223DB94
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0223DCF8 ; =0x000011D0
	ldr r0, [r5, r0]
	bl sub_020186A4
	cmp r0, #3
	bhi _0223DBB6
	cmp r0, #1
	blo _0223DBB4
	beq _0223DBC2
	cmp r0, #2
	beq _0223DBE0
	cmp r0, #3
	beq _0223DBBE
_0223DBB4:
	b _0223DCF0
_0223DBB6:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _0223DBC0
_0223DBBE:
	b _0223DCD4
_0223DBC0:
	b _0223DCF0
_0223DBC2:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DCFC ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r0, #2
	str r0, [r5, #0x2c]
	add r0, r5, #0
	mov r1, #8
	mov r2, #6
	bl ov70_02238E50
	b _0223DCF0
_0223DBE0:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DCFC ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, _0223DD00 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	bl ClearFrameAndWindow2
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	add r4, r0, #0
	bl ov70_0223E4FC
	cmp r0, #0
	beq _0223DC34
	ldr r0, _0223DD04 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x25
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	b _0223DCF0
_0223DC34:
	add r0, r4, #0
	bl ov70_0223E538
	cmp r0, #0
	beq _0223DC72
	cmp r0, #1
	ldr r0, _0223DD04 ; =0x00000F0F
	bne _0223DC56
	str r0, [sp]
	mov r2, #1
	add r0, r5, #0
	mov r1, #0xb1
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	b _0223DC66
_0223DC56:
	str r0, [sp]
	mov r2, #1
	add r0, r5, #0
	mov r1, #0xb2
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
_0223DC66:
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	b _0223DCF0
_0223DC72:
	add r0, r4, #0
	bl ov70_0223E59C
	cmp r0, #0
	beq _0223DC9A
	ldr r0, _0223DD04 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xb3
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	b _0223DCF0
_0223DC9A:
	mov r0, #0x12
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	mov r4, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223DCC8
	ldr r1, _0223DD08 ; =0x00000122
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl GetPartyMonByIndex
	mov r1, #0xa2
	add r2, r4, #0
	bl GetMonData
	cmp r0, #0
	beq _0223DCC8
	mov r0, #0xb
	mov r4, #1
	str r0, [r5, #0x2c]
_0223DCC8:
	cmp r4, #0
	bne _0223DCF0
	add r0, r5, #0
	bl ov70_0223DE6C
	b _0223DCF0
_0223DCD4:
	add r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DCFC ; =0x000011AC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, _0223DD00 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r5, #0x2c]
_0223DCF0:
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223DCF8: .word 0x000011D0
_0223DCFC: .word 0x000011AC
_0223DD00: .word 0x00000F18
_0223DD04: .word 0x00000F0F
_0223DD08: .word 0x00000122
	thumb_func_end ov70_0223DB94

	thumb_func_start ov70_0223DD0C
ov70_0223DD0C: ; 0x0223DD0C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0223DD20
	cmp r0, #8
	beq _0223DD20
	cmp r0, #3
	bne _0223DD40
_0223DD20:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223DD64 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	b _0223DD58
_0223DD40:
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
_0223DD58:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223DD64: .word 0x000011FC
	thumb_func_end ov70_0223DD0C

	thumb_func_start ov70_0223DD68
ov70_0223DD68: ; 0x0223DD68
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223DD8C ; =0x000001AD
	mov r1, #0xc
	mov r3, #8
	bl ov70_02238C14
	ldr r1, _0223DD90 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #6
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223DD8C: .word 0x000001AD
_0223DD90: .word 0x000011C8
	thumb_func_end ov70_0223DD68

	thumb_func_start ov70_0223DD94
ov70_0223DD94: ; 0x0223DD94
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223DDB8
	ldr r0, _0223DDCC ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #2
	mov r1, #0
	str r0, [r4, #0x2c]
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	b _0223DDC8
_0223DDB8:
	cmp r0, #2
	bne _0223DDC8
	ldr r0, _0223DDCC ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0
	str r0, [r4, #0x2c]
_0223DDC8:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223DDCC: .word 0x000011C8
	thumb_func_end ov70_0223DD94

	thumb_func_start ov70_0223DDD0
ov70_0223DDD0: ; 0x0223DDD0
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223DDF8 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r2, #1
	mov r1, #0x19
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r4, #0
	mov r1, #3
	mov r2, #0xc
	bl ov70_02238D84
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_0223DDF8: .word 0x00000F0F
	thumb_func_end ov70_0223DDD0

	thumb_func_start ov70_0223DDFC
ov70_0223DDFC: ; 0x0223DDFC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223DE20 ; =0x000001AD
	mov r1, #0xa
	mov r3, #8
	bl ov70_02238C14
	ldr r1, _0223DE24 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #0xd
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223DE20: .word 0x000001AD
_0223DE24: .word 0x000011C8
	thumb_func_end ov70_0223DDFC

	thumb_func_start ov70_0223DE28
ov70_0223DE28: ; 0x0223DE28
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223DE44
	ldr r0, _0223DE64 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	add r0, r4, #0
	bl ov70_0223DE6C
	b _0223DE5E
_0223DE44:
	cmp r0, #2
	bne _0223DE5E
	ldr r0, _0223DE64 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _0223DE68 ; =0x00001158
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	mov r0, #1
	str r0, [r4, #0x2c]
_0223DE5E:
	mov r0, #3
	pop {r4, pc}
	nop
_0223DE64: .word 0x000011C8
_0223DE68: .word 0x00001158
	thumb_func_end ov70_0223DE28

	thumb_func_start ov70_0223DE6C
ov70_0223DE6C: ; 0x0223DE6C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x26
	lsl r0, r0, #4
	add r2, r4, r0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #8
	mul r0, r1
	add r0, r2, r0
	bl ov70_0223E76C
	cmp r0, #0
	beq _0223DEC4
	mov r0, #0x12
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	cmp r0, #0x12
	beq _0223DEC4
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #6
	bne _0223DEC4
	ldr r0, _0223DF0C ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x1c
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	bl ov70_02238D84
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_0223DEC4:
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223DF10 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #7
	mov r2, #9
	bl ov70_02238E50
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, #0
	bl ov70_0223E690
	mov r0, #0x4a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0223DF0C: .word 0x00000F0F
_0223DF10: .word 0x000011FC
	thumb_func_end ov70_0223DE6C

	thumb_func_start ov70_0223DF14
ov70_0223DF14: ; 0x0223DF14
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223DF3C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r2, #1
	mov r1, #0x19
	mov r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	add r0, r4, #0
	mov r1, #3
	mov r2, #0xf
	bl ov70_02238D84
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_0223DF3C: .word 0x00000F0F
	thumb_func_end ov70_0223DF14

	thumb_func_start ov70_0223DF40
ov70_0223DF40: ; 0x0223DF40
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223DF64 ; =0x000001AD
	mov r1, #0xa
	mov r3, #8
	bl ov70_02238C14
	ldr r1, _0223DF68 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #0x10
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223DF64: .word 0x000001AD
_0223DF68: .word 0x000011C8
	thumb_func_end ov70_0223DF40

	thumb_func_start ov70_0223DF6C
ov70_0223DF6C: ; 0x0223DF6C
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223DFAA
	ldr r0, _0223DFC8 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl ov70_02238E50
	b _0223DFC4
_0223DFAA:
	cmp r0, #2
	bne _0223DFC4
	ldr r0, _0223DFC8 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _0223DFCC ; =0x00001158
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	mov r0, #1
	str r0, [r4, #0x2c]
_0223DFC4:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223DFC8: .word 0x000011C8
_0223DFCC: .word 0x00001158
	thumb_func_end ov70_0223DF6C

	thumb_func_start ov70_0223DFD0
ov70_0223DFD0: ; 0x0223DFD0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223DFEA
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223DFEA:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223DFD0

	thumb_func_start ov70_0223DFF0
ov70_0223DFF0: ; 0x0223DFF0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223E014
	ldr r0, _0223E018 ; =0x00001158
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223E014:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223E018: .word 0x00001158
	thumb_func_end ov70_0223DFF0

	thumb_func_start ov70_0223E01C
ov70_0223E01C: ; 0x0223E01C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r2, #0
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r1, _0223E084 ; =0x00000B9C
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, #0x20
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0223E048
	ldr r0, _0223E088 ; =0x00000F18
	b _0223E04A
_0223E048:
	ldr r0, _0223E08C ; =0x00001158
_0223E04A:
	add r4, r5, r0
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r6, [sp, #4]
	ldr r2, _0223E090 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r7, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E084: .word 0x00000B9C
_0223E088: .word 0x00000F18
_0223E08C: .word 0x00001158
_0223E090: .word 0x00000BBC
	thumb_func_end ov70_0223E01C

	thumb_func_start ov70_0223E094
ov70_0223E094: ; 0x0223E094
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r2, r3, #0
	bl NARC_AllocAndReadWholeMember
	add r4, r0, #0
	beq _0223E0B6
	add r1, r5, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	cmp r0, #0
	bne _0223E0B6
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223E0B6:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E094

	thumb_func_start ov70_0223E0BC
ov70_0223E0BC: ; 0x0223E0BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r2, #0
	add r1, r6, #0
	add r2, r5, #0
	str r0, [sp]
	add r7, r3, #0
	ldr r4, [sp, #0x28]
	bl GetMonIconNaixEx
	add r1, r0, #0
	ldr r0, [sp, #0x24]
	add r2, sp, #8
	mov r3, #0x3d
	bl ov70_0223E094
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r1, r4, #0
	mov r2, #2
	ldr r0, [r0, #0x14]
	add r1, #0xc
	lsl r2, r2, #8
	bl MIi_CpuCopyFast
	lsl r0, r7, #4
	add r0, #0xc
	lsl r0, r0, #5
	str r0, [r4]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r6, #0
	bl GetMonIconPaletteEx
	add r0, r0, #3
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov70_0223E0BC

	thumb_func_start ov70_0223E114
ov70_0223E114: ; 0x0223E114
	push {r4, lr}
	add r4, r1, #0
	bl CalcBoxMonLevel
	strb r0, [r4, #3]
	pop {r4, pc}
	thumb_func_end ov70_0223E114

	thumb_func_start ov70_0223E120
ov70_0223E120: ; 0x0223E120
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x12
	mov r6, #2
	lsl r1, r1, #8
	lsl r6, r6, #8
	add r7, r6, #0
	ldr r5, [r0, r1]
	str r0, [sp]
	mov r4, #0
	add r7, #0xc
_0223E134:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0223E158
	add r0, r5, #0
	add r0, #0xc
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	ldr r1, [r5]
	add r0, #0xc
	add r2, r6, #0
	bl GX_LoadOBJ
	ldr r0, [r5, #8]
	ldr r1, [r5, #4]
	bl sub_02024A14
_0223E158:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #0x1e
	blt _0223E134
	mov r1, #0x12
	ldr r0, [sp]
	lsl r1, r1, #8
	ldr r0, [r0, r1]
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E120

	thumb_func_start ov70_0223E170
ov70_0223E170: ; 0x0223E170
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r1, [sp, #0xc]
	add r7, r2, #0
	add r6, r3, #0
	ldr r4, [sp, #0x40]
	bl AcquireBoxMonLock
	add r0, r5, #0
	mov r1, #0xac
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #0x1c]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	strh r0, [r6]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #0x10]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #0x18]
	ldrh r0, [r6]
	mov r1, #0x6f
	mov r2, #0
	strh r0, [r4]
	add r0, r5, #0
	bl GetBoxMonData
	add r0, r0, #1
	strb r0, [r4, #2]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0223E1DA
	mov r0, #0
	strb r0, [r4, #3]
_0223E1DA:
	add r0, r5, #0
	mov r1, #1
	bl ReleaseBoxMonLock
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0223E248
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x44]
	ldr r3, [sp, #0x38]
	str r0, [sp, #8]
	ldrh r0, [r6]
	bl ov70_0223E0BC
	ldr r0, [sp, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0223E23C
	add r0, r7, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemIdIsMail
	cmp r0, #0
	beq _0223E230
	add r0, r7, #0
	mov r1, #0x29
	bl Set2dSpriteAnimSeqNo
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0223E230:
	add r0, r7, #0
	mov r1, #0x28
	bl Set2dSpriteAnimSeqNo
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0223E23C:
	add r0, r7, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0223E248:
	ldr r0, [sp, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r7, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #0x44]
	mov r1, #0
	str r1, [r0, #8]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E170

	thumb_func_start ov70_0223E264
ov70_0223E264: ; 0x0223E264
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	add r5, r0, #0
	ldr r0, [r5]
	str r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	ldr r1, _0223E46C ; =0x00003D68
	str r0, [sp, #0x20]
	mov r0, #3
	bl AllocFromHeapAtEnd
	mov r1, #0x12
	lsl r1, r1, #8
	str r0, [r5, r1]
	str r0, [sp, #0x18]
	mov r0, #0x14
	mov r1, #0x3d
	bl NARC_ctor
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	blt _0223E326
	cmp r0, #0x12
	bge _0223E326
	ldr r6, _0223E470 ; =0x000011F4
	mov r4, #0
_0223E29A:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	add r2, r4, #0
	bl PCStorage_GetMonByIndexPair
	ldr r2, [r5, r6]
	lsl r1, r4, #2
	add r1, r2, r1
	bl ov70_0223E114
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1e
	blo _0223E29A
	mov r4, #0
_0223E2BA:
	ldr r0, _0223E470 ; =0x000011F4
	lsl r6, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	strh r0, [r1, r6]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	add r2, r4, #0
	add r7, r5, r6
	bl PCStorage_GetMonByIndexPair
	ldr r1, [sp, #0x1c]
	str r4, [sp]
	str r1, [sp, #4]
	ldr r1, _0223E470 ; =0x000011F4
	add r2, r4, #0
	ldr r1, [r5, r1]
	add r3, sp, #0x2c
	add r1, r1, r6
	str r1, [sp, #8]
	mov r1, #0x83
	lsl r1, r1, #2
	mul r2, r1
	ldr r1, [sp, #0x18]
	lsl r6, r4, #1
	add r1, r1, r2
	str r1, [sp, #0xc]
	ldr r1, _0223E474 ; =0x00000DD8
	mov r2, #0xe5
	lsl r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	add r3, r3, r6
	bl ov70_0223E170
	cmp r4, #6
	bhs _0223E30E
	ldr r0, _0223E478 ; =0x00000EC8
	mov r1, #0
	ldr r0, [r7, r0]
	bl Set2dSpriteVisibleFlag
_0223E30E:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1e
	blo _0223E2BA
	ldr r2, _0223E47C ; =0x00000BB4
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r2, [r5, r2]
	bl PCStorage_GetBoxName
	b _0223E414
_0223E326:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetPartyCount
	mov r4, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0223E3B6
_0223E336:
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #8]
	bl GetPartyMonByIndex
	str r0, [sp, #0x24]
	bl Mon_GetBoxMon
	ldr r1, _0223E470 ; =0x000011F4
	lsl r6, r4, #2
	ldr r1, [r5, r1]
	str r0, [sp, #0x28]
	add r1, r1, r6
	bl ov70_0223E114
	mov r2, #0xe5
	ldr r0, [sp, #0x1c]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, _0223E470 ; =0x000011F4
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r7, r5, r6
	add r0, r0, r6
	str r0, [sp, #8]
	mov r0, #0x83
	lsl r0, r0, #2
	mul r1, r0
	ldr r0, [sp, #0x18]
	lsl r2, r2, #4
	add r0, r0, r1
	str r0, [sp, #0xc]
	ldr r1, _0223E474 ; =0x00000DD8
	ldr r0, [sp, #0x28]
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	lsl r6, r4, #1
	add r3, sp, #0x2c
	add r3, r3, r6
	bl ov70_0223E170
	ldr r0, [sp, #0x24]
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	ldr r0, _0223E478 ; =0x00000EC8
	beq _0223E3A2
	ldr r0, [r7, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _0223E3AA
_0223E3A2:
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0223E3AA:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #0x14]
	cmp r4, r0
	blt _0223E336
_0223E3B6:
	cmp r4, #0x1e
	bhs _0223E404
	mov r7, #0
_0223E3BC:
	ldr r0, _0223E470 ; =0x000011F4
	lsl r1, r4, #2
	ldr r0, [r5, r0]
	add r6, r5, r1
	strh r7, [r0, r1]
	ldr r0, _0223E474 ; =0x00000DD8
	add r1, r7, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0xe5
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x83
	lsl r0, r0, #2
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #0x18]
	add r1, r0, r1
	mov r0, #0
	str r0, [r1, #8]
	cmp r4, #6
	bhs _0223E3FA
	ldr r0, _0223E478 ; =0x00000EC8
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
_0223E3FA:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1e
	blo _0223E3BC
_0223E404:
	mov r2, #0xba
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x14
	ldr r2, [r5, r2]
	mov r1, #0x5c
	bl ReadMsgDataIntoString
_0223E414:
	ldr r0, [sp, #0x1c]
	bl NARC_dtor
	ldr r0, _0223E480 ; =0x00000F48
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	ldr r0, _0223E484 ; =0x00010200
	ldr r1, _0223E47C ; =0x00000BB4
	str r0, [sp, #4]
	ldr r0, _0223E480 ; =0x00000F48
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0
	mov r3, #5
	bl ov70_02245084
	ldr r0, [r5, #0x24]
	cmp r0, #6
	bne _0223E462
	mov r2, #0x35
	lsl r2, r2, #4
	add r4, r5, r2
	mov r2, #0x4b
	lsl r2, r2, #2
	ldr r0, _0223E470 ; =0x000011F4
	ldr r3, [r5, r2]
	ldr r1, _0223E474 ; =0x00000DD8
	sub r2, #8
	mul r2, r3
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x18]
	add r1, r5, r1
	add r2, r4, r2
	bl ov70_0223E738
_0223E462:
	ldr r1, _0223E488 ; =ov70_0223E120
	ldr r0, _0223E48C ; =0x00001204
	str r1, [r5, r0]
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E46C: .word 0x00003D68
_0223E470: .word 0x000011F4
_0223E474: .word 0x00000DD8
_0223E478: .word 0x00000EC8
_0223E47C: .word 0x00000BB4
_0223E480: .word 0x00000F48
_0223E484: .word 0x00010200
_0223E488: .word ov70_0223E120
_0223E48C: .word 0x00001204
	thumb_func_end ov70_0223E264

	thumb_func_start ov70_0223E490
ov70_0223E490: ; 0x0223E490
	cmp r0, #0x12
	bne _0223E498
	mov r0, #1
	bx lr
_0223E498:
	mov r0, #0
	bx lr
	thumb_func_end ov70_0223E490

	thumb_func_start ov70_0223E49C
ov70_0223E49C: ; 0x0223E49C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	add r7, r1, #0
	add r4, r3, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223E4CE
	add r0, r5, #0
	bl GetPartyCount
	sub r0, r0, #1
	cmp r4, r0
	ble _0223E4C0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223E4C0:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	pop {r3, r4, r5, r6, r7, pc}
_0223E4CE:
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl PCStorage_GetMonByIndexPair
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E49C

	thumb_func_start ov70_0223E4DC
ov70_0223E4DC: ; 0x0223E4DC
	push {r4, lr}
	add r4, r0, #0
	add r0, r2, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223E4F8
	add r0, r4, #0
	bl GetPartyCount
	cmp r0, #2
	bge _0223E4F8
	mov r0, #0
	pop {r4, pc}
_0223E4F8:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov70_0223E4DC

	thumb_func_start ov70_0223E4FC
ov70_0223E4FC: ; 0x0223E4FC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	bl AcquireBoxMonLock
	ldr r5, _0223E534 ; =ov70_02245700
	str r0, [sp]
	add r6, r4, #0
_0223E50C:
	ldrh r1, [r5]
	add r0, r7, #0
	mov r2, #0
	bl GetBoxMonData
	add r6, r6, #1
	add r4, r4, r0
	add r5, r5, #2
	cmp r6, #0xa
	blt _0223E50C
	ldr r1, [sp]
	add r0, r7, #0
	bl ReleaseBoxMonLock
	cmp r4, #0
	beq _0223E530
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E530:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E534: .word ov70_02245700
	thumb_func_end ov70_0223E4FC

	thumb_func_start ov70_0223E538
ov70_0223E538: ; 0x0223E538
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl AcquireBoxMonLock
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ReleaseBoxMonLock
	cmp r6, #0
	ble _0223E592
	ldr r1, _0223E598 ; =0x000001DF
	cmp r4, r1
	bgt _0223E574
	bge _0223E58A
	cmp r4, #0xac
	beq _0223E58E
	b _0223E592
_0223E574:
	add r0, r1, #0
	add r0, #8
	cmp r4, r0
	bgt _0223E584
	add r1, #8
	cmp r4, r1
	beq _0223E58A
	b _0223E592
_0223E584:
	add r1, #0xd
	cmp r4, r1
	bne _0223E592
_0223E58A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E58E:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0223E592:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223E598: .word 0x000001DF
	thumb_func_end ov70_0223E538

	thumb_func_start ov70_0223E59C
ov70_0223E59C: ; 0x0223E59C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl AcquireBoxMonLock
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ReleaseBoxMonLock
	cmp r4, #0x70
	bne _0223E5C2
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223E5C2:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E59C

	thumb_func_start ov70_0223E5C8
ov70_0223E5C8: ; 0x0223E5C8
	push {r4, lr}
	bl ov70_0223E49C
	add r4, r0, #0
	bne _0223E5D6
	mov r0, #0
	pop {r4, pc}
_0223E5D6:
	mov r1, #0xac
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0223E5E6
	mov r0, #0
	pop {r4, pc}
_0223E5E6:
	add r0, r4, #0
	mov r1, #0xad
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0223E5F8
	mov r0, #2
	pop {r4, pc}
_0223E5F8:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov70_0223E5C8

	thumb_func_start ov70_0223E5FC
ov70_0223E5FC: ; 0x0223E5FC
	push {r3, r4}
	mov r4, #0
	ldrsh r3, [r0, r4]
	ldrsh r2, [r1, r4]
	cmp r3, r2
	beq _0223E60E
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_0223E60E:
	mov r2, #2
	ldrsb r3, [r1, r2]
	cmp r3, #3
	beq _0223E622
	ldrsb r2, [r0, r2]
	cmp r3, r2
	beq _0223E622
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_0223E622:
	mov r2, #3
	ldrsb r3, [r0, r2]
	cmp r3, #0
	bne _0223E630
	mov r0, #0
	pop {r3, r4}
	bx lr
_0223E630:
	ldrsb r0, [r1, r2]
	cmp r0, #0
	beq _0223E640
	cmp r0, r3
	ble _0223E640
	mov r0, #0
	pop {r3, r4}
	bx lr
_0223E640:
	mov r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0223E652
	cmp r0, r3
	bge _0223E652
	mov r0, #0
	pop {r3, r4}
	bx lr
_0223E652:
	mov r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov70_0223E5FC

	thumb_func_start ov70_0223E658
ov70_0223E658: ; 0x0223E658
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetBoxMonData
	add r1, sp, #0
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	add r1, r0, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	add r0, r5, #0
	bl CalcBoxMonLevel
	add r1, sp, #0
	strb r0, [r1, #3]
	add r0, sp, #0
	add r1, r4, #0
	bl ov70_0223E5FC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E658

	thumb_func_start ov70_0223E690
ov70_0223E690: ; 0x0223E690
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x49
	add r5, r1, #0
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r1, sp, #0
	strh r0, [r1, #6]
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	add r1, r0, #1
	add r0, sp, #0
	strb r1, [r0, #8]
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl CalcBoxMonLevel
	add r1, sp, #0
	strb r0, [r1, #9]
	add r0, r4, #0
	ldrh r2, [r1, #6]
	add r0, #0xec
	strh r2, [r0]
	add r0, r4, #0
	ldrh r1, [r1, #8]
	add r0, #0xee
	strh r1, [r0]
	add r0, r4, #0
	add r1, r5, #0
	bl ov70_0223F6E4
	mov r0, #0x26
	lsl r0, r0, #4
	add r2, r5, r0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r0, #8
	mul r0, r1
	add r0, r2, r0
	bl Mon_GetBoxMon
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetBoxMonData
	add r1, sp, #0
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	add r0, r0, #1
	add r1, sp, #0
	strb r0, [r1, #2]
	mov r0, #0
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	add r0, r4, #0
	ldrh r2, [r1]
	add r0, #0xf0
	strh r2, [r0]
	add r0, r4, #0
	ldrh r2, [r1, #2]
	add r0, #0xf2
	add r4, #0xf4
	strh r2, [r0]
	ldrh r0, [r1, #4]
	strh r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov70_0223E690

	thumb_func_start ov70_0223E738
ov70_0223E738: ; 0x0223E738
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	mov r6, #0
_0223E742:
	mov r0, #0
	ldrsh r0, [r5, r0]
	cmp r0, #0
	beq _0223E75C
	add r0, r5, #0
	add r1, r7, #0
	bl ov70_0223E5FC
	cmp r0, #0
	bne _0223E75C
	ldr r0, [r4, #4]
	add r0, r0, #3
	str r0, [r4, #4]
_0223E75C:
	mov r0, #0x83
	lsl r0, r0, #2
	add r6, r6, #1
	add r5, r5, #4
	add r4, r4, r0
	cmp r6, #0x1e
	blt _0223E742
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov70_0223E738

	thumb_func_start ov70_0223E76C
ov70_0223E76C: ; 0x0223E76C
	push {r3, lr}
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemIdIsMail
	cmp r0, #0
	beq _0223E786
	mov r0, #1
	pop {r3, pc}
_0223E786:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov70_0223E76C

	thumb_func_start ov70_0223E78C
ov70_0223E78C: ; 0x0223E78C
	push {r3, r4, lr}
	sub sp, #0x3c
	add r4, r0, #0
	bl ov70_0223ECCC
	ldr r0, [r4, #4]
	bl ov70_0223E954
	add r0, r4, #0
	bl ov70_0223EA6C
	add r0, r4, #0
	bl ov70_0223EB34
	add r0, r4, #0
	bl ov70_0223EC0C
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov70_02245124
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	mov r2, #0xba
	str r0, [sp, #4]
	sub r0, r0, #4
	lsl r2, r2, #4
	str r0, [sp, #8]
	add r1, r2, #4
	ldr r0, [r4, r2]
	sub r2, r2, #4
	ldr r3, _0223E870 ; =0x00001058
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r4, r3
	bl ov70_0223F3D8
	mov r1, #0x2e
	lsl r1, r1, #6
	add r0, r4, r1
	str r0, [sp]
	add r0, r1, #0
	mov r3, #0x49
	add r0, #0x20
	add r1, #0x1c
	ldr r2, _0223E874 ; =0x00001088
	lsl r3, r3, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	add r2, r4, r2
	bl ov70_0223F508
	ldr r0, [r4, #4]
	mov r3, #0xba
	ldr r2, _0223E878 ; =0x00000F58
	str r0, [sp, #0xc]
	add r0, r4, r2
	str r0, [sp, #0x10]
	ldr r0, _0223E87C ; =0x00001168
	lsl r3, r3, #4
	add r1, r4, r0
	str r1, [sp, #0x14]
	mov r1, #0xdd
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, #0x5c
	str r1, [sp, #0x18]
	add r1, r2, #0
	sub r1, #0x54
	ldr r1, [r4, r1]
	sub r2, #0x50
	str r1, [sp, #0x1c]
	ldr r1, [r4, r2]
	mov r2, #0
	str r2, [sp, #0x24]
	str r1, [sp, #0x20]
	ldr r1, [r4, r3]
	str r1, [sp, #0x28]
	add r1, r3, #4
	ldr r1, [r4, r1]
	add r3, #0x10
	str r1, [sp, #0x2c]
	ldr r1, [r4, r3]
	str r1, [sp, #0x30]
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	str r1, [sp, #0x34]
	ldr r0, [r4, r0]
	mov r1, #2
	ldr r0, [r0, #0x14]
	str r0, [sp, #0x38]
	add r0, sp, #0xc
	bl ov70_02242014
	ldr r1, _0223E880 ; =0x000011A8
	str r0, [r4, r1]
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #2
	add sp, #0x3c
	pop {r3, r4, pc}
	nop
_0223E870: .word 0x00001058
_0223E874: .word 0x00001088
_0223E878: .word 0x00000F58
_0223E87C: .word 0x00001168
_0223E880: .word 0x000011A8
	thumb_func_end ov70_0223E78C

	thumb_func_start ov70_0223E884
ov70_0223E884: ; 0x0223E884
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238E44
	bl sub_0203A930
	ldr r1, [r4, #0x2c]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0223E8A0 ; =ov70_02246614
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0223E8A0: .word ov70_02246614
	thumb_func_end ov70_0223E884

	thumb_func_start ov70_0223E8A4
ov70_0223E8A4: ; 0x0223E8A4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203A914
	add r0, r4, #0
	bl ov70_0223ECA4
	ldr r0, _0223E8E4 ; =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_0224212C
	add r0, r4, #0
	bl ov70_0223ED24
	add r0, r4, #0
	bl ov70_0223EBD4
	ldr r0, [r4, #4]
	bl ov70_0223EA40
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	nop
_0223E8E4: .word 0x000011A8
	thumb_func_end ov70_0223E8A4

	thumb_func_start ov70_0223E8E8
ov70_0223E8E8: ; 0x0223E8E8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0xba
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r4, r2, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r1, _0223E948 ; =0x00000B9C
	add r2, r6, #0
	ldr r0, [r5, r1]
	add r1, #0x20
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	ldr r0, _0223E94C ; =0x00000F18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _0223E94C ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223E94C ; =0x00000F18
	ldr r2, _0223E950 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223E948: .word 0x00000B9C
_0223E94C: .word 0x00000F18
_0223E950: .word 0x00000BBC
	thumb_func_end ov70_0223E8E8

	thumb_func_start ov70_0223E954
ov70_0223E954: ; 0x0223E954
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0223EA30 ; =ov70_02245970
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x64
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223EA34 ; =ov70_0224598C
	add r3, sp, #0x48
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
	ldr r5, _0223EA38 ; =ov70_02245954
	add r3, sp, #0x2c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl FillBgTilemapRect
	add r0, r4, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	ldr r5, _0223EA3C ; =ov70_02245938
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_022391F0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223EA30: .word ov70_02245970
_0223EA34: .word ov70_0224598C
_0223EA38: .word ov70_02245954
_0223EA3C: .word ov70_02245938
	thumb_func_end ov70_0223E954

	thumb_func_start ov70_0223EA40
ov70_0223EA40: ; 0x0223EA40
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022392BC
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223EA40

	thumb_func_start ov70_0223EA6C
ov70_0223EA6C: ; 0x0223EA6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5, #4]
	mov r0, #0x64
	mov r1, #0x3d
	bl NARC_ctor
	add r6, r0, #0
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0x3d
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x64
	mov r1, #1
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0xc
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x64
	mov r1, #0x1a
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xf
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r5, #0
	bl ov70_02239CF8
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_0223EA6C

	thumb_func_start ov70_0223EB34
ov70_0223EB34: ; 0x0223EB34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, _0223EBC8 ; =0x00000F18
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #4]
	add r1, r1, r2
	mov r2, #0
	bl AddWindowParameterized
	ldr r1, _0223EBC8 ; =0x00000F18
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _0223EBCC ; =0x00001058
	ldr r0, [sp, #0x14]
	ldr r4, _0223EBD0 ; =ov70_02245920
	mov r7, #0
	mov r6, #0x96
	add r5, r0, r1
_0223EB76:
	ldrh r0, [r4, #2]
	add r1, r5, #0
	mov r2, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl CopyWindowToVram
	add r7, r7, #1
	add r6, #0x16
	add r4, r4, #4
	add r5, #0x10
	cmp r7, #6
	blt _0223EB76
	ldr r0, [sp, #0x14]
	mov r1, #3
	bl ov70_02239D44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223EBC8: .word 0x00000F18
_0223EBCC: .word 0x00001058
_0223EBD0: .word ov70_02245920
	thumb_func_end ov70_0223EB34

	thumb_func_start ov70_0223EBD4
ov70_0223EBD4: ; 0x0223EBD4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0223EC00 ; =0x00001198
	add r0, r6, r0
	bl RemoveWindow
	ldr r0, _0223EC04 ; =0x00001058
	mov r4, #0
	add r5, r6, r0
_0223EBE6:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _0223EBE6
	ldr r0, _0223EC08 ; =0x00000F18
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	nop
_0223EC00: .word 0x00001198
_0223EC04: .word 0x00001058
_0223EC08: .word 0x00000F18
	thumb_func_end ov70_0223EBD4

	thumb_func_start ov70_0223EC0C
ov70_0223EC0C: ; 0x0223EC0C
	push {r4, lr}
	sub sp, #0x30
	mov r2, #0xd6
	add r4, r0, #0
	lsl r2, r2, #4
	add r0, sp, #0
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #1
	bl ov70_02238B54
	mov r0, #0xa
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	mov r1, #0xdd
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xdd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x39
	lsl r0, r0, #0xe
	str r0, [sp, #8]
	mov r0, #0x75
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223EC9C ; =0x00000F04
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x26
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223EC9C ; =0x00000F04
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x23
	lsl r0, r0, #0xe
	str r0, [sp, #8]
	add r0, sp, #0
	bl CreateSprite
	ldr r1, _0223ECA0 ; =0x00000F08
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0223ECA0 ; =0x00000F08
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add sp, #0x30
	pop {r4, pc}
	.balign 4, 0
_0223EC9C: .word 0x00000F04
_0223ECA0: .word 0x00000F08
	thumb_func_end ov70_0223EC0C

	thumb_func_start ov70_0223ECA4
ov70_0223ECA4: ; 0x0223ECA4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xdd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, _0223ECC4 ; =0x00000F04
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, _0223ECC8 ; =0x00000F08
	ldr r0, [r4, r0]
	bl sub_02024758
	pop {r4, pc}
	.balign 4, 0
_0223ECC4: .word 0x00000F04
_0223ECC8: .word 0x00000F08
	thumb_func_end ov70_0223ECA4

	thumb_func_start ov70_0223ECCC
ov70_0223ECCC: ; 0x0223ECCC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223ED1C ; =0x00000BBC
	str r0, [r4, r1]
	mov r0, #0x3d
	mov r1, #0x30
	bl AllocFromHeap
	ldr r1, _0223ED20 ; =0x000011C4
	mov r2, #0x30
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	bl MIi_CpuClearFast
	ldr r2, _0223ED20 ; =0x000011C4
	mov r0, #0x3d
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x1c
	bl ov70_0223F634
	ldr r1, _0223ED20 ; =0x000011C4
	ldr r1, [r4, r1]
	str r0, [r1, #0x18]
	mov r0, #0x3d
	bl ov70_0223F684
	ldr r1, _0223ED20 ; =0x000011C4
	ldr r2, [r4, r1]
	add r1, #0x70
	str r0, [r2, #0x14]
	add r0, r4, r1
	bl ov70_0223F948
	pop {r4, pc}
	.balign 4, 0
_0223ED1C: .word 0x00000BBC
_0223ED20: .word 0x000011C4
	thumb_func_end ov70_0223ECCC

	thumb_func_start ov70_0223ED24
ov70_0223ED24: ; 0x0223ED24
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223ED50 ; =0x000011C4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl FreeToHeap
	ldr r0, _0223ED50 ; =0x000011C4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	bl FreeToHeap
	ldr r0, _0223ED50 ; =0x000011C4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _0223ED54 ; =0x00000BBC
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_0223ED50: .word 0x000011C4
_0223ED54: .word 0x00000BBC
	thumb_func_end ov70_0223ED24

	thumb_func_start ov70_0223ED58
ov70_0223ED58: ; 0x0223ED58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223ED80
	ldr r0, _0223ED88 ; =0x00000F0F
	mov r1, #9
	str r0, [sp]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov70_0223E8E8
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #1
	bl ov70_02238D84
_0223ED80:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223ED88: .word 0x00000F0F
	thumb_func_end ov70_0223ED58

	thumb_func_start ov70_0223ED8C
ov70_0223ED8C: ; 0x0223ED8C
	push {r4, lr}
	ldr r1, _0223EDAC ; =gSystem
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #2
	tst r1, r2
	beq _0223EDA6
	mov r1, #5
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
_0223EDA6:
	mov r0, #3
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
_0223EDAC: .word gSystem
	thumb_func_end ov70_0223ED8C

	thumb_func_start ov70_0223EDB0
ov70_0223EDB0: ; 0x0223EDB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223EDC8 ; =0x000011A8
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #6
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	nop
_0223EDC8: .word 0x000011A8
	thumb_func_end ov70_0223EDB0

	thumb_func_start ov70_0223EDCC
ov70_0223EDCC: ; 0x0223EDCC
	push {r3, lr}
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov70_0223EDCC

	thumb_func_start ov70_0223EDD8
ov70_0223EDD8: ; 0x0223EDD8
	push {r3, lr}
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov70_0223EDD8

	thumb_func_start ov70_0223EDE4
ov70_0223EDE4: ; 0x0223EDE4
	cmp r1, #0
	beq _0223EDF2
	cmp r1, #0xfe
	beq _0223EDFA
	cmp r1, #0xff
	beq _0223EE02
	b _0223EE0A
_0223EDF2:
	mov r1, #1
	strb r1, [r0, #2]
	add r0, r1, #0
	bx lr
_0223EDFA:
	mov r1, #2
	strb r1, [r0, #2]
	mov r0, #1
	bx lr
_0223EE02:
	mov r1, #3
	strb r1, [r0, #2]
	mov r0, #1
	bx lr
_0223EE0A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov70_0223EDE4

	thumb_func_start ov70_0223EE10
ov70_0223EE10: ; 0x0223EE10
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0223EED0 ; =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0223EE2E
	add r1, r1, #1
	cmp r0, r1
	beq _0223EECA
	b _0223EE5E
_0223EE2E:
	ldr r0, _0223EED4 ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	mov r1, #5
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223EED8 ; =0x000011C4
	ldr r3, [r4, r0]
	add r0, #0x70
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	add r0, r4, r0
	add r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
	b _0223EECA
_0223EE5E:
	ldr r1, _0223EEDC ; =0x00000B84
	strh r0, [r4, r1]
	mov r1, #0x12
	bl GetMonBaseStat
	ldr r1, _0223EED8 ; =0x000011C4
	ldr r2, [r4, r1]
	str r0, [r2, #0x20]
	ldr r1, [r4, r1]
	ldr r0, _0223EEDC ; =0x00000B84
	ldr r1, [r1, #0x20]
	add r0, r4, r0
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223EE88
	mov r0, #0xa
	str r0, [r4, #0x2c]
	ldr r0, _0223EEE0 ; =0x00000B86
	ldrsb r1, [r4, r0]
	b _0223EE8E
_0223EE88:
	mov r0, #7
	str r0, [r4, #0x2c]
	mov r1, #3
_0223EE8E:
	ldr r2, _0223EEDC ; =0x00000B84
	ldr r3, _0223EEE4 ; =0x00001058
	ldrsh r0, [r4, r2]
	add r3, r4, r3
	str r0, [sp]
	mov r0, #0
	str r1, [sp, #4]
	mvn r0, r0
	str r0, [sp, #8]
	add r0, r2, #0
	add r1, r2, #0
	add r0, #0x1c
	add r1, #0x20
	add r2, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov70_0223F3D8
	ldr r0, _0223EED8 ; =0x000011C4
	ldr r3, [r4, r0]
	add r0, #0x70
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	add r0, r4, r0
	add r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
_0223EECA:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223EED0: .word 0x000011A8
_0223EED4: .word 0x00000F18
_0223EED8: .word 0x000011C4
_0223EEDC: .word 0x00000B84
_0223EEE0: .word 0x00000B86
_0223EEE4: .word 0x00001058
	thumb_func_end ov70_0223EE10

	thumb_func_start ov70_0223EEE8
ov70_0223EEE8: ; 0x0223EEE8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223EF0C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xa
	mov r2, #1
	mov r3, #0
	bl ov70_0223E8E8
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #8
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223EF0C: .word 0x00000F0F
	thumb_func_end ov70_0223EEE8

	thumb_func_start ov70_0223EF10
ov70_0223EF10: ; 0x0223EF10
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x46
	ldr r1, _0223EF30 ; =0x0000FFFF
	lsl r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0223EF34 ; =0x000011A8
	mov r1, #1
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #9
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	nop
_0223EF30: .word 0x0000FFFF
_0223EF34: .word 0x000011A8
	thumb_func_end ov70_0223EF10

	thumb_func_start ov70_0223EF38
ov70_0223EF38: ; 0x0223EF38
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0223EFA8 ; =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	cmp r0, #2
	bhi _0223EF58
	cmp r0, #0
	beq _0223EF70
	cmp r0, #1
	beq _0223EF70
	cmp r0, #2
	beq _0223EF70
	b _0223EFA0
_0223EF58:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _0223EFA0
	ldr r0, _0223EFAC ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r4, #0x2c]
	b _0223EFA0
_0223EF70:
	ldr r2, _0223EFB0 ; =0x00000B86
	add r0, r0, #1
	strb r0, [r4, r2]
	mov r1, #0xa
	str r1, [r4, #0x2c]
	sub r0, r2, #2
	ldrsh r0, [r4, r0]
	ldr r3, _0223EFB4 ; =0x00001058
	sub r1, #0xb
	str r0, [sp]
	ldrsb r0, [r4, r2]
	add r3, r4, r3
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r2, #0
	add r1, r2, #0
	add r0, #0x1a
	add r1, #0x1e
	add r2, #0x16
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov70_0223F3D8
_0223EFA0:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223EFA8: .word 0x000011A8
_0223EFAC: .word 0x00000F18
_0223EFB0: .word 0x00000B86
_0223EFB4: .word 0x00001058
	thumb_func_end ov70_0223EF38

	thumb_func_start ov70_0223EFB8
ov70_0223EFB8: ; 0x0223EFB8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223EFDC ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xb
	mov r2, #1
	mov r3, #0
	bl ov70_0223E8E8
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0xb
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223EFDC: .word 0x00000F0F
	thumb_func_end ov70_0223EFB8

	thumb_func_start ov70_0223EFE0
ov70_0223EFE0: ; 0x0223EFE0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223F000 ; =0x000011A8
	mov r1, #2
	ldr r0, [r4, r0]
	bl ov70_022420C4
	mov r0, #0x46
	ldr r1, _0223F004 ; =0x0000FFFF
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r0, #0xc
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	nop
_0223F000: .word 0x000011A8
_0223F004: .word 0x0000FFFF
	thumb_func_end ov70_0223EFE0

	thumb_func_start ov70_0223F008
ov70_0223F008: ; 0x0223F008
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0223F09C ; =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	add r1, r0, #0
	cmp r1, #0xc
	beq _0223F02C
	mov r0, #1
	mvn r0, r0
	cmp r1, r0
	beq _0223F02C
	add r0, r0, #1
	cmp r1, r0
	beq _0223F096
	b _0223F054
_0223F02C:
	ldr r0, _0223F0A0 ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	ldr r1, _0223F0A4 ; =0x000011C4
	ldr r0, _0223F0A8 ; =0x00000B84
	ldr r1, [r4, r1]
	add r0, r4, r0
	ldr r1, [r1, #0x20]
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223F04E
	mov r0, #0
	str r0, [r4, #0x2c]
	b _0223F096
_0223F04E:
	mov r0, #7
	str r0, [r4, #0x2c]
	b _0223F096
_0223F054:
	ldr r0, _0223F0A8 ; =0x00000B84
	mov r2, #0
	add r0, r4, r0
	bl ov70_0223F828
	mov r0, #0xd
	ldr r1, _0223F0AC ; =0x00000B87
	str r0, [r4, #0x2c]
	ldrsb r0, [r4, r1]
	add r1, r1, #1
	ldrsb r1, [r4, r1]
	mov r2, #0
	bl ov70_0223F864
	ldr r2, _0223F0A8 ; =0x00000B84
	ldr r3, _0223F0B0 ; =0x00001058
	ldrsh r1, [r4, r2]
	add r3, r4, r3
	str r1, [sp]
	add r1, r2, #2
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r2, #0
	add r1, r2, #0
	add r0, #0x1c
	add r1, #0x20
	add r2, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov70_0223F3D8
_0223F096:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223F09C: .word 0x000011A8
_0223F0A0: .word 0x00000F18
_0223F0A4: .word 0x000011C4
_0223F0A8: .word 0x00000B84
_0223F0AC: .word 0x00000B87
_0223F0B0: .word 0x00001058
	thumb_func_end ov70_0223F008

	thumb_func_start ov70_0223F0B4
ov70_0223F0B4: ; 0x0223F0B4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223F0D8 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0x17
	mov r2, #1
	mov r3, #0
	bl ov70_0223E8E8
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0xe
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223F0D8: .word 0x00000F0F
	thumb_func_end ov70_0223F0B4

	thumb_func_start ov70_0223F0DC
ov70_0223F0DC: ; 0x0223F0DC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223F100 ; =0x0000011A
	mov r1, #0xc
	mov r3, #3
	bl ov70_02238C14
	ldr r1, _0223F104 ; =0x000011C8
	str r0, [r4, r1]
	mov r0, #0xf
	str r0, [r4, #0x2c]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223F100: .word 0x0000011A
_0223F104: .word 0x000011C8
	thumb_func_end ov70_0223F0DC

	thumb_func_start ov70_0223F108
ov70_0223F108: ; 0x0223F108
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223F13E
	ldr r0, _0223F15C ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r1, #7
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223F160 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, #0
	bl ov70_0223F7A4
	b _0223F158
_0223F13E:
	cmp r0, #2
	bne _0223F158
	ldr r0, _0223F15C ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r1, #5
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #2
	str r0, [r4, #0x2c]
_0223F158:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223F15C: .word 0x000011C8
_0223F160: .word 0x000011FC
	thumb_func_end ov70_0223F108

	thumb_func_start ov70_0223F164
ov70_0223F164: ; 0x0223F164
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0223F190
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223F1B4 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	b _0223F1A8
_0223F190:
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
_0223F1A8:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223F1B4: .word 0x000011FC
	thumb_func_end ov70_0223F164

	thumb_func_start ov70_0223F1B8
ov70_0223F1B8: ; 0x0223F1B8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223F1D2
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223F1D2:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223F1B8

	thumb_func_start ov70_0223F1D8
ov70_0223F1D8: ; 0x0223F1D8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r3, #0
	cmp r2, #0
	beq _0223F206
	add r0, r1, #0
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0x18]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov70_02245084
	add r0, r4, #0
	bl String_dtor
_0223F206:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_0223F1D8

	thumb_func_start ov70_0223F20C
ov70_0223F20C: ; 0x0223F20C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r3, #0
	cmp r2, #0
	beq _0223F240
	add r0, r1, #0
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r1, #0
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
_0223F240:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_0223F20C

	thumb_func_start ov70_0223F244
ov70_0223F244: ; 0x0223F244
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	cmp r3, #0
	beq _0223F276
	add r0, r1, #0
	add r1, r3, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0
	bl ov70_02245084
	add r0, r5, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, pc}
_0223F276:
	add r0, r2, #0
	mov r1, #0xad
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0
	bl ov70_02245084
	add r0, r5, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_0223F244

	thumb_func_start ov70_0223F2A0
ov70_0223F2A0: ; 0x0223F2A0
	cmp r0, #1
	bne _0223F2AA
	ldr r0, _0223F2B8 ; =ov70_022465EC
	ldr r0, [r0]
	bx lr
_0223F2AA:
	cmp r0, #2
	bne _0223F2B2
	ldr r0, _0223F2B8 ; =ov70_022465EC
	ldr r1, [r0, #4]
_0223F2B2:
	add r0, r1, #0
	bx lr
	nop
_0223F2B8: .word ov70_022465EC
	thumb_func_end ov70_0223F2A0

	thumb_func_start ov70_0223F2BC
ov70_0223F2BC: ; 0x0223F2BC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r2, #0
	cmp r3, #0
	bne _0223F2CC
	cmp r5, #3
	beq _0223F31C
_0223F2CC:
	add r0, r1, #0
	ldr r1, _0223F320 ; =ov70_02245910
	lsl r2, r5, #2
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	cmp r0, #3
	ble _0223F2FC
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov70_0223F2A0
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	add r0, r6, #0
	add r1, r4, #0
	bl ov70_02245084
	b _0223F316
_0223F2FC:
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov70_0223F2A0
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r1, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov70_02245084
_0223F316:
	add r0, r4, #0
	bl String_dtor
_0223F31C:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223F320: .word ov70_02245910
	thumb_func_end ov70_0223F2BC

	thumb_func_start ov70_0223F324
ov70_0223F324: ; 0x0223F324
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r2, #0
	cmp r3, #0
	bne _0223F334
	cmp r5, #3
	beq _0223F368
_0223F334:
	add r0, r1, #0
	ldr r1, _0223F36C ; =ov70_02245910
	lsl r2, r5, #2
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, [sp, #0x28]
	add r0, r5, #0
	bl ov70_0223F2A0
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r1, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0
	add r0, r6, #0
	add r2, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
_0223F368:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223F36C: .word ov70_02245910
	thumb_func_end ov70_0223F324

	thumb_func_start ov70_0223F370
ov70_0223F370: ; 0x0223F370
	push {r4, lr}
	sub sp, #0x10
	mov r4, #0
	str r4, [sp]
	ldr r4, [sp, #0x18]
	str r4, [sp, #4]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #8]
	ldr r4, [sp, #0x20]
	str r4, [sp, #0xc]
	bl ov70_0223F38C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov70_0223F370

	thumb_func_start ov70_0223F38C
ov70_0223F38C: ; 0x0223F38C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	add r5, r3, #0
	cmp r2, r0
	beq _0223F3CC
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0223F3A6
	ldr r3, _0223F3D0 ; =ov70_02245A4C
	b _0223F3A8
_0223F3A6:
	ldr r3, _0223F3D4 ; =ov70_022459F4
_0223F3A8:
	add r0, r1, #0
	lsl r1, r2, #3
	ldr r1, [r3, r1]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, r6, #0
	add r1, r4, #0
	bl ov70_02245084
	add r0, r4, #0
	bl String_dtor
_0223F3CC:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223F3D0: .word ov70_02245A4C
_0223F3D4: .word ov70_022459F4
	thumb_func_end ov70_0223F38C

	thumb_func_start ov70_0223F3D8
ov70_0223F3D8: ; 0x0223F3D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	mov r1, #0x65
	str r0, [sp, #0xc]
	add r6, r3, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	mov r2, #0
	ldr r0, _0223F468 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	add r5, r6, #0
	mov r4, #1
	add r5, #0x10
	mov r7, #0
_0223F404:
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0223F404
	mov r3, #0
	ldr r0, _0223F46C ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x30]
	add r0, #0x10
	bl ov70_0223F1D8
	ldr r2, [sp, #0x34]
	sub r0, r2, #1
	cmp r0, #1
	bhi _0223F446
	mov r3, #0
	str r3, [sp]
	mov r0, #0x46
	str r0, [sp, #4]
	ldr r0, _0223F46C ; =0x00010200
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x10
	bl ov70_0223F2BC
_0223F446:
	mov r1, #0
	ldr r0, _0223F46C ; =0x00010200
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r6, #0x20
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x38]
	add r0, r6, #0
	mov r3, #2
	bl ov70_0223F370
	ldr r0, [sp, #0x14]
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F468: .word 0x000F0200
_0223F46C: .word 0x00010200
	thumb_func_end ov70_0223F3D8

	thumb_func_start ov70_0223F470
ov70_0223F470: ; 0x0223F470
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	mov r1, #0x65
	str r0, [sp, #0xc]
	add r6, r3, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	mov r2, #0
	ldr r0, _0223F500 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	add r3, r2, #0
	bl ov70_02245084
	add r5, r6, #0
	mov r4, #1
	add r5, #0x10
	mov r7, #0
_0223F49C:
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0223F49C
	mov r3, #0
	ldr r0, _0223F504 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x30]
	add r0, #0x10
	bl ov70_0223F1D8
	ldr r2, [sp, #0x34]
	sub r0, r2, #1
	cmp r0, #1
	bhi _0223F4DE
	mov r3, #0
	str r3, [sp]
	mov r0, #0x46
	str r0, [sp, #4]
	ldr r0, _0223F504 ; =0x00010200
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x10
	bl ov70_0223F2BC
_0223F4DE:
	mov r3, #0
	ldr r0, _0223F504 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	add r6, #0x20
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x38]
	add r0, r6, #0
	str r3, [sp, #8]
	bl ov70_0223F370
	ldr r0, [sp, #0x14]
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F500: .word 0x000F0200
_0223F504: .word 0x00010200
	thumb_func_end ov70_0223F470

	thumb_func_start ov70_0223F508
ov70_0223F508: ; 0x0223F508
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x3d
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	bl String_ctor
	str r0, [sp, #0x18]
	mov r0, #0xb
	mov r1, #0x3d
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	mov r1, #0x77
	bl GetBoxMonData
	ldr r0, [sp, #0xc]
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	add r6, r0, #1
	ldr r0, [sp, #0xc]
	bl CalcBoxMonLevel
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x68
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	mov r1, #3
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r3, r1, #0
	bl BufferIntegerAsString
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x6c
	mov r3, #0x3d
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x1c]
	cmp r6, #3
	beq _0223F586
	ldr r1, _0223F624 ; =ov70_02245910
	lsl r2, r6, #2
	ldr r1, [r1, r2]
	ldr r2, [sp, #0x14]
	add r0, r4, #0
	bl ReadMsgDataIntoString
_0223F586:
	ldr r5, [sp, #8]
	mov r4, #0
_0223F58A:
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0223F58A
	mov r2, #0
	ldr r0, _0223F628 ; =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x20]
	add r3, r2, #0
	bl ov70_02245084
	mov r2, #0
	ldr r0, _0223F62C ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x18]
	add r0, #0x10
	add r3, r2, #0
	bl ov70_02245084
	mov r0, #2
	str r0, [sp]
	ldr r0, _0223F62C ; =0x00010200
	mov r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x1c]
	add r0, #0x20
	add r3, r2, #0
	bl ov70_02245084
	cmp r6, #3
	beq _0223F5F6
	sub r0, r6, #1
	mov r3, #0
	lsl r1, r0, #2
	ldr r0, _0223F630 ; =ov70_022465EC
	str r3, [sp]
	ldr r0, [r0, r1]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r2, #0x46
	add r0, #0x10
	str r0, [sp, #8]
	bl ov70_02245084
_0223F5F6:
	ldr r0, [sp, #0xc]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	strh r0, [r7]
	ldr r0, [sp, #0x10]
	strb r6, [r7, #2]
	strb r0, [r7, #3]
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x20]
	bl String_dtor
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F624: .word ov70_02245910
_0223F628: .word 0x000F0200
_0223F62C: .word 0x00010200
_0223F630: .word ov70_022465EC
	thumb_func_end ov70_0223F508

	thumb_func_start ov70_0223F634
ov70_0223F634: ; 0x0223F634
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0
	add r3, r0, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r1, #0xd
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, [sp, #8]
	lsr r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0223F634

	thumb_func_start ov70_0223F658
ov70_0223F658: ; 0x0223F658
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	lsl r2, r1, #2
	ldr r1, _0223F680 ; =ov70_02245AAC
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, sp, #8
	ldr r1, [r1, r2]
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r2, #0
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, [sp, #8]
	lsr r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223F680: .word ov70_02245AAC
	thumb_func_end ov70_0223F658

	thumb_func_start ov70_0223F684
ov70_0223F684: ; 0x0223F684
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0223F6DC ; =0x000001EE
	add r5, r0, #0
	mov r0, #0x3d
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _0223F6DC ; =0x000001EE
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	mov r2, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r1, #0xc
	add r3, r5, #0
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	add r7, r0, #0
	ldr r0, [sp, #8]
	ldr r5, _0223F6E0 ; =0x00000000
	lsr r3, r0, #1
	beq _0223F6D0
	ldr r0, _0223F6DC ; =0x000001EE
	add r6, r7, #0
	mov r1, #1
_0223F6C0:
	ldrh r2, [r6]
	cmp r2, r0
	bhs _0223F6C8
	strb r1, [r4, r2]
_0223F6C8:
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, r3
	blo _0223F6C0
_0223F6D0:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F6DC: .word 0x000001EE
_0223F6E0: .word 0x00000000
	thumb_func_end ov70_0223F684

	thumb_func_start ov70_0223F6E4
ov70_0223F6E4: ; 0x0223F6E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x12
	add r4, r1, #0
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	bl ov70_0223E490
	cmp r0, #0
	beq _0223F718
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Mon_UpdateShayminForme
	bl SizeOfStructPokemon
	add r2, r0, #0
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl MIi_CpuCopyFast
	b _0223F730
_0223F718:
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl BoxMon_UpdateShayminForme
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl CopyBoxPokemonToPokemon
_0223F730:
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r2, #8
	bl CopyU16StringArrayN
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	mov r1, #0x47
	lsl r1, r1, #2
	strh r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	bl sub_0202CA8C
	ldr r1, _0223F798 ; =0x0000011E
	strb r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	bl sub_0202CA90
	ldr r1, _0223F79C ; =0x0000011F
	strb r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetAvatar
	mov r1, #0x12
	lsl r1, r1, #4
	strb r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl PlayerProfile_GetTrainerGender
	add r1, r5, #0
	add r1, #0xf6
	strb r0, [r1]
	ldr r0, _0223F7A0 ; =0x00000122
	mov r1, #GAME_VERSION
	strb r1, [r5, r0]
	mov r1, #2
	add r0, r0, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0223F798: .word 0x0000011E
_0223F79C: .word 0x0000011F
_0223F7A0: .word 0x00000122
	thumb_func_end ov70_0223F6E4

	thumb_func_start ov70_0223F7A4
ov70_0223F7A4: ; 0x0223F7A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov70_0223F6E4
	mov r0, #0x2e
	lsl r0, r0, #6
	add r1, r5, #0
	ldrh r2, [r4, r0]
	add r1, #0xec
	strh r2, [r1]
	add r1, r0, #2
	ldrh r2, [r4, r1]
	add r1, r5, #0
	add r1, #0xee
	strh r2, [r1]
	add r1, r0, #4
	ldrh r2, [r4, r1]
	add r1, r5, #0
	add r1, #0xf0
	strh r2, [r1]
	add r1, r0, #6
	ldrh r2, [r4, r1]
	add r1, r5, #0
	add r1, #0xf2
	strh r2, [r1]
	add r0, #8
	ldrh r0, [r4, r0]
	add r5, #0xf4
	strh r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_0223F7A4

	thumb_func_start ov70_0223F7E4
ov70_0223F7E4: ; 0x0223F7E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	cmp r2, #0
	bne _0223F7F4
	ldr r5, _0223F820 ; =ov70_02245A4C
	mov r6, #0xc
	b _0223F7F8
_0223F7F4:
	ldr r5, _0223F824 ; =ov70_022459F4
	mov r6, #0xb
_0223F7F8:
	add r0, r6, #0
	mov r1, #0x3d
	bl ListMenuItems_ctor
	mov r4, #0
	str r0, [r7]
	cmp r6, #0
	ble _0223F81C
_0223F808:
	ldr r0, [r7]
	ldr r1, [sp]
	ldr r2, [r5]
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	add r5, #8
	cmp r4, r6
	blt _0223F808
_0223F81C:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F820: .word ov70_02245A4C
_0223F824: .word ov70_022459F4
	thumb_func_end ov70_0223F7E4

	thumb_func_start ov70_0223F828
ov70_0223F828: ; 0x0223F828
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0
	bne _0223F83E
	ldr r6, _0223F85C ; =ov70_02245A4C
	cmp r4, #0xc
	blt _0223F848
	bl GF_AssertFail
	b _0223F848
_0223F83E:
	ldr r6, _0223F860 ; =ov70_022459F4
	cmp r4, #0xb
	blt _0223F848
	bl GF_AssertFail
_0223F848:
	lsl r0, r4, #3
	add r1, r6, r0
	mov r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r5, #3]
	mov r0, #6
	ldrsh r0, [r1, r0]
	strb r0, [r5, #4]
	pop {r4, r5, r6, pc}
	nop
_0223F85C: .word ov70_02245A4C
_0223F860: .word ov70_022459F4
	thumb_func_end ov70_0223F828

	thumb_func_start ov70_0223F864
ov70_0223F864: ; 0x0223F864
	push {r4, r5, r6, r7}
	cmp r2, #0
	bne _0223F870
	ldr r4, _0223F8A0 ; =ov70_02245A4C
	mov r3, #0xc
	b _0223F874
_0223F870:
	ldr r4, _0223F8A4 ; =ov70_022459F4
	mov r3, #0xb
_0223F874:
	mov r2, #0
	cmp r3, #0
	ble _0223F898
	mov r5, #6
	mov r6, #4
_0223F87E:
	ldrsh r7, [r4, r6]
	cmp r0, r7
	bne _0223F890
	ldrsh r7, [r4, r5]
	cmp r1, r7
	bne _0223F890
	add r0, r2, #0
	pop {r4, r5, r6, r7}
	bx lr
_0223F890:
	add r2, r2, #1
	add r4, #8
	cmp r2, r3
	blt _0223F87E
_0223F898:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0223F8A0: .word ov70_02245A4C
_0223F8A4: .word ov70_022459F4
	thumb_func_end ov70_0223F864

	thumb_func_start ov70_0223F8A8
ov70_0223F8A8: ; 0x0223F8A8
	cmp r1, #0
	bne _0223F8B4
	ldr r1, _0223F8C8 ; =0x000012CC
	mov r2, #0
	str r2, [r0, r1]
	bx lr
_0223F8B4:
	sub r1, r1, #1
	cmp r1, #0x82
	bhs _0223F8C4
	lsl r2, r1, #1
	ldr r1, _0223F8CC ; =ov70_02245B5C
	ldrh r2, [r1, r2]
	ldr r1, _0223F8C8 ; =0x000012CC
	str r2, [r0, r1]
_0223F8C4:
	bx lr
	nop
_0223F8C8: .word 0x000012CC
_0223F8CC: .word ov70_02245B5C
	thumb_func_end ov70_0223F8A8

	thumb_func_start ov70_0223F8D0
ov70_0223F8D0: ; 0x0223F8D0
	push {r3, r4}
	ldr r3, _0223F900 ; =ov70_022459C8
	mov r4, #0
_0223F8D6:
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0223F8F0
	ldr r3, _0223F900 ; =ov70_022459C8
	lsl r0, r4, #1
	ldrb r2, [r3, r0]
	add r0, r4, #1
	lsl r0, r0, #1
	str r2, [r1]
	ldrb r0, [r3, r0]
	sub r0, r0, r2
	pop {r3, r4}
	bx lr
_0223F8F0:
	add r4, r4, #1
	add r3, r3, #2
	cmp r4, #0x16
	blo _0223F8D6
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_0223F900: .word ov70_022459C8
	thumb_func_end ov70_0223F8D0

	thumb_func_start ov70_0223F904
ov70_0223F904: ; 0x0223F904
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp]
	add r0, r2, #0
	add r1, sp, #4
	bl ov70_0223F8D0
	mov r1, #0x3d
	add r7, r0, #0
	bl ListMenuItems_ctor
	str r0, [r5]
	mov r4, #0
	b _0223F938
_0223F922:
	ldr r2, [sp, #4]
	ldr r0, [r5]
	add r3, r2, r4
	lsl r6, r3, #1
	ldr r2, _0223F944 ; =ov70_02245B5C
	ldr r1, [sp]
	ldrh r2, [r2, r6]
	add r3, r3, #1
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
_0223F938:
	cmp r4, r7
	blt _0223F922
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F944: .word ov70_02245B5C
	thumb_func_end ov70_0223F904

	thumb_func_start ov70_0223F948
ov70_0223F948: ; 0x0223F948
	mov r2, #0
	add r3, r0, #0
	add r1, r2, #0
_0223F94E:
	strh r1, [r3, #4]
	strh r1, [r3, #0x18]
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0xa
	blt _0223F94E
	strh r1, [r0]
	strh r1, [r0, #2]
	bx lr
	thumb_func_end ov70_0223F948

	thumb_func_start ov70_0223F960
ov70_0223F960: ; 0x0223F960
	lsl r1, r1, #1
	add r0, r0, r1
	strh r2, [r0, #4]
	strh r3, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov70_0223F960

	thumb_func_start ov70_0223F96C
ov70_0223F96C: ; 0x0223F96C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_0223FC40
	ldr r0, [r4, #4]
	bl ov70_0223FA08
	add r0, r4, #0
	bl ov70_0223FB60
	add r0, r4, #0
	bl ov70_0223FBF4
	add r0, r4, #0
	bl ov70_02241358
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov70_02245124
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_0223F96C

	thumb_func_start ov70_0223F9B4
ov70_0223F9B4: ; 0x0223F9B4
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238E44
	bl sub_0203A930
	ldr r1, [r4, #0x2c]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0223F9D0 ; =ov70_02246658
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0223F9D0: .word ov70_02246658
	thumb_func_end ov70_0223F9B4

	thumb_func_start ov70_0223F9D4
ov70_0223F9D4: ; 0x0223F9D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223FA04 ; =0x0400106C
	bl GXx_GetMasterBrightness_
	cmp r0, #0
	beq _0223F9E8
	add r0, r4, #0
	bl ov70_02241380
_0223F9E8:
	add r0, r4, #0
	bl ov70_0223FC58
	add r0, r4, #0
	bl ov70_0223FC30
	ldr r0, [r4, #4]
	bl ov70_0223FB34
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223FA04: .word 0x0400106C
	thumb_func_end ov70_0223F9D4

	thumb_func_start ov70_0223FA08
ov70_0223FA08: ; 0x0223FA08
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _0223FB1C ; =ov70_02245C60
	add r3, sp, #0x8c
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0223FB20 ; =ov70_02245CA8
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223FB24 ; =ov70_02245C8C
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
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223FB28 ; =ov70_02245CE0
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223FB2C ; =ov70_02245CC4
	add r3, sp, #0x1c
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
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223FB30 ; =ov70_02245C70
	add r3, sp, #0
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
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_0223FB1C: .word ov70_02245C60
_0223FB20: .word ov70_02245CA8
_0223FB24: .word ov70_02245C8C
_0223FB28: .word ov70_02245CE0
_0223FB2C: .word ov70_02245CC4
_0223FB30: .word ov70_02245C70
	thumb_func_end ov70_0223FA08

	thumb_func_start ov70_0223FB34
ov70_0223FB34: ; 0x0223FB34
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov70_0223FB34

	thumb_func_start ov70_0223FB60
ov70_0223FB60: ; 0x0223FB60
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5, #4]
	mov r0, #0x60
	mov r1, #0
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	mov r0, #0x64
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPal
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	ldr r0, _0223FBF0 ; =0x000011DC
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _0223FBD8
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
_0223FBD8:
	ldr r0, [r5, #0x20]
	cmp r0, #9
	bne _0223FBEA
	add r0, r5, #0
	bl ov70_02239C6C
	add r0, r5, #0
	bl ov70_02239CF8
_0223FBEA:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223FBF0: .word 0x000011DC
	thumb_func_end ov70_0223FB60

	thumb_func_start ov70_0223FBF4
ov70_0223FBF4: ; 0x0223FBF4
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	ldr r1, _0223FC2C ; =0x00000F18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _0223FC2C ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0223FC2C: .word 0x00000F18
	thumb_func_end ov70_0223FBF4

	thumb_func_start ov70_0223FC30
ov70_0223FC30: ; 0x0223FC30
	ldr r1, _0223FC38 ; =0x00000F18
	ldr r3, _0223FC3C ; =RemoveWindow
	add r0, r0, r1
	bx r3
	.balign 4, 0
_0223FC38: .word 0x00000F18
_0223FC3C: .word RemoveWindow
	thumb_func_end ov70_0223FC30

	thumb_func_start ov70_0223FC40
ov70_0223FC40: ; 0x0223FC40
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _0223FC54 ; =0x00000BBC
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0223FC54: .word 0x00000BBC
	thumb_func_end ov70_0223FC40

	thumb_func_start ov70_0223FC58
ov70_0223FC58: ; 0x0223FC58
	ldr r1, _0223FC60 ; =0x00000BBC
	ldr r3, _0223FC64 ; =String_dtor
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_0223FC60: .word 0x00000BBC
_0223FC64: .word String_dtor
	thumb_func_end ov70_0223FC58

	thumb_func_start ov70_0223FC68
ov70_0223FC68: ; 0x0223FC68
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0xc
	bhi _0223FD4C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223FC80: ; jump table
	.short _0223FD4C - _0223FC80 - 2 ; case 0
	.short _0223FD4C - _0223FC80 - 2 ; case 1
	.short _0223FD4C - _0223FC80 - 2 ; case 2
	.short _0223FD4C - _0223FC80 - 2 ; case 3
	.short _0223FD4C - _0223FC80 - 2 ; case 4
	.short _0223FD4C - _0223FC80 - 2 ; case 5
	.short _0223FD4C - _0223FC80 - 2 ; case 6
	.short _0223FC9A - _0223FC80 - 2 ; case 7
	.short _0223FCB8 - _0223FC80 - 2 ; case 8
	.short _0223FCD6 - _0223FC80 - 2 ; case 9
	.short _0223FCF4 - _0223FC80 - 2 ; case 10
	.short _0223FD18 - _0223FC80 - 2 ; case 11
	.short _0223FD30 - _0223FC80 - 2 ; case 12
_0223FC9A:
	ldr r1, _0223FD5C ; =0x00000F0F
	mov r2, #0x18
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #2
	bl ov70_02238D84
	b _0223FD50
_0223FCB8:
	ldr r1, _0223FD5C ; =0x00000F0F
	mov r2, #0x18
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #7
	bl ov70_02238D84
	b _0223FD50
_0223FCD6:
	ldr r1, _0223FD5C ; =0x00000F0F
	mov r2, #0x18
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0xc
	bl ov70_02238D84
	b _0223FD50
_0223FCF4:
	ldr r1, _0223FD5C ; =0x00000F0F
	mov r2, #0x18
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x12
	bl ov70_02238D84
	ldr r0, _0223FD60 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	b _0223FD50
_0223FD18:
	ldr r1, _0223FD5C ; =0x00000F0F
	mov r2, #0x18
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #0
	bl ov70_02244FA4
	mov r0, #0x18
	str r0, [r4, #0x2c]
	b _0223FD50
_0223FD30:
	ldr r1, _0223FD5C ; =0x00000F0F
	mov r2, #0x94
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	mov r0, #1
	str r0, [r4, #0x18]
	mov r0, #0x1d
	str r0, [r4, #0x2c]
	b _0223FD50
_0223FD4C:
	bl GF_AssertFail
_0223FD50:
	add r0, r4, #0
	bl ov70_02238F64
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223FD5C: .word 0x00000F0F
_0223FD60: .word 0x000011FC
	thumb_func_end ov70_0223FC68

	thumb_func_start ov70_0223FD64
ov70_0223FD64: ; 0x0223FD64
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl Pokemon_RemoveCapsule
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_02237F64
	mov r0, #3
	str r0, [r4, #0x2c]
	ldr r0, _0223FD94 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #4
	mov r2, #6
	bl ov70_02240D44
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223FD94: .word 0x00001604
	thumb_func_end ov70_0223FD64

	thumb_func_start ov70_0223FD98
ov70_0223FD98: ; 0x0223FD98
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223FE20
	bl ov70_02237F58
	ldr r1, _0223FE3C ; =0x00001604
	mov r2, #0
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xf
	cmp r1, #0xf
	bhi _0223FE36
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223FDC2: ; jump table
	.short _0223FE12 - _0223FDC2 - 2 ; case 0
	.short _0223FE12 - _0223FDC2 - 2 ; case 1
	.short _0223FE1A - _0223FDC2 - 2 ; case 2
	.short _0223FE0A - _0223FDC2 - 2 ; case 3
	.short _0223FE02 - _0223FDC2 - 2 ; case 4
	.short _0223FE02 - _0223FDC2 - 2 ; case 5
	.short _0223FE02 - _0223FDC2 - 2 ; case 6
	.short _0223FE02 - _0223FDC2 - 2 ; case 7
	.short _0223FE02 - _0223FDC2 - 2 ; case 8
	.short _0223FE02 - _0223FDC2 - 2 ; case 9
	.short _0223FE02 - _0223FDC2 - 2 ; case 10
	.short _0223FE0A - _0223FDC2 - 2 ; case 11
	.short _0223FE36 - _0223FDC2 - 2 ; case 12
	.short _0223FE12 - _0223FDC2 - 2 ; case 13
	.short _0223FDFA - _0223FDC2 - 2 ; case 14
	.short _0223FDE2 - _0223FDC2 - 2 ; case 15
_0223FDE2:
	add r0, r4, #0
	mov r1, #1
	bl ov70_022409C0
	ldr r0, [r4]
	mov r1, #0x2d
	ldr r0, [r0, #0x28]
	bl GameStats_Inc
	mov r0, #0x1e
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FDFA:
	str r0, [r4, #0x3c]
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE02:
	str r0, [r4, #0x3c]
	mov r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE0A:
	str r0, [r4, #0x3c]
	mov r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE12:
	str r0, [r4, #0x3c]
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE1A:
	bl sub_020399EC
	b _0223FE36
_0223FE20:
	ldr r0, _0223FE3C ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _0223FE36
	bl sub_020399EC
_0223FE36:
	mov r0, #3
	pop {r4, pc}
	nop
_0223FE3C: .word 0x00001604
	thumb_func_end ov70_0223FD98

	thumb_func_start ov70_0223FE40
ov70_0223FE40: ; 0x0223FE40
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237FB4
	mov r0, #5
	str r0, [r4, #0x2c]
	ldr r0, _0223FE5C ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	strh r0, [r4, #0x36]
	mov r0, #3
	pop {r4, pc}
	nop
_0223FE5C: .word 0x00001604
	thumb_func_end ov70_0223FE40

	thumb_func_start ov70_0223FE60
ov70_0223FE60: ; 0x0223FE60
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223FEC6
	bl ov70_02237F58
	ldr r1, _0223FEE0 ; =0x00001604
	mov r2, #0
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xf
	cmp r1, #0xf
	bhi _0223FEDC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223FE8A: ; jump table
	.short _0223FEB8 - _0223FE8A - 2 ; case 0
	.short _0223FEB8 - _0223FE8A - 2 ; case 1
	.short _0223FEC0 - _0223FE8A - 2 ; case 2
	.short _0223FEB0 - _0223FE8A - 2 ; case 3
	.short _0223FEDC - _0223FE8A - 2 ; case 4
	.short _0223FEDC - _0223FE8A - 2 ; case 5
	.short _0223FEDC - _0223FE8A - 2 ; case 6
	.short _0223FEDC - _0223FE8A - 2 ; case 7
	.short _0223FEDC - _0223FE8A - 2 ; case 8
	.short _0223FEDC - _0223FE8A - 2 ; case 9
	.short _0223FEB8 - _0223FE8A - 2 ; case 10
	.short _0223FEB0 - _0223FE8A - 2 ; case 11
	.short _0223FEB8 - _0223FE8A - 2 ; case 12
	.short _0223FEB8 - _0223FE8A - 2 ; case 13
	.short _0223FEB8 - _0223FE8A - 2 ; case 14
	.short _0223FEAA - _0223FE8A - 2 ; case 15
_0223FEAA:
	mov r0, #0x21
	str r0, [r4, #0x2c]
	b _0223FEDC
_0223FEB0:
	str r0, [r4, #0x3c]
	mov r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FEDC
_0223FEB8:
	mov r0, #4
	bl sub_02039AD8
	b _0223FEDC
_0223FEC0:
	bl sub_020399EC
	b _0223FEDC
_0223FEC6:
	ldr r0, _0223FEE0 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _0223FEDC
	bl sub_020399EC
_0223FEDC:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0223FEE0: .word 0x00001604
	thumb_func_end ov70_0223FE60

	thumb_func_start ov70_0223FEE4
ov70_0223FEE4: ; 0x0223FEE4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_02238008
	mov r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _0223FF0C ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0xb
	bl ov70_02240D44
	mov r0, #3
	pop {r4, pc}
	nop
_0223FF0C: .word 0x00001604
	thumb_func_end ov70_0223FEE4

	thumb_func_start ov70_0223FF10
ov70_0223FF10: ; 0x0223FF10
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223FFA8
	bl ov70_02237F58
	ldr r1, _0223FFC4 ; =0x00001604
	mov r2, #0
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xf
	cmp r1, #0xf
	bhi _0223FFBE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223FF3A: ; jump table
	.short _0223FF9A - _0223FF3A - 2 ; case 0
	.short _0223FF9A - _0223FF3A - 2 ; case 1
	.short _0223FFA2 - _0223FF3A - 2 ; case 2
	.short _0223FF92 - _0223FF3A - 2 ; case 3
	.short _0223FFBE - _0223FF3A - 2 ; case 4
	.short _0223FFBE - _0223FF3A - 2 ; case 5
	.short _0223FFBE - _0223FF3A - 2 ; case 6
	.short _0223FFBE - _0223FF3A - 2 ; case 7
	.short _0223FFBE - _0223FF3A - 2 ; case 8
	.short _0223FFBE - _0223FF3A - 2 ; case 9
	.short _0223FFBE - _0223FF3A - 2 ; case 10
	.short _0223FF8C - _0223FF3A - 2 ; case 11
	.short _0223FF86 - _0223FF3A - 2 ; case 12
	.short _0223FF9A - _0223FF3A - 2 ; case 13
	.short _0223FFBE - _0223FF3A - 2 ; case 14
	.short _0223FF5A - _0223FF3A - 2 ; case 15
_0223FF5A:
	ldr r0, _0223FFC8 ; =0x0000025D
	ldrsb r5, [r4, r0]
	cmp r5, #0
	beq _0223FF68
	mov r0, #0x18
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF68:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0202DBA0
	mov r1, #0x4f
	lsl r1, r1, #2
	add r2, r0, #0
	add r0, r4, #0
	add r1, r4, r1
	add r3, r5, #0
	bl ov70_02240A7C
	mov r0, #0x1e
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF86:
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF8C:
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF92:
	str r0, [r4, #0x3c]
	mov r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF9A:
	str r0, [r4, #0x3c]
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FFA2:
	bl sub_020399EC
	b _0223FFBE
_0223FFA8:
	ldr r0, _0223FFC4 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _0223FFBE
	bl sub_020399EC
_0223FFBE:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_0223FFC4: .word 0x00001604
_0223FFC8: .word 0x0000025D
	thumb_func_end ov70_0223FF10

	thumb_func_start ov70_0223FFCC
ov70_0223FFCC: ; 0x0223FFCC
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022380EC
	mov r0, #0xa
	str r0, [r4, #0x2c]
	ldr r0, _0223FFE4 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_0223FFE4: .word 0x00001604
	thumb_func_end ov70_0223FFCC

	thumb_func_start ov70_0223FFE8
ov70_0223FFE8: ; 0x0223FFE8
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224004C
	bl ov70_02237F58
	ldr r1, _02240068 ; =0x00001604
	mov r2, #0
	add r0, #0xf
	str r2, [r4, r1]
	cmp r0, #0xf
	bhi _02240062
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02240010: ; jump table
	.short _0224003E - _02240010 - 2 ; case 0
	.short _0224003E - _02240010 - 2 ; case 1
	.short _02240046 - _02240010 - 2 ; case 2
	.short _0224003E - _02240010 - 2 ; case 3
	.short _02240062 - _02240010 - 2 ; case 4
	.short _02240062 - _02240010 - 2 ; case 5
	.short _02240062 - _02240010 - 2 ; case 6
	.short _02240062 - _02240010 - 2 ; case 7
	.short _02240062 - _02240010 - 2 ; case 8
	.short _02240062 - _02240010 - 2 ; case 9
	.short _02240036 - _02240010 - 2 ; case 10
	.short _02240036 - _02240010 - 2 ; case 11
	.short _02240036 - _02240010 - 2 ; case 12
	.short _0224003E - _02240010 - 2 ; case 13
	.short _02240062 - _02240010 - 2 ; case 14
	.short _02240030 - _02240010 - 2 ; case 15
_02240030:
	mov r0, #0x21
	str r0, [r4, #0x2c]
	b _02240062
_02240036:
	mov r0, #3
	bl sub_02039AD8
	b _02240062
_0224003E:
	mov r0, #4
	bl sub_02039AD8
	b _02240062
_02240046:
	bl sub_020399EC
	b _02240062
_0224004C:
	ldr r0, _02240068 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02240062
	bl sub_020399EC
_02240062:
	mov r0, #3
	pop {r4, pc}
	nop
_02240068: .word 0x00001604
	thumb_func_end ov70_0223FFE8

	thumb_func_start ov70_0224006C
ov70_0224006C: ; 0x0224006C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl Pokemon_RemoveCapsule
	mov r1, #0x4b
	lsl r1, r1, #2
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #8
	mul r0, r2
	add r2, r4, r0
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	ldr r2, _022400B4 ; =0x00000A5C
	add r1, #0x10
	add r1, r4, r1
	add r2, r4, r2
	bl ov70_02238208
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0x10
	bl ov70_02240D44
	mov r0, #0xd
	str r0, [r4, #0x2c]
	ldr r0, _022400B8 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_022400B4: .word 0x00000A5C
_022400B8: .word 0x00001604
	thumb_func_end ov70_0224006C

	thumb_func_start ov70_022400BC
ov70_022400BC: ; 0x022400BC
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224015E
	bl ov70_02237F58
	ldr r2, _02240178 ; =0x00001604
	mov r1, #0
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0xf
	cmp r2, #0xf
	bhi _02240174
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022400E6: ; jump table
	.short _02240150 - _022400E6 - 2 ; case 0
	.short _02240150 - _022400E6 - 2 ; case 1
	.short _02240158 - _022400E6 - 2 ; case 2
	.short _02240148 - _022400E6 - 2 ; case 3
	.short _02240140 - _022400E6 - 2 ; case 4
	.short _02240140 - _022400E6 - 2 ; case 5
	.short _02240140 - _022400E6 - 2 ; case 6
	.short _02240140 - _022400E6 - 2 ; case 7
	.short _02240140 - _022400E6 - 2 ; case 8
	.short _02240140 - _022400E6 - 2 ; case 9
	.short _02240138 - _022400E6 - 2 ; case 10
	.short _02240174 - _022400E6 - 2 ; case 11
	.short _02240174 - _022400E6 - 2 ; case 12
	.short _02240150 - _022400E6 - 2 ; case 13
	.short _02240174 - _022400E6 - 2 ; case 14
	.short _02240106 - _022400E6 - 2 ; case 15
_02240106:
	mov r0, #0x1e
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl ov70_022409C0
	mov r2, #0x12
	lsl r2, r2, #4
	ldr r1, _0224017C ; =0x00000A5C
	ldrh r2, [r4, r2]
	add r0, r4, #0
	add r1, r4, r1
	bl ov70_02240B9C
	ldr r0, [r4]
	ldr r1, _0224017C ; =0x00000A5C
	ldr r0, [r0, #0x18]
	add r1, r4, r1
	bl ov70_02240CE4
	ldr r1, _0224017C ; =0x00000A5C
	add r0, r4, #0
	add r1, r4, r1
	bl ov70_02240500
	b _02240174
_02240138:
	str r0, [r4, #0x3c]
	mov r0, #0x11
	str r0, [r4, #0x2c]
	b _02240174
_02240140:
	str r0, [r4, #0x3c]
	mov r0, #0x27
	str r0, [r4, #0x2c]
	b _02240174
_02240148:
	str r0, [r4, #0x3c]
	mov r0, #0x27
	str r0, [r4, #0x2c]
	b _02240174
_02240150:
	str r0, [r4, #0x3c]
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _02240174
_02240158:
	bl sub_020399EC
	b _02240174
_0224015E:
	ldr r0, _02240178 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02240174
	bl sub_020399EC
_02240174:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02240178: .word 0x00001604
_0224017C: .word 0x00000A5C
	thumb_func_end ov70_022400BC

	thumb_func_start ov70_02240180
ov70_02240180: ; 0x02240180
	push {r4, lr}
	add r4, r0, #0
	bl ov70_0223826C
	mov r0, #0xf
	str r0, [r4, #0x2c]
	ldr r0, _02240198 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_02240198: .word 0x00001604
	thumb_func_end ov70_02240180

	thumb_func_start ov70_0224019C
ov70_0224019C: ; 0x0224019C
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _02240200
	bl ov70_02237F58
	ldr r1, _0224021C ; =0x00001604
	mov r2, #0
	add r0, #0xf
	str r2, [r4, r1]
	cmp r0, #0xf
	bhi _02240216
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022401C4: ; jump table
	.short _022401F2 - _022401C4 - 2 ; case 0
	.short _022401F2 - _022401C4 - 2 ; case 1
	.short _022401FA - _022401C4 - 2 ; case 2
	.short _022401F2 - _022401C4 - 2 ; case 3
	.short _02240216 - _022401C4 - 2 ; case 4
	.short _02240216 - _022401C4 - 2 ; case 5
	.short _02240216 - _022401C4 - 2 ; case 6
	.short _02240216 - _022401C4 - 2 ; case 7
	.short _02240216 - _022401C4 - 2 ; case 8
	.short _02240216 - _022401C4 - 2 ; case 9
	.short _022401EA - _022401C4 - 2 ; case 10
	.short _02240216 - _022401C4 - 2 ; case 11
	.short _02240216 - _022401C4 - 2 ; case 12
	.short _022401F2 - _022401C4 - 2 ; case 13
	.short _02240216 - _022401C4 - 2 ; case 14
	.short _022401E4 - _022401C4 - 2 ; case 15
_022401E4:
	mov r0, #0x21
	str r0, [r4, #0x2c]
	b _02240216
_022401EA:
	mov r0, #3
	bl sub_02039AD8
	b _02240216
_022401F2:
	mov r0, #4
	bl sub_02039AD8
	b _02240216
_022401FA:
	bl sub_020399EC
	b _02240216
_02240200:
	ldr r0, _0224021C ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02240216
	bl sub_020399EC
_02240216:
	mov r0, #3
	pop {r4, pc}
	nop
_0224021C: .word 0x00001604
	thumb_func_end ov70_0224019C

	thumb_func_start ov70_02240220
ov70_02240220: ; 0x02240220
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_02238058
	mov r0, #0x19
	str r0, [r4, #0x2c]
	ldr r0, _0224023C ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0224023C: .word 0x00001604
	thumb_func_end ov70_02240220

	thumb_func_start ov70_02240240
ov70_02240240: ; 0x02240240
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	bne _0224024E
	b _022403D0
_0224024E:
	bl ov70_02237F58
	ldr r1, _022403EC ; =0x00001604
	mov r2, #0
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xf
	cmp r1, #0x10
	bhi _022402B0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224026C: ; jump table
	.short _022403BE - _0224026C - 2 ; case 0
	.short _022403BE - _0224026C - 2 ; case 1
	.short _022403C6 - _0224026C - 2 ; case 2
	.short _022403BE - _0224026C - 2 ; case 3
	.short _022403E6 - _0224026C - 2 ; case 4
	.short _022403E6 - _0224026C - 2 ; case 5
	.short _022403E6 - _0224026C - 2 ; case 6
	.short _022403E6 - _0224026C - 2 ; case 7
	.short _022403E6 - _0224026C - 2 ; case 8
	.short _022403E6 - _0224026C - 2 ; case 9
	.short _022403E6 - _0224026C - 2 ; case 10
	.short _02240372 - _0224026C - 2 ; case 11
	.short _0224030A - _0224026C - 2 ; case 12
	.short _022403BE - _0224026C - 2 ; case 13
	.short _022403E6 - _0224026C - 2 ; case 14
	.short _0224028E - _0224026C - 2 ; case 15
	.short _02240294 - _0224026C - 2 ; case 16
_0224028E:
	mov r0, #0x1a
	str r0, [r4, #0x2c]
	b _022403E6
_02240294:
	mov r1, #0x4f
	mov r0, #1
	lsl r1, r1, #2
	strh r0, [r4, #0x36]
	add r0, r4, #0
	add r1, r4, r1
	bl ov70_02240D00
	cmp r0, #0
	beq _022402FE
	cmp r0, #1
	beq _022402B2
	cmp r0, #2
	beq _022402D8
_022402B0:
	b _022403E6
_022402B2:
	add r0, r4, #0
	bl ov70_02238F80
	ldr r0, _022403F0 ; =0x00000F0F
	mov r1, #0xba
	str r0, [sp]
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x1d
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x1c
	bl ov70_02238D84
	b _022403E6
_022402D8:
	add r0, r4, #0
	bl ov70_02238F80
	ldr r0, _022403F0 ; =0x00000F0F
	mov r1, #0xba
	str r0, [sp]
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x23
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x1c
	bl ov70_02238D84
	b _022403E6
_022402FE:
	mov r0, #0x12
	str r0, [r4, #0x2c]
	ldr r0, _022403F4 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	b _022403E6
_0224030A:
	strh r2, [r4, #0x36]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0202DB54
	cmp r0, #0
	beq _0224036A
	mov r0, #0x3d
	bl AllocMonZeroed
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	ldr r0, [r0]
	bl sub_0202DB64
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _022403F8 ; =0x00000B9C
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #0x22
	str r0, [r4, #0x2c]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0202DBA0
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #0
	bl ov70_02240A7C
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0202DB5C
	add r0, r5, #0
	bl FreeToHeap
	b _022403E6
_0224036A:
	add r0, r4, #0
	bl ov70_022404D4
	b _022403E6
_02240372:
	strh r2, [r4, #0x36]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0202DB54
	cmp r0, #0
	beq _022403E6
	mov r0, #0x3d
	bl AllocMonZeroed
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	ldr r0, [r0]
	bl sub_0202DB64
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _022403F8 ; =0x00000B9C
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	mov r0, #3
	str r0, [r4, #0x28]
	mov r0, #0x22
	str r0, [r4, #0x2c]
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0202DB5C
	add r0, r5, #0
	bl FreeToHeap
	b _022403E6
_022403BE:
	str r0, [r4, #0x3c]
	mov r0, #0x26
	str r0, [r4, #0x2c]
	b _022403E6
_022403C6:
	mov r0, #3
	mov r1, #1
	bl ShowCommunicationError
_022403CE:
	b _022403CE
_022403D0:
	ldr r0, _022403EC ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _022403E6
	bl sub_020399EC
_022403E6:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_022403EC: .word 0x00001604
_022403F0: .word 0x00000F0F
_022403F4: .word 0x000011FC
_022403F8: .word 0x00000B9C
	thumb_func_end ov70_02240240

	thumb_func_start ov70_022403FC
ov70_022403FC: ; 0x022403FC
	push {r4, lr}
	mov r1, #1
	mov r2, #0
	add r4, r0, #0
	bl ov70_02238E50
	mov r0, #0x24
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_022403FC

	thumb_func_start ov70_02240410
ov70_02240410: ; 0x02240410
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_02238008
	mov r0, #0x1b
	str r0, [r4, #0x2c]
	ldr r0, _0224042C ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0224042C: .word 0x00001604
	thumb_func_end ov70_02240410

	thumb_func_start ov70_02240430
ov70_02240430: ; 0x02240430
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _022404B4
	bl ov70_02237F58
	ldr r2, _022404D0 ; =0x00001604
	mov r1, #0
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0xf
	cmp r2, #0xf
	bhi _022404AC
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0224045A: ; jump table
	.short _0224049A - _0224045A - 2 ; case 0
	.short _0224049A - _0224045A - 2 ; case 1
	.short _022404A4 - _0224045A - 2 ; case 2
	.short _0224049A - _0224045A - 2 ; case 3
	.short _022404AC - _0224045A - 2 ; case 4
	.short _022404AC - _0224045A - 2 ; case 5
	.short _022404AC - _0224045A - 2 ; case 6
	.short _022404AC - _0224045A - 2 ; case 7
	.short _022404AC - _0224045A - 2 ; case 8
	.short _022404AC - _0224045A - 2 ; case 9
	.short _022404AC - _0224045A - 2 ; case 10
	.short _022404AC - _0224045A - 2 ; case 11
	.short _02240496 - _0224045A - 2 ; case 12
	.short _0224049A - _0224045A - 2 ; case 13
	.short _022404AC - _0224045A - 2 ; case 14
	.short _0224047A - _0224045A - 2 ; case 15
_0224047A:
	add r0, r4, #0
	bl ov70_02240D54
	cmp r0, #0
	beq _02240490
	mov r0, #0x16
	str r0, [r4, #0x2c]
	mov r0, #0
	strh r0, [r4, #0x36]
	mov r0, #3
	pop {r4, pc}
_02240490:
	mov r0, #1
	strh r0, [r4, #0x36]
	b _022404AC
_02240496:
	strh r1, [r4, #0x36]
	b _022404AC
_0224049A:
	str r0, [r4, #0x3c]
	mov r0, #0x26
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
_022404A4:
	bl sub_020399EC
	mov r0, #3
	pop {r4, pc}
_022404AC:
	add r0, r4, #0
	bl ov70_022404D4
	b _022404CA
_022404B4:
	ldr r0, _022404D0 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _022404CA
	bl sub_020399EC
_022404CA:
	mov r0, #3
	pop {r4, pc}
	nop
_022404D0: .word 0x00001604
	thumb_func_end ov70_02240430

	thumb_func_start ov70_022404D4
ov70_022404D4: ; 0x022404D4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #1
	beq _022404E4
	cmp r1, #2
	beq _022404F2
	pop {r4, pc}
_022404E4:
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r0, #0x24
	str r0, [r4, #0x2c]
	pop {r4, pc}
_022404F2:
	mov r1, #2
	mov r2, #3
	bl ov70_02238E50
	mov r0, #0x24
	str r0, [r4, #0x2c]
	pop {r4, pc}
	thumb_func_end ov70_022404D4

	thumb_func_start ov70_02240500
ov70_02240500: ; 0x02240500
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #0x28]
	mov r1, #0x18
	bl GameStats_AddSpecial
	ldr r0, [r5]
	mov r1, #0x19
	ldr r0, [r0, #0x28]
	bl GameStats_Inc
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	ldr r1, _0224053C ; =gGameLanguage
	ldrb r1, [r1]
	cmp r1, r0
	beq _0224053A
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl Sav2_Pokewalker_get
	mov r1, #0x14
	bl Pokewalker_UnlockCourse
_0224053A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224053C: .word gGameLanguage
	thumb_func_end ov70_02240500

	thumb_func_start ov70_02240540
ov70_02240540: ; 0x02240540
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0202DBA0
	ldr r3, _02240594 ; =0x0000025D
	mov r1, #0x4f
	lsl r1, r1, #2
	add r2, r0, #0
	ldrsb r3, [r4, r3]
	add r0, r4, #0
	add r1, r4, r1
	bl ov70_02240A7C
	ldr r0, [r4]
	mov r1, #0x4f
	lsl r1, r1, #2
	ldr r0, [r0, #0x18]
	add r1, r4, r1
	bl ov70_02240CE4
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r4, r1
	bl ov70_02240500
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0202DB5C
	mov r0, #0x1e
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0xb
	bl ov70_02240D44
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02240594: .word 0x0000025D
	thumb_func_end ov70_02240540

	thumb_func_start ov70_02240598
ov70_02240598: ; 0x02240598
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022380A8
	mov r0, #0x14
	str r0, [r4, #0x2c]
	ldr r0, _022405B0 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_022405B0: .word 0x00001604
	thumb_func_end ov70_02240598

	thumb_func_start ov70_022405B4
ov70_022405B4: ; 0x022405B4
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224061C
	bl ov70_02237F58
	ldr r1, _02240638 ; =0x00001604
	mov r2, #0
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xf
	cmp r1, #0xf
	bhi _02240632
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022405DE: ; jump table
	.short _0224060E - _022405DE - 2 ; case 0
	.short _0224060E - _022405DE - 2 ; case 1
	.short _02240616 - _022405DE - 2 ; case 2
	.short _0224060C - _022405DE - 2 ; case 3
	.short _02240632 - _022405DE - 2 ; case 4
	.short _02240632 - _022405DE - 2 ; case 5
	.short _02240632 - _022405DE - 2 ; case 6
	.short _02240632 - _022405DE - 2 ; case 7
	.short _02240632 - _022405DE - 2 ; case 8
	.short _02240632 - _022405DE - 2 ; case 9
	.short _02240632 - _022405DE - 2 ; case 10
	.short _0224060C - _022405DE - 2 ; case 11
	.short _02240604 - _022405DE - 2 ; case 12
	.short _0224060E - _022405DE - 2 ; case 13
	.short _02240632 - _022405DE - 2 ; case 14
	.short _022405FE - _022405DE - 2 ; case 15
_022405FE:
	mov r0, #0x21
	str r0, [r4, #0x2c]
	b _02240632
_02240604:
	mov r0, #3
	bl sub_02039AD8
	b _02240632
_0224060C:
	str r0, [r4, #0x3c]
_0224060E:
	mov r0, #4
	bl sub_02039AD8
	b _02240632
_02240616:
	bl sub_020399EC
	b _02240632
_0224061C:
	ldr r0, _02240638 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02240632
	bl sub_020399EC
_02240632:
	mov r0, #3
	pop {r4, pc}
	nop
_02240638: .word 0x00001604
	thumb_func_end ov70_022405B4

	thumb_func_start ov70_0224063C
ov70_0224063C: ; 0x0224063C
	mov r0, #3
	bx lr
	thumb_func_end ov70_0224063C

	thumb_func_start ov70_02240640
ov70_02240640: ; 0x02240640
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	strh r1, [r4, #0x36]
	mov r1, #9
	mov r2, #7
	bl ov70_02238E50
	mov r0, #0x24
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240640

	thumb_func_start ov70_02240658
ov70_02240658: ; 0x02240658
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	strh r1, [r4, #0x36]
	mov r1, #9
	mov r2, #8
	bl ov70_02238E50
	mov r0, #0x24
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240658

	thumb_func_start ov70_02240670
ov70_02240670: ; 0x02240670
	push {r4, lr}
	mov r1, #9
	add r2, r1, #0
	add r4, r0, #0
	bl ov70_02238E50
	mov r0, #0x24
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240670

	thumb_func_start ov70_02240684
ov70_02240684: ; 0x02240684
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	strh r1, [r4, #0x36]
	mov r1, #9
	mov r2, #0xa
	bl ov70_02238E50
	mov r0, #0x1e
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240684

	thumb_func_start ov70_0224069C
ov70_0224069C: ; 0x0224069C
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022380EC
	mov r0, #0x17
	str r0, [r4, #0x2c]
	ldr r0, _022406B4 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_022406B4: .word 0x00001604
	thumb_func_end ov70_0224069C

	thumb_func_start ov70_022406B8
ov70_022406B8: ; 0x022406B8
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224072A
	bl ov70_02237F58
	ldr r1, _02240744 ; =0x00001604
	mov r2, #0
	add r0, #0xf
	str r2, [r4, r1]
	cmp r0, #0xf
	bhi _02240740
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022406E0: ; jump table
	.short _0224071C - _022406E0 - 2 ; case 0
	.short _0224071C - _022406E0 - 2 ; case 1
	.short _02240724 - _022406E0 - 2 ; case 2
	.short _0224071C - _022406E0 - 2 ; case 3
	.short _02240740 - _022406E0 - 2 ; case 4
	.short _02240740 - _022406E0 - 2 ; case 5
	.short _02240740 - _022406E0 - 2 ; case 6
	.short _02240740 - _022406E0 - 2 ; case 7
	.short _02240740 - _022406E0 - 2 ; case 8
	.short _02240740 - _022406E0 - 2 ; case 9
	.short _02240714 - _022406E0 - 2 ; case 10
	.short _0224070E - _022406E0 - 2 ; case 11
	.short _02240708 - _022406E0 - 2 ; case 12
	.short _0224071C - _022406E0 - 2 ; case 13
	.short _02240740 - _022406E0 - 2 ; case 14
	.short _02240700 - _022406E0 - 2 ; case 15
_02240700:
	add r0, r4, #0
	bl ov70_022404D4
	b _02240740
_02240708:
	add r0, r4, #0
	bl ov70_022404D4
_0224070E:
	add r0, r4, #0
	bl ov70_022404D4
_02240714:
	mov r0, #3
	bl sub_02039AD8
	b _02240740
_0224071C:
	mov r0, #4
	bl sub_02039AD8
	b _02240740
_02240724:
	bl sub_020399EC
	b _02240740
_0224072A:
	ldr r0, _02240744 ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02240740
	bl sub_020399EC
_02240740:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02240744: .word 0x00001604
	thumb_func_end ov70_022406B8

	thumb_func_start ov70_02240748
ov70_02240748: ; 0x02240748
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02240788 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x93
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x24
	bl ov70_02238D84
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	add r0, r4, #0
	bl ov70_02238F80
	add r0, r4, #0
	bl ov70_02241234
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02240788: .word 0x00000F0F
	thumb_func_end ov70_02240748

	thumb_func_start ov70_0224078C
ov70_0224078C: ; 0x0224078C
	push {r3, lr}
	ldr r1, [r0, #0x3c]
	mov r2, #0x9a
	add r1, #0xf
	cmp r1, #0xe
	bhi _022407CC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022407A4: ; jump table
	.short _022407CC - _022407A4 - 2 ; case 0
	.short _022407CA - _022407A4 - 2 ; case 1
	.short _022407CC - _022407A4 - 2 ; case 2
	.short _022407CC - _022407A4 - 2 ; case 3
	.short _022407C2 - _022407A4 - 2 ; case 4
	.short _022407C2 - _022407A4 - 2 ; case 5
	.short _022407C2 - _022407A4 - 2 ; case 6
	.short _022407C2 - _022407A4 - 2 ; case 7
	.short _022407C2 - _022407A4 - 2 ; case 8
	.short _022407C2 - _022407A4 - 2 ; case 9
	.short _022407CC - _022407A4 - 2 ; case 10
	.short _022407CC - _022407A4 - 2 ; case 11
	.short _022407CC - _022407A4 - 2 ; case 12
	.short _022407CA - _022407A4 - 2 ; case 13
	.short _022407C6 - _022407A4 - 2 ; case 14
_022407C2:
	mov r2, #0x1a
	b _022407CC
_022407C6:
	mov r2, #0x97
	b _022407CC
_022407CA:
	mov r2, #0x9c
_022407CC:
	ldr r1, _022407E0 ; =0x00000F0F
	mov r3, #1
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	bl ov70_02244FA4
	pop {r3, pc}
	nop
_022407E0: .word 0x00000F0F
	thumb_func_end ov70_0224078C

	thumb_func_start ov70_022407E4
ov70_022407E4: ; 0x022407E4
	push {r4, lr}
	add r4, r0, #0
	bl ov70_0224078C
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x24
	bl ov70_02238D84
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	add r0, r4, #0
	bl ov70_02238F80
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_022407E4

	thumb_func_start ov70_0224080C
ov70_0224080C: ; 0x0224080C
	push {r4, lr}
	add r4, r0, #0
	bl ov70_0224078C
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x24
	bl ov70_02238D84
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	add r0, r4, #0
	bl ov70_02238F80
	add r0, r4, #0
	bl ov70_02241234
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_0224080C

	thumb_func_start ov70_02240838
ov70_02240838: ; 0x02240838
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x25
	mov r2, #0x1e
	bl ov70_02238D84
	add r0, r4, #0
	mov r1, #0x21
	mov r2, #0x24
	bl ov70_02240D44
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02240838

	thumb_func_start ov70_02240854
ov70_02240854: ; 0x02240854
	push {r4, lr}
	add r4, r0, #0
	bl SetAllPCBoxesModified
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0, #0x20]
	bl Save_PrepareForAsyncWrite
	mov r0, #0x1f
	str r0, [r4, #0x2c]
	bl LCRandom
	mov r1, #0x3c
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	add r1, r0, #2
	mov r0, #0x47
	lsl r0, r0, #6
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240854

	thumb_func_start ov70_02240884
ov70_02240884: ; 0x02240884
	mov r1, #0x47
	lsl r1, r1, #6
	ldr r2, [r0, r1]
	sub r2, r2, #1
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02240898
	mov r1, #0x20
	str r1, [r0, #0x2c]
_02240898:
	mov r0, #3
	bx lr
	thumb_func_end ov70_02240884

	thumb_func_start ov70_0224089C
ov70_0224089C: ; 0x0224089C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl Save_WriteFileAsync
	cmp r0, #1
	bne _022408B2
	ldr r0, _022408B8 ; =0x000011D4
	ldrh r0, [r4, r0]
	str r0, [r4, #0x2c]
_022408B2:
	mov r0, #3
	pop {r4, pc}
	nop
_022408B8: .word 0x000011D4
	thumb_func_end ov70_0224089C

	thumb_func_start ov70_022408BC
ov70_022408BC: ; 0x022408BC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl Save_WriteFileAsync
	cmp r0, #2
	bne _022408D8
	ldr r0, _022408DC ; =0x000011D6
	ldrh r0, [r4, r0]
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl ov70_02238F80
_022408D8:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_022408DC: .word 0x000011D6
	thumb_func_end ov70_022408BC

	thumb_func_start ov70_022408E0
ov70_022408E0: ; 0x022408E0
	push {r4, lr}
	add r4, r0, #0
	bl SetAllPCBoxesModified
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0, #0x20]
	bl Save_PrepareForAsyncWrite
	mov r0, #0x23
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_022408E0

	thumb_func_start ov70_022408FC
ov70_022408FC: ; 0x022408FC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl Save_WriteFileAsync
	cmp r0, #2
	bne _0224093C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	add r0, r4, #0
	bl ov70_02238F80
	ldr r0, _02240944 ; =0x00000F0F
	mov r1, #0xba
	str r0, [sp]
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, #0x28]
	add r0, r4, #0
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #0x1c
	bl ov70_02238D84
_0224093C:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02240944: .word 0x00000F0F
	thumb_func_end ov70_022408FC

	thumb_func_start ov70_02240948
ov70_02240948: ; 0x02240948
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_02238F80
	bl sub_0203A914
	ldr r0, _0224099C ; =0x000011FC
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02240978
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _02240990
_02240978:
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
_02240990:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224099C: .word 0x000011FC
	thumb_func_end ov70_02240948

	thumb_func_start ov70_022409A0
ov70_022409A0: ; 0x022409A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _022409BA
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_022409BA:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_022409A0

	thumb_func_start ov70_022409C0
ov70_022409C0: ; 0x022409C0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0x12
	add r5, r0, #0
	lsl r1, r1, #4
	ldrh r0, [r5, r1]
	cmp r0, #0x12
	beq _02240A1A
	mov r0, #0x3d
	bl AllocMonZeroed
	mov r2, #0x12
	lsl r2, r2, #4
	add r4, r0, #0
	ldr r0, [r5]
	ldrh r1, [r5, r2]
	add r2, r2, #2
	ldrh r2, [r5, r2]
	ldr r0, [r0, #0xc]
	bl PCStorage_GetMonByIndexPair
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	mov r2, #0x12
	ldr r0, [r5]
	lsl r2, r2, #4
	ldrh r2, [r5, r2]
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0202DB70
	mov r2, #0x12
	lsl r2, r2, #4
	ldr r0, [r5]
	ldrh r1, [r5, r2]
	add r2, r2, #2
	ldrh r2, [r5, r2]
	ldr r0, [r0, #0xc]
	bl PCStorage_DeleteBoxMonByIndexPair
	add r0, r4, #0
	bl FreeToHeap
	b _02240A62
_02240A1A:
	ldr r0, [r5]
	add r1, r1, #2
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl GetPartyMonByIndex
	add r4, r0, #0
	bl Pokemon_RemoveCapsule
	mov r2, #0x12
	ldr r0, [r5]
	lsl r2, r2, #4
	ldrh r2, [r5, r2]
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0202DB70
	ldr r1, _02240A74 ; =0x00000122
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl RemoveMonFromParty
	ldr r0, [r5]
	ldr r1, _02240A78 ; =0x000001B9
	ldr r0, [r0, #8]
	bl PartyHasMon
	cmp r0, #0
	bne _02240A62
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl Sav2_Chatot_get
	bl Chatot_invalidate
_02240A62:
	cmp r6, #0
	beq _02240A70
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0]
	bl sub_0202DB5C
_02240A70:
	pop {r4, r5, r6, pc}
	nop
_02240A74: .word 0x00000122
_02240A78: .word 0x000001B9
	thumb_func_end ov70_022409C0

	thumb_func_start ov70_02240A7C
ov70_02240A7C: ; 0x02240A7C
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	add r6, r3, #0
	bl GetMonData
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x20]
	bl UpdatePokedexWithReceivedSpecies
	mov r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #6
	bne _02240AB0
	mov r0, #0
	str r0, [sp, #0x20]
_02240AB0:
	cmp r6, #0
	beq _02240B2C
	mov r1, #0x46
	add r0, sp, #0
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _02240B98 ; =0x000001ED
	cmp r0, r1
	bne _02240B0E
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02240AF4
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	cmp r0, #0x56
	bne _02240B0E
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02240B0E
_02240AF4:
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl SavArray_Flags_get
	add r6, r0, #0
	bl ScriptState_GetVar404C
	cmp r0, #0
	bne _02240B0E
	add r0, r6, #0
	mov r1, #1
	bl ScriptState_SetVar404C
_02240B0E:
	add r0, r4, #0
	mov r1, #9
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl SetMonData
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0]
	bl ov70_02240CA0
_02240B2C:
	ldr r0, [sp, #0x20]
	cmp r0, #0x12
	bne _02240B54
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #8]
	bl AddMonToParty
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetPartyCount
	mov r1, #0x4d
	mov r2, #0x12
	lsl r1, r1, #2
	str r2, [r5, r1]
	sub r2, r0, #1
	add r0, r1, #4
	str r2, [r5, r0]
	b _02240B84
_02240B54:
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #0x20
	ldr r0, [r0, #0xc]
	add r2, sp, #4
	bl PCStorage_FindFirstEmptySlot
	add r0, r4, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl PCStorage_PlaceMonInBoxFirstEmptySlot
	mov r0, #0x4d
	ldr r1, [sp, #0x20]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [sp, #4]
	add r0, r0, #4
	str r1, [r5, r0]
_02240B84:
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0202DB5C
	add sp, #8
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_02240B98: .word 0x000001ED
	thumb_func_end ov70_02240A7C

	thumb_func_start ov70_02240B9C
ov70_02240B9C: ; 0x02240B9C
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #0x20]
	bl UpdatePokedexWithReceivedSpecies
	mov r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #6
	bne _02240BC2
	mov r0, #0
	str r0, [sp, #0x20]
_02240BC2:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _02240C9C ; =0x000001ED
	cmp r0, r1
	bne _02240C16
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02240BFC
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	cmp r0, #0x56
	bne _02240C16
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02240C16
_02240BFC:
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl SavArray_Flags_get
	add r6, r0, #0
	bl ScriptState_GetVar404C
	cmp r0, #0
	bne _02240C16
	add r0, r6, #0
	mov r1, #1
	bl ScriptState_SetVar404C
_02240C16:
	mov r1, #0x46
	add r0, sp, #0
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #9
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl SetMonData
	ldr r0, [sp, #0x20]
	cmp r0, #0x12
	bne _02240C58
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #8]
	bl AddMonToParty
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetPartyCount
	mov r1, #0x4d
	mov r2, #0x12
	lsl r1, r1, #2
	str r2, [r5, r1]
	sub r2, r0, #1
	add r0, r1, #4
	str r2, [r5, r0]
	b _02240C88
_02240C58:
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #0x20
	ldr r0, [r0, #0xc]
	add r2, sp, #4
	bl PCStorage_FindFirstEmptySlot
	add r0, r4, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl PCStorage_PlaceMonInBoxFirstEmptySlot
	mov r0, #0x4d
	ldr r1, [sp, #0x20]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [sp, #4]
	add r0, r0, #4
	str r1, [r5, r0]
_02240C88:
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0]
	bl ov70_02240CA0
	add sp, #8
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_02240C9C: .word 0x000001ED
	thumb_func_end ov70_02240B9C

	thumb_func_start ov70_02240CA0
ov70_02240CA0: ; 0x02240CA0
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0xc
	add r1, sp, #0
	bl ov00_021ECB94
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x10
	ldr r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r2, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r3, r3, #8
	orr r0, r3
	orr r0, r1
	add r1, r2, #0
	orr r1, r0
	cmp r4, #1
	bne _02240CD8
	add r0, r5, #0
	bl sub_0202DB98
	add sp, #0x1c
	pop {r4, r5, pc}
_02240CD8:
	add r0, r5, #0
	bl sub_0202DB88
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_02240CA0

	thumb_func_start ov70_02240CE4
ov70_02240CE4: ; 0x02240CE4
	push {r4, lr}
	ldr r3, _02240CFC ; =0x0000011E
	add r4, r1, #0
	add r2, r3, #1
	ldrb r1, [r4, r3]
	add r3, r3, #5
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	bl sub_02039FB8
	pop {r4, pc}
	nop
_02240CFC: .word 0x0000011E
	thumb_func_end ov70_02240CE4

	thumb_func_start ov70_02240D00
ov70_02240D00: ; 0x02240D00
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov70_0223E76C
	cmp r0, #0
	beq _02240D1E
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #6
	bne _02240D1E
	mov r0, #2
	pop {r4, pc}
_02240D1E:
	ldr r0, _02240D40 ; =0x000011F8
	ldrh r1, [r4, r0]
	mov r0, #0x87
	lsl r0, r0, #2
	cmp r1, r0
	bne _02240D3A
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #6
	bne _02240D3A
	mov r0, #1
	pop {r4, pc}
_02240D3A:
	mov r0, #0
	pop {r4, pc}
	nop
_02240D40: .word 0x000011F8
	thumb_func_end ov70_02240D00

	thumb_func_start ov70_02240D44
ov70_02240D44: ; 0x02240D44
	ldr r3, _02240D50 ; =0x000011D4
	strh r1, [r0, r3]
	add r1, r3, #2
	strh r2, [r0, r1]
	bx lr
	nop
_02240D50: .word 0x000011D4
	thumb_func_end ov70_02240D44

	thumb_func_start ov70_02240D54
ov70_02240D54: ; 0x02240D54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0202DB54
	cmp r0, #0
	bne _02240D6E
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _02240D6E
	mov r0, #1
	pop {r4, pc}
_02240D6E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02240D54

	thumb_func_start ov70_02240D74
ov70_02240D74: ; 0x02240D74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	add r4, r1, #0
	bl ov70_0224127C
	ldr r2, _02240ED8 ; =0x00000D84
	add r0, sp, #4
	add r1, r5, #0
	add r2, r5, r2
	mov r3, #2
	bl ov70_02238B54
	mov r0, #2
	str r0, [sp, #0x2c]
	lsl r0, r0, #0x12
	str r0, [sp, #0xc]
	ldr r0, _02240EDC ; =0x00182000
	str r0, [sp, #0x10]
	add r0, sp, #4
	bl CreateSprite
	ldr r1, _02240EE0 ; =0x00000EE4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02240EE0 ; =0x00000EE4
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_02024A04
	ldr r0, _02240EE0 ; =0x00000EE4
	mov r1, #7
	mul r1, r4
	ldr r0, [r5, r0]
	add r1, r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02240EE0 ; =0x00000EE4
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0
	ldr r6, _02240EE4 ; =ov70_02245D0A
	str r0, [sp]
	add r4, r5, #0
	mov r7, #0xe
_02240DD8:
	add r0, sp, #4
	bl CreateSprite
	ldr r1, _02240EE8 ; =0x00000EE8
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02240EE8 ; =0x00000EE8
	add r1, r7, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02240EE8 ; =0x00000EE8
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02240EE8 ; =0x00000EE8
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	ldr r0, [r4, r0]
	bl ov70_022410F0
	ldr r0, _02240EE8 ; =0x00000EE8
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, [sp]
	add r4, r4, #4
	add r0, r0, #1
	add r7, r7, #4
	add r6, r6, #4
	str r0, [sp]
	cmp r0, #7
	blt _02240DD8
	add r0, sp, #4
	bl CreateSprite
	ldr r1, _02240EEC ; =0x00000F0C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02240EEC ; =0x00000F0C
	mov r1, #0x2b
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02240EEC ; =0x00000F0C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02240EEC ; =0x00000F0C
	mov r1, #0x80
	ldr r0, [r5, r0]
	mov r2, #0x56
	bl ov70_022410F0
	ldr r0, _02240EEC ; =0x00000F0C
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024A04
	add r0, sp, #4
	bl CreateSprite
	mov r1, #0xf1
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2a
	bl Set2dSpriteAnimSeqNo
	mov r2, #0xf1
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, r2, #4
	ldr r3, [r5, r2]
	mov r2, #0x6a
	lsl r2, r2, #2
	mov r1, #0x37
	add r2, r3, r2
	bl ov70_02238F9C
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r7, _02240EF0 ; =0x0000120C
	mov r4, #0
	add r6, r7, #2
_02240EAA:
	ldr r0, _02240EE0 ; =0x00000EE4
	ldr r0, [r5, r0]
	bl sub_020248AC
	ldr r1, [r0]
	add r4, r4, #1
	asr r2, r1, #0xb
	lsr r2, r2, #0x14
	add r2, r1, r2
	asr r1, r2, #0xc
	strh r1, [r5, r7]
	ldr r1, [r0, #4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5, r6]
	add r5, r5, #4
	cmp r4, #8
	blt _02240EAA
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02240ED8: .word 0x00000D84
_02240EDC: .word 0x00182000
_02240EE0: .word 0x00000EE4
_02240EE4: .word ov70_02245D0A
_02240EE8: .word 0x00000EE8
_02240EEC: .word 0x00000F0C
_02240EF0: .word 0x0000120C
	thumb_func_end ov70_02240D74

	thumb_func_start ov70_02240EF4
ov70_02240EF4: ; 0x02240EF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov70_02240D74
	ldr r0, _02240F30 ; =ov70_02240F58
	mov r1, #0x10
	mov r2, #5
	mov r3, #0x3d
	bl sub_02007200
	ldr r1, _02240F34 ; =0x000011D8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0201F988
	mov r1, #0
	add r2, r1, #0
	str r1, [r0]
	sub r2, #0x28
	str r2, [r0, #4]
	str r4, [r0, #8]
	str r5, [r0, #0xc]
	bl ov70_02240F3C
	ldr r0, _02240F38 ; =0x0000062E
	bl PlaySE
	pop {r3, r4, r5, pc}
	nop
_02240F30: .word ov70_02240F58
_02240F34: .word 0x000011D8
_02240F38: .word 0x0000062E
	thumb_func_end ov70_02240EF4

	thumb_func_start ov70_02240F3C
ov70_02240F3C: ; 0x02240F3C
	add r3, r0, #0
	ldr r2, [r3, #0xc]
	ldr r0, _02240F50 ; =0x00000EE4
	ldr r3, [r3, #8]
	ldr r0, [r2, r0]
	mov r2, #7
	mul r2, r3
	ldr r3, _02240F54 ; =sub_020248F0
	add r1, r1, r2
	bx r3
	.balign 4, 0
_02240F50: .word 0x00000EE4
_02240F54: .word Set2dSpriteAnimSeqNo
	thumb_func_end ov70_02240F3C

	thumb_func_start ov70_02240F58
ov70_02240F58: ; 0x02240F58
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #3
	bhi _02240FF6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02240F72: ; jump table
	.short _02240F7A - _02240F72 - 2 ; case 0
	.short _02240FA0 - _02240F72 - 2 ; case 1
	.short _02240FBA - _02240F72 - 2 ; case 2
	.short _02240FE2 - _02240F72 - 2 ; case 3
_02240F7A:
	ldr r0, [r4, #4]
	cmp r0, #0xa0
	ble _02240F8E
	mov r0, #0xa0
	str r0, [r4, #4]
	mov r1, #1
	add r0, r4, #0
	str r1, [r4]
	bl ov70_02240F3C
_02240F8E:
	ldr r0, [r4, #4]
	mov r1, #0x80
	add r2, r0, #5
	ldr r0, _02240FF8 ; =0x00000EE4
	str r2, [r4, #4]
	ldr r0, [r5, r0]
	bl ov70_022410F0
	pop {r4, r5, r6, pc}
_02240FA0:
	ldr r0, _02240FF8 ; =0x00000EE4
	ldr r0, [r5, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _02240FF6
	add r0, r4, #0
	mov r1, #2
	bl ov70_02240F3C
	mov r0, #2
	str r0, [r4]
	pop {r4, r5, r6, pc}
_02240FBA:
	ldr r0, [r4, #4]
	cmp r0, #0x8a
	bgt _02240FD0
	mov r0, #0x8a
	str r0, [r4, #4]
	mov r1, #3
	add r0, r4, #0
	str r1, [r4]
	bl ov70_02240F3C
	b _02240FD4
_02240FD0:
	sub r0, r0, #2
	str r0, [r4, #4]
_02240FD4:
	ldr r0, _02240FF8 ; =0x00000EE4
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	mov r1, #0x80
	bl ov70_022410F0
	pop {r4, r5, r6, pc}
_02240FE2:
	ldr r0, _02240FFC ; =0x0000060C
	bl PlaySE
	ldr r1, [r4, #0xc]
	ldr r0, _02241000 ; =0x000011DC
	mov r2, #1
	strh r2, [r1, r0]
	add r0, r6, #0
	bl sub_02007234
_02240FF6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02240FF8: .word 0x00000EE4
_02240FFC: .word 0x0000060C
_02241000: .word 0x000011DC
	thumb_func_end ov70_02240F58

	thumb_func_start ov70_02241004
ov70_02241004: ; 0x02241004
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0224103C ; =ov70_02241048
	mov r1, #0x10
	mov r2, #5
	mov r3, #0x3d
	bl sub_02007200
	ldr r1, _02241040 ; =0x000011D8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0201F988
	mov r1, #0
	str r1, [r0]
	mov r1, #0x8a
	str r1, [r0, #4]
	str r4, [r0, #8]
	mov r1, #5
	str r5, [r0, #0xc]
	bl ov70_02240F3C
	ldr r0, _02241044 ; =0x0000060D
	bl PlaySE
	pop {r3, r4, r5, pc}
	nop
_0224103C: .word ov70_02241048
_02241040: .word 0x000011D8
_02241044: .word 0x0000060D
	thumb_func_end ov70_02241004

	thumb_func_start ov70_02241048
ov70_02241048: ; 0x02241048
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	ldr r5, [r4, #0xc]
	cmp r1, #3
	bhi _022410E0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02241060: ; jump table
	.short _02241068 - _02241060 - 2 ; case 0
	.short _02241090 - _02241060 - 2 ; case 1
	.short _022410B0 - _02241060 - 2 ; case 2
	.short _022410D6 - _02241060 - 2 ; case 3
_02241068:
	ldr r0, [r4, #4]
	cmp r0, #0xa0
	ble _0224107E
	mov r0, #0xa0
	str r0, [r4, #4]
	mov r0, #1
	str r0, [r4]
	add r0, r4, #0
	mov r1, #6
	bl ov70_02240F3C
_0224107E:
	ldr r0, [r4, #4]
	mov r1, #0x80
	add r2, r0, #2
	ldr r0, _022410E4 ; =0x00000EE4
	str r2, [r4, #4]
	ldr r0, [r5, r0]
	bl ov70_022410F0
	pop {r3, r4, r5, pc}
_02241090:
	ldr r0, _022410E4 ; =0x00000EE4
	ldr r0, [r5, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _022410E0
	add r0, r4, #0
	mov r1, #0
	bl ov70_02240F3C
	mov r0, #2
	str r0, [r4]
	ldr r0, _022410E8 ; =0x0000062F
	bl PlaySE
	pop {r3, r4, r5, pc}
_022410B0:
	mov r0, #0x13
	ldr r1, [r4, #4]
	mvn r0, r0
	cmp r1, r0
	bge _022410C4
	mov r1, #3
	add r0, r4, #0
	str r1, [r4]
	bl ov70_02240F3C
_022410C4:
	ldr r0, [r4, #4]
	mov r1, #0x80
	sub r2, r0, #5
	ldr r0, _022410E4 ; =0x00000EE4
	str r2, [r4, #4]
	ldr r0, [r5, r0]
	bl ov70_022410F0
	pop {r3, r4, r5, pc}
_022410D6:
	ldr r1, _022410EC ; =0x000011DC
	mov r2, #1
	strh r2, [r5, r1]
	bl sub_02007234
_022410E0:
	pop {r3, r4, r5, pc}
	nop
_022410E4: .word 0x00000EE4
_022410E8: .word 0x0000062F
_022410EC: .word 0x000011DC
	thumb_func_end ov70_02241048

	thumb_func_start ov70_022410F0
ov70_022410F0: ; 0x022410F0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #0
	ble _0224110E
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224111C
_0224110E:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224111C:
	bl _ffix
	sub r5, #8
	str r0, [sp]
	cmp r5, #0
	ble _0224113A
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02241148
_0224113A:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02241148:
	bl _ffix
	mov r1, #1
	lsl r1, r1, #0x14
	add r0, r0, r1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov70_022410F0

	thumb_func_start ov70_02241164
ov70_02241164: ; 0x02241164
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02241180 ; =ov70_02245D26
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0224117A
	cmp r0, r4
	blt _0224117E
_0224117A:
	mov r0, #0
	mvn r0, r0
_0224117E:
	pop {r4, pc}
	.balign 4, 0
_02241180: .word ov70_02245D26
	thumb_func_end ov70_02241164

	thumb_func_start ov70_02241184
ov70_02241184: ; 0x02241184
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	add r0, r1, #0
	beq _0224119E
	add r0, r2, #0
	cmp r0, #1
	bne _0224119E
	ldr r0, _02241218 ; =0x0000064E
	bl PlaySE
_0224119E:
	ldr r4, [sp, #4]
	mov r0, #0xe
	mov r6, #0
	str r0, [sp, #0x10]
	add r5, r4, #0
	mov r7, #0x11
_022411AA:
	ldr r0, [sp, #8]
	cmp r6, r0
	bge _022411F4
	ldr r0, _0224121C ; =0x00000356
	ldr r1, [sp, #4]
	ldrb r0, [r4, r0]
	mov r3, #0xe
	add r2, r1, #0
	str r0, [sp]
	ldr r0, _02241220 ; =0x000011E4
	lsl r3, r3, #6
	ldr r0, [r1, r0]
	ldr r1, _02241224 ; =0x000011EC
	ldrb r3, [r4, r3]
	ldr r1, [r2, r1]
	add r2, r6, #0
	bl ov70_022412C8
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ldr r0, _02241228 ; =0x00000EE8
	beq _022411E0
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x10]
	bl Set2dSpriteAnimSeqNo
	b _022411E8
_022411E0:
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
_022411E8:
	ldr r0, _02241228 ; =0x00000EE8
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	b _022411FE
_022411F4:
	ldr r0, _02241228 ; =0x00000EE8
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
_022411FE:
	mov r0, #0x49
	lsl r0, r0, #2
	add r4, r4, r0
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r0, r0, #4
	str r0, [sp, #0x10]
	add r5, r5, #4
	add r7, r7, #4
	cmp r6, #7
	blt _022411AA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241218: .word 0x0000064E
_0224121C: .word 0x00000356
_02241220: .word 0x000011E4
_02241224: .word 0x000011EC
_02241228: .word 0x00000EE8
	thumb_func_end ov70_02241184

	thumb_func_start ov70_0224122C
ov70_0224122C: ; 0x0224122C
	lsl r0, r0, #2
	add r0, #0xe
	bx lr
	.balign 4, 0
	thumb_func_end ov70_0224122C

	thumb_func_start ov70_02241234
ov70_02241234: ; 0x02241234
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02241278 ; =0x00000EE8
	add r5, r0, #0
	mov r4, #0
_0224123C:
	ldr r0, [r5, r7]
	bl sub_020248B8
	cmp r0, #0
	beq _0224126E
	ldr r0, _02241278 ; =0x00000EE8
	ldr r0, [r5, r0]
	bl sub_020249A8
	add r6, r0, #0
	add r0, r4, #0
	bl ov70_0224122C
	add r0, r0, #1
	cmp r6, r0
	beq _0224126E
	add r0, r4, #0
	bl ov70_0224122C
	add r1, r0, #0
	ldr r0, _02241278 ; =0x00000EE8
	add r1, r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
_0224126E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _0224123C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241278: .word 0x00000EE8
	thumb_func_end ov70_02241234

	thumb_func_start ov70_0224127C
ov70_0224127C: ; 0x0224127C
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _022412BC ; =0x000011EC
	add r4, r0, #0
	mov r0, #0x54
	mov r1, #0xb
	add r2, r4, r2
	mov r3, #0x3d
	bl GfGfxLoader_GetPlttData
	ldr r3, _022412C0 ; =0x000011E8
	mov r1, #0xc
	str r0, [r4, r3]
	mov r0, #0x3d
	sub r3, r3, #4
	str r0, [sp]
	mov r0, #0x54
	mov r2, #1
	add r3, r4, r3
	bl GfGfxLoader_GetCharData
	ldr r1, _022412C4 ; =0x000011E0
	str r0, [r4, r1]
	add r0, r1, #4
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r1, r1, #0xe
	bl DC_FlushRange
	add sp, #4
	pop {r3, r4, pc}
	nop
_022412BC: .word 0x000011EC
_022412C0: .word 0x000011E8
_022412C4: .word 0x000011E0
	thumb_func_end ov70_0224127C

	thumb_func_start ov70_022412C8
ov70_022412C8: ; 0x022412C8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x18]
	add r1, r3, #0
	add r5, r2, #0
	bl sub_0205B464
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #8
	ldr r1, [r7, #0x14]
	mul r0, r4
	add r0, r1, r0
	ldr r1, _02241304 ; =ov70_02245CFC
	lsl r2, r5, #1
	ldrh r1, [r1, r2]
	mov r2, #2
	ldr r6, [r6, #0xc]
	lsl r2, r2, #8
	bl GXS_LoadOBJ
	lsl r0, r4, #5
	add r1, r5, #2
	add r0, r6, r0
	lsl r1, r1, #5
	mov r2, #0x20
	bl GXS_LoadOBJPltt
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241304: .word ov70_02245CFC
	thumb_func_end ov70_022412C8

	thumb_func_start ov70_02241308
ov70_02241308: ; 0x02241308
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02241328 ; =0x000011DC
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _02241324
	add r0, #0xc
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _0224132C ; =0x000011E0
	ldr r0, [r4, r0]
	bl FreeToHeap
_02241324:
	pop {r4, pc}
	nop
_02241328: .word 0x000011DC
_0224132C: .word 0x000011E0
	thumb_func_end ov70_02241308

	thumb_func_start ov70_02241330
ov70_02241330: ; 0x02241330
	push {r4, lr}
	lsl r4, r1, #2
	ldr r1, _0224134C ; =0x00000F0C
	ldr r3, _02241350 ; =ov70_02245D0C
	ldr r0, [r0, r1]
	ldr r1, _02241354 ; =ov70_02245D0A
	ldrh r3, [r3, r4]
	ldrh r1, [r1, r4]
	add r3, #0x20
	add r2, r2, r3
	bl ov70_022410F0
	pop {r4, pc}
	nop
_0224134C: .word 0x00000F0C
_02241350: .word ov70_02245D0C
_02241354: .word ov70_02245D0A
	thumb_func_end ov70_02241330

	thumb_func_start ov70_02241358
ov70_02241358: ; 0x02241358
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02241378 ; =0x0000120C
	add r5, r0, #0
	mov r4, #0
	add r6, r7, #2
_02241362:
	ldr r0, _0224137C ; =0x00000EE4
	ldrsh r1, [r5, r7]
	ldrsh r2, [r5, r6]
	ldr r0, [r5, r0]
	bl ov70_02238F9C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02241362
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241378: .word 0x0000120C
_0224137C: .word 0x00000EE4
	thumb_func_end ov70_02241358

	thumb_func_start ov70_02241380
ov70_02241380: ; 0x02241380
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _022413A4 ; =0x0000120C
	add r5, r0, #0
	mov r4, #0
	add r6, r7, #2
_0224138A:
	ldr r0, _022413A8 ; =0x00000EE4
	ldrsh r2, [r5, r6]
	ldrsh r1, [r5, r7]
	ldr r0, [r5, r0]
	add r2, #0x20
	bl ov70_02238F9C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _0224138A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022413A4: .word 0x0000120C
_022413A8: .word 0x00000EE4
	thumb_func_end ov70_02241380

	thumb_func_start ov70_022413AC
ov70_022413AC: ; 0x022413AC
	push {r4, lr}
	mov r3, #0x12
	add r4, r0, #0
	lsl r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	add r1, r4, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r4, #0
	mov r1, #2
	add r0, #0xcd
	strb r1, [r0]
	add r0, r4, #0
	mov r2, #1
	add r0, #0xcf
	strb r2, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xce
	strb r2, [r0]
	add r0, r4, #0
	add r0, #0xd4
	strh r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl sub_02088288
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
	ldr r0, [r4]
	ldr r1, [r0, #0x30]
	add r0, r4, #0
	add r0, #0xd8
	str r1, [r0]
	ldr r0, [r4]
	ldr r1, [r0, #0x24]
	add r0, r4, #0
	add r0, #0xc0
	str r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl Save_SpecialRibbons_get
	add r1, r4, #0
	add r1, #0xdc
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl sub_0208828C
	add r1, r4, #0
	add r1, #0xf0
	str r0, [r1]
	add r0, r4, #0
	ldr r1, _02241460 ; =ov70_02245D48
	add r0, #0xbc
	bl sub_02089D40
	ldr r1, [r4]
	add r0, r4, #0
	ldr r1, [r1, #0x1c]
	add r0, #0xbc
	bl sub_0208AD34
	add r1, r4, #0
	ldr r0, _02241464 ; =_02103A1C
	add r1, #0xbc
	mov r2, #0x3d
	bl OverlayManager_new
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	mov r0, #0x45
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_02241460: .word ov70_02245D48
_02241464: .word _02103A1C
	thumb_func_end ov70_022413AC

	thumb_func_start ov70_02241468
ov70_02241468: ; 0x02241468
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r4, #3
	bl OverlayManager_run
	cmp r0, #0
	beq _02241490
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl OverlayManager_delete
	ldr r2, [r5, #0x24]
	add r0, r5, #0
	mov r1, #5
	bl ov70_02238E50
	mov r4, #4
_02241490:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02241468

	thumb_func_start ov70_02241494
ov70_02241494: ; 0x02241494
	push {r3, lr}
	bl ov70_02238E58
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov70_02241494

	thumb_func_start ov70_022414A0
ov70_022414A0: ; 0x022414A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3d
	bl AllocMonZeroed
	ldr r1, _02241640 ; =0x000011F0
	str r0, [r4, r1]
	ldr r0, [r4, #0x24]
	cmp r0, #0xa
	bls _022414B6
	b _02241618
_022414B6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022414C2: ; jump table
	.short _02241618 - _022414C2 - 2 ; case 0
	.short _02241618 - _022414C2 - 2 ; case 1
	.short _02241618 - _022414C2 - 2 ; case 2
	.short _02241618 - _022414C2 - 2 ; case 3
	.short _02241618 - _022414C2 - 2 ; case 4
	.short _02241618 - _022414C2 - 2 ; case 5
	.short _02241618 - _022414C2 - 2 ; case 6
	.short _022414D8 - _022414C2 - 2 ; case 7
	.short _0224151C - _022414C2 - 2 ; case 8
	.short _022415B2 - _022414C2 - 2 ; case 9
	.short _02241560 - _022414C2 - 2 ; case 10
_022414D8:
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl Mon_GetBoxMon
	add r1, r4, #0
	add r1, #0xf8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xf8
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0xfc
	str r1, [r0]
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_0224182C
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x30
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	sub r0, #0x2c
	str r2, [r4, r0]
	mov r0, #2
	sub r1, #0x28
	str r0, [r4, r1]
	b _02241618
_0224151C:
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl Mon_GetBoxMon
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xfc
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0xf8
	str r1, [r0]
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_0224182C
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x30
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	sub r0, #0x2c
	str r2, [r4, r0]
	mov r0, #4
	sub r1, #0x28
	str r0, [r4, r1]
	b _02241618
_02241560:
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl Mon_GetBoxMon
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
	ldr r0, [r4]
	ldr r1, _02241640 ; =0x000011F0
	ldr r0, [r0]
	ldr r1, [r4, r1]
	bl sub_0202DB64
	ldr r0, _02241640 ; =0x000011F0
	ldr r0, [r4, r0]
	bl Mon_GetBoxMon
	add r1, r4, #0
	add r1, #0xf8
	str r0, [r1]
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov70_0224182C
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x30
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	sub r0, #0x2c
	str r2, [r4, r0]
	mov r0, #1
	sub r1, #0x28
	str r0, [r4, r1]
	b _02241618
_022415B2:
	ldr r0, [r4]
	ldr r1, [r4, r1]
	ldr r0, [r0]
	bl sub_0202DB64
	ldr r0, _02241640 ; =0x000011F0
	ldr r0, [r4, r0]
	bl Mon_GetBoxMon
	add r1, r4, #0
	add r1, #0xf8
	str r0, [r1]
	mov r0, #0x26
	lsl r0, r0, #4
	add r2, r4, r0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #8
	mul r0, r1
	add r0, r2, r0
	bl Mon_GetBoxMon
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
	mov r0, #0x26
	lsl r0, r0, #4
	add r2, r4, r0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #8
	mul r0, r1
	add r0, r2, r0
	bl ov70_0224182C
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x30
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	sub r0, #0x2c
	str r2, [r4, r0]
	mov r0, #1
	sub r1, #0x28
	str r0, [r4, r1]
_02241618:
	ldr r0, [r4]
	mov r2, #0x3d
	ldr r1, [r0, #0x24]
	mov r0, #0x43
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r1, r4, #0
	ldr r0, _02241644 ; =ov70_02245D50
	add r1, #0xf8
	bl OverlayManager_new
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	mov r0, #0x45
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_02241640: .word 0x000011F0
_02241644: .word ov70_02245D50
	thumb_func_end ov70_022414A0

	thumb_func_start ov70_02241648
ov70_02241648: ; 0x02241648
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5, #0x2c]
	mov r4, #3
	cmp r0, #0
	beq _0224165E
	cmp r0, #1
	bne _0224165C
	b _022417C8
_0224165C:
	b _022417FE
_0224165E:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl OverlayManager_run
	cmp r0, #0
	bne _0224166E
	b _022417FE
_0224166E:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl OverlayManager_delete
	ldr r1, [r5, #0x24]
	cmp r1, #9
	bne _022416E8
	add r0, r5, #0
	bl ov70_02241868
	mov r1, #6
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	add r3, r0, #0
	add r0, sp, #0x28
	lsl r3, r3, #0x10
	str r0, [sp]
	mov r0, #0
	add r1, r6, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl GetMonEvolution
	add r2, r0, #0
	beq _022416DA
	ldr r3, [r5]
	add r1, r6, #0
	ldr r0, [r3, #0x38]
	str r0, [sp]
	ldr r0, [r3, #0x10]
	str r0, [sp, #4]
	ldr r0, [r3, #0x2c]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #0x3d
	str r0, [sp, #0x18]
	ldr r3, [r3, #0x24]
	mov r0, #0
	bl sub_02075A7C
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #1
	str r0, [r5, #0x2c]
	b _022417FE
_022416DA:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r4, #4
	b _022417FE
_022416E8:
	cmp r1, #8
	beq _022416F0
	cmp r1, #0xa
	bne _022417BA
_022416F0:
	add r0, r5, #0
	bl ov70_02241868
	add r6, r0, #0
	mov r0, #0x3d
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0]
	bl sub_0202DB64
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	bne _02241742
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	mov r1, #0
	str r0, [sp, #0x20]
	add r0, r7, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, [sp, #0x20]
	cmp r1, r0
	beq _022417A6
_02241742:
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	add r0, sp, #0x24
	lsl r3, r3, #0x10
	str r0, [sp]
	mov r0, #0
	add r1, r6, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl GetMonEvolution
	add r2, r0, #0
	beq _02241798
	ldr r3, [r5]
	add r1, r6, #0
	ldr r0, [r3, #0x38]
	str r0, [sp]
	ldr r0, [r3, #0x10]
	str r0, [sp, #4]
	ldr r0, [r3, #0x2c]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #0x3d
	str r0, [sp, #0x18]
	ldr r3, [r3, #0x24]
	mov r0, #0
	bl sub_02075A7C
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #1
	str r0, [r5, #0x2c]
	b _022417B2
_02241798:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r4, #4
	b _022417B2
_022417A6:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r4, #4
_022417B2:
	add r0, r7, #0
	bl FreeToHeap
	b _022417FE
_022417BA:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r4, #4
	b _022417FE
_022417C8:
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02075D3C
	cmp r0, #0
	beq _022417FE
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02075D4C
	add r0, r5, #0
	bl ov70_022418A4
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02241804 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	add r0, r5, #0
	mov r1, #7
	mov r2, #0xc
	bl ov70_02238E50
	mov r4, #4
_022417FE:
	add r0, r4, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241804: .word 0xFFFF1FFF
	thumb_func_end ov70_02241648

	thumb_func_start ov70_02241808
ov70_02241808: ; 0x02241808
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02241828 ; =0x000011F0
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl ov70_02238E58
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02241828: .word 0x000011F0
	thumb_func_end ov70_02241808

	thumb_func_start ov70_0224182C
ov70_0224182C: ; 0x0224182C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x3d
	bl PlayerProfile_new
	add r4, r0, #0
	bl PlayerProfile_init
	mov r1, #0x43
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r5, r1
	bl Sav2_Profile_PlayerName_set
	ldr r1, _02241860 ; =0x00000122
	add r0, r4, #0
	ldrb r1, [r5, r1]
	bl PlayerProfile_SetVersion
	ldr r1, _02241864 ; =0x00000123
	add r0, r4, #0
	ldrb r1, [r5, r1]
	bl PlayerProfile_SetLanguage
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02241860: .word 0x00000122
_02241864: .word 0x00000123
	thumb_func_end ov70_0224182C

	thumb_func_start ov70_02241868
ov70_02241868: ; 0x02241868
	push {r3, lr}
	cmp r1, #9
	bne _02241882
	mov r1, #0x26
	lsl r1, r1, #4
	add r2, r0, r1
	mov r1, #0x4b
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	sub r1, #8
	mul r1, r0
	add r0, r2, r1
	pop {r3, pc}
_02241882:
	cmp r1, #0xa
	bne _0224188E
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
_0224188E:
	cmp r1, #8
	bne _0224189A
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
_0224189A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov70_02241868

	thumb_func_start ov70_022418A4
ov70_022418A4: ; 0x022418A4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r1, [r5, #0x24]
	bl ov70_02241868
	mov r2, #0x4d
	lsl r2, r2, #2
	add r4, r0, #0
	ldr r0, [r5, r2]
	cmp r0, #0x12
	bne _022418D4
	ldr r0, [r5]
	add r1, r2, #4
	ldr r0, [r0, #8]
	ldr r1, [r5, r1]
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r4, #0
	bl CopyPokemonToPokemon
	add sp, #8
	pop {r3, r4, r5, pc}
_022418D4:
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, r2]
	add r2, r2, #4
	ldr r0, [r0, #0xc]
	ldr r2, [r5, r2]
	bl PCStorage_DeleteBoxMonByIndexPair
	ldr r0, [r5]
	add r1, sp, #4
	ldr r0, [r0, #0xc]
	add r2, sp, #0
	bl PCStorage_FindFirstEmptySlot
	add r0, r4, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5]
	ldr r1, [sp, #4]
	ldr r0, [r0, #0xc]
	bl PCStorage_PlaceMonInBoxFirstEmptySlot
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_022418A4

	thumb_func_start ov70_0224190C
ov70_0224190C: ; 0x0224190C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r0, #0
	cmp r1, #6
	bls _02241918
	b _02241DAA
_02241918:
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241924: ; jump table
	.short _02241A58 - _02241924 - 2 ; case 0
	.short _02241C60 - _02241924 - 2 ; case 1
	.short _02241D00 - _02241924 - 2 ; case 2
	.short _02241BB2 - _02241924 - 2 ; case 3
	.short _02241932 - _02241924 - 2 ; case 4
	.short _022419B2 - _02241924 - 2 ; case 5
	.short _02241B06 - _02241924 - 2 ; case 6
_02241932:
	mov r0, #0
	ldr r6, _02241C68 ; =ov70_02245E0E
	str r0, [sp, #0x28]
	mov r7, #0x30
	add r5, r0, #0
_0224193C:
	ldrb r0, [r6, #1]
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x28]
	add r7, r7, #6
	add r0, r0, #1
	add r6, r6, #2
	add r5, #0x10
	str r0, [sp, #0x28]
	cmp r0, #9
	blt _0224193C
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C ; =0x0000012F
	mov r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_022419B2:
	mov r1, #2
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r3, #1
	str r3, [sp, #0xc]
	mov r0, #0x30
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r0, [r4]
	lsl r2, r2, #0x18
	ldr r1, [r4, #4]
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	bl FillWindowPixelBuffer
	ldr r6, _02241C70 ; =ov70_02245E10
	mov r7, #1
	mov r5, #0x10
_022419E0:
	sub r0, r6, #1
	ldrb r0, [r0]
	sub r3, r6, #2
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	sub r0, r7, #1
	lsl r0, r0, #2
	add r0, #0x36
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, r6, #2
	add r5, #0x10
	cmp r7, #4
	blt _022419E0
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C ; =0x0000012F
	mov r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241A58:
	mov r0, #0
	ldr r6, _02241C74 ; =ov70_02245DA2
	str r0, [sp, #0x14]
	mov r7, #0x30
	add r5, r0, #0
_02241A62:
	ldrb r0, [r6, #1]
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r7, #0x10
	add r0, r0, #1
	add r6, r6, #3
	add r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02241A62
	mov r0, #0xe
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x70
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0x40
	lsr r2, r2, #0x18
	mov r3, #6
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C ; =0x0000012F
	mov r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241B06:
	mov r0, #0
	ldr r6, _02241C68 ; =ov70_02245E0E
	str r0, [sp, #0x18]
	mov r7, #0x30
	add r5, r0, #0
_02241B10:
	ldrb r0, [r6, #1]
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x18]
	add r7, r7, #6
	add r0, r0, #1
	add r6, r6, #2
	add r5, #0x10
	str r0, [sp, #0x18]
	cmp r0, #9
	blt _02241B10
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C ; =0x0000012F
	mov r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
	mov r3, #2
	str r3, [sp]
	mov r0, #9
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x66
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xf0
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xf0
	bl FillWindowPixelBuffer
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241BB2:
	mov r0, #0
	ldr r6, _02241C78 ; =ov70_02245D96
	str r0, [sp, #0x1c]
	mov r7, #0x30
	add r5, r0, #0
_02241BBC:
	ldrb r0, [r6, #1]
	str r0, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x1c]
	add r7, #0x2e
	add r0, r0, #1
	add r6, r6, #2
	add r5, #0x10
	str r0, [sp, #0x1c]
	cmp r0, #5
	blt _02241BBC
	mov r0, #0x10
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _02241C7C ; =0x00000116
	mov r3, #0xd
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0x50
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C ; =0x0000012F
	mov r3, #0x18
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241C60:
	mov r0, #0
	ldr r6, _02241C80 ; =ov70_02245D60
	b _02241C84
	nop
_02241C68: .word ov70_02245E0E
_02241C6C: .word 0x0000012F
_02241C70: .word ov70_02245E10
_02241C74: .word ov70_02245DA2
_02241C78: .word ov70_02245D96
_02241C7C: .word 0x00000116
_02241C80: .word ov70_02245D60
_02241C84:
	str r0, [sp, #0x20]
	mov r7, #0x30
	add r5, r0, #0
_02241C8A:
	ldrb r0, [r6, #1]
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x20]
	add r7, #0x10
	add r0, r0, #1
	add r6, r6, #2
	add r5, #0x10
	str r0, [sp, #0x20]
	cmp r0, #3
	blt _02241C8A
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x60
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	mov r3, #9
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241D00:
	mov r0, #0
	ldr r6, _02241DB0 ; =ov70_02245D6E
	str r0, [sp, #0x24]
	mov r7, #0x30
	add r5, r0, #0
_02241D0A:
	ldrb r0, [r6, #1]
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	add r1, r1, r5
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x24]
	add r7, #0x16
	add r0, r0, #1
	add r6, r6, #2
	add r5, #0x10
	str r0, [sp, #0x24]
	cmp r0, #4
	blt _02241D0A
	mov r0, #0xe
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x88
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0x40
	lsr r2, r2, #0x18
	mov r3, #6
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x11
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0xa1
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x18
	ldr r0, [r4]
	add r1, #0xe0
	lsr r2, r2, #0x18
	mov r3, #9
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0x22
	add r0, #0xe0
	bl FillWindowPixelBuffer
_02241DAA:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02241DB0: .word ov70_02245D6E
	thumb_func_end ov70_0224190C

	thumb_func_start ov70_02241DB4
ov70_02241DB4: ; 0x02241DB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r2, sp, #0x10
	add r5, r1, #0
	ldr r0, [r4, #0x1c]
	mov r1, #0
	add r2, #1
	add r3, sp, #0x10
	bl sub_02019B1C
	cmp r5, #6
	bls _02241DD0
	b _02242010
_02241DD0:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241DDC: ; jump table
	.short _02241EA6 - _02241DDC - 2 ; case 0
	.short _02241FD4 - _02241DDC - 2 ; case 1
	.short _02241FF4 - _02241DDC - 2 ; case 2
	.short _02241F6A - _02241DDC - 2 ; case 3
	.short _02241DEA - _02241DDC - 2 ; case 4
	.short _02241E48 - _02241DDC - 2 ; case 5
	.short _02241F04 - _02241DDC - 2 ; case 6
_02241DEA:
	mov r6, #0
	add r5, r6, #0
	mov r7, #0x22
_02241DF0:
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #9
	blt _02241DF0
	add r0, sp, #0x10
	mov r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241E3C
	str r1, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	mov r2, #5
	mov r3, #0x11
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
_02241E3C:
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241E48:
	mov r6, #0
	add r5, r6, #0
	mov r7, #0x22
_02241E4E:
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #4
	blt _02241E4E
	add r0, sp, #0x10
	mov r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241E9A
	str r1, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	mov r2, #5
	mov r3, #0x11
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
_02241E9A:
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241EA6:
	mov r6, #0
	add r5, r6, #0
	mov r7, #0x22
_02241EAC:
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #5
	blt _02241EAC
	add r0, sp, #0x10
	mov r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241EF8
	str r1, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	mov r2, #5
	mov r3, #0x11
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
_02241EF8:
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241F04:
	mov r6, #0
	add r5, r6, #0
	mov r7, #0x22
_02241F0A:
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #9
	blt _02241F0A
	add r0, sp, #0x10
	mov r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241F56
	str r1, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	mov r2, #5
	mov r3, #0x11
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
_02241F56:
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
	ldr r0, [r4, #4]
	add r0, #0xf0
	bl RemoveWindow
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241F6A:
	mov r6, #0
	add r5, r6, #0
	mov r7, #0x22
_02241F70:
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #6
	blt _02241F70
	add r0, sp, #0x10
	mov r1, #1
	ldrsb r0, [r0, r1]
	sub r0, #0x10
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02241FC8
	str r1, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xf
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	mov r2, #5
	mov r3, #0x12
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
_02241FC8:
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241FD4:
	mov r6, #0
	add r5, r6, #0
_02241FD8:
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #3
	blt _02241FD8
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241FF4:
	mov r6, #0
	add r5, r6, #0
_02241FF8:
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #5
	blt _02241FF8
	ldr r0, [r4, #4]
	add r0, #0xe0
	bl RemoveWindow
_02242010:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov70_02241DB4

	thumb_func_start ov70_02242014
ov70_02242014: ; 0x02242014
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x3d
	mov r1, #0x80
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
	ldr r0, [r5, #4]
	mov r2, #1
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	mov r3, #0x3d
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x10]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x20]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x2c]
	ldr r0, [r5, #0x28]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x30]
	str r6, [r4, #0x54]
	str r7, [r4, #0x60]
	strh r1, [r4, #0x3c]
	add r0, r4, #0
	strh r1, [r4, #0x3e]
	add r0, #0x40
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x42
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x44
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x45
	strb r1, [r0]
	add r0, r4, #0
	str r1, [r4, #0x48]
	add r0, #0x7e
	strb r1, [r0]
	str r1, [r4, #0x4c]
	ldr r0, [r4]
	mov r1, #2
	bl sub_0201956C
	str r0, [r4, #0x1c]
	mov r0, #0x14
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #2
	mov r3, #0x20
	bl sub_020195F4
	ldr r0, [r4, #0xc]
	mov r1, #0x88
	mov r2, #0x28
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xf
	mov r1, #0xe
	mov r2, #2
	mov r3, #0x3d
	bl MessagePrinter_new
	str r0, [r4, #0x38]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov70_02242014

	thumb_func_start ov70_022420C4
ov70_022420C4: ; 0x022420C4
	add r2, r0, #0
	add r2, #0x58
	strh r1, [r2]
	cmp r1, #3
	bhi _02242128
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022420DA: ; jump table
	.short _022420E2 - _022420DA - 2 ; case 0
	.short _0224210A - _022420DA - 2 ; case 1
	.short _0224211A - _022420DA - 2 ; case 2
	.short _022420F6 - _022420DA - 2 ; case 3
_022420E2:
	mov r2, #0
	add r1, r0, #0
	str r2, [r0, #0x48]
	add r1, #0x7e
	strb r2, [r1]
	strh r2, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	mov r1, #4
	str r1, [r0, #0x4c]
	bx lr
_022420F6:
	mov r2, #0
	add r1, r0, #0
	str r2, [r0, #0x48]
	add r1, #0x7e
	strb r2, [r1]
	strh r2, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	mov r1, #0x10
	str r1, [r0, #0x4c]
	bx lr
_0224210A:
	mov r2, #0
	add r1, r0, #0
	str r2, [r0, #0x48]
	add r1, #0x7e
	strb r2, [r1]
	mov r1, #0x1c
	str r1, [r0, #0x4c]
	bx lr
_0224211A:
	mov r2, #0
	add r1, r0, #0
	str r2, [r0, #0x48]
	add r1, #0x7e
	strb r2, [r1]
	mov r1, #0x1f
	str r1, [r0, #0x4c]
_02242128:
	bx lr
	.balign 4, 0
	thumb_func_end ov70_022420C4

	thumb_func_start ov70_0224212C
ov70_0224212C: ; 0x0224212C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	bl MessagePrinter_delete
	ldr r0, [r4, #0x1c]
	bl sub_020195C0
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov70_0224212C

	thumb_func_start ov70_02242144
ov70_02242144: ; 0x02242144
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x4c]
	lsl r2, r1, #2
	ldr r1, _02242160 ; =ov70_022466F8
	ldr r1, [r1, r2]
	blx r1
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02019934
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	nop
_02242160: .word ov70_022466F8
	thumb_func_end ov70_02242144

	thumb_func_start ov70_02242164
ov70_02242164: ; 0x02242164
	push {r3, lr}
	cmp r1, #7
	bhi _022421B4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02242176: ; jump table
	.short _02242196 - _02242176 - 2 ; case 0
	.short _0224219E - _02242176 - 2 ; case 1
	.short _02242196 - _02242176 - 2 ; case 2
	.short _022421A6 - _02242176 - 2 ; case 3
	.short _02242186 - _02242176 - 2 ; case 4
	.short _022421AE - _02242176 - 2 ; case 5
	.short _0224218E - _02242176 - 2 ; case 6
	.short _022421AE - _02242176 - 2 ; case 7
_02242186:
	ldr r0, _022421B8 ; =ov70_02245ED0
	bl sub_02025224
	pop {r3, pc}
_0224218E:
	ldr r0, _022421BC ; =ov70_02245F28
	bl sub_02025224
	pop {r3, pc}
_02242196:
	ldr r0, _022421C0 ; =ov70_02245E3E
	bl sub_02025224
	pop {r3, pc}
_0224219E:
	ldr r0, _022421C4 ; =ov70_02245DD0
	bl sub_02025224
	pop {r3, pc}
_022421A6:
	ldr r0, _022421C8 ; =ov70_02245E5E
	bl sub_02025224
	pop {r3, pc}
_022421AE:
	ldr r0, _022421CC ; =ov70_02245DE4
	bl sub_02025224
_022421B4:
	pop {r3, pc}
	nop
_022421B8: .word ov70_02245ED0
_022421BC: .word ov70_02245F28
_022421C0: .word ov70_02245E3E
_022421C4: .word ov70_02245DD0
_022421C8: .word ov70_02245E5E
_022421CC: .word ov70_02245DE4
	thumb_func_end ov70_02242164

	thumb_func_start ov70_022421D0
ov70_022421D0: ; 0x022421D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x48]
	cmp r1, #9
	bge _022421E0
	add r0, #0x7e
	strb r1, [r0]
_022421E0:
	ldr r0, _02242344 ; =gSystem
	mov r2, #0x40
	ldr r0, [r0, #0x4c]
	tst r2, r0
	beq _022421F6
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242348 ; =ov70_02245EA8
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _0224222A
_022421F6:
	mov r2, #0x80
	tst r2, r0
	beq _02242208
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _0224234C ; =ov70_02245EA9
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _0224222A
_02242208:
	mov r2, #0x20
	tst r2, r0
	beq _0224221A
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242350 ; =ov70_02245EAA
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _0224222A
_0224221A:
	mov r2, #0x10
	tst r0, r2
	beq _0224222A
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242354 ; =ov70_02245EAB
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
_0224222A:
	cmp r1, #9
	blt _02242282
	ldr r0, [r5, #0x48]
	cmp r0, #9
	bge _02242282
	ldr r0, _02242344 ; =gSystem
	ldr r2, [r0, #0x4c]
	mov r0, #0x40
	tst r0, r2
	beq _02242260
	add r0, r5, #0
	add r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	add r0, r0, #4
	cmp r0, #9
	bge _02242282
	add r0, r5, #0
	add r0, #0x48
_02242250:
	ldr r2, [r0]
	add r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	add r2, r2, #4
	cmp r2, #9
	blt _02242250
	b _02242282
_02242260:
	mov r0, #0x80
	tst r0, r2
	beq _02242282
	add r0, r5, #0
	add r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	sub r0, r0, #4
	bmi _02242282
	add r0, r5, #0
	add r0, #0x48
_02242276:
	ldr r2, [r0]
	sub r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	sub r2, r2, #4
	bpl _02242276
_02242282:
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _022422BC
	ldr r0, _02242358 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	ldr r1, _0224235C ; =ov70_02245E26
	lsl r2, r0, #1
	ldrb r1, [r1, r2]
	ldr r3, _02242360 ; =ov70_02245E27
	ldr r0, [r5, #0xc]
	ldrb r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #9
	ldr r0, [r5, #0xc]
	bne _022422B6
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _022422BC
_022422B6:
	mov r1, #0x3d
	bl Set2dSpriteAnimSeqNo
_022422BC:
	add r0, r5, #0
	mov r1, #4
	bl ov70_02242164
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _022422F8
	cmp r6, #9
	bne _022422DE
	ldr r0, _02242358 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r4, r5, r6, pc}
_022422DE:
	blo _022422E4
	bl GF_AssertFail
_022422E4:
	cmp r4, #0
	beq _022422EE
	ldrb r0, [r4, r6]
	cmp r0, #0
	beq _0224233C
_022422EE:
	ldr r0, _02242358 ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_022422F8:
	ldr r0, _02242344 ; =gSystem
	ldr r2, [r0, #0x48]
	mov r0, #1
	add r1, r2, #0
	tst r1, r0
	beq _0224232A
	ldr r1, [r5, #0x48]
	cmp r1, #9
	bne _0224230E
	sub r0, r0, #3
	pop {r4, r5, r6, pc}
_0224230E:
	blt _02242314
	bl GF_AssertFail
_02242314:
	cmp r4, #0
	beq _02242320
	ldr r0, [r5, #0x48]
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0224233C
_02242320:
	ldr r0, _02242358 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	pop {r4, r5, r6, pc}
_0224232A:
	mov r0, #2
	tst r0, r2
	beq _0224233C
	ldr r0, _02242358 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r4, r5, r6, pc}
_0224233C:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_02242344: .word gSystem
_02242348: .word ov70_02245EA8
_0224234C: .word ov70_02245EA9
_02242350: .word ov70_02245EAA
_02242354: .word ov70_02245EAB
_02242358: .word 0x000005DC
_0224235C: .word ov70_02245E26
_02242360: .word ov70_02245E27
	thumb_func_end ov70_022421D0

	thumb_func_start ov70_02242364
ov70_02242364: ; 0x02242364
	cmp r1, #3
	beq _02242386
	mov r2, #0x3c
	ldrsh r0, [r0, r2]
	cmp r0, #8
	bgt _02242382
	lsl r3, r0, #3
	ldr r0, _0224238C ; =ov70_02245F5C
	ldr r0, [r0, r3]
	cmp r1, r0
	blt _0224237E
	add r1, r2, #0
	sub r1, #0x3d
_0224237E:
	add r0, r1, #0
	bx lr
_02242382:
	add r0, r1, #0
	bx lr
_02242386:
	mov r0, #1
	mvn r0, r0
	bx lr
	.balign 4, 0
_0224238C: .word ov70_02245F5C
	thumb_func_end ov70_02242364

	thumb_func_start ov70_02242390
ov70_02242390: ; 0x02242390
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x48]
	cmp r1, #3
	bge _022423A0
	add r0, #0x7e
	strb r1, [r0]
_022423A0:
	ldr r0, _022424E4 ; =gSystem
	mov r2, #0x40
	ldr r0, [r0, #0x4c]
	tst r2, r0
	beq _022423B6
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _022424E8 ; =ov70_02245DC0
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _022423EA
_022423B6:
	mov r2, #0x80
	tst r2, r0
	beq _022423C8
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _022424EC ; =ov70_02245DC1
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _022423EA
_022423C8:
	mov r2, #0x20
	tst r2, r0
	beq _022423DA
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _022424F0 ; =ov70_02245DC2
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _022423EA
_022423DA:
	mov r2, #0x10
	tst r0, r2
	beq _022423EA
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _022424F4 ; =ov70_02245DC3
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
_022423EA:
	cmp r1, #3
	bne _022423FC
	ldr r0, [r5, #0x48]
	cmp r0, #3
	bge _022423FC
	add r0, r5, #0
	add r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
_022423FC:
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _02242440
	ldr r0, _022424F8 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #3
	bne _02242422
	ldr r0, [r5, #0xc]
	mov r1, #0xc0
	mov r2, #0x88
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _02242440
_02242422:
	ldr r1, _022424FC ; =ov70_02245E26
	lsl r2, r0, #1
	ldrb r1, [r1, r2]
	ldr r3, _02242500 ; =ov70_02245E27
	ldr r0, [r5, #0xc]
	ldrb r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
_02242440:
	add r0, r5, #0
	mov r1, #5
	bl ov70_02242164
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02242488
	add r0, r5, #0
	bl ov70_02242364
	mov r1, #0
	add r6, r0, #0
	mvn r1, r1
	cmp r6, r1
	beq _022424E0
	sub r0, r1, #1
	cmp r6, r0
	beq _0224247E
	cmp r4, #0
	beq _0224247E
	mov r0, #0x3c
	ldrsh r0, [r5, r0]
	lsl r1, r0, #2
	ldr r0, _02242504 ; =ov70_02245E84
	ldr r1, [r0, r1]
	add r0, r4, r6
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _022424DC
_0224247E:
	ldr r0, _022424F8 ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_02242488:
	ldr r0, _022424E4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _022424CA
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl ov70_02242364
	mov r1, #0
	add r6, r0, #0
	mvn r1, r1
	cmp r6, r1
	beq _022424E0
	sub r0, r1, #1
	cmp r6, r0
	beq _022424C0
	cmp r4, #0
	beq _022424C0
	mov r0, #0x3c
	ldrsh r0, [r5, r0]
	lsl r1, r0, #2
	ldr r0, _02242504 ; =ov70_02245E84
	ldr r1, [r0, r1]
	add r0, r4, r6
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _022424DC
_022424C0:
	ldr r0, _022424F8 ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_022424CA:
	mov r0, #2
	tst r0, r1
	beq _022424DC
	ldr r0, _022424F8 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r4, r5, r6, pc}
_022424DC:
	mov r0, #0
	mvn r0, r0
_022424E0:
	pop {r4, r5, r6, pc}
	nop
_022424E4: .word gSystem
_022424E8: .word ov70_02245DC0
_022424EC: .word ov70_02245DC1
_022424F0: .word ov70_02245DC2
_022424F4: .word ov70_02245DC3
_022424F8: .word 0x000005DC
_022424FC: .word ov70_02245E26
_02242500: .word ov70_02245E27
_02242504: .word ov70_02245E84
	thumb_func_end ov70_02242390

	thumb_func_start ov70_02242508
ov70_02242508: ; 0x02242508
	push {r3, lr}
	cmp r0, #0
	bne _02242512
	mov r0, #1
	pop {r3, pc}
_02242512:
	sub r2, r1, #1
	add r0, r0, r2
	bl _s32_div_f
	pop {r3, pc}
	thumb_func_end ov70_02242508

	thumb_func_start ov70_0224251C
ov70_0224251C: ; 0x0224251C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #4
	beq _0224252E
	cmp r1, #5
	beq _02242534
	cmp r1, #6
	beq _02242542
	b _0224254E
_0224252E:
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242534:
	mov r1, #0
	mvn r1, r1
	bl ov70_02242574
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242542:
	mov r1, #1
	bl ov70_02242574
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0224254E:
	mov r0, #0x5a
	ldrsh r2, [r5, r0]
	lsl r2, r2, #2
	add r4, r1, r2
	ldr r1, [r5, #0x5c]
	cmp r4, r1
	bge _0224256C
	ldr r0, _02242570 ; =0x000005DC
	bl PlaySE
	ldr r1, [r5, #0x34]
	lsl r0, r4, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_0224256C:
	sub r0, #0x5b
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02242570: .word 0x000005DC
	thumb_func_end ov70_0224251C

	thumb_func_start ov70_02242574
ov70_02242574: ; 0x02242574
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	add r6, r1, #0
	mov r1, #4
	bl ov70_02242508
	sub r4, r0, #1
	beq _02242616
	cmp r6, #0
	bge _022425BE
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x14]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, #0
	beq _022425B6
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x5a
	strh r1, [r0]
	b _022425F0
_022425B6:
	add r0, r5, #0
	add r0, #0x5a
	strh r4, [r0]
	b _022425F0
_022425BE:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x10]
	mov r1, #0x26
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, r4
	bge _022425E8
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x5a
	strh r1, [r0]
	b _022425F0
_022425E8:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x5a
	strh r1, [r0]
_022425F0:
	mov r1, #0x5a
	ldrsh r1, [r5, r1]
	ldr r2, [r5, #0x5c]
	add r0, r5, #0
	bl ov70_022434C0
	ldr r0, [r5, #0x5c]
	mov r1, #4
	bl ov70_02242508
	str r0, [sp]
	mov r3, #0x5a
	ldr r2, [r5, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x38]
	add r2, #0x40
	bl ov70_02243F00
_02242616:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_02242574

	thumb_func_start ov70_0224261C
ov70_0224261C: ; 0x0224261C
	push {r3, r4, r5, lr}
	ldr r1, _022426E4 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x4c]
	mov r1, #0x40
	ldr r4, [r5, #0x48]
	tst r1, r2
	beq _0224263C
	cmp r4, #0
	beq _02242636
	sub r0, r4, #1
	str r0, [r5, #0x48]
	b _0224266E
_02242636:
	mov r0, #4
	str r0, [r5, #0x48]
	b _0224266E
_0224263C:
	mov r1, #0x80
	tst r1, r2
	beq _02242652
	cmp r4, #4
	beq _0224264C
	add r0, r4, #1
	str r0, [r5, #0x48]
	b _0224266E
_0224264C:
	mov r0, #0
	str r0, [r5, #0x48]
	b _0224266E
_02242652:
	mov r1, #0x20
	add r3, r2, #0
	tst r3, r1
	beq _02242662
	sub r1, #0x21
	bl ov70_02242574
	b _0224266E
_02242662:
	mov r1, #0x10
	tst r1, r2
	beq _0224266E
	mov r1, #1
	bl ov70_02242574
_0224266E:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _022426A2
	ldr r0, _022426E8 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	ldr r1, _022426EC ; =ov70_02245D76
	lsl r3, r0, #1
	ldr r2, _022426F0 ; =ov70_02245D77
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #4
	ldr r0, [r5, #0xc]
	bne _0224269C
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _022426A2
_0224269C:
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
_022426A2:
	add r0, r5, #0
	mov r1, #0
	bl ov70_02242164
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _022426BC
	add r0, r5, #0
	bl ov70_0224251C
	pop {r3, r4, r5, pc}
_022426BC:
	ldr r1, _022426E4 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _022426D0
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl ov70_0224251C
	pop {r3, r4, r5, pc}
_022426D0:
	mov r1, #2
	tst r1, r2
	beq _022426E0
	ldr r0, _022426E8 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
_022426E0:
	pop {r3, r4, r5, pc}
	nop
_022426E4: .word gSystem
_022426E8: .word 0x000005DC
_022426EC: .word ov70_02245D76
_022426F0: .word ov70_02245D77
	thumb_func_end ov70_0224261C

	thumb_func_start ov70_022426F4
ov70_022426F4: ; 0x022426F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022427B0 ; =gSystem
	ldr r4, [r5, #0x48]
	ldr r1, [r0, #0x4c]
	mov r0, #0x40
	tst r0, r1
	beq _0224271C
	ldr r0, _022427B4 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _02242716
	sub r0, r0, #1
	str r0, [r5, #0x48]
	b _02242738
_02242716:
	mov r0, #3
	str r0, [r5, #0x48]
	b _02242738
_0224271C:
	mov r0, #0x80
	tst r0, r1
	beq _02242738
	ldr r0, _022427B4 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #3
	beq _02242734
	add r0, r0, #1
	str r0, [r5, #0x48]
	b _02242738
_02242734:
	mov r0, #0
	str r0, [r5, #0x48]
_02242738:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _02242764
	ldr r1, _022427B8 ; =ov70_02245D66
	lsl r3, r0, #1
	ldr r2, _022427BC ; =ov70_02245D67
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #3
	ldr r0, [r5, #0xc]
	bne _0224275E
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _02242764
_0224275E:
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
_02242764:
	add r0, r5, #0
	mov r1, #1
	bl ov70_02242164
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02242784
	ldr r0, _022427B4 ; =0x000005DC
	bl PlaySE
	ldr r0, _022427C0 ; =ov70_02245DB0
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_02242784:
	ldr r1, _022427B0 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _0224279E
	ldr r0, _022427B4 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	lsl r1, r0, #2
	ldr r0, _022427C0 ; =ov70_02245DB0
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_0224279E:
	mov r1, #2
	tst r1, r2
	beq _022427AE
	ldr r0, _022427B4 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
_022427AE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022427B0: .word gSystem
_022427B4: .word 0x000005DC
_022427B8: .word ov70_02245D66
_022427BC: .word ov70_02245D67
_022427C0: .word ov70_02245DB0
	thumb_func_end ov70_022426F4

	thumb_func_start ov70_022427C4
ov70_022427C4: ; 0x022427C4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	cmp r1, #0
	bge _02242802
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, #0x14]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _022427F8
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x5a
	strh r1, [r0]
	b _02242834
_022427F8:
	add r0, r4, #0
	mov r1, #2
	add r0, #0x5a
	strh r1, [r0]
	b _02242834
_02242802:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, #0x10]
	mov r1, #0x26
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	ldrsh r0, [r4, r0]
	cmp r0, #2
	bge _0224282C
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x5a
	strh r1, [r0]
	b _02242834
_0224282C:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x5a
	strh r1, [r0]
_02242834:
	mov r1, #0x5a
	ldrsh r1, [r4, r1]
	ldr r2, [r4, #0x5c]
	add r0, r4, #0
	bl ov70_022434C0
	ldr r0, [r4, #0x5c]
	mov r1, #4
	bl ov70_02242508
	str r0, [sp]
	mov r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	add r2, #0x40
	bl ov70_02243F00
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov70_022427C4

	thumb_func_start ov70_02242860
ov70_02242860: ; 0x02242860
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	beq _02242874
	cmp r4, #5
	beq _02242880
	cmp r4, #6
	beq _0224288E
	b _0224289A
_02242874:
	ldr r0, _022428BC ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242880:
	mov r1, #0
	mvn r1, r1
	bl ov70_022427C4
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0224288E:
	mov r1, #1
	bl ov70_022427C4
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0224289A:
	mov r0, #0x5a
	ldrsh r1, [r5, r0]
	lsl r1, r1, #2
	add r2, r4, r1
	ldr r1, [r5, #0x5c]
	cmp r2, r1
	bge _022428B8
	ldr r0, _022428BC ; =0x000005DC
	bl PlaySE
	ldr r1, [r5, #0x34]
	lsl r0, r4, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_022428B8:
	sub r0, #0x5b
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022428BC: .word 0x000005DC
	thumb_func_end ov70_02242860

	thumb_func_start ov70_022428C0
ov70_022428C0: ; 0x022428C0
	push {r3, r4, r5, lr}
	ldr r1, _02242990 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x4c]
	mov r1, #0x40
	ldr r4, [r5, #0x48]
	tst r1, r2
	beq _022428E8
	ldr r0, _02242994 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _022428E2
	sub r0, r0, #1
	str r0, [r5, #0x48]
	b _02242922
_022428E2:
	mov r0, #4
	str r0, [r5, #0x48]
	b _02242922
_022428E8:
	mov r1, #0x80
	tst r1, r2
	beq _02242906
	ldr r0, _02242994 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #4
	beq _02242900
	add r0, r0, #1
	str r0, [r5, #0x48]
	b _02242922
_02242900:
	mov r0, #0
	str r0, [r5, #0x48]
	b _02242922
_02242906:
	mov r1, #0x20
	add r3, r2, #0
	tst r3, r1
	beq _02242916
	sub r1, #0x21
	bl ov70_022427C4
	b _02242922
_02242916:
	mov r1, #0x10
	tst r1, r2
	beq _02242922
	mov r1, #1
	bl ov70_022427C4
_02242922:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _0224294E
	ldr r1, _02242998 ; =ov70_02245D80
	lsl r3, r0, #1
	ldr r2, _0224299C ; =ov70_02245D81
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #4
	ldr r0, [r5, #0xc]
	bne _02242948
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _0224294E
_02242948:
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
_0224294E:
	add r0, r5, #0
	mov r1, #2
	bl ov70_02242164
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02242968
	add r0, r5, #0
	bl ov70_02242860
	pop {r3, r4, r5, pc}
_02242968:
	ldr r1, _02242990 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _0224297C
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl ov70_02242860
	pop {r3, r4, r5, pc}
_0224297C:
	mov r1, #2
	tst r1, r2
	beq _0224298C
	ldr r0, _02242994 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
_0224298C:
	pop {r3, r4, r5, pc}
	nop
_02242990: .word gSystem
_02242994: .word 0x000005DC
_02242998: .word ov70_02245D80
_0224299C: .word ov70_02245D81
	thumb_func_end ov70_022428C0

	thumb_func_start ov70_022429A0
ov70_022429A0: ; 0x022429A0
	cmp r1, #9
	beq _022429AA
	cmp r1, #0xa
	beq _022429B0
	b _022429B4
_022429AA:
	mov r0, #1
	mvn r0, r0
	bx lr
_022429B0:
	mov r0, #0xa
	bx lr
_022429B4:
	add r0, r1, #0
	bx lr
	thumb_func_end ov70_022429A0

	thumb_func_start ov70_022429B8
ov70_022429B8: ; 0x022429B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x48]
	cmp r1, #9
	bge _022429C8
	add r0, #0x7e
	strb r1, [r0]
_022429C8:
	ldr r0, _02242B3C ; =gSystem
	mov r2, #0x40
	ldr r0, [r0, #0x4c]
	tst r2, r0
	beq _022429DE
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242B40 ; =ov70_02245EFC
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _02242A12
_022429DE:
	mov r2, #0x80
	tst r2, r0
	beq _022429F0
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242B44 ; =ov70_02245EFD
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _02242A12
_022429F0:
	mov r2, #0x20
	tst r2, r0
	beq _02242A02
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242B48 ; =ov70_02245EFE
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _02242A12
_02242A02:
	mov r2, #0x10
	tst r0, r2
	beq _02242A12
	ldr r0, [r5, #0x48]
	lsl r2, r0, #2
	ldr r0, _02242B4C ; =ov70_02245EFF
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
_02242A12:
	cmp r1, #9
	blt _02242A6A
	ldr r0, [r5, #0x48]
	cmp r0, #9
	bge _02242A6A
	ldr r0, _02242B3C ; =gSystem
	ldr r2, [r0, #0x4c]
	mov r0, #0x40
	tst r0, r2
	beq _02242A48
	add r0, r5, #0
	add r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	add r0, r0, #4
	cmp r0, #9
	bge _02242A6A
	add r0, r5, #0
	add r0, #0x48
_02242A38:
	ldr r2, [r0]
	add r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	add r2, r2, #4
	cmp r2, #9
	blt _02242A38
	b _02242A6A
_02242A48:
	mov r0, #0x80
	tst r0, r2
	beq _02242A6A
	add r0, r5, #0
	add r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	sub r0, r0, #4
	bmi _02242A6A
	add r0, r5, #0
	add r0, #0x48
_02242A5E:
	ldr r2, [r0]
	sub r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	sub r2, r2, #4
	bpl _02242A5E
_02242A6A:
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _02242AB6
	ldr r0, _02242B50 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	ldr r1, _02242B54 ; =ov70_02245DF8
	lsl r2, r0, #1
	ldrb r1, [r1, r2]
	ldr r3, _02242B58 ; =ov70_02245DF9
	ldr r0, [r5, #0xc]
	ldrb r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #9
	beq _02242A9A
	cmp r0, #0xa
	beq _02242AA4
	b _02242AAE
_02242A9A:
	ldr r0, [r5, #0xc]
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _02242AB6
_02242AA4:
	ldr r0, [r5, #0xc]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	b _02242AB6
_02242AAE:
	ldr r0, [r5, #0xc]
	mov r1, #0x3d
	bl Set2dSpriteAnimSeqNo
_02242AB6:
	add r0, r5, #0
	mov r1, #6
	bl ov70_02242164
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02242AF0
	add r0, r5, #0
	bl ov70_022429A0
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _02242AE6
	cmp r5, #0xb
	beq _02242AE6
	cmp r4, #0
	beq _02242AE6
	ldrb r0, [r4, r5]
	cmp r0, #0
	beq _02242B36
_02242AE6:
	ldr r0, _02242B50 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_02242AF0:
	ldr r0, _02242B3C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02242B24
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl ov70_022429A0
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _02242B1A
	cmp r5, #0xb
	beq _02242B1A
	cmp r4, #0
	beq _02242B1A
	ldrb r0, [r4, r5]
	cmp r0, #0
	beq _02242B36
_02242B1A:
	ldr r0, _02242B50 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_02242B24:
	mov r0, #2
	tst r0, r1
	beq _02242B36
	ldr r0, _02242B50 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242B36:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02242B3C: .word gSystem
_02242B40: .word ov70_02245EFC
_02242B44: .word ov70_02245EFD
_02242B48: .word ov70_02245EFE
_02242B4C: .word ov70_02245EFF
_02242B50: .word 0x000005DC
_02242B54: .word ov70_02245DF8
_02242B58: .word ov70_02245DF9
	thumb_func_end ov70_022429B8

	thumb_func_start ov70_02242B5C
ov70_02242B5C: ; 0x02242B5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #5
	beq _02242B6E
	cmp r1, #6
	beq _02242B7A
	cmp r1, #7
	beq _02242B88
	b _02242B94
_02242B6E:
	ldr r0, _02242BB8 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242B7A:
	mov r1, #0
	mvn r1, r1
	bl ov70_02242BBC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242B88:
	mov r1, #1
	bl ov70_02242BBC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02242B94:
	mov r0, #0x5a
	ldrsh r3, [r5, r0]
	lsl r2, r3, #2
	add r2, r3, r2
	add r4, r1, r2
	ldr r1, [r5, #0x5c]
	cmp r4, r1
	bge _02242BB4
	ldr r0, _02242BB8 ; =0x000005DC
	bl PlaySE
	ldr r1, [r5, #0x34]
	lsl r0, r4, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_02242BB4:
	sub r0, #0x5b
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02242BB8: .word 0x000005DC
	thumb_func_end ov70_02242B5C

	thumb_func_start ov70_02242BBC
ov70_02242BBC: ; 0x02242BBC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	add r6, r1, #0
	mov r1, #5
	bl ov70_02242508
	sub r4, r0, #1
	beq _02242C5E
	cmp r6, #0
	bge _02242C06
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x14]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, #0
	beq _02242BFE
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x5a
	strh r1, [r0]
	b _02242C38
_02242BFE:
	add r0, r5, #0
	add r0, #0x5a
	strh r4, [r0]
	b _02242C38
_02242C06:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x10]
	mov r1, #0x26
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, r4
	bge _02242C30
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x5a
	strh r1, [r0]
	b _02242C38
_02242C30:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x5a
	strh r1, [r0]
_02242C38:
	mov r1, #0x5a
	ldrsh r1, [r5, r1]
	ldr r2, [r5, #0x5c]
	add r0, r5, #0
	bl ov70_0224352C
	ldr r0, [r5, #0x5c]
	mov r1, #5
	bl ov70_02242508
	str r0, [sp]
	mov r3, #0x5a
	ldr r2, [r5, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x38]
	add r2, #0x50
	bl ov70_02243F00
_02242C5E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_02242BBC

	thumb_func_start ov70_02242C64
ov70_02242C64: ; 0x02242C64
	push {r3, r4, r5, lr}
	ldr r1, _02242D34 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x4c]
	mov r1, #0x40
	ldr r4, [r5, #0x48]
	tst r1, r2
	beq _02242C8C
	ldr r0, _02242D38 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _02242C86
	sub r0, r0, #1
	str r0, [r5, #0x48]
	b _02242CC6
_02242C86:
	mov r0, #5
	str r0, [r5, #0x48]
	b _02242CC6
_02242C8C:
	mov r1, #0x80
	tst r1, r2
	beq _02242CAA
	ldr r0, _02242D38 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x48]
	cmp r0, #5
	beq _02242CA4
	add r0, r0, #1
	str r0, [r5, #0x48]
	b _02242CC6
_02242CA4:
	mov r0, #0
	str r0, [r5, #0x48]
	b _02242CC6
_02242CAA:
	mov r1, #0x20
	add r3, r2, #0
	tst r3, r1
	beq _02242CBA
	sub r1, #0x21
	bl ov70_02242BBC
	b _02242CC6
_02242CBA:
	mov r1, #0x10
	tst r1, r2
	beq _02242CC6
	mov r1, #1
	bl ov70_02242BBC
_02242CC6:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _02242CF2
	ldr r1, _02242D3C ; =ov70_02245D8A
	lsl r3, r0, #1
	ldr r2, _02242D40 ; =ov70_02245D8B
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #5
	ldr r0, [r5, #0xc]
	bne _02242CEC
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	b _02242CF2
_02242CEC:
	mov r1, #0x32
	bl Set2dSpriteAnimSeqNo
_02242CF2:
	add r0, r5, #0
	mov r1, #3
	bl ov70_02242164
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02242D0C
	add r0, r5, #0
	bl ov70_02242B5C
	pop {r3, r4, r5, pc}
_02242D0C:
	ldr r1, _02242D34 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _02242D20
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl ov70_02242B5C
	pop {r3, r4, r5, pc}
_02242D20:
	mov r1, #2
	tst r1, r2
	beq _02242D30
	ldr r0, _02242D38 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
_02242D30:
	pop {r3, r4, r5, pc}
	nop
_02242D34: .word gSystem
_02242D38: .word 0x000005DC
_02242D3C: .word ov70_02245D8A
_02242D40: .word ov70_02245D8B
	thumb_func_end ov70_02242C64

	thumb_func_start ov70_02242D44
ov70_02242D44: ; 0x02242D44
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #6
	bne _02242D58
	mov r3, #0x21
	b _02242D5A
_02242D58:
	mov r3, #0x22
_02242D5A:
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	mov r2, #0x64
	bl sub_02019688
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_02019B08
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov70_0224190C
	add r0, r5, #0
	add r0, #0x64
	mov r1, #1
	mov r2, #0x1a
	bl MI_CpuFill8
	mov r4, #0
	add r6, r4, #0
_02242D88:
	add r1, r4, #0
	ldr r0, [r5, #0x24]
	add r1, #0x6e
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #4
	bne _02242DBE
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_02243F7C
	cmp r0, #1
	bne _02242DB2
	add r2, r5, r4
	add r2, #0x64
	mov r1, #1
	ldr r0, _02242E50 ; =0x000F0E02
	strb r1, [r2]
	b _02242DE0
_02242DB2:
	add r2, r5, r4
	add r2, #0x64
	mov r1, #0
	ldr r0, _02242E54 ; =0x00080902
	strb r1, [r2]
	b _02242DE0
_02242DBE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_02243FE0
	cmp r0, #1
	bne _02242DD6
	add r2, r5, r4
	add r2, #0x64
	mov r1, #1
	ldr r0, _02242E50 ; =0x000F0E02
	strb r1, [r2]
	b _02242DE0
_02242DD6:
	add r2, r5, r4
	ldr r0, _02242E54 ; =0x00080902
	add r2, #0x64
	mov r1, #0
	strb r1, [r2]
_02242DE0:
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	add r1, r1, r6
	add r2, r7, #0
	mov r3, #2
	bl ov70_02242FC4
	add r0, r7, #0
	bl String_dtor
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #9
	blt _02242D88
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	ldr r0, [sp, #4]
	cmp r0, #6
	bne _02242E34
	ldr r0, [r5, #0x24]
	mov r1, #0xae
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, _02242E50 ; =0x000F0E02
	add r2, r4, #0
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	add r1, #0xf0
	mov r3, #2
	bl ov70_02242FC4
	add r0, r4, #0
	bl String_dtor
_02242E34:
	ldr r2, [sp, #8]
	mov r1, #0
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x1c]
	asr r2, r2, #0x18
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_020197F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02242E50: .word 0x000F0E02
_02242E54: .word 0x00080902
	thumb_func_end ov70_02242D44

	thumb_func_start ov70_02242E58
ov70_02242E58: ; 0x02242E58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x1f
	bl sub_02019688
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r5, #0
	mov r1, #1
	bl ov70_0224190C
	mov r6, #0
	add r4, r6, #0
_02242E80:
	add r1, r6, #0
	ldr r0, [r5, #0x24]
	add r1, #0x7c
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, _02242EE0 ; =0x000F0E02
	add r2, r7, #0
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	add r1, r1, r4
	mov r3, #2
	bl ov70_02242FC4
	add r0, r7, #0
	bl String_dtor
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #3
	blt _02242E80
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r5, #0x1c]
	mov r2, #0x20
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_020197F4
	mov r1, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	sub r2, r1, #4
	add r3, r1, #0
	bl sub_020198FC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02242EE0: .word 0x000F0E02
	thumb_func_end ov70_02242E58

	thumb_func_start ov70_02242EE4
ov70_02242EE4: ; 0x02242EE4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x23
	bl sub_02019688
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r4, #0
	mov r1, #2
	bl ov70_0224190C
	ldr r0, [r4, #0x60]
	cmp r0, #1
	bne _02242F20
	add r0, r4, #0
	ldr r1, [r4, #0x24]
	add r0, #0x34
	mov r2, #1
	bl ov70_0223F7E4
	str r0, [r4, #0x5c]
	b _02242F32
_02242F20:
	cmp r0, #0
	bne _02242F32
	add r0, r4, #0
	ldr r1, [r4, #0x24]
	add r0, #0x34
	mov r2, #0
	bl ov70_0223F7E4
	str r0, [r4, #0x5c]
_02242F32:
	ldr r2, [r4, #0x5c]
	add r0, r4, #0
	mov r1, #0
	bl ov70_022434C0
	add r0, r4, #0
	mov r1, #0
	add r0, #0x5a
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	mov r1, #4
	bl ov70_02242508
	str r0, [sp]
	mov r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	add r2, #0x40
	bl ov70_02243F00
	ldr r2, [r4, #4]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r4, #0x1c]
	mov r2, #0x20
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r4, #0xc]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	mov r1, #0
	add r0, r4, #0
	str r1, [r4, #0x48]
	add r0, #0x7e
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, _02242FBC ; =ov70_02245D76
	lsl r3, r0, #1
	ldr r2, _02242FC0 ; =ov70_02245D77
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_020197F4
	mov r1, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	sub r2, r1, #4
	add r3, r1, #0
	bl sub_020198FC
	mov r0, #0x20
	str r0, [r4, #0x4c]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02242FBC: .word ov70_02245D76
_02242FC0: .word ov70_02245D77
	thumb_func_end ov70_02242EE4

	thumb_func_start ov70_02242FC4
ov70_02242FC4: ; 0x02242FC4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl sub_02019A60
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02242FC4

	thumb_func_start ov70_02242FF4
ov70_02242FF4: ; 0x02242FF4
	mov r0, #0
	mvn r0, r0
	bx lr
	.balign 4, 0
	thumb_func_end ov70_02242FF4

	thumb_func_start ov70_02242FFC
ov70_02242FFC: ; 0x02242FFC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_020199E4
	cmp r0, #0
	bne _02243044
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x58
	ldrsh r0, [r4, r0]
	cmp r0, #2
	bne _02243040
	ldr r0, [r4, #0x10]
	mov r1, #0xe4
	mov r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0x14]
	mov r1, #0x9a
	mov r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_02243040:
	ldr r0, [r4, #0x50]
	str r0, [r4, #0x4c]
_02243044:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02242FFC

	thumb_func_start ov70_0224304C
ov70_0224304C: ; 0x0224304C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_020199E4
	cmp r0, #0
	bne _02243060
	ldr r0, [r4, #0x50]
	str r0, [r4, #0x4c]
_02243060:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_0224304C

	thumb_func_start ov70_02243068
ov70_02243068: ; 0x02243068
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_020199E4
	cmp r0, #0
	bne _02243084
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_0201980C
	ldr r0, [r4, #0x50]
	str r0, [r4, #0x4c]
_02243084:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02243068

	thumb_func_start ov70_0224308C
ov70_0224308C: ; 0x0224308C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #4
	mov r2, #0x20
	bl ov70_02242D44
	ldr r0, [r4, #0xc]
	mov r1, #0x3d
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0xc]
	mov r1, #0x88
	mov r2, #0x28
	bl ov70_02238F9C
	mov r1, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	sub r2, r1, #4
	add r3, r1, #0
	bl sub_020198FC
	mov r0, #1
	str r0, [r4, #0x4c]
	mov r0, #5
	str r0, [r4, #0x50]
	sub r0, r0, #6
	strh r0, [r4, #0x3c]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov70_0224308C

	thumb_func_start ov70_022430CC
ov70_022430CC: ; 0x022430CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x64
	bl ov70_022421D0
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _022430F6
	cmp r4, #8
	bhi _02243118
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #6
	str r0, [r5, #0x4c]
	strh r4, [r5, #0x3c]
	b _02243118
_022430F6:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #6
	str r0, [r5, #0x50]
	sub r0, r0, #7
	strh r0, [r5, #0x3c]
_02243118:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_022430CC

	thumb_func_start ov70_02243120
ov70_02243120: ; 0x02243120
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl ov70_02241DB4
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3c
	ldrsh r1, [r4, r0]
	cmp r1, #0
	blt _0224315C
	cmp r1, #8
	ble _02243142
	bl GF_AssertFail
_02243142:
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	lsl r1, r0, #3
	ldr r0, _02243168 ; =ov70_02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _02243158
	mov r0, #0
	strh r0, [r4, #0x3e]
	mov r0, #0xc
	b _02243160
_02243158:
	mov r0, #8
	b _02243160
_0224315C:
	sub r0, #0x3e
	pop {r4, pc}
_02243160:
	str r0, [r4, #0x4c]
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_02243168: .word ov70_02245F5C
	thumb_func_end ov70_02243120

	thumb_func_start ov70_0224316C
ov70_0224316C: ; 0x0224316C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x22
	bl sub_02019688
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r5, #0
	mov r1, #4
	bl ov70_0224190C
	add r0, r5, #0
	add r0, #0x64
	mov r1, #1
	mov r2, #0x1a
	bl MI_CpuFill8
	mov r4, #0
	add r6, r4, #0
_022431A0:
	add r1, r4, #0
	ldr r0, [r5, #0x24]
	add r1, #0x6e
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_02243F7C
	cmp r0, #1
	bne _022431C2
	add r2, r5, r4
	ldr r0, _02243244 ; =0x000F0E02
	add r2, #0x64
	mov r1, #1
	b _022431CA
_022431C2:
	add r2, r5, r4
	ldr r0, _02243248 ; =0x00080902
	add r2, #0x64
	mov r1, #0
_022431CA:
	strb r1, [r2]
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	add r1, r1, r6
	add r2, r7, #0
	mov r3, #2
	bl ov70_02242FC4
	add r0, r7, #0
	bl String_dtor
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #9
	blt _022431A0
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r5, #0x1c]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_020197F4
	ldr r0, [r5, #0xc]
	mov r1, #0x3d
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x3c
	ldrsh r0, [r5, r0]
	ldr r1, _0224324C ; =ov70_02245E26
	ldr r2, _02243250 ; =ov70_02245E27
	lsl r3, r0, #1
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	mov r0, #0x3c
	ldrsh r0, [r5, r0]
	mov r1, #1
	str r0, [r5, #0x48]
	ldr r0, [r5, #0xc]
	bl Set2dSpriteVisibleFlag
	mov r0, #5
	str r0, [r5, #0x4c]
	sub r0, r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243244: .word 0x000F0E02
_02243248: .word 0x00080902
_0224324C: .word ov70_02245E26
_02243250: .word ov70_02245E27
	thumb_func_end ov70_0224316C

	thumb_func_start ov70_02243254
ov70_02243254: ; 0x02243254
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x20
	bl sub_02019688
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r5, #0
	mov r1, #5
	bl ov70_0224190C
	add r0, r5, #0
	add r0, #0x64
	mov r1, #1
	mov r2, #0x1a
	bl MI_CpuFill8
	mov r0, #2
	str r0, [sp]
	ldr r0, _02243388 ; =0x000F0E02
	mov r3, #0x3c
	str r0, [sp, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	ldr r2, [r5, #4]
	add r3, #0x6e
	bl ov70_02243E8C
	mov r0, #0x3c
	ldrsh r1, [r5, r0]
	ldr r0, _0224338C ; =ov70_02245F5C
	mov r4, #1
	lsl r2, r1, #3
	ldr r0, [r0, r2]
	cmp r0, #1
	blt _0224332C
	mov r7, #0x10
_022432B0:
	lsl r2, r1, #2
	ldr r1, _02243390 ; =ov70_02245E84
	add r0, r5, #0
	ldr r1, [r1, r2]
	add r1, r4, r1
	sub r1, r1, #1
	bl ov70_02243F54
	cmp r0, #0
	ble _022432DA
	mov r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243388 ; =0x000F0E02
	lsl r2, r1, #2
	ldr r1, _02243390 ; =ov70_02245E84
	ldr r2, [r1, r2]
	add r1, r5, r4
	add r2, r2, r1
	add r2, #0x63
	mov r1, #1
	b _022432EE
_022432DA:
	mov r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243394 ; =0x00080902
	lsl r2, r1, #2
	ldr r1, _02243390 ; =ov70_02245E84
	ldr r2, [r1, r2]
	add r1, r5, r4
	add r2, r2, r1
	add r2, #0x63
	mov r1, #0
_022432EE:
	strb r1, [r2]
	mov r1, #5
	str r1, [sp]
	str r0, [sp, #4]
	mov r3, #0x3c
	ldrsh r3, [r5, r3]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	lsl r6, r3, #3
	ldr r3, _02243398 ; =ov70_02245F58
	ldr r1, [r5, #0x24]
	ldr r3, [r3, r6]
	add r2, r2, r7
	add r3, r4, r3
	lsl r6, r3, #2
	ldr r3, _0224339C ; =ov70_02245FA0
	add r3, r3, r6
	sub r3, r3, #4
	ldr r3, [r3]
	bl ov70_02243E8C
	mov r0, #0x3c
	ldrsh r1, [r5, r0]
	ldr r0, _02243398 ; =ov70_02245F58
	add r4, r4, #1
	lsl r2, r1, #3
	add r0, r0, r2
	ldr r0, [r0, #4]
	add r7, #0x10
	cmp r4, r0
	ble _022432B0
_0224332C:
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r5, #0x1c]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r5, #0xc]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x3e
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _0224335A
	mov r0, #0
	b _0224335A
_0224335A:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x48]
	ldr r1, _022433A0 ; =ov70_02245E26
	lsl r3, r0, #1
	ldr r2, _022433A4 ; =ov70_02245E27
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #9
	str r0, [r5, #0x4c]
	sub r0, #0xa
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243388: .word 0x000F0E02
_0224338C: .word ov70_02245F5C
_02243390: .word ov70_02245E84
_02243394: .word 0x00080902
_02243398: .word ov70_02245F58
_0224339C: .word ov70_02245FA0
_022433A0: .word ov70_02245E26
_022433A4: .word ov70_02245E27
	thumb_func_end ov70_02243254

	thumb_func_start ov70_022433A8
ov70_022433A8: ; 0x022433A8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x64
	bl ov70_02242390
	add r5, r0, #0
	cmp r5, #4
	bhi _022433D0
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022433C6: ; jump table
	.short _022433DA - _022433C6 - 2 ; case 0
	.short _022433DA - _022433C6 - 2 ; case 1
	.short _022433DA - _022433C6 - 2 ; case 2
	.short _022433DA - _022433C6 - 2 ; case 3
	.short _022433DA - _022433C6 - 2 ; case 4
_022433D0:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _022433EA
	b _022433FA
_022433DA:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xa
	str r0, [r4, #0x4c]
	strh r5, [r4, #0x3e]
	b _022433FA
_022433EA:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xa
	str r0, [r4, #0x4c]
	sub r0, #0xb
	strh r0, [r4, #0x3e]
_022433FA:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_022433A8

	thumb_func_start ov70_02243400
ov70_02243400: ; 0x02243400
	push {r4, lr}
	mov r1, #5
	add r4, r0, #0
	bl ov70_02241DB4
	mov r0, #0x3e
	ldrsh r0, [r4, r0]
	cmp r0, #0
	blt _02243416
	mov r0, #0xc
	b _02243418
_02243416:
	mov r0, #7
_02243418:
	str r0, [r4, #0x4c]
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	thumb_func_end ov70_02243400

	thumb_func_start ov70_02243420
ov70_02243420: ; 0x02243420
	mov r1, #8
	str r1, [r0, #0x4c]
	sub r1, #9
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov70_02243420

	thumb_func_start ov70_0224342C
ov70_0224342C: ; 0x0224342C
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r7, r2, #0
	str r1, [sp]
	add r5, r3, #0
	add r4, r6, #0
	cmp r7, #0
	ble _02243452
_0224343C:
	ldrh r1, [r5]
	ldr r0, [sp]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _0224344A
	add r4, r4, #1
_0224344A:
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, r7
	blt _0224343C
_02243452:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov70_0224342C

	thumb_func_start ov70_02243458
ov70_02243458: ; 0x02243458
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	add r6, r0, #0
	ldr r1, [sp, #0x28]
	mov r0, #0x3d
	add r2, sp, #0xc
	add r4, r3, #0
	ldr r7, [sp, #0x2c]
	bl ov70_0223F658
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov70_0224342C
	str r0, [sp, #8]
	add r0, r0, #1
	mov r1, #0x3d
	bl ListMenuItems_ctor
	str r0, [r6]
	ldr r0, [sp, #0xc]
	mov r4, #0
	cmp r0, #0
	ble _022434B4
	ldr r5, [sp, #4]
_02243492:
	ldrh r1, [r5]
	add r0, r7, #0
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _022434AA
	ldrh r2, [r5]
	ldr r0, [r6]
	ldr r1, [sp]
	add r3, r2, #0
	bl ListMenuItems_AppendFromMsgData
_022434AA:
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, r0
	blt _02243492
_022434B4:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov70_02243458

	thumb_func_start ov70_022434C0
ov70_022434C0: ; 0x022434C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsl r7, r1, #2
	mov r4, #0
	add r5, r0, #0
	lsl r0, r7, #3
	str r2, [sp, #4]
	str r4, [sp, #0xc]
	add r6, r4, #0
	str r0, [sp, #8]
_022434D4:
	ldr r0, [r5, #4]
	mov r1, #0x22
	add r0, r0, r4
	bl FillWindowPixelBuffer
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _022434FE
	ldr r0, _02243528 ; =0x000F0E02
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r3, [r5, #0x34]
	ldr r1, [r5, #4]
	add r2, r2, r3
	ldr r0, [r5, #0x1c]
	ldr r2, [r6, r2]
	add r1, r1, r4
	mov r3, #0
	bl ov70_02242FC4
	b _02243512
_022434FE:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl CopyWindowPixelsToVram_TextMode
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	add r2, r2, r4
	bl sub_02019A60
_02243512:
	ldr r0, [sp, #0xc]
	add r4, #0x10
	add r0, r0, #1
	add r7, r7, #1
	add r6, #8
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _022434D4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243528: .word 0x000F0E02
	thumb_func_end ov70_022434C0

	thumb_func_start ov70_0224352C
ov70_0224352C: ; 0x0224352C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	mov r4, #0
	add r7, r1, r0
	lsl r0, r7, #3
	str r2, [sp, #4]
	str r4, [sp, #0xc]
	add r6, r4, #0
	str r0, [sp, #8]
_02243542:
	ldr r0, [r5, #4]
	mov r1, #0x22
	add r0, r0, r4
	bl FillWindowPixelBuffer
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _0224356C
	ldr r0, _02243594 ; =0x000F0E02
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r3, [r5, #0x34]
	ldr r1, [r5, #4]
	add r2, r2, r3
	ldr r0, [r5, #0x1c]
	ldr r2, [r6, r2]
	add r1, r1, r4
	mov r3, #0
	bl ov70_02242FC4
	b _02243580
_0224356C:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl CopyWindowPixelsToVram_TextMode
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	add r2, r2, r4
	bl sub_02019A60
_02243580:
	ldr r0, [sp, #0xc]
	add r4, #0x10
	add r0, r0, #1
	add r7, r7, #1
	add r6, #8
	str r0, [sp, #0xc]
	cmp r0, #5
	blt _02243542
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243594: .word 0x000F0E02
	thumb_func_end ov70_0224352C

	thumb_func_start ov70_02243598
ov70_02243598: ; 0x02243598
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x23
	bl sub_02019688
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r4, #0
	mov r1, #0
	bl ov70_0224190C
	mov r0, #0x3e
	ldrsh r2, [r4, r0]
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	lsl r1, r0, #2
	ldr r0, _0224367C ; =ov70_02245E84
	ldr r0, [r0, r1]
	add r0, r2, r0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	str r0, [sp, #4]
	add r0, r4, #0
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x30]
	add r0, #0x34
	bl ov70_02243458
	str r0, [r4, #0x5c]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x5a
	strh r1, [r0]
	ldr r2, [r4, #0x5c]
	add r0, r4, #0
	bl ov70_022434C0
	ldr r0, [r4, #0x5c]
	mov r1, #4
	bl ov70_02242508
	str r0, [sp]
	mov r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	add r2, #0x40
	bl ov70_02243F00
	ldr r2, [r4, #4]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r4, #0x1c]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r4, #0xc]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	ldr r1, _02243680 ; =ov70_02245D76
	lsl r3, r0, #1
	ldr r2, _02243684 ; =ov70_02245D77
	str r0, [r4, #0x48]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	ldr r0, [r4, #0x10]
	mov r1, #0xe4
	mov r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0x14]
	mov r1, #0x9a
	mov r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xd
	str r0, [r4, #0x4c]
	sub r0, #0xe
	add sp, #8
	pop {r4, pc}
	nop
_0224367C: .word ov70_02245E84
_02243680: .word ov70_02245D76
_02243684: .word ov70_02245D77
	thumb_func_end ov70_02243598

	thumb_func_start ov70_02243688
ov70_02243688: ; 0x02243688
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_0224261C
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _022436A2
	add r0, r0, #1
	cmp r4, r0
	beq _022436F6
	b _022436C4
_022436A2:
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _022436FC ; =0x000005DC
	bl PlaySE
	mov r0, #0xe
	str r0, [r5, #0x4c]
	sub r0, #0xf
	add r5, #0x40
	strh r0, [r5]
	b _022436F6
_022436C4:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0xf
	str r0, [r5, #0x50]
	add r5, #0x40
	strh r4, [r5]
_022436F6:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022436FC: .word 0x000005DC
	thumb_func_end ov70_02243688

	thumb_func_start ov70_02243700
ov70_02243700: ; 0x02243700
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl ListMenuItems_dtor
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	cmp r0, #8
	ble _0224372E
	bl GF_AssertFail
_0224372E:
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	lsl r1, r0, #3
	ldr r0, _0224374C ; =ov70_02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _02243740
	mov r0, #7
	b _02243742
_02243740:
	mov r0, #0xb
_02243742:
	str r0, [r4, #0x4c]
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_0224374C: .word ov70_02245F5C
	thumb_func_end ov70_02243700

	thumb_func_start ov70_02243750
ov70_02243750: ; 0x02243750
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl ListMenuItems_dtor
	mov r0, #0x40
	ldrsh r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02243750

	thumb_func_start ov70_02243768
ov70_02243768: ; 0x02243768
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #6
	mov r2, #0x20
	add r4, r0, #0
	bl ov70_02242D44
	mov r1, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	sub r2, r1, #4
	add r3, r1, #0
	bl sub_020198FC
	mov r0, #1
	str r0, [r4, #0x4c]
	mov r0, #0x11
	str r0, [r4, #0x50]
	mov r0, #0xa
	str r0, [r4, #0x48]
	sub r0, #0xb
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x48]
	ldr r1, _022437C0 ; =ov70_02245DF8
	lsl r3, r0, #1
	ldr r2, _022437C4 ; =ov70_02245DF9
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, pc}
	nop
_022437C0: .word ov70_02245DF8
_022437C4: .word ov70_02245DF9
	thumb_func_end ov70_02243768

	thumb_func_start ov70_022437C8
ov70_022437C8: ; 0x022437C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x64
	bl ov70_022429B8
	add r4, r0, #0
	cmp r4, #0xa
	beq _0224380E
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _022437EA
	add r0, r0, #1
	cmp r4, r0
	beq _02243840
	b _02243832
_022437EA:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x12
	str r0, [r5, #0x50]
	sub r0, #0x13
	strh r0, [r5, #0x3c]
	b _02243840
_0224380E:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x12
	str r0, [r5, #0x50]
	sub r0, #0x14
	strh r0, [r5, #0x3c]
	b _02243840
_02243832:
	cmp r4, #8
	bls _0224383A
	bl GF_AssertFail
_0224383A:
	strh r4, [r5, #0x3c]
	mov r0, #0x12
	str r0, [r5, #0x4c]
_02243840:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_022437C8

	thumb_func_start ov70_02243848
ov70_02243848: ; 0x02243848
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #6
	bl ov70_02241DB4
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3c
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bge _0224387E
	add r1, r0, #0
	sub r1, #0x3d
	cmp r2, r1
	bne _02243872
	add sp, #4
	sub r0, #0x3e
	pop {r3, r4, pc}
_02243872:
	sub r0, #0x3e
	cmp r2, r0
	bne _022438C8
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_0224387E:
	cmp r2, #8
	ble _02243886
	bl GF_AssertFail
_02243886:
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	lsl r1, r0, #3
	ldr r0, _022438D0 ; =ov70_02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _022438C4
	mov r1, #0
	strh r1, [r4, #0x3e]
	mov r2, #3
	str r2, [sp]
	ldr r0, [r4, #0x1c]
	sub r2, r2, #7
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _022438B2
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_022438B2:
	ldr r0, [r4, #0xc]
	mov r1, #0x32
	bl Set2dSpriteAnimSeqNo
	mov r0, #2
	str r0, [r4, #0x4c]
	mov r0, #0x18
	str r0, [r4, #0x50]
	b _022438C8
_022438C4:
	mov r0, #0x14
	str r0, [r4, #0x4c]
_022438C8:
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_022438D0: .word ov70_02245F5C
	thumb_func_end ov70_02243848

	thumb_func_start ov70_022438D4
ov70_022438D4: ; 0x022438D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #6
	mov r2, #0x10
	bl ov70_02242D44
	ldr r0, [r4, #0xc]
	mov r1, #0x3d
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	ldr r1, _02243920 ; =ov70_02245DF8
	ldr r2, _02243924 ; =ov70_02245DF9
	lsl r3, r0, #1
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [r4, #0x48]
	add r1, #0x10
	ldr r0, [r4, #0xc]
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02243918
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_02243918:
	mov r0, #0x11
	str r0, [r4, #0x4c]
	sub r0, #0x12
	pop {r4, pc}
	.balign 4, 0
_02243920: .word ov70_02245DF8
_02243924: .word ov70_02245DF9
	thumb_func_end ov70_022438D4

	thumb_func_start ov70_02243928
ov70_02243928: ; 0x02243928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x20
	bl sub_02019688
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r5, #0
	mov r1, #5
	bl ov70_0224190C
	add r0, r5, #0
	add r0, #0x64
	mov r1, #1
	mov r2, #0x1a
	bl MI_CpuFill8
	mov r0, #2
	str r0, [sp]
	ldr r0, _02243A50 ; =0x000F0E02
	mov r3, #0x3c
	str r0, [sp, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	ldr r2, [r5, #4]
	add r3, #0x6e
	bl ov70_02243E8C
	mov r4, #1
	mov r7, #0x10
_02243976:
	mov r1, #0x3c
	ldrsh r1, [r5, r1]
	add r0, r5, #0
	lsl r2, r1, #2
	ldr r1, _02243A54 ; =ov70_02245E84
	ldr r1, [r1, r2]
	add r1, r4, r1
	sub r1, r1, #1
	bl ov70_02243FD4
	cmp r0, #0
	ble _022439A4
	mov r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243A50 ; =0x000F0E02
	lsl r2, r1, #2
	ldr r1, _02243A54 ; =ov70_02245E84
	ldr r2, [r1, r2]
	add r1, r5, r4
	add r2, r2, r1
	add r2, #0x63
	mov r1, #1
	b _022439B8
_022439A4:
	mov r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243A58 ; =0x00080902
	lsl r2, r1, #2
	ldr r1, _02243A54 ; =ov70_02245E84
	ldr r2, [r1, r2]
	add r1, r5, r4
	add r2, r2, r1
	add r2, #0x63
	mov r1, #0
_022439B8:
	strb r1, [r2]
	mov r1, #5
	str r1, [sp]
	str r0, [sp, #4]
	mov r3, #0x3c
	ldrsh r3, [r5, r3]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	lsl r6, r3, #3
	ldr r3, _02243A5C ; =ov70_02245F58
	ldr r1, [r5, #0x24]
	ldr r3, [r3, r6]
	add r2, r2, r7
	add r3, r4, r3
	lsl r6, r3, #2
	ldr r3, _02243A60 ; =ov70_02245FA0
	add r3, r3, r6
	sub r3, r3, #4
	ldr r3, [r3]
	bl ov70_02243E8C
	add r4, r4, #1
	add r7, #0x10
	cmp r4, #4
	blt _02243976
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r5, #0x1c]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020196E8
	ldr r0, [r5, #0xc]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x3e
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _02243A18
	mov r0, #0
	b _02243A18
_02243A18:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x48]
	ldr r1, _02243A64 ; =ov70_02245E26
	lsl r3, r0, #1
	ldr r2, _02243A68 ; =ov70_02245E27
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	add r1, #0x10
	lsl r1, r1, #3
	lsl r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _02243A46
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_02243A46:
	mov r0, #0x15
	str r0, [r5, #0x4c]
	sub r0, #0x16
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243A50: .word 0x000F0E02
_02243A54: .word ov70_02245E84
_02243A58: .word 0x00080902
_02243A5C: .word ov70_02245F58
_02243A60: .word ov70_02245FA0
_02243A64: .word ov70_02245E26
_02243A68: .word ov70_02245E27
	thumb_func_end ov70_02243928

	thumb_func_start ov70_02243A6C
ov70_02243A6C: ; 0x02243A6C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x64
	bl ov70_02242390
	add r5, r0, #0
	cmp r5, #4
	bhi _02243A94
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02243A8A: ; jump table
	.short _02243A9E - _02243A8A - 2 ; case 0
	.short _02243A9E - _02243A8A - 2 ; case 1
	.short _02243A9E - _02243A8A - 2 ; case 2
	.short _02243A9E - _02243A8A - 2 ; case 3
	.short _02243A9E - _02243A8A - 2 ; case 4
_02243A94:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _02243AAE
	b _02243ABE
_02243A9E:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x16
	str r0, [r4, #0x4c]
	strh r5, [r4, #0x3e]
	b _02243ABE
_02243AAE:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x16
	str r0, [r4, #0x4c]
	sub r0, #0x17
	strh r0, [r4, #0x3e]
_02243ABE:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02243A6C

	thumb_func_start ov70_02243AC4
ov70_02243AC4: ; 0x02243AC4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #5
	bl ov70_02241DB4
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3e
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02243AE6
	mov r0, #0x13
	str r0, [r4, #0x4c]
	b _02243B12
_02243AE6:
	mov r0, #3
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	sub r2, r1, #4
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02243B02
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_02243B02:
	ldr r0, [r4, #0xc]
	mov r1, #0x32
	bl Set2dSpriteAnimSeqNo
	mov r0, #2
	str r0, [r4, #0x4c]
	mov r0, #0x18
	str r0, [r4, #0x50]
_02243B12:
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02243AC4

	thumb_func_start ov70_02243B1C
ov70_02243B1C: ; 0x02243B1C
	mov r1, #0x14
	str r1, [r0, #0x4c]
	mov r1, #0x3e
	ldrsh r2, [r0, r1]
	sub r1, #0x3f
	str r2, [r0, #0x48]
	add r0, r1, #0
	bx lr
	thumb_func_end ov70_02243B1C

	thumb_func_start ov70_02243B2C
ov70_02243B2C: ; 0x02243B2C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x64
	mov r3, #0x1e
	bl sub_02019688
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02019B08
	add r0, r4, #0
	mov r1, #3
	bl ov70_0224190C
	mov r3, #0x3c
	ldrsh r3, [r4, r3]
	mov r2, #0x3e
	add r0, r4, #0
	lsl r5, r3, #2
	ldr r3, _02243BFC ; =ov70_02245E84
	ldrsh r2, [r4, r2]
	ldr r3, [r3, r5]
	ldr r1, [r4, #0x2c]
	add r0, #0x34
	add r2, r2, r3
	bl ov70_0223F904
	str r0, [r4, #0x5c]
	ldr r2, [r4, #0x5c]
	add r0, r4, #0
	mov r1, #0
	bl ov70_0224352C
	add r0, r4, #0
	mov r1, #0
	add r0, #0x5a
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	mov r1, #5
	bl ov70_02242508
	str r0, [sp]
	mov r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	add r2, #0x50
	bl ov70_02243F00
	ldr r2, [r4, #4]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	add r2, #0xe0
	mov r3, #0x44
	bl ov70_02243EB8
	mov r1, #0
	ldr r0, [r4, #0x1c]
	mov r2, #1
	add r3, r1, #0
	bl sub_020196E8
	mov r0, #0
	ldr r1, _02243C00 ; =ov70_02245D8A
	lsl r3, r0, #1
	ldr r2, _02243C04 ; =ov70_02245D8B
	str r0, [r4, #0x48]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	ldr r0, [r4, #0x10]
	mov r1, #0xb0
	mov r2, #0x88
	bl ov70_02238F9C
	ldr r0, [r4, #0x14]
	mov r1, #0x58
	mov r2, #0x88
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x19
	str r0, [r4, #0x4c]
	sub r0, #0x1a
	pop {r3, r4, r5, pc}
	nop
_02243BFC: .word ov70_02245E84
_02243C00: .word ov70_02245D8A
_02243C04: .word ov70_02245D8B
	thumb_func_end ov70_02243B2C

	thumb_func_start ov70_02243C08
ov70_02243C08: ; 0x02243C08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_02242C64
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02243C22
	add r0, r0, #1
	cmp r4, r0
	beq _02243C84
	b _02243C52
_02243C22:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #2
	str r0, [r5, #0x4c]
	mov r0, #0x1a
	str r0, [r5, #0x50]
	b _02243C84
_02243C52:
	mov r2, #6
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x1b
	str r0, [r5, #0x50]
	add r5, #0x42
	strh r4, [r5]
_02243C84:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_02243C08

	thumb_func_start ov70_02243C8C
ov70_02243C8C: ; 0x02243C8C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #3
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl ListMenuItems_dtor
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	cmp r0, #8
	ble _02243CA8
	bl GF_AssertFail
_02243CA8:
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	lsl r1, r0, #3
	ldr r0, _02243CC4 ; =ov70_02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _02243CBA
	mov r0, #0x13
	b _02243CBC
_02243CBA:
	mov r0, #0x17
_02243CBC:
	str r0, [r4, #0x4c]
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_02243CC4: .word ov70_02245F5C
	thumb_func_end ov70_02243C8C

	thumb_func_start ov70_02243CC8
ov70_02243CC8: ; 0x02243CC8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #3
	bl ov70_02241DB4
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02243CDE
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_02243CDE:
	ldr r0, [r4, #0x34]
	bl ListMenuItems_dtor
	mov r0, #0x42
	ldrsh r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02243CC8

	thumb_func_start ov70_02243CEC
ov70_02243CEC: ; 0x02243CEC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	str r1, [r4, #0x48]
	bl ov70_02242E58
	ldr r0, [r4, #0xc]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x48]
	ldr r1, _02243D20 ; =ov70_02245D66
	lsl r3, r0, #1
	ldr r2, _02243D24 ; =ov70_02245D67
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	mov r0, #1
	str r0, [r4, #0x4c]
	mov r0, #0x1d
	str r0, [r4, #0x50]
	sub r0, #0x1e
	pop {r4, pc}
	nop
_02243D20: .word ov70_02245D66
_02243D24: .word ov70_02245D67
	thumb_func_end ov70_02243CEC

	thumb_func_start ov70_02243D28
ov70_02243D28: ; 0x02243D28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_022426F4
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02243D42
	add r0, r0, #1
	cmp r4, r0
	beq _02243D8A
	b _02243D68
_02243D42:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x1e
	str r0, [r5, #0x50]
	sub r0, #0x20
	add r5, #0x44
	strb r0, [r5]
	b _02243D8A
_02243D68:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x1e
	str r0, [r5, #0x50]
	add r5, #0x44
	strb r4, [r5]
_02243D8A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02243D28

	thumb_func_start ov70_02243D90
ov70_02243D90: ; 0x02243D90
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl ov70_02241DB4
	mov r0, #0x44
	ldrsb r0, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov70_02243D90

	thumb_func_start ov70_02243DA0
ov70_02243DA0: ; 0x02243DA0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	str r1, [r4, #0x48]
	bl ov70_02242EE4
	ldr r0, [r4, #0xc]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x48]
	ldr r1, _02243DD4 ; =ov70_02245D80
	lsl r3, r0, #1
	ldr r2, _02243DD8 ; =ov70_02245D81
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	mov r0, #1
	str r0, [r4, #0x4c]
	mov r0, #0x20
	str r0, [r4, #0x50]
	sub r0, #0x21
	pop {r4, pc}
	nop
_02243DD4: .word ov70_02245D80
_02243DD8: .word ov70_02245D81
	thumb_func_end ov70_02243DA0

	thumb_func_start ov70_02243DDC
ov70_02243DDC: ; 0x02243DDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_022428C0
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02243DF6
	add r0, r0, #1
	cmp r4, r0
	beq _02243E6E
	b _02243E2C
_02243DF6:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x21
	str r0, [r5, #0x50]
	sub r0, #0x23
	add r5, #0x45
	strb r0, [r5]
	b _02243E6E
_02243E2C:
	mov r2, #4
	str r2, [sp]
	mov r1, #0
	ldr r0, [r5, #0x1c]
	add r3, r1, #0
	bl sub_020198FC
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	str r0, [r5, #0x4c]
	mov r0, #0x21
	str r0, [r5, #0x50]
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	ldr r1, [r5, #0x34]
	add r5, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	strb r0, [r5]
_02243E6E:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02243DDC

	thumb_func_start ov70_02243E74
ov70_02243E74: ; 0x02243E74
	push {r4, lr}
	add r4, r0, #0
	mov r1, #2
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl ListMenuItems_dtor
	mov r0, #0x45
	ldrsb r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02243E74

	thumb_func_start ov70_02243E8C
ov70_02243E8C: ; 0x02243E8C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	add r6, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov70_02242FC4
	add r0, r4, #0
	bl String_dtor
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov70_02243E8C

	thumb_func_start ov70_02243EB8
ov70_02243EB8: ; 0x02243EB8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	add r5, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02243EFC ; =0x000F0E02
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r6, #0
	mov r1, #0
	add r2, r5, #0
	bl sub_02019A60
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02243EFC: .word 0x000F0E02
	thumb_func_end ov70_02243EB8

	thumb_func_start ov70_02243F00
ov70_02243F00: ; 0x02243F00
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	add r1, r3, #1
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #2
	mov r3, #1
	bl sub_0200CDF0
	mov r1, #0
	str r1, [sp]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0x10
	bl sub_0200CDAC
	str r4, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r3, #0
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #2
	str r3, [sp, #8]
	bl sub_0200CDF0
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	bl sub_02019A60
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov70_02243F00

	thumb_func_start ov70_02243F54
ov70_02243F54: ; 0x02243F54
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x3d
	add r2, sp, #0
	bl ov70_0223F658
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x20]
	ldr r2, [sp]
	add r3, r5, #0
	bl ov70_0224342C
	add r4, r0, #0
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov70_02243F54

	thumb_func_start ov70_02243F7C
ov70_02243F7C: ; 0x02243F7C
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _02243FC8 ; =ov70_02245E84
	lsl r3, r1, #2
	ldr r4, [r2, r3]
	ldr r2, _02243FCC ; =ov70_02245F5C
	lsl r1, r1, #3
	ldr r2, [r2, r1]
	add r7, r0, #0
	cmp r2, #0
	ble _02243FB4
	mov r5, #0
	cmp r2, #0
	ble _02243FC2
	ldr r0, _02243FD0 ; =ov70_02245F58
	add r6, r0, r1
_02243F9A:
	add r0, r7, #0
	add r1, r4, r5
	bl ov70_02243F54
	cmp r0, #0
	ble _02243FAA
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02243FAA:
	ldr r0, [r6, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _02243F9A
	b _02243FC2
_02243FB4:
	add r1, r4, #0
	bl ov70_02243F54
	cmp r0, #0
	ble _02243FC2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02243FC2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243FC8: .word ov70_02245E84
_02243FCC: .word ov70_02245F5C
_02243FD0: .word ov70_02245F58
	thumb_func_end ov70_02243F7C

	thumb_func_start ov70_02243FD4
ov70_02243FD4: ; 0x02243FD4
	push {r3, lr}
	add r0, r1, #0
	add r1, sp, #0
	bl ov70_0223F8D0
	pop {r3, pc}
	thumb_func_end ov70_02243FD4

	thumb_func_start ov70_02243FE0
ov70_02243FE0: ; 0x02243FE0
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _0224402C ; =ov70_02245E84
	lsl r3, r1, #2
	ldr r4, [r2, r3]
	ldr r2, _02244030 ; =ov70_02245F5C
	lsl r1, r1, #3
	ldr r2, [r2, r1]
	add r7, r0, #0
	cmp r2, #0
	ble _02244018
	mov r5, #0
	cmp r2, #0
	ble _02244026
	ldr r0, _02244034 ; =ov70_02245F58
	add r6, r0, r1
_02243FFE:
	add r0, r7, #0
	add r1, r4, r5
	bl ov70_02243FD4
	cmp r0, #0
	ble _0224400E
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224400E:
	ldr r0, [r6, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _02243FFE
	b _02244026
_02244018:
	add r1, r4, #0
	bl ov70_02243FD4
	cmp r0, #0
	ble _02244026
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02244026:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224402C: .word ov70_02245E84
_02244030: .word ov70_02245F5C
_02244034: .word ov70_02245F58
	thumb_func_end ov70_02243FE0

	thumb_func_start ov70_02244038
ov70_02244038: ; 0x02244038
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov70_02244670
	ldr r2, _02244114 ; =0x04000304
	ldr r0, _02244118 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	bl ov70_022441A4
	add r0, r4, #0
	bl ov70_022442B4
	add r0, r4, #0
	bl ov70_0224458C
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	bl ov00_021EC5B4
	cmp r0, #0
	bne _022440FA
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	beq _022440EE
	ldr r0, [r1, #0x20]
	bl sub_02039418
	ldr r0, _0224411C ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _02244120 ; =0x00000BA8
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #2
	bl ov70_02238D84
	add r0, r4, #0
	bl ov70_02238F64
	b _0224410C
_022440EE:
	mov r0, #4
	bl Sys_ClearSleepDisableFlag
	mov r0, #0
	str r0, [r4, #0x2c]
	b _0224410C
_022440FA:
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl sub_02039418
	add r0, r4, #0
	bl ov70_02245124
	mov r0, #0x11
	str r0, [r4, #0x2c]
_0224410C:
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02244114: .word 0x04000304
_02244118: .word 0xFFFF7FFF
_0224411C: .word 0x00000F0F
_02244120: .word 0x00000BA8
	thumb_func_end ov70_02244038

	thumb_func_start ov70_02244124
ov70_02244124: ; 0x02244124
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov70_02238E44
	bl sub_0203A930
	ldr r4, [r5, #0x2c]
	ldr r1, _02244150 ; =ov70_02246780
	lsl r2, r4, #2
	ldr r1, [r1, r2]
	add r0, r5, #0
	blx r1
	ldr r1, [r5, #0x2c]
	cmp r4, r1
	beq _0224414E
	mov r1, #0x16
	mov r2, #0
	lsl r1, r1, #8
	strh r2, [r5, r1]
	add r1, r1, #2
	strh r2, [r5, r1]
_0224414E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244150: .word ov70_02246780
	thumb_func_end ov70_02244124

	thumb_func_start ov70_02244154
ov70_02244154: ; 0x02244154
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0224419C ; =0x000012D0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224416E
	bl DestroySysTask
	ldr r0, _0224419C ; =0x000012D0
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_0224416E:
	add r0, r4, #0
	bl ov70_022446A8
	add r0, r4, #0
	bl ov70_02244644
	ldr r0, [r4, #4]
	bl ov70_02244290
	ldr r0, _022441A0 ; =0x000012D4
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov70_02238E58
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02244196
	mov r0, #5
	pop {r4, pc}
_02244196:
	mov r0, #1
	pop {r4, pc}
	nop
_0224419C: .word 0x000012D0
_022441A0: .word 0x000012D4
	thumb_func_end ov70_02244154

	thumb_func_start ov70_022441A4
ov70_022441A4: ; 0x022441A4
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _02244280 ; =ov70_02246058
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
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
	ldr r5, _02244284 ; =ov70_0224603C
	add r3, sp, #0x38
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
	ldr r5, _02244288 ; =ov70_02246020
	add r3, sp, #0x1c
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
	ldr r5, _0224428C ; =ov70_02246074
	add r3, sp, #0
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
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3d
	bl BG_ClearCharDataRange
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_02244280: .word ov70_02246058
_02244284: .word ov70_0224603C
_02244288: .word ov70_02246020
_0224428C: .word ov70_02246074
	thumb_func_end ov70_022441A4

	thumb_func_start ov70_02244290
ov70_02244290: ; 0x02244290
	push {r4, lr}
	add r4, r0, #0
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
	thumb_func_end ov70_02244290

	thumb_func_start ov70_022442B4
ov70_022442B4: ; 0x022442B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	mov r0, #0x58
	mov r1, #0x3d
	bl NARC_ctor
	mov r2, #0
	str r2, [sp]
	mov r1, #0x3d
	str r1, [sp, #4]
	mov r1, #3
	add r3, r2, #0
	str r0, [sp, #0x2c]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r1, #3
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x3d
	bl LoadFontPal1
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x3d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x3d
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
	mov r0, #0x3d
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
	mov r0, #0x3d
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
	mov r0, #0x3d
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
	ldr r1, _022444CC ; =0x000012D0
	ldr r0, [sp, #0x10]
	lsl r2, r2, #4
	add r0, r0, r1
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x2c]
	mov r1, #5
	add r2, sp, #0x38
	mov r3, #0x3d
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r2, _022444D0 ; =0x000012D8
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	add r1, r1, r2
	mov r2, #0x80
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x38]
	ldr r2, _022444D4 ; =0x00001358
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
	ldr r1, _022444D4 ; =0x00001358
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	sub r1, #0x80
	add r0, r0, r1
	str r0, [sp, #0x14]
_02244404:
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r1, r0, #5
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x30]
_02244416:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _02244420
	bl GF_AssertFail
_02244420:
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
_02244438:
	ldr r0, _022444D0 ; =0x000012D8
	ldr r3, [sp, #0x34]
	ldrh r0, [r4, r0]
	add r1, r6, #0
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	bl sub_02003DE8
	add r7, r7, #1
	add r4, r4, #2
	add r6, r6, #2
	add r5, r5, #2
	cmp r7, #0x10
	blt _02244438
	ldr r0, [sp, #0x18]
	add r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _02244482
	mov r0, #3
	ldr r1, [sp, #0x20]
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02244416
	str r0, [sp, #0x20]
	mov r0, #1
	str r0, [sp, #0x1c]
	b _02244416
_02244482:
	ldr r0, [sp, #0x14]
	add r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02244404
	ldr r1, _022444D4 ; =0x00001358
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r1, _022444D8 ; =0x000012D4
	ldr r0, [sp, #0x10]
	mov r2, #1
	str r2, [r0, r1]
	ldr r2, _022444DC ; =0x000015FC
	mov r3, #0
	str r3, [r0, r2]
	sub r2, r1, #4
	ldr r1, [sp, #0x10]
	ldr r0, _022444E0 ; =ov70_022444E4
	add r1, r1, r2
	mov r2, #0x14
	bl sub_0200E33C
	ldr r2, _022444CC ; =0x000012D0
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [sp, #0x2c]
	bl NARC_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022444CC: .word 0x000012D0
_022444D0: .word 0x000012D8
_022444D4: .word 0x00001358
_022444D8: .word 0x000012D4
_022444DC: .word 0x000015FC
_022444E0: .word ov70_022444E4
	thumb_func_end ov70_022442B4

	thumb_func_start ov70_022444E4
ov70_022444E4: ; 0x022444E4
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02244582
	ldr r1, _02244584 ; =0x0000032B
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _02244582
	add r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _0224451A
	sub r0, r1, #3
	ldrsh r0, [r4, r0]
	add r2, r4, #0
	add r2, #0x88
	lsl r0, r0, #5
	add r0, r2, r0
	mov r1, #0
	mov r2, #0x20
	bl GX_LoadBGPltt
_0224451A:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02244528
	cmp r0, #2
	bne _0224453E
_02244528:
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
_0224453E:
	ldr r0, _02244588 ; =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _02244566
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _02244582
	mov r2, #0x13
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	mov r1, #1
	eor r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_02244566:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _02244582
	mov r2, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eor r1, r2
	strb r1, [r4, r0]
_02244582:
	pop {r4, pc}
	.balign 4, 0
_02244584: .word 0x0000032B
_02244588: .word 0x0000032A
	thumb_func_end ov70_022444E4

	thumb_func_start ov70_0224458C
ov70_0224458C: ; 0x0224458C
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
	mov r0, #0x94
	ldr r1, _02244634 ; =0x00000F48
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	bl AddWindowParameterized
	ldr r0, _02244634 ; =0x00000F48
	mov r1, #0
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
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r1, _02244638 ; =0x00000F38
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #4
	bl AddWindowParameterized
	ldr r0, _02244638 ; =0x00000F38
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #1
	mov r1, #0x2f
	ldr r0, _0224463C ; =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _02244638 ; =0x00000F38
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0
	bl ov70_02245050
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	ldr r1, _02244640 ; =0x00000F18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _02244640 ; =0x00000F18
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02244634: .word 0x00000F48
_02244638: .word 0x00000F38
_0224463C: .word 0x000F0E00
_02244640: .word 0x00000F18
	thumb_func_end ov70_0224458C

	thumb_func_start ov70_02244644
ov70_02244644: ; 0x02244644
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02244664 ; =0x00000F18
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _02244668 ; =0x00000F38
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0224466C ; =0x00000F48
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	nop
_02244664: .word 0x00000F18
_02244668: .word 0x00000F38
_0224466C: .word 0x00000F48
	thumb_func_end ov70_02244644

	thumb_func_start ov70_02244670
ov70_02244670: ; 0x02244670
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _022446A0 ; =0x00000BBC
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x3d
	bl String_ctor
	ldr r1, _022446A4 ; =0x00000BEC
	str r0, [r4, r1]
	sub r1, #0x4c
	ldr r0, [r4, r1]
	mov r1, #0x1f
	bl NewString_ReadMsgData
	mov r1, #0x2f
	lsl r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_022446A0: .word 0x00000BBC
_022446A4: .word 0x00000BEC
	thumb_func_end ov70_02244670

	thumb_func_start ov70_022446A8
ov70_022446A8: ; 0x022446A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _022446C8 ; =0x00000BEC
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _022446CC ; =0x00000BBC
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
_022446C8: .word 0x00000BEC
_022446CC: .word 0x00000BBC
	thumb_func_end ov70_022446A8

	thumb_func_start ov70_022446D0
ov70_022446D0: ; 0x022446D0
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _022446FC ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02244700 ; =0x00000BAC
	mov r2, #0x11
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #1
	bl ov70_02238D84
	ldr r0, _02244704 ; =0x000011FA
	mov r1, #1
	strh r1, [r4, r0]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_022446FC: .word 0x00000F0F
_02244700: .word 0x00000BAC
_02244704: .word 0x000011FA
	thumb_func_end ov70_022446D0

	thumb_func_start ov70_02244708
ov70_02244708: ; 0x02244708
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _02244742
	ldr r0, _02244768 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _0224476C ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _02244770 ; =0x00000BA8
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #2
	bl ov70_02238D84
	add r0, r4, #0
	bl ov70_02238F64
	b _02244760
_02244742:
	cmp r0, #2
	bne _02244760
	ldr r0, _02244768 ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	bl sub_0203946C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #0xb
	str r0, [r4, #0x2c]
_02244760:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02244768: .word 0x000011C8
_0224476C: .word 0x00000F0F
_02244770: .word 0x00000BA8
	thumb_func_end ov70_02244708

	thumb_func_start ov70_02244774
ov70_02244774: ; 0x02244774
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0224479C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #7
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0x10
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0224479C: .word 0x00000F0F
	thumb_func_end ov70_02244774

	thumb_func_start ov70_022447A0
ov70_022447A0: ; 0x022447A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02244800 ; =0x000011B0
	mov r1, #0x3d
	ldr r0, [r4, r0]
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _022447FC
	sub r1, r1, #1
	cmp r0, r1
	bne _022447DE
	bl ov00_021EC5B4
	cmp r0, #0
	bne _022447CA
	mov r0, #0
	str r0, [r4, #0x2c]
	b _022447FC
_022447CA:
	add r0, r4, #0
	mov r1, #7
	mov r2, #0xb
	bl ov70_02238E50
	mov r0, #1
	str r0, [r4, #0x1c]
	mov r0, #0xb
	str r0, [r4, #0x2c]
	b _022447FC
_022447DE:
	bl ov00_021EC5B4
	cmp r0, #0
	beq _022447EA
	bl ov00_021EC8D8
_022447EA:
	bl sub_0203946C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #0xb
	str r0, [r4, #0x2c]
_022447FC:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02244800: .word 0x000011B0
	thumb_func_end ov70_022447A0

	thumb_func_start ov70_02244804
ov70_02244804: ; 0x02244804
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0224482C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _02244830 ; =0x00000BAC
	mov r2, #0x1a
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0x12
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0224482C: .word 0x00000F0F
_02244830: .word 0x00000BAC
	thumb_func_end ov70_02244804

	thumb_func_start ov70_02244834
ov70_02244834: ; 0x02244834
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203946C
	bl ov00_021EC8D8
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #0x13
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02244834

	thumb_func_start ov70_02244854
ov70_02244854: ; 0x02244854
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_0203A914
	ldr r0, _02244880 ; =0x00000F0F
	ldr r1, _02244884 ; =0x00000BAC
	str r0, [sp]
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x1b
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0xb
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02244880: .word 0x00000F0F
_02244884: .word 0x00000BAC
	thumb_func_end ov70_02244854

	thumb_func_start ov70_02244888
ov70_02244888: ; 0x02244888
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl sub_02039418
	mov r0, #4
	bl Sys_SetSleepDisableFlag
	add r0, r4, #0
	bl ov70_02245124
	add r0, r4, #0
	add r0, #0x54
	mov r1, #2
	mov r2, #1
	mov r3, #0x14
	bl ov00_021EC3F0
	mov r0, #2
	bl ov00_021EC454
	bl ov00_021EC4A4
	mov r0, #3
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02244888

	thumb_func_start ov70_022448C0
ov70_022448C0: ; 0x022448C0
	push {r4, lr}
	sub sp, #0x48
	add r4, r0, #0
	bl ov00_021EC60C
	bl ov00_021EC5B4
	cmp r0, #0
	beq _0224493E
	bl ov00_021EC724
	cmp r0, #8
	bhi _0224491E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022448E6: ; jump table
	.short _0224491E - _022448E6 - 2 ; case 0
	.short _0224491E - _022448E6 - 2 ; case 1
	.short _0224491E - _022448E6 - 2 ; case 2
	.short _0224491E - _022448E6 - 2 ; case 3
	.short _02244934 - _022448E6 - 2 ; case 4
	.short _0224491E - _022448E6 - 2 ; case 5
	.short _0224491E - _022448E6 - 2 ; case 6
	.short _022448F8 - _022448E6 - 2 ; case 7
	.short _0224491E - _022448E6 - 2 ; case 8
_022448F8:
	add r0, sp, #8
	add r1, sp, #4
	bl ov00_021EC11C
	str r0, [r4, #0x40]
	ldr r0, [sp, #8]
	str r0, [r4, #0x44]
	ldr r0, [sp, #4]
	str r0, [r4, #0x48]
	bl ov00_021EC210
	bl ov00_021EC8D8
	add r0, r4, #0
	bl ov70_02238F80
	mov r0, #0x17
	str r0, [r4, #0x2c]
	b _0224493E
_0224491E:
	add r0, sp, #0
	bl ov00_021EC0FC
	add r0, r4, #0
	bl ov70_02238F80
	mov r0, #0x15
	str r0, [r4, #0x2c]
	sub r0, #0x17
	str r0, [r4, #0x3c]
	b _0224493E
_02244934:
	add r0, sp, #0xc
	bl ov00_021EC9E0
	mov r0, #4
	str r0, [r4, #0x2c]
_0224493E:
	mov r0, #3
	add sp, #0x48
	pop {r4, pc}
	thumb_func_end ov70_022448C0

	thumb_func_start ov70_02244944
ov70_02244944: ; 0x02244944
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021ECD04
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02244944

	thumb_func_start ov70_02244954
ov70_02244954: ; 0x02244954
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov00_021ECDC8
	cmp r0, #5
	bhi _022449F4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224496E: ; jump table
	.short _02244980 - _0224496E - 2 ; case 0
	.short _022449F4 - _0224496E - 2 ; case 1
	.short _022449F4 - _0224496E - 2 ; case 2
	.short _0224497A - _0224496E - 2 ; case 3
	.short _02244980 - _0224496E - 2 ; case 4
	.short _02244980 - _0224496E - 2 ; case 5
_0224497A:
	mov r0, #6
	str r0, [r4, #0x2c]
	b _022449F4
_02244980:
	add r0, r4, #0
	bl ov70_02238F80
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	str r0, [r4, #0x40]
	ldr r0, [sp, #4]
	str r0, [r4, #0x44]
	bl ov00_021EC210
	bl ov00_021EC8D8
	mov r0, #0x17
	str r0, [r4, #0x2c]
	ldr r1, [sp]
	cmp r1, #7
	bhi _022449E2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022449B2: ; jump table
	.short _022449E2 - _022449B2 - 2 ; case 0
	.short _022449C2 - _022449B2 - 2 ; case 1
	.short _022449C2 - _022449B2 - 2 ; case 2
	.short _022449D4 - _022449B2 - 2 ; case 3
	.short _022449C6 - _022449B2 - 2 ; case 4
	.short _022449DE - _022449B2 - 2 ; case 5
	.short _022449D0 - _022449B2 - 2 ; case 6
	.short _022449DE - _022449B2 - 2 ; case 7
_022449C2:
	str r0, [r4, #0x2c]
	b _022449E2
_022449C6:
	bl ov00_021FA0D8
	mov r0, #0x17
	str r0, [r4, #0x2c]
	b _022449E2
_022449D0:
	str r0, [r4, #0x2c]
	b _022449E2
_022449D4:
	bl ov00_021ED9B4
	mov r0, #0x17
	str r0, [r4, #0x2c]
	b _022449E2
_022449DE:
	bl sub_020399EC
_022449E2:
	ldr r1, [sp, #4]
	ldr r0, _022449FC ; =0xFFFFB1E0
	cmp r1, r0
	bge _022449F4
	ldr r0, _02244A00 ; =0xFFFF8AD1
	cmp r1, r0
	blt _022449F4
	mov r0, #0x17
	str r0, [r4, #0x2c]
_022449F4:
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_022449FC: .word 0xFFFFB1E0
_02244A00: .word 0xFFFF8AD1
	thumb_func_end ov70_02244954

	thumb_func_start ov70_02244A04
ov70_02244A04: ; 0x02244A04
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	bl sub_0202C08C
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl Sav2_SysInfo_GetField4C
	cmp r0, #0
	bne _02244A28
	ldr r1, [r5]
	ldr r0, [r1, #4]
	ldr r1, [r1, #0x34]
	bl Sav2_SysInfo_SetField4C
_02244A28:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl Sav2_SysInfo_GetField4C
	add r6, r0, #0
	add r0, r4, #0
	bl DWC_CreateFriendKey
	add r3, r0, #0
	add r2, r1, #0
	add r0, r6, #0
	add r1, r3, #0
	bl ov70_022378C0
	mov r0, #7
	str r0, [r5, #0x2c]
	mov r0, #3
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02244A04

	thumb_func_start ov70_02244A4C
ov70_02244A4C: ; 0x02244A4C
	push {r4, lr}
	add r4, r0, #0
	bl ov70_022382C0
	mov r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _02244A64 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_02244A64: .word 0x00001604
	thumb_func_end ov70_02244A4C

	thumb_func_start ov70_02244A68
ov70_02244A68: ; 0x02244A68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _02244B02
	bl ov70_02237F58
	add r5, r0, #0
	ldr r0, _02244B1C ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	add r0, r5, #0
	add r0, #0xf
	cmp r0, #0x11
	bhi _02244AF6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02244A94: ; jump table
	.short _02244ADA - _02244A94 - 2 ; case 0
	.short _02244AE8 - _02244A94 - 2 ; case 1
	.short _02244AF6 - _02244A94 - 2 ; case 2
	.short _02244ADA - _02244A94 - 2 ; case 3
	.short _02244AF6 - _02244A94 - 2 ; case 4
	.short _02244AF6 - _02244A94 - 2 ; case 5
	.short _02244AF6 - _02244A94 - 2 ; case 6
	.short _02244AF6 - _02244A94 - 2 ; case 7
	.short _02244AF6 - _02244A94 - 2 ; case 8
	.short _02244AF6 - _02244A94 - 2 ; case 9
	.short _02244AF6 - _02244A94 - 2 ; case 10
	.short _02244AF6 - _02244A94 - 2 ; case 11
	.short _02244AF6 - _02244A94 - 2 ; case 12
	.short _02244AE8 - _02244A94 - 2 ; case 13
	.short _02244ACC - _02244A94 - 2 ; case 14
	.short _02244AB8 - _02244A94 - 2 ; case 15
	.short _02244ABE - _02244A94 - 2 ; case 16
	.short _02244ACC - _02244A94 - 2 ; case 17
_02244AB8:
	mov r0, #9
	str r0, [r4, #0x2c]
	b _02244B18
_02244ABE:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244ACC:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244ADA:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244AE8:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244AF6:
	add r0, r4, #0
	bl ov70_02238F80
	bl sub_020399EC
	b _02244B18
_02244B02:
	ldr r0, _02244B1C ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02244B18
	bl sub_020399EC
_02244B18:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244B1C: .word 0x00001604
	thumb_func_end ov70_02244A68

	thumb_func_start ov70_02244B20
ov70_02244B20: ; 0x02244B20
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02244B4C ; =0x00001260
	ldr r0, [r0, #0x20]
	add r1, r4, r1
	bl sub_0203189C
	ldr r1, _02244B4C ; =0x00001260
	add r0, r4, r1
	add r1, #0x64
	add r1, r4, r1
	bl ov70_02238304
	mov r0, #0xa
	str r0, [r4, #0x2c]
	ldr r0, _02244B50 ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_02244B4C: .word 0x00001260
_02244B50: .word 0x00001604
	thumb_func_end ov70_02244B20

	thumb_func_start ov70_02244B54
ov70_02244B54: ; 0x02244B54
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	bne _02244B62
	b _02244C72
_02244B62:
	bl ov70_02237F58
	add r5, r0, #0
	ldr r0, _02244C8C ; =0x00001604
	mov r1, #0
	str r1, [r4, r0]
	add r0, r5, #0
	add r0, #0xf
	cmp r0, #0x11
	bhi _02244C66
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02244B82: ; jump table
	.short _02244C4A - _02244B82 - 2 ; case 0
	.short _02244C58 - _02244B82 - 2 ; case 1
	.short _02244C66 - _02244B82 - 2 ; case 2
	.short _02244C4A - _02244B82 - 2 ; case 3
	.short _02244C66 - _02244B82 - 2 ; case 4
	.short _02244C66 - _02244B82 - 2 ; case 5
	.short _02244C66 - _02244B82 - 2 ; case 6
	.short _02244C66 - _02244B82 - 2 ; case 7
	.short _02244C66 - _02244B82 - 2 ; case 8
	.short _02244C66 - _02244B82 - 2 ; case 9
	.short _02244C66 - _02244B82 - 2 ; case 10
	.short _02244C66 - _02244B82 - 2 ; case 11
	.short _02244C66 - _02244B82 - 2 ; case 12
	.short _02244C58 - _02244B82 - 2 ; case 13
	.short _02244C3C - _02244B82 - 2 ; case 14
	.short _02244BA6 - _02244B82 - 2 ; case 15
	.short _02244C2E - _02244B82 - 2 ; case 16
	.short _02244C3C - _02244B82 - 2 ; case 17
_02244BA6:
	add r0, r4, #0
	bl ov70_02238F80
	ldr r0, _02244C90 ; =0x000012C4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02244BBE
	cmp r1, #1
	beq _02244C0E
	cmp r1, #2
	beq _02244C18
	b _02244C22
_02244BBE:
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #3
	bhi _02244C08
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02244BD2: ; jump table
	.short _02244BDA - _02244BD2 - 2 ; case 0
	.short _02244BF4 - _02244BD2 - 2 ; case 1
	.short _02244BFE - _02244BD2 - 2 ; case 2
	.short _02244BEA - _02244BD2 - 2 ; case 3
_02244BDA:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov70_02238E50
	mov r0, #0xb
	str r0, [r4, #0x2c]
	b _02244C88
_02244BEA:
	ldr r0, _02244C94 ; =0xFFFFEC75
	str r0, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244BF4:
	ldr r0, _02244C98 ; =0xFFFFEC78
	str r0, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244BFE:
	ldr r0, _02244C9C ; =0xFFFFEC77
	str r0, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C08:
	bl sub_020399EC
	b _02244C88
_02244C0E:
	ldr r0, _02244CA0 ; =0xFFFFEC74
	str r0, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C18:
	ldr r0, _02244CA4 ; =0xFFFFEC73
	str r0, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C22:
	add r0, r4, #0
	bl ov70_02238F80
	bl sub_020399EC
	b _02244C88
_02244C2E:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C3C:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C4A:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C58:
	add r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	mov r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C66:
	add r0, r4, #0
	bl ov70_02238F80
	bl sub_020399EC
	b _02244C88
_02244C72:
	ldr r0, _02244C8C ; =0x00001604
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _02244C88
	bl sub_020399EC
_02244C88:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244C8C: .word 0x00001604
_02244C90: .word 0x000012C4
_02244C94: .word 0xFFFFEC75
_02244C98: .word 0xFFFFEC78
_02244C9C: .word 0xFFFFEC77
_02244CA0: .word 0xFFFFEC74
_02244CA4: .word 0xFFFFEC73
	thumb_func_end ov70_02244B54

	thumb_func_start ov70_02244CA8
ov70_02244CA8: ; 0x02244CA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	neg r0, r0
	bl ov00_021E6A70
	ldr r2, [r4, #0x44]
	add r1, r0, #0
	add r0, r4, #0
	neg r2, r2
	bl ov70_022451A8
	mov r0, #0x18
	str r0, [r4, #0x2c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02244CA8

	thumb_func_start ov70_02244CCC
ov70_02244CCC: ; 0x02244CCC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02244CFC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _02244CE8
	mov r0, #2
	tst r0, r1
	bne _02244CE8
	ldr r0, _02244D00 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02244CF6
_02244CE8:
	ldr r0, _02244D04 ; =0x00000F48
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	mov r0, #0
	str r0, [r4, #0x2c]
_02244CF6:
	mov r0, #3
	pop {r4, pc}
	nop
_02244CFC: .word gSystem
_02244D00: .word gSystem + 0x40
_02244D04: .word 0x00000F48
	thumb_func_end ov70_02244CCC

	thumb_func_start ov70_02244D08
ov70_02244D08: ; 0x02244D08
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0203A914
	add r0, r4, #0
	bl ov70_02238F80
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _02244D40 ; =0x000011FC
	mov r1, #1
	str r1, [r4, r0]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02244D40: .word 0x000011FC
	thumb_func_end ov70_02244D08

	thumb_func_start ov70_02244D44
ov70_02244D44: ; 0x02244D44
	push {r4, lr}
	add r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _02244D68
	ldr r0, _02244D7C ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #0xb
	str r0, [r4, #0x2c]
	b _02244D78
_02244D68:
	cmp r0, #2
	bne _02244D78
	ldr r0, _02244D7C ; =0x000011C8
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0
	str r0, [r4, #0x2c]
_02244D78:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02244D7C: .word 0x000011C8
	thumb_func_end ov70_02244D44

	thumb_func_start ov70_02244D80
ov70_02244D80: ; 0x02244D80
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r2, #0xd
	ldr r0, [r4, #0x3c]
	mvn r2, r2
	cmp r0, r2
	bgt _02244DBE
	bge _02244DFA
	ldr r1, _02244E38 ; =0xFFFFEC78
	cmp r0, r1
	bgt _02244DB6
	ldr r1, _02244E3C ; =0x0000138D
	add r1, r0, r1
	bmi _02244DFE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02244DAA: ; jump table
	.short _02244E12 - _02244DAA - 2 ; case 0
	.short _02244E0E - _02244DAA - 2 ; case 1
	.short _02244E02 - _02244DAA - 2 ; case 2
	.short _02244DFE - _02244DAA - 2 ; case 3
	.short _02244E0A - _02244DAA - 2 ; case 4
	.short _02244E06 - _02244DAA - 2 ; case 5
_02244DB6:
	mov r1, #0xe
	mvn r1, r1
	cmp r0, r1
	b _02244DFE
_02244DBE:
	add r1, r2, #0
	add r1, #9
	cmp r0, r1
	bgt _02244DD4
	add r1, r2, #0
	add r1, #9
	cmp r0, r1
	bge _02244DFE
	add r1, r2, #2
	cmp r0, r1
	b _02244DFE
_02244DD4:
	add r0, r0, #3
	cmp r0, #5
	bhi _02244DFE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02244DE6: ; jump table
	.short _02244DFE - _02244DE6 - 2 ; case 0
	.short _02244DFA - _02244DE6 - 2 ; case 1
	.short _02244DF6 - _02244DE6 - 2 ; case 2
	.short _02244DFE - _02244DE6 - 2 ; case 3
	.short _02244DF2 - _02244DE6 - 2 ; case 4
	.short _02244DF6 - _02244DE6 - 2 ; case 5
_02244DF2:
	mov r2, #0x96
	b _02244E14
_02244DF6:
	mov r2, #0x97
	b _02244E14
_02244DFA:
	mov r2, #0x9c
	b _02244E14
_02244DFE:
	mov r2, #0x9b
	b _02244E14
_02244E02:
	mov r2, #0xb9
	b _02244E14
_02244E06:
	mov r2, #0xb6
	b _02244E14
_02244E0A:
	mov r2, #0xb6
	b _02244E14
_02244E0E:
	mov r2, #0xb7
	b _02244E14
_02244E12:
	mov r2, #0xb8
_02244E14:
	ldr r0, _02244E40 ; =0x00000F0F
	mov r1, #0xba
	str r0, [sp]
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r3, #1
	bl ov70_02244FA4
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0x16
	bl ov70_02238D84
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02244E38: .word 0xFFFFEC78
_02244E3C: .word 0x0000138D
_02244E40: .word 0x00000F0F
	thumb_func_end ov70_02244D80

	thumb_func_start ov70_02244E44
ov70_02244E44: ; 0x02244E44
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0x16
	add r4, r0, #0
	lsl r1, r1, #8
	ldrsh r1, [r4, r1]
	cmp r1, #3
	bhi _02244EE8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02244E60: ; jump table
	.short _02244E68 - _02244E60 - 2 ; case 0
	.short _02244E86 - _02244E60 - 2 ; case 1
	.short _02244EAC - _02244E60 - 2 ; case 2
	.short _02244ECA - _02244E60 - 2 ; case 3
_02244E68:
	ldr r1, _02244F0C ; =0x00000F0F
	mov r2, #0xba
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	mov r0, #0x16
	lsl r0, r0, #8
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244E86:
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02244F04
	bl sub_0203946C
	bl ov00_021EC8D8
	mov r0, #0x16
	lsl r0, r0, #8
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244EAC:
	ldr r1, _02244F0C ; =0x00000F0F
	mov r2, #0xbb
	str r1, [sp]
	mov r1, #0xba
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov70_02244FA4
	mov r0, #0x16
	lsl r0, r0, #8
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244ECA:
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02244F04
	mov r0, #0x16
	lsl r0, r0, #8
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244EE8:
	ldr r0, _02244F10 ; =0x00001602
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _02244F04
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov70_02238E50
	mov r0, #0xb
	str r0, [r4, #0x2c]
_02244F04:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02244F0C: .word 0x00000F0F
_02244F10: .word 0x00001602
	thumb_func_end ov70_02244E44

	thumb_func_start ov70_02244F14
ov70_02244F14: ; 0x02244F14
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02244F2E
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02244F2E:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02244F14

	thumb_func_start ov70_02244F34
ov70_02244F34: ; 0x02244F34
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02244F62
	mov r0, #0x47
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _02244F58
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02244F58:
	mov r0, #0x47
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02244F62:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02244F34

	thumb_func_start ov70_02244F68
ov70_02244F68: ; 0x02244F68
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02244F9A
	mov r0, #0
	str r0, [sp]
	mov r2, #0x8d
	ldr r0, [r4, #4]
	mov r1, #0xa
	lsl r2, r2, #2
	mov r3, #8
	bl ov70_02238C14
	ldr r1, _02244FA0 ; =0x000011C8
	str r0, [r4, r1]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02244F9A:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02244FA0: .word 0x000011C8
	thumb_func_end ov70_02244F68

	thumb_func_start ov70_02244FA4
ov70_02244FA4: ; 0x02244FA4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r1, _0224500C ; =0x00000B9C
	add r2, r6, #0
	ldr r0, [r5, r1]
	add r1, #0x20
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	ldr r0, _02245010 ; =0x00000F18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _02245010 ; =0x00000F18
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _02245010 ; =0x00000F18
	ldr r2, _02245014 ; =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r5, r0]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0224500C: .word 0x00000B9C
_02245010: .word 0x00000F18
_02245014: .word 0x00000BBC
	thumb_func_end ov70_02244FA4

	thumb_func_start ov70_02245018
ov70_02245018: ; 0x02245018
	push {r4, lr}
	add r4, r0, #0
	cmp r3, #1
	beq _02245026
	cmp r3, #2
	beq _0224503C
	b _0224504A
_02245026:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	b _0224504A
_0224503C:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r2, r1, r0
_0224504A:
	add r0, r2, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov70_02245018

	thumb_func_start ov70_02245050
ov70_02245050: ; 0x02245050
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
	bl ov70_02245018
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
	thumb_func_end ov70_02245050

	thumb_func_start ov70_02245084
ov70_02245084: ; 0x02245084
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x24]
	add r5, r0, #0
	str r3, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	add r6, r1, #0
	bl ov70_02245018
	add r3, r0, #0
	str r4, [sp]
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov70_02245084

	thumb_func_start ov70_022450B8
ov70_022450B8: ; 0x022450B8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x24]
	add r5, r0, #0
	str r3, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	add r6, r1, #0
	bl ov70_02245018
	add r3, r0, #0
	str r4, [sp]
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r1, #4
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_022450B8

	thumb_func_start ov70_022450EC
ov70_022450EC: ; 0x022450EC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	ldr r1, _0224511C ; =ov70_0224600C
	lsl r2, r2, #2
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r2, #0
	ldr r0, _02245120 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov70_02245084
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224511C: .word ov70_0224600C
_02245120: .word 0x00010200
	thumb_func_end ov70_022450EC

	thumb_func_start ov70_02245124
ov70_02245124: ; 0x02245124
	ldr r3, _02245128 ; =sub_0203A880
	bx r3
	.balign 4, 0
_02245128: .word sub_0203A880
	thumb_func_end ov70_02245124

	thumb_func_start ov70_0224512C
ov70_0224512C: ; 0x0224512C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	add r6, r1, #0
	lsl r0, r0, #8
	mov r1, #0x3d
	bl String_ctor
	add r4, r0, #0
	ldr r0, _02245198 ; =0x00000BAC
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r1, _0224519C ; =0x00000B9C
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, #0x50
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	ldr r0, _022451A0 ; =0x00000F48
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _022451A0 ; =0x00000F48
	mov r1, #1
	add r0, r5, r0
	mov r2, #0x1f
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _022451A0 ; =0x00000F48
	ldr r2, _022451A4 ; =0x00000BEC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02245198: .word 0x00000BAC
_0224519C: .word 0x00000B9C
_022451A0: .word 0x00000F48
_022451A4: .word 0x00000BEC
	thumb_func_end ov70_0224512C

	thumb_func_start ov70_022451A8
ov70_022451A8: ; 0x022451A8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	cmp r4, r0
	bne _022451BA
	mov r4, #0xb
_022451BA:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022451E4 ; =0x00000B9C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, _022451E8 ; =0x00000F18
	mov r1, #1
	add r0, r5, r0
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r1, r4, #0
	bl ov70_0224512C
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022451E4: .word 0x00000B9C
_022451E8: .word 0x00000F18
	thumb_func_end ov70_022451A8

	.rodata

_022451EC:
	.byte 0x02, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x80, 0x01, 0xBC, 0x01, 0x3C, 0x00

ov70_022451F8: ; 0x022451F8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245208: ; 0x02245208
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00

ov70_02245218: ; 0x02245218
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov70_02245240: ; 0x02245240
	.byte 0x80, 0x00

ov70_02245242: ; 0x02245242
	.byte 0x38, 0x00, 0x80, 0x00, 0x60, 0x00, 0x80, 0x00, 0x88, 0x00

ov70_0224524C: ; 0x0224524C
	.byte 0x28, 0x47, 0x18, 0xE7
	.byte 0x50, 0x6F, 0x18, 0xE7, 0x78, 0x97, 0x18, 0xE7, 0xFF, 0x00, 0x00, 0x00

ov70_0224525C: ; 0x0224525C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_0224526C: ; 0x0224526C
	.byte 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00

ov70_02245284: ; 0x02245284
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022452A0: ; 0x022452A0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022452BC: ; 0x022452BC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022452D8: ; 0x022452D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_022452F4: ; 0x022452F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245310: ; 0x02245310
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_0224532C: ; 0x0224532C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245348: ; 0x02245348
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245364: ; 0x02245364
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245380: ; 0x02245380
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_0224539C: ; 0x0224539C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022453B8: ; 0x022453B8
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov70_02245498: ; 0x02245498
	.byte 0xA2, 0xBF, 0x03, 0x7D, 0xA2, 0xBF, 0x82, 0xFD
	.byte 0xFF, 0x00, 0x00, 0x00

ov70_022454A4: ; 0x022454A4
	.byte 0x01

ov70_022454A5: ; 0x022454A5
	.byte 0x02, 0x03, 0x00, 0x00, 0x04, 0x05, 0x01, 0x02, 0x06, 0x05, 0x03
	.byte 0x04, 0x06, 0x00, 0x00

ov70_022454B4: ; 0x022454B4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022454D0: ; 0x022454D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022454EC: ; 0x022454EC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00

ov70_0224562C: ; 0x0224562C
	.byte 0x01, 0x00, 0x10, 0x00
	.byte 0x02, 0x00, 0x12, 0x00

ov70_02245634: ; 0x02245634
	.byte 0x16, 0x00, 0x08, 0x00, 0x16, 0x00, 0x0D, 0x00, 0x16, 0x00, 0x03, 0x00

ov70_02245640: ; 0x02245640
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x06, 0x00, 0x02, 0x00, 0x08, 0x00
	.byte 0x01, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0D, 0x00

ov70_02245658: ; 0x02245658
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x07, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245674: ; 0x02245674
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245690: ; 0x02245690
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022456AC: ; 0x022456AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022456C8: ; 0x022456C8
	.byte 0x03, 0x29, 0x02, 0x63, 0x2B, 0x51, 0x02, 0x63
	.byte 0x53, 0x79, 0x02, 0x63, 0x7B, 0xA1, 0x02, 0x63, 0x13, 0x2D, 0x91, 0xFF, 0x3A, 0x55, 0x91, 0xFF
	.byte 0x62, 0x7D, 0x91, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov70_022456E8: ; 0x022456E8
	.byte 0x9A, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0C, 0x00

ov70_022456F0: ; 0x022456F0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245700: ; 0x02245700
	.byte 0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x33, 0x00, 0x34, 0x00

ov70_02245714: ; 0x02245714
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245730: ; 0x02245730
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_0224574C: ; 0x0224574C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245768: ; 0x02245768
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245784: ; 0x02245784
	.byte 0x13, 0x00

ov70_02245786: ; 0x02245786
	.byte 0x24, 0x00, 0x2D, 0x00, 0x24, 0x00, 0x47, 0x00, 0x24, 0x00
	.byte 0x61, 0x00, 0x24, 0x00, 0x7B, 0x00, 0x24, 0x00, 0x95, 0x00, 0x24, 0x00, 0x13, 0x00, 0x3B, 0x00
	.byte 0x2D, 0x00, 0x3B, 0x00, 0x47, 0x00, 0x3B, 0x00, 0x61, 0x00, 0x3B, 0x00, 0x7B, 0x00, 0x3B, 0x00
	.byte 0x95, 0x00, 0x3B, 0x00, 0x13, 0x00, 0x52, 0x00, 0x2D, 0x00, 0x52, 0x00, 0x47, 0x00, 0x52, 0x00
	.byte 0x61, 0x00, 0x52, 0x00, 0x7B, 0x00, 0x52, 0x00, 0x95, 0x00, 0x52, 0x00, 0x13, 0x00, 0x69, 0x00
	.byte 0x2D, 0x00, 0x69, 0x00, 0x47, 0x00, 0x69, 0x00, 0x61, 0x00, 0x69, 0x00, 0x7B, 0x00, 0x69, 0x00
	.byte 0x95, 0x00, 0x69, 0x00, 0x13, 0x00, 0x80, 0x00, 0x2D, 0x00, 0x80, 0x00, 0x47, 0x00, 0x80, 0x00
	.byte 0x61, 0x00, 0x80, 0x00, 0x7B, 0x00, 0x80, 0x00, 0x95, 0x00, 0x80, 0x00, 0xE0, 0x00, 0x87, 0x00
	.byte 0x52, 0x00, 0x10, 0x00

ov70_02245804: ; 0x02245804
	.byte 0x1F, 0x06, 0x05, 0x01, 0x1F, 0x07, 0x00, 0x02, 0x1F, 0x08, 0x01, 0x03
	.byte 0x1F, 0x09, 0x02, 0x04, 0x1F, 0x0A, 0x03, 0x05, 0x1F, 0x0B, 0x04, 0x00, 0x00, 0x0C, 0x0B, 0x07
	.byte 0x01, 0x0D, 0x06, 0x08, 0x02, 0x0E, 0x07, 0x09, 0x03, 0x0F, 0x08, 0x0A, 0x04, 0x10, 0x09, 0x0B
	.byte 0x05, 0x11, 0x0A, 0x06, 0x06, 0x12, 0x11, 0x0D, 0x07, 0x13, 0x0C, 0x0E, 0x08, 0x14, 0x0D, 0x0F
	.byte 0x09, 0x15, 0x0E, 0x10, 0x0A, 0x16, 0x0F, 0x11, 0x0B, 0x17, 0x10, 0x0C, 0x0C, 0x18, 0x17, 0x13
	.byte 0x0D, 0x19, 0x12, 0x14, 0x0E, 0x1A, 0x13, 0x15, 0x0F, 0x1B, 0x14, 0x16, 0x10, 0x1C, 0x15, 0x17
	.byte 0x11, 0x1D, 0x16, 0x12, 0x12, 0x1F, 0x1E, 0x19, 0x13, 0x1F, 0x18, 0x1A, 0x14, 0x1F, 0x19, 0x1B
	.byte 0x15, 0x1F, 0x1A, 0x1C, 0x16, 0x1F, 0x1B, 0x1D, 0x17, 0x1F, 0x1C, 0x1E, 0x1E, 0x1E, 0x1D, 0x18
	.byte 0x1A, 0x02, 0x63, 0x65

ov70_02245884: ; 0x02245884
	.byte 0x17, 0x31, 0x08, 0x1E, 0x17, 0x31, 0x22, 0x38, 0x17, 0x31, 0x3C, 0x52
	.byte 0x17, 0x31, 0x56, 0x6C, 0x17, 0x31, 0x70, 0x86, 0x17, 0x31, 0x8A, 0xA0, 0x2E, 0x48, 0x08, 0x1E
	.byte 0x2E, 0x48, 0x22, 0x38, 0x2E, 0x48, 0x3C, 0x52, 0x2E, 0x48, 0x56, 0x6C, 0x2E, 0x48, 0x70, 0x86
	.byte 0x2E, 0x48, 0x8A, 0xA0, 0x45, 0x5F, 0x08, 0x1E, 0x45, 0x5F, 0x22, 0x38, 0x45, 0x5F, 0x3C, 0x52
	.byte 0x45, 0x5F, 0x56, 0x6C, 0x45, 0x5F, 0x70, 0x86, 0x45, 0x5F, 0x8A, 0xA0, 0x5C, 0x76, 0x08, 0x1E
	.byte 0x5C, 0x76, 0x22, 0x38, 0x5C, 0x76, 0x3C, 0x52, 0x5C, 0x76, 0x56, 0x6C, 0x5C, 0x76, 0x70, 0x86
	.byte 0x5C, 0x76, 0x8A, 0xA0, 0x73, 0x8D, 0x08, 0x1E, 0x73, 0x8D, 0x22, 0x38, 0x73, 0x8D, 0x3C, 0x52
	.byte 0x73, 0x8D, 0x56, 0x6C, 0x73, 0x8D, 0x70, 0x86, 0x73, 0x8D, 0x8A, 0xA0, 0x7B, 0x94, 0xBA, 0xF5
	.byte 0x04, 0x1C, 0x92, 0xA2, 0x04, 0x1C, 0x02, 0x12, 0xFF, 0x00, 0x00, 0x00

ov70_0224590C: ; 0x0224590C
	.byte 0x82, 0x00, 0x00, 0x00

ov70_02245910: ; 0x02245910
	.byte 0x7C, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00

ov70_02245920: ; 0x02245920
	.byte 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x05, 0x00, 0x03, 0x00, 0x07, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x0D, 0x00, 0x03, 0x00, 0x0F, 0x00

ov70_02245938: ; 0x02245938
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245954: ; 0x02245954
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245970: ; 0x02245970
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_0224598C: ; 0x0224598C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x06, 0x00, 0x04, 0x08, 0x00, 0x12
	.byte 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_022459C8: ; 0x022459C8
	.byte 0x00, 0x00, 0x08, 0x01, 0x16, 0x02, 0x23, 0x03
	.byte 0x26, 0x04, 0x29, 0x05, 0x2D, 0x06, 0x38, 0x07, 0x3C, 0x08, 0x43, 0x09, 0x46, 0x0A, 0x48, 0x0B
	.byte 0x4C, 0x0C, 0x54, 0x0D, 0x5B, 0x0E, 0x5C, 0x0F, 0x63, 0x11, 0x66, 0x12, 0x73, 0x13, 0x78, 0x14
	.byte 0x7F, 0x15, 0x82, 0xFF

ov70_022459F4: ; 0x022459F4
	.byte 0x9F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0A, 0x00, 0xA1, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x14, 0x00, 0xA2, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x1E, 0x00, 0xA3, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x28, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x32, 0x00, 0xA5, 0x00, 0x00, 0x00, 0x33, 0x00, 0x3C, 0x00, 0xA6, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x46, 0x00, 0xA7, 0x00, 0x00, 0x00, 0x47, 0x00, 0x50, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0x51, 0x00, 0x5A, 0x00, 0xA9, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x64, 0x00

ov70_02245A4C: ; 0x02245A4C
	.byte 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x82, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00

ov70_02245AAC: ; 0x02245AAC
	.byte 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00
	.byte 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00

ov70_02245B5C: ; 0x02245B5C
	.byte 0x01, 0x00, 0x02, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0F, 0x00, 0x10, 0x00
	.byte 0x11, 0x00, 0x12, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x19, 0x00, 0x1B, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x1F, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x28, 0x00
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x2D, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00, 0x34, 0x00, 0x36, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x45, 0x00
	.byte 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x4A, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00
	.byte 0x51, 0x00, 0x52, 0x00, 0x53, 0x00, 0x55, 0x00, 0x56, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00
	.byte 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x61, 0x00, 0x62, 0x00, 0x64, 0x00
	.byte 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x6B, 0x00, 0x6F, 0x00, 0x73, 0x00, 0x75, 0x00
	.byte 0x76, 0x00, 0x79, 0x00, 0x7A, 0x00, 0x7E, 0x00, 0x81, 0x00, 0x83, 0x00, 0x85, 0x00, 0x87, 0x00
	.byte 0x8C, 0x00, 0x8E, 0x00, 0x92, 0x00, 0x94, 0x00, 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x9C, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0xA0, 0x00, 0xA1, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0xA6, 0x00
	.byte 0xA7, 0x00, 0x6E, 0x00, 0xAB, 0x00, 0xAC, 0x00, 0xB3, 0x00, 0xB7, 0x00, 0xBA, 0x00, 0xBB, 0x00
	.byte 0xBC, 0x00, 0xBD, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC4, 0x00, 0xC6, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xCA, 0x00, 0xCD, 0x00, 0xCF, 0x00, 0xD3, 0x00, 0xD4, 0x00, 0xD8, 0x00, 0xDA, 0x00
	.byte 0xDB, 0x00, 0xCC, 0x00, 0xDD, 0x00, 0xDC, 0x00, 0xDE, 0x00, 0xE0, 0x00, 0xE2, 0x00, 0xE3, 0x00

ov70_02245C60: ; 0x02245C60
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245C70: ; 0x02245C70
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245C8C: ; 0x02245C8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245CA8: ; 0x02245CA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245CC4: ; 0x02245CC4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245CE0: ; 0x02245CE0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245CFC: ; 0x02245CFC
	.byte 0x00, 0x24, 0x00, 0x26
	.byte 0x00, 0x28, 0x00, 0x2A, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x30

ov70_02245D0A: ; 0x02245D0A
	.byte 0x80, 0x00

ov70_02245D0C: ; 0x02245D0C
	.byte 0x36, 0x00, 0x60, 0x00
	.byte 0x37, 0x00, 0xA0, 0x00, 0x37, 0x00, 0x40, 0x00, 0x46, 0x00, 0xC0, 0x00, 0x46, 0x00, 0x30, 0x00
	.byte 0x66, 0x00, 0xD0, 0x00, 0x66, 0x00

ov70_02245D26: ; 0x02245D26
	.byte 0x46, 0x66, 0x70, 0x90, 0x47, 0x67, 0x50, 0x70, 0x47, 0x67
	.byte 0x90, 0xB0, 0x56, 0x76, 0x30, 0x50, 0x56, 0x76, 0xB0, 0xD0, 0x76, 0x96, 0x20, 0x40, 0x76, 0x96
	.byte 0xC0, 0xE0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02245D48: ; 0x02245D48
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00

ov70_02245D50: ; 0x02245D50
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, FS_OVERLAY_ID(OVY_71)

ov70_02245D60: ; 0x02245D60
	.byte 0x04, 0x03, 0x04, 0x07, 0x04, 0x0B

ov70_02245D66: ; 0x02245D66
	.byte 0xC0

ov70_02245D67: ; 0x02245D67
	.byte 0x20, 0xC0, 0x40, 0xC0, 0x60, 0xC0, 0x88

ov70_02245D6E: ; 0x02245D6E
	.byte 0x03, 0x02
	.byte 0x03, 0x05, 0x03, 0x08, 0x03, 0x0B

ov70_02245D76: ; 0x02245D76
	.byte 0xC0

ov70_02245D77: ; 0x02245D77
	.byte 0x18, 0xC0, 0x30, 0xC0, 0x48, 0xC0, 0x60, 0xC0, 0x88

ov70_02245D80: ; 0x02245D80
	.byte 0xC0

ov70_02245D81: ; 0x02245D81
	.byte 0x18, 0xC0, 0x30, 0xC0, 0x48, 0xC0, 0x60, 0xC0, 0x88

ov70_02245D8A: ; 0x02245D8A
	.byte 0x88

ov70_02245D8B: ; 0x02245D8B
	.byte 0x10, 0x88, 0x28, 0x88, 0x40
	.byte 0x88, 0x58, 0x88, 0x70, 0xC0, 0x88

ov70_02245D96: ; 0x02245D96
	.byte 0x03, 0x01, 0x03, 0x04, 0x03, 0x07, 0x03, 0x0A, 0x03, 0x0D
	.byte 0x18, 0x11

ov70_02245DA2: ; 0x02245DA2
	.byte 0x04, 0x02, 0x00, 0x04, 0x05, 0x00, 0x04, 0x08, 0x00, 0x04, 0x0B, 0x00, 0x00, 0x00

ov70_02245DB0: ; 0x02245DB0
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov70_02245DC0: ; 0x02245DC0
	.byte 0x03

ov70_02245DC1: ; 0x02245DC1
	.byte 0x03

ov70_02245DC2: ; 0x02245DC2
	.byte 0x02

ov70_02245DC3: ; 0x02245DC3
	.byte 0x01, 0x03, 0x03, 0x00, 0x02, 0x03, 0x03, 0x01, 0x00, 0x02, 0x02, 0x03, 0x03

ov70_02245DD0: ; 0x02245DD0
	.byte 0x18, 0x2C, 0x88, 0xF8, 0x38, 0x4C, 0x88, 0xF8, 0x58, 0x6C, 0x88, 0xF8, 0x85, 0x9A, 0xC5, 0xFA
	.byte 0xFF, 0x00, 0x00, 0x00

ov70_02245DE4: ; 0x02245DE4
	.byte 0x28, 0x3C, 0x88, 0x97, 0x28, 0x3C, 0xA8, 0xB7, 0x28, 0x3C, 0xC8, 0xD7
	.byte 0x85, 0x9A, 0xC5, 0xFA, 0xFF, 0x00, 0x00, 0x00

ov70_02245DF8: ; 0x02245DF8
	.byte 0x01

ov70_02245DF9: ; 0x02245DF9
	.byte 0x05, 0x05, 0x05, 0x09, 0x05, 0x0D, 0x05
	.byte 0x01, 0x08, 0x05, 0x08, 0x09, 0x08, 0x0D, 0x08, 0x01, 0x0B, 0x08, 0x11, 0x08, 0x03

ov70_02245E0E: ; 0x02245E0E
	.byte 0x01, 0x05

ov70_02245E10: ; 0x02245E10
	.byte 0x05, 0x05, 0x09, 0x05, 0x0D, 0x05, 0x01, 0x08, 0x05, 0x08, 0x09, 0x08, 0x0D, 0x08, 0x01, 0x0B
	.byte 0x09, 0x11, 0x01, 0x02, 0x01, 0x02

ov70_02245E26: ; 0x02245E26
	.byte 0x01

ov70_02245E27: ; 0x02245E27
	.byte 0x05, 0x05, 0x05, 0x09, 0x05, 0x0D, 0x05, 0x01, 0x08
	.byte 0x05, 0x08, 0x09, 0x08, 0x0D, 0x08, 0x01, 0x0B, 0x08, 0x11, 0x01, 0x02, 0x01, 0x02

ov70_02245E3E: ; 0x02245E3E
	.byte 0x10, 0x23
	.byte 0x88, 0xF8, 0x28, 0x3C, 0x88, 0xF8, 0x40, 0x54, 0x88, 0xF8, 0x58, 0x6C, 0x88, 0xF8, 0x85, 0x9A
	.byte 0xC6, 0xF8, 0x6C, 0x81, 0x8F, 0xA0, 0x6C, 0x7E, 0xDF, 0xF0, 0xFF, 0x00, 0x00, 0x00

ov70_02245E5E: ; 0x02245E5E
	.byte 0x08, 0x1C
	.byte 0x08, 0xF7, 0x20, 0x34, 0x08, 0xF7, 0x38, 0x4C, 0x08, 0xF7, 0x50, 0x64, 0x08, 0xF7, 0x68, 0x7C
	.byte 0x08, 0xF7, 0x85, 0x9A, 0xC3, 0xF8, 0x7C, 0x91, 0x4D, 0x60, 0x7C, 0x91, 0xAD, 0xBE, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245E84: ; 0x02245E84
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00

ov70_02245EA8: ; 0x02245EA8
	.byte 0x09

ov70_02245EA9: ; 0x02245EA9
	.byte 0x04

ov70_02245EAA: ; 0x02245EAA
	.byte 0x03

ov70_02245EAB: ; 0x02245EAB
	.byte 0x01, 0x09, 0x05, 0x00, 0x02
	.byte 0x09, 0x06, 0x01, 0x03, 0x09, 0x07, 0x02, 0x00, 0x00, 0x08, 0x07, 0x05, 0x01, 0x09, 0x04, 0x06
	.byte 0x02, 0x09, 0x05, 0x07, 0x03, 0x09, 0x06, 0x04, 0x04, 0x09, 0x08, 0x08, 0x08, 0x02, 0x09, 0x09

ov70_02245ED0: ; 0x02245ED0
	.byte 0x28, 0x3C, 0x88, 0x97, 0x28, 0x3C, 0xA8, 0xB7, 0x28, 0x3C, 0xC8, 0xD7, 0x28, 0x3C, 0xE8, 0xF7
	.byte 0x40, 0x54, 0x88, 0x97, 0x40, 0x54, 0xA8, 0xB7, 0x40, 0x54, 0xC8, 0xD7, 0x40, 0x54, 0xE8, 0xF7
	.byte 0x58, 0x6C, 0x88, 0x97, 0x85, 0x9A, 0xC5, 0xFA, 0xFF, 0x00, 0x00, 0x00

ov70_02245EFC: ; 0x02245EFC
	.byte 0x0A

ov70_02245EFD: ; 0x02245EFD
	.byte 0x04

ov70_02245EFE: ; 0x02245EFE
	.byte 0x03

ov70_02245EFF: ; 0x02245EFF
	.byte 0x01
	.byte 0x0A, 0x05, 0x00, 0x02, 0x0A, 0x06, 0x01, 0x03, 0x0A, 0x07, 0x02, 0x00, 0x00, 0x08, 0x07, 0x05
	.byte 0x01, 0x09, 0x04, 0x06, 0x02, 0x09, 0x05, 0x07, 0x03, 0x09, 0x06, 0x04, 0x04, 0x09, 0x08, 0x08
	.byte 0x08, 0x0A, 0x09, 0x09, 0x09, 0x00, 0x0A, 0x0A

ov70_02245F28: ; 0x02245F28
	.byte 0x28, 0x3C, 0x88, 0x97, 0x28, 0x3C, 0xA8, 0xB7
	.byte 0x28, 0x3C, 0xC8, 0xD7, 0x28, 0x3C, 0xE8, 0xF7, 0x40, 0x54, 0x88, 0x97, 0x40, 0x54, 0xA8, 0xB7
	.byte 0x40, 0x54, 0xC8, 0xD7, 0x40, 0x54, 0xE8, 0xF7, 0x58, 0x6C, 0x88, 0x97, 0x85, 0x9A, 0xC5, 0xFA
	.byte 0x10, 0x23, 0x88, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov70_02245F58: ; 0x02245F58
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02245F5C: ; 0x02245F5C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov70_02245FA0: ; 0x02245FA0
	.byte 0xBC, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x00, 0x00, 0xBE, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0x00, 0xC2, 0x00, 0x00, 0x00, 0xC3, 0x00, 0x00, 0x00
	.byte 0xC4, 0x00, 0x00, 0x00, 0xC5, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00, 0xC7, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x00, 0x00, 0xC9, 0x00, 0x00, 0x00, 0xCA, 0x00, 0x00, 0x00, 0xCB, 0x00, 0x00, 0x00
	.byte 0xCC, 0x00, 0x00, 0x00, 0xCD, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x00, 0x00, 0xCF, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0xD1, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD3, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x00, 0x00

ov70_0224600C: ; 0x0224600C
	.byte 0xE9, 0x00, 0x00, 0x00
	.byte 0xEA, 0x00, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00

ov70_02246020: ; 0x02246020
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_0224603C: ; 0x0224603C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov70_02246058: ; 0x02246058
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov70_02246074: ; 0x02246074
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

	.balign 4, 0
ov70_022460A0:
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/post.asp"

	.balign 4, 0
ov70_022460EC: ; 0x022460EC
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/post_finish.asp"

	.balign 4, 0
ov70_0224613C: ; 0x0224613C
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/get.asp"

	.balign 4, 0
ov70_02246184: ; 0x02246184
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/result.asp"

	.balign 4, 0
ov70_022461D0: ; 0x022461D0
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/delete.asp"

	.balign 4, 0
ov70_0224621C: ; 0x0224621C
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/return.asp"

	.balign 4, 0
ov70_02246268: ; 0x02246268
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/search.asp"

	.balign 4, 0
ov70_022462B4: ; 0x022462B4
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/exchange.asp"

	.balign 4, 0
ov70_02246304: ; 0x02246304
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/exchange_finish.asp"

	.balign 4, 0
ov70_02246358: ; 0x02246358
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/worldexchange/info.asp"

	.balign 4, 0
ov70_022463A4: ; 0x022463A4
	.asciz "http://gamestats2.gs.nintendowifi.net/pokemondpds/common/setProfile.asp"

	.balign 4, 0
ov70_022463EC: ; 0x022463EC
	.word ov70_02244038, ov70_02244124, ov70_02244154
	.word ov70_02238FF4, ov70_022390DC, ov70_022390FC
	.word ov70_02239D8C, ov70_02239E68, ov70_02239E7C
	.word ov70_0223A8BC, ov70_0223AA90, ov70_0223AB00
	.word ov70_0223B55C, ov70_0223B6EC, ov70_0223B788
	.word ov70_0223CD44, ov70_0223CDD8, ov70_0223CDF8
	.word ov70_0223E78C, ov70_0223E884, ov70_0223E8A4
	.word ov70_0223F96C, ov70_0223F9B4, ov70_0223F9D4
	.word ov70_022413AC, ov70_02241468, ov70_02241494
	.word ov70_022414A0, ov70_02241648, ov70_02241808

ov70_02246464: ; 0x02246464
	.word ov70_02239658
	.word ov70_02239698
	.word ov70_022396A8
	.word ov70_022396CC
	.word ov70_022396E0
	.word ov70_022396F4
	.word ov70_02239834
	.word ov70_02239954
	.word ov70_0223997C
	.word ov70_02239990
	.word ov70_02239AAC
	.word ov70_02239ACC
	.word ov70_022399D8
	.word ov70_02239A10

ov70_0224649C: ; 0x0224649C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x06, 0x05, 0x00, 0x00, 0x04, 0x03, 0x00

ov70_022464A8: ; 0x022464A8
	.word ov70_0223A258
	.word ov70_0223A260
	.word ov70_0223A2D0
	.word ov70_0223A4A0
	.word ov70_0223A4C0
	.word ov70_0223A2F8
	.word ov70_0223A324
	.word ov70_0223A384
	.word ov70_0223A3DC

ov70_022464CC: ; 0x022464CC
	.word ov70_0223AF5C
	.word ov70_0223AFFC
	.word ov70_0223B12C
	.word ov70_0223B344
	.word ov70_0223B188
	.word ov70_0223B1B8
	.word ov70_0223B2C0
	.word ov70_0223B2D0
	.word ov70_0223B300

ov70_022464F0: ; 0x022464F0
	.byte 0x00

ov70_022464F1: ; 0x022464F1
	.byte 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x01, 0x00, 0x01, 0x01, 0x01, 0x02

ov70_022464FE: ; 0x022464FE
	.byte 0x00, 0x00

ov70_02246500: ; 0x02246500
	.byte 0x00, 0x00

ov70_02246502: ; 0x02246502
	.byte 0x2D, 0x00, 0x00, 0x00, 0x28, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x50, 0x00, 0x2D, 0x00
	.byte 0x00, 0x00, 0x78, 0x00, 0x2D, 0x00, 0xC0, 0x00, 0x20, 0x00, 0x2E, 0x00, 0xC0, 0x00, 0x48, 0x00
	.byte 0x2E, 0x00, 0xC0, 0x00, 0x70, 0x00, 0x2E, 0x00

ov70_02246528: ; 0x02246528
	.word ov70_0223BD04
	.word ov70_0223BE84
	.word ov70_0223C4B0
	.word ov70_0223C4E4
	.word ov70_0223C50C
	.word ov70_0223C52C
	.word ov70_0223C618
	.word ov70_0223C640
	.word ov70_0223C660
	.word ov70_0223C6F0
	.word ov70_0223C718
	.word ov70_0223C744
	.word ov70_0223C7C4
	.word ov70_0223C7EC
	.word ov70_0223C818
	.word ov70_0223BF00
	.word ov70_0223C008
	.word ov70_0223C0C8
	.word ov70_0223C19C
	.word ov70_0223C1F8
	.word ov70_0223C23C
	.word ov70_0223C958
	.word ov70_0223C978
	.word ov70_0223C8B0
	.word ov70_0223C8DC
	.word ov70_0223C928
	.word ov70_0223C930
	.word ov70_0223C274
	.word ov70_0223C2B0
	.word ov70_0223C9AC
	.word ov70_0223CA18
	.word ov70_0223CA40

ov70_022465A8: ; 0x022465A8
	.word ov70_0223D44C
	.word ov70_0223D6C8
	.word ov70_0223DD0C
	.word ov70_0223DFD0
	.word ov70_0223DFF0
	.word ov70_0223DD68
	.word ov70_0223DD94
	.word ov70_0223D934
	.word ov70_0223D998
	.word ov70_0223DB30
	.word ov70_0223DB94
	.word ov70_0223DDD0
	.word ov70_0223DDFC
	.word ov70_0223DE28
	.word ov70_0223DF14
	.word ov70_0223DF40
	.word ov70_0223DF6C

ov70_022465EC: ; 0x022465EC
	.byte 0x00, 0x06, 0x05, 0x00
	.byte 0x00, 0x04, 0x03, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFF, 0xFF

ov70_02246614: ; 0x02246614
	.word ov70_0223ED58
	.word ov70_0223ED8C
	.word ov70_0223F164
	.word ov70_0223EDB0
	.word ov70_0223EDCC
	.word ov70_0223EDD8
	.word ov70_0223EE10
	.word ov70_0223EEE8
	.word ov70_0223EF10
	.word ov70_0223EF38
	.word ov70_0223EFB8
	.word ov70_0223EFE0
	.word ov70_0223F008
	.word ov70_0223F0B4
	.word ov70_0223F0DC
	.word ov70_0223F108
	.word ov70_0223F1B8

ov70_02246658: ; 0x02246658
	.word ov70_0223FC68
	.word ov70_0224063C
	.word ov70_0223FD64
	.word ov70_0223FD98
	.word ov70_0223FE40
	.word ov70_0223FE60
	.word ov70_02240640
	.word ov70_0223FEE4
	.word ov70_0223FF10
	.word ov70_0223FFCC
	.word ov70_0223FFE8
	.word ov70_02240658
	.word ov70_0224006C
	.word ov70_022400BC
	.word ov70_02240180
	.word ov70_0224019C
	.word ov70_02240670
	.word ov70_02240748
	.word ov70_02240540
	.word ov70_02240598
	.word ov70_022405B4
	.word ov70_02240684
	.word ov70_0224069C
	.word ov70_022406B8
	.word ov70_02240220
	.word ov70_02240240
	.word ov70_02240410
	.word ov70_02240430
	.word ov70_022403FC
	.word ov70_02240838
	.word ov70_02240854
	.word ov70_02240884
	.word ov70_0224089C
	.word ov70_022408BC
	.word ov70_022408E0
	.word ov70_022408FC
	.word ov70_02240948
	.word ov70_022409A0
	.word ov70_022407E4
	.word ov70_0224080C

ov70_022466F8: ; 0x022466F8
	.word ov70_02242FF4
	.word ov70_02242FFC
	.word ov70_0224304C
	.word ov70_02243068
	.word ov70_0224308C
	.word ov70_022430CC
	.word ov70_02243120
	.word ov70_0224316C
	.word ov70_02243254
	.word ov70_022433A8
	.word ov70_02243400
	.word ov70_02243420
	.word ov70_02243598
	.word ov70_02243688
	.word ov70_02243700
	.word ov70_02243750
	.word ov70_02243768
	.word ov70_022437C8
	.word ov70_02243848
	.word ov70_022438D4
	.word ov70_02243928
	.word ov70_02243A6C
	.word ov70_02243AC4
	.word ov70_02243B1C
	.word ov70_02243B2C
	.word ov70_02243C08
	.word ov70_02243C8C
	.word ov70_02243CC8
	.word ov70_02243CEC
	.word ov70_02243D28
	.word ov70_02243D90
	.word ov70_02243DA0
	.word ov70_02243DDC
	.word ov70_02243E74

ov70_02246780: ; 0x02246780
	.word ov70_022446D0
	.word ov70_02244708
	.word ov70_02244888
	.word ov70_022448C0
	.word ov70_02244944
	.word ov70_02244954
	.word ov70_02244A04
	.word ov70_02244A4C
	.word ov70_02244A68
	.word ov70_02244B20
	.word ov70_02244B54
	.word ov70_02244D08
	.word ov70_02244F14
	.word ov70_02244F68
	.word ov70_02244D44
	.word ov70_02244774
	.word ov70_022447A0
	.word ov70_02244804
	.word ov70_02244834
	.word ov70_02244854
	.word ov70_02244F34
	.word ov70_02244D80
	.word ov70_02244E44
	.word ov70_02244CA8
	.word ov70_02244CCC

	.bss

_02246800:
	.space 0xC

ov70_0224680C: ; 0x0224680C
	.space 0x8

ov70_02246814: ; 0x02246814
	.space 0xEC

ov70_02246900: ; 0x02246900
	.space 0x20

ov70_02246920: ; 0x02246920
	.space 0x1C

ov70_0224693C: ; 0x0224693C
	.space 0x8

ov70_02246944: ; 0x02246944
	.space 0x1c
