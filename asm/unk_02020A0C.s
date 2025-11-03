	.include "asm/macros.inc"
	.include "unk_02020654.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02020A0C
sub_02020A0C: ; 0x02020A0C
	ldrb r3, [r0]
	strb r3, [r1]
	ldrb r0, [r0, #1]
	strb r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020A0C

	thumb_func_start sub_02020A18
sub_02020A18: ; 0x02020A18
	ldrb r3, [r0, #2]
	strb r3, [r1]
	ldrb r0, [r0, #3]
	strb r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020A18

	thumb_func_start sub_02020A24
sub_02020A24: ; 0x02020A24
	push {r4, r5}
	ldr r5, _02020A9C ; =0xFFFFFFF8
	ldr r4, [sp, #0xc]
	add r5, sp
	ldrb r5, [r5, #0x18]
	cmp r5, #3
	bhi _02020A64
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_02020A3E: ; jump table
	.short _02020A46 - _02020A3E - 2 ; case 0
	.short _02020A4E - _02020A3E - 2 ; case 1
	.short _02020A56 - _02020A3E - 2 ; case 2
	.short _02020A5E - _02020A3E - 2 ; case 3
_02020A46:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #4]
	b _02020A64
_02020A4E:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #5]
	b _02020A64
_02020A56:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #6]
	b _02020A64
_02020A5E:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #7]
_02020A64:
	cmp r1, #0
	beq _02020A6E
	lsl r5, r4, #3
	ldrb r5, [r0, r5]
	strb r5, [r1]
_02020A6E:
	cmp r2, #0
	beq _02020A7A
	lsl r1, r4, #3
	add r1, r0, r1
	ldrb r1, [r1, #1]
	strb r1, [r2]
_02020A7A:
	cmp r3, #0
	beq _02020A86
	lsl r1, r4, #3
	add r1, r0, r1
	ldrb r1, [r1, #2]
	strb r1, [r3]
_02020A86:
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _02020A94
	lsl r1, r4, #3
	add r0, r0, r1
	ldrb r0, [r0, #3]
	strb r0, [r2]
_02020A94:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	nop
_02020A9C: .word 0xFFFFFFF8
	thumb_func_end sub_02020A24
