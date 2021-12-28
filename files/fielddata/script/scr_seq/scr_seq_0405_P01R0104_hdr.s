#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 3
	.short 3, 0
	.byte 2
	.short 4, 0
	.byte 1
	.word scr_seq_0405_P01R0104_hdr_0010-.-4
	.byte 0

scr_seq_0405_P01R0104_hdr_0010:
	.short VAR_UNK_40E1, 1, 2
	.short 0

	.balign 4, 0
