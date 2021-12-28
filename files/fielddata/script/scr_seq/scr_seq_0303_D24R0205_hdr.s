#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0303_D24R0205_hdr_0010-.-4
	.byte 3
	.short 2, 0
	.byte 2
	.short 9, 0
	.byte 0

scr_seq_0303_D24R0205_hdr_0010:
	.short VAR_UNK_40CE, 1, 1
	.short VAR_UNK_40FB, 2, 7
	.short VAR_UNK_40FB, 9, 8
	.short VAR_UNK_40FB, 11, 10
	.short 0

	.balign 4, 0
