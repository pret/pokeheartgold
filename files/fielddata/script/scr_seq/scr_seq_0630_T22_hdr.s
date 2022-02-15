#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T22_map_scripts_2-.-4
	.byte 0

scr_seq_T22_map_scripts_2:
	.short VAR_SCENE_VIOLET_CITY_OW, 1, _EV_scr_seq_T22_000 + 1
	.short VAR_SCENE_VIOLET_CITY_OW, 3, _EV_scr_seq_T22_004 + 1
	.short 0

	.balign 4, 0
