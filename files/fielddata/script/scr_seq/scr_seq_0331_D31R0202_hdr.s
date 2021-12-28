#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 2
	.short 1, 0
	.byte 1
	.word scr_seq_0331_D31R0202_hdr_000B-.-4
	.byte 0

scr_seq_0331_D31R0202_hdr_000B:
	.short VAR_UNK_414D, 1, 2
	.short VAR_UNK_414D, 2, 3
	.short VAR_UNK_414D, 3, 4
	.short 0

	.balign 4, 0
