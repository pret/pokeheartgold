#include "constants/items.h"
	.include "asm/macros.inc"
	.include "unk_0203BC10.inc"
	.include "global.inc"

	.rodata

	.extern sub_0203C8FC
	.extern sub_0203CA44
	.extern sub_0203CF0C
	.extern sub_0203D1A8
	.extern sub_0203D244
	.extern sub_0203D318
	.extern sub_0203D394
	.extern sub_0203D488
	.extern sub_0203D500
	.extern sub_0203D2CC

	.public _020FA0AC
_020FA0AC:
	.byte 0x01, 0x04, 0x00, 0x00
	.public _020FA0B0
_020FA0B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
	.public _020FA0B8
_020FA0B8:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00
	.public _020FA0C4
_020FA0C4:
	.word 0
	.word 1
	.word 2
	.word 4
	.word 5
	.word 6
	.word 100
	.word 100
	.word 100
	.word 100
	.word 100
	.word 3
	.global _020FA0F4
_020FA0F4:
	.word  0, sub_0203C8FC
	.word  1, sub_0203CA44
	.word  2, sub_0203CF0C
	.word  3, sub_0203D1A8
	.word  4, sub_0203D244
	.word  5, sub_0203D318
	.word  6, -2
	.word  7, sub_0203D394
	.word  8, sub_0203D488
	.word 14, sub_0203D500
	.word 14, sub_0203D500
	.word 14, sub_0203D500
	.word 14, sub_0203D2CC

	.text

	.extern sub_0203C1FC
	.extern sub_0203C38C
	.extern sub_0203C3B8
	.extern sub_0203C460
	.extern sub_0203CF74
	.extern sub_0203CFC0
