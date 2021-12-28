#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 4
	.short 21, 0
	.byte 2
	.short 16, 0
	.byte 3
	.short 22, 0
	.byte 1
	.word scr_seq_0346_D32R0401_hdr_0015-.-4
	.byte 0

scr_seq_0346_D32R0401_hdr_0015:
	.short VAR_UNK_4145, 1, 4
	.short VAR_UNK_4145, 2, 2
	.short VAR_UNK_4145, 3, 5
	.short VAR_UNK_4145, 255, 3
	.short 0

	.balign 4, 0
