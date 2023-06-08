	.include "asm/macros.inc"
	.include "unk_0202CA24.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202CA24
sub_0202CA24: ; 0x0202CA24
	ldr r0, _0202CA28 ; =0x00000FF8
	bx lr
	.balign 4, 0
_0202CA28: .word 0x00000FF8
	thumb_func_end sub_0202CA24

	thumb_func_start sub_0202CA2C
sub_0202CA2C: ; 0x0202CA2C
	push {r3, lr}
	ldr r2, _0202CA40 ; =0x00000FF8
	add r1, r0, #0
	mov r0, #0
	bl MIi_CpuClear32
	mov r0, #0x1a
	bl SaveSubstruct_UpdateCRC
	pop {r3, pc}
	.balign 4, 0
_0202CA40: .word 0x00000FF8
	thumb_func_end sub_0202CA2C

	thumb_func_start sub_0202CA44
sub_0202CA44: ; 0x0202CA44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1a
	bl SaveSubstruct_AssertCRC
	add r0, r4, #0
	mov r1, #0x1a
	bl SaveArray_Get
	pop {r4, pc}
	thumb_func_end sub_0202CA44

	thumb_func_start sub_0202CA58
sub_0202CA58: ; 0x0202CA58
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #1
	add r5, r1, #0
	lsl r0, r0, #8
	add r4, r2, #0
	cmp r5, r0
	blt _0202CA6C
	bl GF_AssertFail
_0202CA6C:
	cmp r4, #0x40
	blt _0202CA74
	bl GF_AssertFail
_0202CA74:
	strb r5, [r6, #5]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #3
	strb r4, [r6, #6]
	bl sub_0202CAE4
	mov r0, #0x1a
	bl SaveSubstruct_UpdateCRC
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CA58

	thumb_func_start sub_0202CA8C
sub_0202CA8C: ; 0x0202CA8C
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end sub_0202CA8C

	thumb_func_start sub_0202CA90
sub_0202CA90: ; 0x0202CA90
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end sub_0202CA90

	thumb_func_start sub_0202CA94
sub_0202CA94: ; 0x0202CA94
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #1
	add r5, r1, #0
	lsl r0, r0, #8
	add r4, r2, #0
	cmp r5, r0
	blt _0202CAA8
	bl GF_AssertFail
_0202CAA8:
	cmp r4, #0x40
	blt _0202CAB0
	bl GF_AssertFail
_0202CAB0:
	cmp r5, #0
	bne _0202CAB8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CAB8:
	asr r0, r4, #1
	lsr r0, r0, #0x1e
	add r0, r4, r0
	asr r1, r0, #2
	sub r0, r5, #1
	lsl r0, r0, #4
	add r0, r1, r0
	add r0, r6, r0
	ldrb r3, [r0, #7]
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #1
	add r1, r3, #0
	asr r1, r0
	mov r0, #3
	and r0, r1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202CA94

	thumb_func_start sub_0202CAE4
sub_0202CAE4: ; 0x0202CAE4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	cmp r3, #4
	blt _0202CAF6
	bl GF_AssertFail
_0202CAF6:
	mov r0, #1
	lsl r0, r0, #8
	cmp r5, r0
	blt _0202CB02
	bl GF_AssertFail
_0202CB02:
	cmp r4, #0x40
	blt _0202CB0A
	bl GF_AssertFail
_0202CB0A:
	cmp r5, #0
	beq _0202CB58
	asr r0, r4, #1
	lsr r0, r0, #0x1e
	add r0, r4, r0
	asr r2, r0, #2
	sub r0, r5, #1
	lsl r0, r0, #4
	add r0, r2, r0
	lsr r2, r4, #0x1f
	lsl r4, r4, #0x1e
	sub r4, r4, r2
	mov r3, #0x1e
	ror r4, r3
	add r2, r2, r4
	lsl r6, r2, #1
	mov r2, #3
	add r3, r2, #0
	add r1, r7, #7
	ldrb r4, [r1, r0]
	lsl r3, r6
	mov r2, #0xff
	eor r2, r3
	and r2, r4
	ldr r3, [sp]
	strb r2, [r1, r0]
	ldrb r2, [r1, r0]
	lsl r3, r6
	orr r2, r3
	strb r2, [r1, r0]
	cmp r5, #0x67
	beq _0202CB52
	add r0, r7, #0
	mov r1, #1
	bl sub_0202CB60
_0202CB52:
	mov r0, #0x1a
	bl SaveSubstruct_UpdateCRC
_0202CB58:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202CAE4

	thumb_func_start sub_0202CB5C
sub_0202CB5C: ; 0x0202CB5C
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end sub_0202CB5C

	thumb_func_start sub_0202CB60
sub_0202CB60: ; 0x0202CB60
	ldr r3, _0202CB68 ; =SaveSubstruct_UpdateCRC
	strb r1, [r0, #4]
	mov r0, #0x1a
	bx r3
	.balign 4, 0
_0202CB68: .word SaveSubstruct_UpdateCRC
	thumb_func_end sub_0202CB60

	thumb_func_start sub_0202CB6C
sub_0202CB6C: ; 0x0202CB6C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r0, #3
	mov r7, #0
	mov r4, #2
	mov r6, #0xff
	add r3, r0, #0
_0202CB7A:
	ldr r1, [sp]
	add r1, r1, r7
	ldrb r2, [r1, #7]
	mov ip, r1
	mov r1, #0
_0202CB84:
	add r5, r2, #0
	asr r5, r1
	and r5, r3
	cmp r5, #1
	bne _0202CBA4
	add r5, r0, #0
	lsl r5, r1
	eor r5, r6
	and r2, r5
	lsl r2, r2, #0x18
	lsr r5, r2, #0x18
	add r2, r4, #0
	lsl r2, r1
	orr r2, r5
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
_0202CBA4:
	add r1, r1, #2
	cmp r1, #8
	blt _0202CB84
	mov r1, ip
	strb r2, [r1, #7]
	mov r1, #0xff
	add r7, r7, #1
	lsl r1, r1, #4
	cmp r7, r1
	blt _0202CB7A
	mov r0, #0x1a
	bl SaveSubstruct_UpdateCRC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202CB6C
