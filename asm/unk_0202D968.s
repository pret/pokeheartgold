	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202D968
sub_0202D968: ; 0x0202D968
	mov r0, #0x68
	bx lr
	thumb_func_end sub_0202D968

	thumb_func_start sub_0202D96C
sub_0202D96C: ; 0x0202D96C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x68
	bl memset
	bl MTRandom
	str r0, [r4]
	bl MTRandom
	str r0, [r4, #4]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x64
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x65
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r4, #0x67
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202D96C

	thumb_func_start sub_0202D9A0
sub_0202D9A0: ; 0x0202D9A0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D9A0

	thumb_func_start sub_0202D9A8
sub_0202D9A8: ; 0x0202D9A8
	push {r3, lr}
	cmp r1, #1
	beq _0202D9B4
	cmp r1, #2
	beq _0202D9B8
	b _0202D9BC
_0202D9B4:
	ldr r0, [r0]
	pop {r3, pc}
_0202D9B8:
	ldr r0, [r0, #4]
	pop {r3, pc}
_0202D9BC:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202D9A8

	thumb_func_start sub_0202D9C4
sub_0202D9C4: ; 0x0202D9C4
	ldr r3, _0202D9CC ; =SavArray_get
	mov r1, #0x15
	bx r3
	nop
_0202D9CC: .word SavArray_get
	thumb_func_end sub_0202D9C4

	thumb_func_start sub_0202D9D0
sub_0202D9D0: ; 0x0202D9D0
	push {r3, lr}
	bl sub_0202D9C4
	mov r1, #1
	add r0, #0x64
	strb r1, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D9D0

	thumb_func_start sub_0202D9E0
sub_0202D9E0: ; 0x0202D9E0
	add r0, #0x64
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D9E0

	thumb_func_start sub_0202D9E8
sub_0202D9E8: ; 0x0202D9E8
	ldr r2, [r0, #8]
	cmp r2, r1
	beq _0202D9F2
	str r2, [r0, #0xc]
	str r1, [r0, #8]
_0202D9F2:
	bx lr
	thumb_func_end sub_0202D9E8

	thumb_func_start sub_0202D9F4
sub_0202D9F4: ; 0x0202D9F4
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0202D9F4

	thumb_func_start sub_0202D9F8
sub_0202D9F8: ; 0x0202D9F8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0202DA06
	bl GF_AssertFail
_0202DA06:
	add r0, r5, r4
	add r0, #0x60
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202D9F8

	thumb_func_start sub_0202DA10
sub_0202DA10: ; 0x0202DA10
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blo _0202DA20
	bl GF_AssertFail
_0202DA20:
	add r0, r5, r4
	add r0, #0x60
	strb r6, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202DA10

	thumb_func_start sub_0202DA28
sub_0202DA28: ; 0x0202DA28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0202DA36
	bl GF_AssertFail
_0202DA36:
	mov r0, #0x14
	mul r0, r4
	add r0, r5, r0
	add r0, #0x22
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202DA28

	thumb_func_start sub_0202DA44
sub_0202DA44: ; 0x0202DA44
	ldr r2, [r0]
	mov r1, #0x14
	mov r0, #0
_0202DA4A:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0202DA4A
	bx lr
	thumb_func_end sub_0202DA44

	thumb_func_start sub_0202DA54
sub_0202DA54: ; 0x0202DA54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0202DA62
	bl GF_AssertFail
_0202DA62:
	mov r0, #0x14
	add r5, #0x10
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DA54

	thumb_func_start sub_0202DA6C
sub_0202DA6C: ; 0x0202DA6C
	push {r3, lr}
	cmp r1, #8
	bhi _0202DAB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202DA7E: ; jump table
	.short _0202DAB0 - _0202DA7E - 2 ; case 0
	.short _0202DA90 - _0202DA7E - 2 ; case 1
	.short _0202DA94 - _0202DA7E - 2 ; case 2
	.short _0202DA98 - _0202DA7E - 2 ; case 3
	.short _0202DA9C - _0202DA7E - 2 ; case 4
	.short _0202DAA0 - _0202DA7E - 2 ; case 5
	.short _0202DAA4 - _0202DA7E - 2 ; case 6
	.short _0202DAA8 - _0202DA7E - 2 ; case 7
	.short _0202DAAC - _0202DA7E - 2 ; case 8
_0202DA90:
	ldr r0, [r0]
	pop {r3, pc}
_0202DA94:
	ldr r0, [r0, #4]
	pop {r3, pc}
_0202DA98:
	ldr r0, [r0, #8]
	pop {r3, pc}
_0202DA9C:
	ldrh r0, [r0, #0xc]
	pop {r3, pc}
_0202DAA0:
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_0202DAA4:
	ldrb r0, [r0, #0x10]
	pop {r3, pc}
_0202DAA8:
	ldrb r0, [r0, #0x11]
	pop {r3, pc}
_0202DAAC:
	ldrb r0, [r0, #0x12]
	pop {r3, pc}
_0202DAB0:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202DA6C

	thumb_func_start sub_0202DAB8
sub_0202DAB8: ; 0x0202DAB8
	push {r3, lr}
	cmp r1, #8
	bhi _0202DAFC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202DACA: ; jump table
	.short _0202DAFC - _0202DACA - 2 ; case 0
	.short _0202DADC - _0202DACA - 2 ; case 1
	.short _0202DAE0 - _0202DACA - 2 ; case 2
	.short _0202DAE4 - _0202DACA - 2 ; case 3
	.short _0202DAE8 - _0202DACA - 2 ; case 4
	.short _0202DAEC - _0202DACA - 2 ; case 5
	.short _0202DAF0 - _0202DACA - 2 ; case 6
	.short _0202DAF4 - _0202DACA - 2 ; case 7
	.short _0202DAF8 - _0202DACA - 2 ; case 8
_0202DADC:
	str r2, [r0]
	pop {r3, pc}
_0202DAE0:
	str r2, [r0, #4]
	pop {r3, pc}
_0202DAE4:
	str r2, [r0, #8]
	pop {r3, pc}
_0202DAE8:
	strh r2, [r0, #0xc]
	pop {r3, pc}
_0202DAEC:
	strh r2, [r0, #0xe]
	pop {r3, pc}
_0202DAF0:
	strb r2, [r0, #0x10]
	pop {r3, pc}
_0202DAF4:
	strb r2, [r0, #0x11]
	pop {r3, pc}
_0202DAF8:
	strb r2, [r0, #0x12]
	pop {r3, pc}
_0202DAFC:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202DAB8

	thumb_func_start sub_0202DB04
sub_0202DB04: ; 0x0202DB04
	add r0, #0x65
	bx lr
	thumb_func_end sub_0202DB04

	thumb_func_start sub_0202DB08
sub_0202DB08: ; 0x0202DB08
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	bne _0202DB14
	mov r0, #1
	bx lr
_0202DB14:
	mov r0, #0
	bx lr
	thumb_func_end sub_0202DB08

	thumb_func_start sub_0202DB18
sub_0202DB18: ; 0x0202DB18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	bls _0202DB26
	bl GF_AssertFail
_0202DB26:
	add r5, #0x67
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DB18

	thumb_func_start sub_0202DB2C
sub_0202DB2C: ; 0x0202DB2C
	add r0, #0x67
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB2C
