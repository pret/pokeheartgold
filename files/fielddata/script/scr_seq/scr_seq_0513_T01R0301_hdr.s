#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0301.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T01R0301_010 + 1, 0
	.byte 1
	.word scr_seq_T01R0301_map_scripts_2-.-4
	.byte 0

scr_seq_T01R0301_map_scripts_2:
	.short VAR_UNK_4131, 1, _EV_scr_seq_T01R0301_006 + 1
	.short 0

	.balign 4, 0
