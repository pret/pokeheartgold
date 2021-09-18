	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D10E8:
	.space 0x20

	.text

	thumb_func_start sub_02018380
sub_02018380: ; 0x02018380
	ldr r0, _02018388 ; =_021D10E8
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_02018388: .word _021D10E8
	thumb_func_end sub_02018380

	thumb_func_start sub_0201838C
sub_0201838C: ; 0x0201838C
	push {r3, lr}
	ldr r1, _020183AC ; =_021D10E8
	mov r2, #1
	str r2, [r1]
	mov r2, #0
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r0, [r1, #4]
	bl sub_020254FC
	ldr r2, _020183AC ; =_021D10E8
	str r0, [r2, #0x18]
	str r1, [r2, #0x1c]
	pop {r3, pc}
	.balign 4, 0
_020183AC: .word _021D10E8
	thumb_func_end sub_0201838C

	thumb_func_start sub_020183B0
sub_020183B0: ; 0x020183B0
	push {r3, r4, r5, lr}
	ldr r0, _020183EC ; =_021D10E8
	ldr r0, [r0]
	cmp r0, #0
	beq _020183EA
	bl sub_020254FC
	ldr r2, _020183EC ; =_021D10E8
	ldr r3, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	sub r0, r0, r3
	sbc r1, r2
	bl sub_02025504
	add r5, r1, #0
	ldr r1, _020183EC ; =_021D10E8
	add r4, r0, #0
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	sub r0, r3, r4
	sbc r2, r5
	bhs _020183EA
	ldr r0, [r1, #4]
	sub r1, r4, r3
	bl AddIGTSeconds
	ldr r0, _020183EC ; =_021D10E8
	str r4, [r0, #8]
	str r5, [r0, #0xc]
_020183EA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020183EC: .word _021D10E8
	thumb_func_end sub_020183B0
