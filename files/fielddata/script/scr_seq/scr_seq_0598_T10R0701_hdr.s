#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0598_T10R0701_hdr_000B-.-4
	.byte 4
	.short 2, 0
	.byte 0

scr_seq_0598_T10R0701_hdr_000B:
	.short VAR_TEMP_x4001, 0, 1
	.short 0

	.balign 4, 0
