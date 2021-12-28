#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 3
	.short 1, 0
	.byte 4
	.short 3, 0
	.byte 1
	.word scr_seq_0375_D45R0102_hdr_0010-.-4
	.byte 0

scr_seq_0375_D45R0102_hdr_0010:
	.short VAR_UNK_40FE, 2, 2
	.short 0

	.balign 4, 0
