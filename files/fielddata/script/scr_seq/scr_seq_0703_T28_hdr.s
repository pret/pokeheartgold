#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T28_map_scripts_2-.-4
	.byte 0

scr_seq_T28_map_scripts_2:
	.short VAR_MIDGAME_BADGES, 4, _EV_scr_seq_T28_005 + 1
	.short 0

	.balign 4, 0
