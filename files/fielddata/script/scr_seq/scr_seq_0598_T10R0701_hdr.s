#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0701.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T10R0701_map_scripts_2-.-4
	.byte 4
	.short _EV_scr_seq_T10R0701_001 + 1, 0
	.byte 0

scr_seq_T10R0701_map_scripts_2:
	.short VAR_TEMP_x4001, 0, _EV_scr_seq_T10R0701_000 + 1
	.short 0

	.balign 4, 0
