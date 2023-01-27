	.include "asm/macros.inc"
	.include "unk_0203AC88.inc"
	.include "global.inc"

	.rodata

_020F6B2C:
	.word sub_02097238, sub_02097230, 0
	.word sub_02097248, sub_0209722C, 0
	.word sub_02097258, sub_02097234, 0
_020F6B2C_end:

	.text

	thumb_func_start sub_0203AC88
sub_0203AC88: ; 0x0203AC88
	ldr r0, _0203AC8C ; =_020F6B2C
	bx lr
	.balign 4, 0
_0203AC8C: .word _020F6B2C
	thumb_func_end sub_0203AC88

	thumb_func_start sub_0203AC90
sub_0203AC90: ; 0x0203AC90
	mov r0, #(_020F6B2C_end - _020F6B2C) / 12
	bx lr
	thumb_func_end sub_0203AC90
