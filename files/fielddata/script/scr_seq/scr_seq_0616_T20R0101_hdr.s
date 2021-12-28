#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 3
	.short 11, 0
	.byte 1
	.word scr_seq_0616_T20R0101_hdr_000B-.-4
	.byte 0

scr_seq_0616_T20R0101_hdr_000B:
	.short VAR_UNK_40FC, 2, 16
	.short VAR_UNK_4108, 3, 3
	.short VAR_UNK_4108, 8, 15
	.short 0

	.balign 4, 0
