#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 3
	.short 1, 0
	.byte 2
	.short 16, 0
	.byte 1
	.word scr_seq_0693_T27_hdr_0010-.-4
	.byte 0

scr_seq_0693_T27_hdr_0010:
	.short VAR_UNK_4079, 1, 13
	.short 0

	.balign 4, 0
