#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T26_012 + 1, 0
	.byte 1
	.word scr_seq_T26_map_scripts_2-.-4
	.byte 0

scr_seq_T26_map_scripts_2:
	.short VAR_MIDGAME_BADGES, 4, _EV_scr_seq_T26_002 + 1
	.short VAR_SCENE_LIGHTHOUSE_JASMINE, 2, _EV_scr_seq_T26_003 + 1
	.short 0

	.balign 4, 0
