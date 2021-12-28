#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0314_D24R0216_hdr_0010-.-4
	.byte 2
	.short 5, 0
	.byte 3
	.short 7, 0
	.byte 0

scr_seq_0314_D24R0216_hdr_0010:
	.short VAR_UNK_40FB, 2, 2
	.short VAR_UNK_40FB, 9, 3
	.short VAR_UNK_40FB, 11, 4
	.short VAR_UNK_40CE, 1, 6
	.short 0

	.balign 4, 0
