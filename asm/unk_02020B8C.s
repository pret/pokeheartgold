	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02020B8C
sub_02020B8C: ; 0x02020B8C
	cmp r0, r1
	blt _02020B92
	add r0, r1, #0
_02020B92:
	bx lr
	thumb_func_end sub_02020B8C

	thumb_func_start sub_02020B94
sub_02020B94: ; 0x02020B94
	cmp r0, r1
	bgt _02020B9A
	add r0, r1, #0
_02020B9A:
	bx lr
	thumb_func_end sub_02020B94

	thumb_func_start GetDistanceFromPointToLine
GetDistanceFromPointToLine: ; 0x02020B9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r5, r0, #0
	add r3, sp, #0x14
	mov r0, #0
	str r0, [r3]
	str r0, [r3, #4]
	str r0, [r3, #8]
	add r0, r2, #0
	add r4, r1, #0
	add r2, sp, #0x44
	bl VEC_Subtract
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x38
	bl VEC_Subtract
	ldr r0, [sp, #0x48]
	ldr r5, [sp, #0x4c]
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x44]
	asr r4, r5, #0x1f
	str r0, [sp, #4]
	asr r7, r0, #0x1f
	add r0, sp, #0x44
	add r1, sp, #0x38
	bl VEC_DotProduct
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r5, #0
	add r3, r4, #0
	bl _ll_mul
	add r6, r0, #0
	ldr r0, [sp, #4]
	add r4, r1, #0
	add r1, r7, #0
	add r2, r0, #0
	add r3, r7, #0
	bl _ll_mul
	str r0, [sp, #0xc]
	add r5, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	add r2, r0, #0
	add r3, r1, #0
	bl _ll_mul
	mov r2, #2
	add r3, r1, #0
	add r7, r0, #0
	mov r1, #0
	lsl r2, r2, #0xa
	add r2, r6, r2
	adc r4, r1
	lsl r4, r4, #0x14
	lsr r2, r2, #0xc
	orr r2, r4
	mov r4, #2
	ldr r6, [sp, #0xc]
	lsl r4, r4, #0xa
	add r4, r6, r4
	adc r5, r1
	lsl r5, r5, #0x14
	lsr r4, r4, #0xc
	orr r4, r5
	mov r5, #2
	lsl r5, r5, #0xa
	add r5, r7, r5
	adc r3, r1
	lsl r1, r3, #0x14
	lsr r3, r5, #0xc
	orr r3, r1
	add r1, r4, r3
	ldr r0, [sp, #8]
	add r1, r2, r1
	bl FX_Div
	add r1, sp, #0x44
	add r2, sp, #0x14
	add r3, sp, #0x20
	bl VEC_MultAdd
	add r0, sp, #0x20
	add r1, sp, #0x38
	add r2, sp, #0x2c
	bl VEC_Subtract
	add r0, sp, #0x2c
	bl VEC_Mag
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GetDistanceFromPointToLine

	thumb_func_start sub_02020C64
sub_02020C64: ; 0x02020C64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r1, sp, #0x24
	bl VEC_Normalize
	add r0, r4, #0
	add r1, sp, #0x18
	bl VEC_Normalize
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x18]
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	asr r6, r4, #0x1f
	str r0, [sp, #8]
	asr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #8]
	asr r7, r0, #0x1f
	ldr r3, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #0x10]
	bl _ll_mul
	str r0, [sp, #0x14]
	add r5, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_mul
	mov r2, #2
	ldr r3, [sp, #0x14]
	lsl r2, r2, #0xa
	add r3, r3, r2
	ldr r2, _02020D28 ; =0x00000000
	adc r5, r2
	lsl r2, r5, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	mov r2, #2
	lsl r2, r2, #0xa
	add r0, r0, r2
	ldr r2, _02020D28 ; =0x00000000
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r5, r3, r0
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_mul
	add r6, r0, #0
	add r4, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r6, r6, r2
	adc r4, r3
	lsl r4, r4, #0x14
	lsr r6, r6, #0xc
	orr r6, r4
	add r4, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	orr r1, r0
	sub r0, r6, r1
	cmp r5, #0
	bne _02020D1E
	cmp r0, #0
	ble _02020D16
	add sp, #0x30
	lsl r0, r2, #3
	pop {r3, r4, r5, r6, r7, pc}
_02020D16:
	mov r0, #3
	add sp, #0x30
	lsl r0, r0, #0xe
	pop {r3, r4, r5, r6, r7, pc}
_02020D1E:
	add r1, r5, #0
	bl FX_Atan2Idx
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020D28: .word 0x00000000
	thumb_func_end sub_02020C64

	thumb_func_start sub_02020D2C
sub_02020D2C: ; 0x02020D2C
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4]
	ldr r3, _02020DA0 ; =FX_SinCosTable_
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotX33_
	ldr r0, [r4, #4]
	ldr r3, _02020DA0 ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _02020DA0 ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02020DA0: .word FX_SinCosTable_
	thumb_func_end sub_02020D2C

	thumb_func_start sub_02020DA4
sub_02020DA4: ; 0x02020DA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl GF_CosDegNoWrap
	add r7, r0, #0
	add r0, r5, #0
	bl GF_SinDegNoWrap
	add r1, r0, #0
	ldr r0, [sp]
	add r2, r7, #0
	bl MTX_RotX33_
	add r0, r4, #0
	bl GF_CosDegNoWrap
	add r5, r0, #0
	add r0, r4, #0
	bl GF_SinDegNoWrap
	add r1, r0, #0
	add r0, sp, #4
	add r2, r5, #0
	bl MTX_RotY33_
	ldr r0, [sp]
	add r1, sp, #4
	add r2, r0, #0
	bl MTX_Concat33
	add r0, r6, #0
	bl GF_CosDegNoWrap
	add r4, r0, #0
	add r0, r6, #0
	bl GF_SinDegNoWrap
	add r1, r0, #0
	add r0, sp, #4
	add r2, r4, #0
	bl MTX_RotZ33_
	ldr r0, [sp]
	add r1, sp, #4
	add r2, r0, #0
	bl MTX_Concat33
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02020DA4

	thumb_func_start sub_02020E10
sub_02020E10: ; 0x02020E10
	push {r3, r4, r5, r6, r7, lr}
	asr r0, r0, #4
	add r7, r2, #0
	lsl r2, r0, #1
	add r6, r1, #0
	lsl r0, r2, #1
	ldr r1, _02020E7C ; =FX_SinCosTable_
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	add r5, r3, #0
	ldr r4, [sp, #0x18]
	bl FX_Div
	add r2, r0, #0
	asr r1, r6, #0x1f
	add r0, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r6, #2
	mov r2, #0
	lsl r6, r6, #0xa
	add r0, r0, r6
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r3, r0, #0x1f
	lsr r1, r0, #0x13
	lsl r3, r3, #0xd
	orr r3, r1
	lsl r0, r0, #0xd
	add r0, r0, r6
	adc r3, r2
	lsl r1, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	str r0, [r4]
	bl _ll_mul
	mov r3, #0
	add r2, r6, #0
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020E7C: .word FX_SinCosTable_
	thumb_func_end sub_02020E10

	thumb_func_start sub_02020E80
sub_02020E80: ; 0x02020E80
	push {r4, r5, r6, r7}
	ldr r6, [r2, #4]
	ldr r7, [r1]
	ldr r4, [r0, #4]
	ldr r5, [r1, #4]
	sub r1, r6, r4
	add r3, r7, #0
	mul r3, r1
	ldr r2, [r2]
	sub r1, r4, r5
	mul r1, r2
	ldr r2, [r0]
	sub r0, r5, r6
	mul r0, r2
	add r0, r1, r0
	add r0, r3, r0
	bmi _02020EA8
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_02020EA8:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020E80

	thumb_func_start sub_02020EB0
sub_02020EB0: ; 0x02020EB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r3, #0
	str r2, [sp]
	bl sub_02020E80
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl sub_02020E80
	eor r0, r6
	cmp r0, #1
	bne _02020EF0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02020E80
	add r5, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02020E80
	eor r0, r5
	cmp r0, #1
	bne _02020EF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02020EF0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02020EB0

	thumb_func_start sub_02020EF4
sub_02020EF4: ; 0x02020EF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	sub r1, r3, r4
	ldr r0, [sp, #0x18]
	add r6, r2, #0
	sub r0, r0, r6
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	beq _02020F1A
	lsl r0, r0, #0xc
	lsl r1, r1, #0xc
	bl FX_Div
	str r0, [sp]
	b _02020F20
_02020F1A:
	mov r0, #0xff
	lsl r0, r0, #0xc
	str r0, [sp]
_02020F20:
	ldr r0, [sp]
	lsl r2, r4, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	mov r4, #0
	lsl r3, r3, #0xa
	lsl r2, r6, #0xc
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldr r0, [sp]
	sub r1, r2, r1
	str r0, [r5]
	str r1, [sp, #4]
	str r1, [r5, #4]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02020EF4

	thumb_func_start sub_02020F4C
sub_02020F4C: ; 0x02020F4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, [sp, #0x48]
	add r7, r0, #0
	add r5, r1, #0
	add r6, r3, #0
	str r2, [sp, #4]
	cmp r4, #0
	beq _02020F64
	ldr r0, _0202109C ; =0x0000FFFF
	str r0, [r4]
	str r0, [r4, #4]
_02020F64:
	ldr r2, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02020EB0
	cmp r0, #0
	bne _02020F7A
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02020F7A:
	ldr r0, [r5, #4]
	str r0, [sp]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, [r5]
	add r0, sp, #0x24
	bl sub_02020EF4
	ldr r0, [r6, #4]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r2, [r2, #4]
	ldr r3, [r6]
	add r0, sp, #0x1c
	bl sub_02020EF4
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x24]
	cmp r3, r1
	bne _02020FAC
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02020FAC:
	ldr r2, [sp, #0x20]
	ldr r0, [sp, #0x28]
	sub r1, r3, r1
	sub r0, r2, r0
	bl FX_Div
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	ldr r0, [sp, #0x20]
	mov r3, #0
	str r0, [sp, #0x10]
	mov r0, #2
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsr r0, r0, #0xc
	lsl r1, r1, #0x14
	str r0, [sp, #0x14]
	orr r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x30
	bl FX_Modf
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _02020FF8
	ldr r2, [sp, #0x30]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x30]
_02020FF8:
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x10]
	asr r0, r0, #0xc
	str r0, [r4]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r1, sp, #0x2c
	bl FX_Modf
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _0202101A
	ldr r2, [sp, #0x2c]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x2c]
_0202101A:
	ldr r0, [sp, #0x2c]
	asr r0, r0, #0xc
	str r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, [r7]
	cmp r0, r1
	blt _0202102C
	mov ip, r0
	b _02021030
_0202102C:
	mov ip, r1
	add r1, r0, #0
_02021030:
	ldr r2, [r5, #4]
	ldr r0, [r7, #4]
	cmp r0, r2
	blt _0202103C
	str r0, [sp, #8]
	b _02021040
_0202103C:
	str r2, [sp, #8]
	add r2, r0, #0
_02021040:
	ldr r0, [sp, #4]
	ldr r3, [r6]
	ldr r0, [r0]
	cmp r0, r3
	blt _0202104E
	str r0, [sp, #0x18]
	b _02021052
_0202104E:
	str r3, [sp, #0x18]
	add r3, r0, #0
_02021052:
	ldr r0, [sp, #4]
	ldr r5, [r6, #4]
	ldr r0, [r0, #4]
	cmp r0, r5
	blt _02021060
	add r7, r0, #0
	b _02021064
_02021060:
	add r7, r5, #0
	add r5, r0, #0
_02021064:
	ldr r0, [r4]
	mov r6, ip
	cmp r6, r0
	blt _02021094
	cmp r1, r0
	bgt _02021094
	ldr r1, [r4, #4]
	ldr r4, [sp, #8]
	cmp r4, r1
	blt _02021094
	cmp r2, r1
	bgt _02021094
	ldr r2, [sp, #0x18]
	cmp r2, r0
	blt _02021094
	cmp r3, r0
	bgt _02021094
	cmp r7, r1
	blt _02021094
	cmp r5, r1
	bgt _02021094
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02021094:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0202109C: .word 0x0000FFFF
	thumb_func_end sub_02020F4C
