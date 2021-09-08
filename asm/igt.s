	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202CDB0
sub_0202CDB0: ; 0x0202CDB0
	mov r1, #0
	strh r1, [r0]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CDB0

	thumb_func_start sub_0202CDBC
sub_0202CDBC: ; 0x0202CDBC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r6, [r5]
	ldr r0, _0202CE20 ; =0x000003E7
	cmp r6, r0
	bne _0202CDD4
	ldrb r0, [r5, #2]
	cmp r0, #0x3b
	bne _0202CDD4
	ldrb r0, [r5, #3]
	cmp r0, #0x3b
	beq _0202CE1C
_0202CDD4:
	ldrb r0, [r5, #3]
	ldrb r4, [r5, #2]
	add r7, r0, r1
	cmp r7, #0x3b
	bls _0202CE16
	add r0, r7, #0
	mov r1, #0x3c
	bl _u32_div_f
	add r4, r4, r0
	add r0, r7, #0
	mov r1, #0x3c
	bl _u32_div_f
	add r7, r1, #0
	cmp r4, #0x3b
	bls _0202CE16
	add r0, r4, #0
	mov r1, #0x3c
	bl _u32_div_f
	add r6, r6, r0
	add r0, r4, #0
	mov r1, #0x3c
	bl _u32_div_f
	ldr r0, _0202CE20 ; =0x000003E7
	add r4, r1, #0
	cmp r6, r0
	blo _0202CE16
	mov r4, #0x3b
	add r6, r0, #0
	add r7, r4, #0
_0202CE16:
	strh r6, [r5]
	strb r4, [r5, #2]
	strb r7, [r5, #3]
_0202CE1C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202CE20: .word 0x000003E7
	thumb_func_end sub_0202CDBC

	thumb_func_start sub_0202CE24
sub_0202CE24: ; 0x0202CE24
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_0202CE24

	thumb_func_start sub_0202CE28
sub_0202CE28: ; 0x0202CE28
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202CE28

	thumb_func_start sub_0202CE2C
sub_0202CE2C: ; 0x0202CE2C
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end sub_0202CE2C
