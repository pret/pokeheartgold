	.include "asm/macros.inc"
	.include "unk_02026E84.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02026E84
sub_02026E84: ; 0x02026E84
	mov r0, #5
	lsl r0, r0, #0x18
	bx lr
	.balign 4, 0
	thumb_func_end sub_02026E84

	thumb_func_start sub_02026E8C
sub_02026E8C: ; 0x02026E8C
	mov r0, #2
	lsl r0, r0, #8
	bx lr
	.balign 4, 0
	thumb_func_end sub_02026E8C

	thumb_func_start sub_02026E94
sub_02026E94: ; 0x02026E94
	ldr r0, _02026E98 ; =0x05000400
	bx lr
	.balign 4, 0
_02026E98: .word 0x05000400
	thumb_func_end sub_02026E94

	thumb_func_start sub_02026E9C
sub_02026E9C: ; 0x02026E9C
	mov r0, #2
	lsl r0, r0, #8
	bx lr
	.balign 4, 0
	thumb_func_end sub_02026E9C

	thumb_func_start sub_02026EA4
sub_02026EA4: ; 0x02026EA4
	ldr r0, _02026EA8 ; =0x05000200
	bx lr
	.balign 4, 0
_02026EA8: .word 0x05000200
	thumb_func_end sub_02026EA4

	thumb_func_start sub_02026EAC
sub_02026EAC: ; 0x02026EAC
	ldr r0, _02026EB0 ; =0x05000600
	bx lr
	.balign 4, 0
_02026EB0: .word 0x05000600
	thumb_func_end sub_02026EAC
