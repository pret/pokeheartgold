#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 2
	.short 5, 0
	.byte 3
	.short 9000, 0
	.byte 1
	.word scr_seq_0339_D32PC0101_hdr_0010-.-4
	.byte 0

scr_seq_0339_D32PC0101_hdr_0010:
	.short VAR_UNK_4133, 2, 9013
	.short VAR_UNK_4133, 1, 9012
	.short 0

	.balign 4, 0
