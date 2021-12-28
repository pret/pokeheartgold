#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0400_HIROBA_hdr_0006-.-4
	.byte 0

scr_seq_0400_HIROBA_hdr_0006:
	.short VAR_TEMP_x4003, 0, 1
	.short 0

	.balign 4, 0
