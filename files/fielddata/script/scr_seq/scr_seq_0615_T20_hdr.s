#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T20_map_scripts_2-.-4
	.byte 2
	.short _EV_scr_seq_T20_006 + 1, 0
	.byte 3
	.short _EV_scr_seq_T20_009 + 1, 0
	.byte 0

scr_seq_T20_map_scripts_2:
	.short VAR_SCENE_PLAYERS_HOUSE_1F, 1, _EV_scr_seq_T20_003 + 1
	.short VAR_SCENE_NEW_BARK_TOWN_OW, 1, _EV_scr_seq_T20_008 + 1
	.short 0

	.balign 4, 0
