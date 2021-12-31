#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0101.h"
	.rodata
	.option alignment off

	.byte 3
	.short _EV_scr_seq_T20R0101_010 + 1, 0
	.byte 1
	.word scr_seq_T20R0101_map_scripts_2-.-4
	.byte 0

scr_seq_T20R0101_map_scripts_2:
	.short VAR_UNK_40FC, 2, _EV_scr_seq_T20R0101_015 + 1
	.short VAR_SCENE_ELMS_LAB, 3, _EV_scr_seq_T20R0101_002 + 1
	.short VAR_SCENE_ELMS_LAB, 8, _EV_scr_seq_T20R0101_014 + 1
	.short 0

	.balign 4, 0
