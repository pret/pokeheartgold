	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202D938
sub_0202D938: ; 0x0202D938
	mov r0, #0xe
	bx lr
	thumb_func_end sub_0202D938

	thumb_func_start sub_0202D93C
sub_0202D93C: ; 0x0202D93C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	bx lr
	thumb_func_end sub_0202D93C

	thumb_func_start sub_0202D95C
sub_0202D95C: ; 0x0202D95C
	ldr r3, _0202D964 ; =SavArray_get
	mov r1, #0x14
	bx r3
	nop
_0202D964: .word SavArray_get
	thumb_func_end sub_0202D95C
