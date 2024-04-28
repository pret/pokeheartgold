	.include "asm/macros.inc"
	.include "unk_02013FDC.inc"
	.include "global.inc"

	.rodata

	.global _020F5F44
_020F5F44:
	.word 0x147, 0x1EF
	.global _020F5F4C
_020F5F4C:
	.word 0, 0, 10, 10
	.global _020F5F5C
_020F5F5C:
	.word 0, 0, 10, 10
	.global _020F5F6C
_020F5F6C:
	.word 0, 0, 8, 8
	.word 8, 0, 2, 4
	.word 8, 4, 2, 4
	.word 0, 8, 4, 2
	.word 4, 8, 4, 2
	.word 8, 8, 2, 2
	.global _020F5FCC
_020F5FCC:
	.word 0, 0, 8, 8
	.word 8, 0, 2, 4
	.word 8, 4, 2, 4
	.word 0, 8, 4, 2
	.word 4, 8, 4, 2
	.word 8, 8, 2, 2

	.text

	.extern sub_02013FDC
	.extern sub_0201401C
	.extern sub_02014050
	.extern sub_020140E8
	.extern sub_02014128
	.extern sub_02014178
	.extern sub_02014298
	.extern sub_020142D4
	.extern sub_02014350
	.extern sub_02014374
