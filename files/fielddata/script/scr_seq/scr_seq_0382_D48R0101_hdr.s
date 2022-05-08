#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D48R0101.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_D48R0101_map_scripts_2-.-4
	.byte 2
	.short _EV_scr_seq_D48R0101_005 + 1, 0
	.byte 3
	.short _EV_scr_seq_D48R0101_006 + 1, 0
	.byte 0

scr_seq_D48R0101_map_scripts_2:
	.short VAR_SCENE_EMBEDDED_TOWER, 2, _EV_scr_seq_D48R0101_004 + 1
	.short 0

	.balign 4, 0
