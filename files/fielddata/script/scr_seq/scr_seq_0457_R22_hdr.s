#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 2
	.short 2, 0
	.byte 3
	.short 5, 0
	.byte 1
	.word scr_seq_0457_R22_hdr_0010-.-4
	.byte 0

scr_seq_0457_R22_hdr_0010:
	.short VAR_UNK_40FE, 1, 4
	.short 0

	.balign 4, 0
