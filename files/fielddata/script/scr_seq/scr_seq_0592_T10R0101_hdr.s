#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0101.h"
	.rodata
	.option alignment off

	.byte 2
	.short 6, 0
	.byte 3
	.short 9000, 0
	.byte 1
	.word scr_seq_T10R0101_map_scripts_2-.-4
	.byte 0

scr_seq_T10R0101_map_scripts_2:
	.short VAR_UNK_4133, 2, 9013
	.short VAR_UNK_4133, 1, 9012
	.short 0

	.balign 4, 0
