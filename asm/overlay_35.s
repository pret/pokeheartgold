	.include "asm/macros.inc"
	.include "overlay_35.inc"
	.include "global.inc"

	.text

	thumb_func_start ov35_02259D80
ov35_02259D80: ; 0x02259D80
	push {r3, lr}
	cmp r1, #5
	bhi _02259DB4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02259D92: ; jump table
	.short _02259DB4 - _02259D92 - 2 ; case 0
	.short _02259D9E - _02259D92 - 2 ; case 1
	.short _02259DB4 - _02259D92 - 2 ; case 2
	.short _02259DB4 - _02259D92 - 2 ; case 3
	.short _02259DA4 - _02259D92 - 2 ; case 4
	.short _02259DB4 - _02259D92 - 2 ; case 5
_02259D9E:
	mov r1, #1
	strb r1, [r0, #4]
	pop {r3, pc}
_02259DA4:
	ldrb r1, [r0, #2]
	cmp r1, #2
	bne _02259DB4
	ldr r1, [r0, #0x44]
	cmp r1, #0
	beq _02259DB4
	ldr r0, [r0, #0x48]
	blx r1
_02259DB4:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov35_02259D80

	thumb_func_start ov35_02259DB8
ov35_02259DB8: ; 0x02259DB8
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end ov35_02259DB8
