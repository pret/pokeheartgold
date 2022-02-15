#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0601.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T25R0601_002 + 1, 0
	.byte 1
	.word scr_seq_T25R0601_map_scripts_2-.-4
	.byte 0

scr_seq_T25R0601_map_scripts_2:
	.short VAR_UNK_4082, 1, _EV_scr_seq_T25R0601_003 + 1
	.short 0

	.balign 4, 0
