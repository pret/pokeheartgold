#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 3
	.short 2, 0
	.byte 1
	.word scr_seq_0403_P01R0102_hdr_0010-.-4
	.byte 2
	.short 6, 0
	.byte 0

scr_seq_0403_P01R0102_hdr_0010:
	.short VAR_UNK_40E1, 2, 3
	.short 0

	.balign 4, 0
