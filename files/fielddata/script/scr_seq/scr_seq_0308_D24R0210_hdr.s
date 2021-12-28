#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0308_D24R0210_hdr_000B-.-4
	.byte 3
	.short 2, 0
	.byte 0

scr_seq_0308_D24R0210_hdr_000B:
	.short VAR_UNK_40D1, 1, 1
	.short 0

	.balign 4, 0
