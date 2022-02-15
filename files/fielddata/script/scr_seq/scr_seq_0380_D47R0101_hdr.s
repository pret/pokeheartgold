#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47R0101.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_D47R0101_map_scripts_2-.-4
	.byte 0

scr_seq_D47R0101_map_scripts_2:
	.short VAR_SCENE_SAFARI_ZONE_ENTRANCE, 1, _EV_scr_seq_D47R0101_006 + 1
	.short VAR_SCENE_SAFARI_ZONE_ENTRANCE, 3, _EV_scr_seq_D47R0101_006 + 1
	.short VAR_SCENE_SAFARI_ZONE_ENTRANCE, 2, _EV_scr_seq_D47R0101_007 + 1
	.short VAR_UNK_4057, 1, _EV_scr_seq_D47R0101_008 + 1
	.short VAR_UNK_4057, 4, _EV_scr_seq_D47R0101_009 + 1
	.short 0

	.balign 4, 0
