#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0104.h"
	.rodata
	.option alignment off

	.byte 3
	.short _EV_scr_seq_P01R0104_002 + 1, 0
	.byte 2
	.short _EV_scr_seq_P01R0104_003 + 1, 0
	.byte 1
	.word scr_seq_P01R0104_map_scripts_2-.-4
	.byte 0

scr_seq_P01R0104_map_scripts_2:
	.short VAR_BOAT_DIRECTION, 1, _EV_scr_seq_P01R0104_001 + 1
	.short 0

	.balign 4, 0
