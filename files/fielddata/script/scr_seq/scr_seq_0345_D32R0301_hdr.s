#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 2
	.short 14, 0
	.byte 1
	.word scr_seq_0345_D32R0301_hdr_000B-.-4
	.byte 0

scr_seq_0345_D32R0301_hdr_000B:
	.short VAR_UNK_4142, 1, 4
	.short VAR_UNK_4142, 2, 2
	.short VAR_UNK_4142, 3, 5
	.short VAR_UNK_4142, 255, 3
	.short 0

	.balign 4, 0
