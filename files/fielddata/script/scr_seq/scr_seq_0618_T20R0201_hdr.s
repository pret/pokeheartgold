#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0201.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T20R0201_map_scripts_2-.-4
	.byte 0

scr_seq_T20R0201_map_scripts_2:
	.short VAR_SCENE_PLAYERS_HOUSE_1F, 3, _EV_scr_seq_T20R0201_006 + 1
	.short VAR_SCENE_PLAYERS_HOUSE_1F, 0, _EV_scr_seq_T20R0201_000 + 1
	.short 0

	.balign 4, 0
