#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 2
	.short 6, 0
	.byte 1
	.word scr_seq_0648_T24_hdr_000B-.-4
	.byte 0

scr_seq_0648_T24_hdr_000B:
	.short VAR_UNK_4116, 1, 7
	.short 0

	.balign 4, 0
