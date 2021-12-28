#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 2
	.short 2, 0
	.byte 1
	.word scr_seq_0402_P01R0101_hdr_000B-.-4
	.byte 0

scr_seq_0402_P01R0101_hdr_000B:
	.short VAR_UNK_411A, 1, 3
	.short 0

	.balign 4, 0
