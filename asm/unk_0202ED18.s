	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202ED18
sub_0202ED18: ; 0x0202ED18
	mov r0, #8
	bx lr
	thumb_func_end sub_0202ED18

	thumb_func_start sub_0202ED1C
sub_0202ED1C: ; 0x0202ED1C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202ED1C

	thumb_func_start sub_0202ED34
sub_0202ED34: ; 0x0202ED34
	ldr r3, _0202ED3C ; =SavArray_get
	mov r1, #0x21
	bx r3
	nop
_0202ED3C: .word SavArray_get
	thumb_func_end sub_0202ED34

	thumb_func_start sub_0202ED40
sub_0202ED40: ; 0x0202ED40
	str r0, [r1]
	bx lr
	thumb_func_end sub_0202ED40

	thumb_func_start sub_0202ED44
sub_0202ED44: ; 0x0202ED44
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0202ED44

	thumb_func_start sub_0202ED48
sub_0202ED48: ; 0x0202ED48
	ldr r3, [r1, #4]
	mov r2, #3
	bic r3, r2
	mov r2, #3
	and r0, r2
	orr r0, r3
	str r0, [r1, #4]
	bx lr
	thumb_func_end sub_0202ED48

	thumb_func_start sub_0202ED58
sub_0202ED58: ; 0x0202ED58
	ldr r3, [r0, #4]
	mov r2, #4
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x1d
	orr r1, r3
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0202ED58

	thumb_func_start sub_0202ED68
sub_0202ED68: ; 0x0202ED68
	ldr r0, [r0, #4]
	lsl r0, r0, #0x1d
	asr r0, r0, #0x1f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202ED68
