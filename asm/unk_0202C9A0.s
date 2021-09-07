	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202C9A0
sub_0202C9A0: ; 0x0202C9A0
	mov r0, #0x62
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C9A0

	thumb_func_start sub_0202C9A8
sub_0202C9A8: ; 0x0202C9A8
	push {r4, r5, r6, lr}
	mov r2, #0x62
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	add r0, r4, #0
	bl sub_0202CA10
	add r5, r0, #0
	mov r4, #0
	mov r6, #0x8c
_0202C9C2:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0202CA1C
	add r4, r4, #1
	cmp r4, #8
	blt _0202C9C2
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202C9A8

	thumb_func_start sub_0202C9D8
sub_0202C9D8: ; 0x0202C9D8
	ldr r3, _0202C9E0 ; =SavArray_get
	mov r1, #0xf
	bx r3
	nop
_0202C9E0: .word SavArray_get
	thumb_func_end sub_0202C9D8

	thumb_func_start sub_0202C9E4
sub_0202C9E4: ; 0x0202C9E4
	add r0, #0x20
	bx lr
	thumb_func_end sub_0202C9E4

	thumb_func_start sub_0202C9E8
sub_0202C9E8: ; 0x0202C9E8
	push {r3, r4}
	mov r3, #0
	mov r1, #6
	add r4, r3, #0
	add r0, #0x20
	lsl r1, r1, #6
_0202C9F4:
	ldr r2, [r0]
	add r4, r4, #1
	add r3, r3, r2
	add r0, r0, #4
	cmp r4, r1
	blt _0202C9F4
	cmp r3, #0
	beq _0202CA0A
	mov r0, #1
	pop {r3, r4}
	bx lr
_0202CA0A:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202C9E8

	thumb_func_start sub_0202CA10
sub_0202CA10: ; 0x0202CA10
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CA10

	thumb_func_start sub_0202CA14
sub_0202CA14: ; 0x0202CA14
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CA14

	thumb_func_start sub_0202CA1C
sub_0202CA1C: ; 0x0202CA1C
	lsl r0, r0, #2
	str r1, [r2, r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CA1C
