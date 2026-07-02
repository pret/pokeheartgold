	.include "asm/macros.inc"
	.include "unk_02037C94.inc"
	.include "global.inc"

	.bss

.public _021D4150
_021D4150:
	.space 0x4

	.rodata

.public _020F6A90
_020F6A90:
	.word sub_0203827C
	.word sub_02038398
	.word 0

	.data

	.balign 4, 0
.public _0210F904
_0210F904:
	.asciz " GAME"
	.balign 4, 0
.public _0210F90C
_0210F90C:
	.asciz "FREAK"
	.balign 4, 0
.public _0210F914
_0210F914:
	.asciz " FULL"

	.text

