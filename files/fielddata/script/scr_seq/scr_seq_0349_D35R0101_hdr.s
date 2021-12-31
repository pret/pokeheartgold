#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0101.h"
	.rodata
	.option alignment off

	.byte 3
	.short _EV_scr_seq_D35R0101_001 + 1, 0
	.byte 4
	.short _EV_scr_seq_D35R0101_008 + 1, 0
	.byte 1
	.word scr_seq_D35R0101_map_scripts_2-.-4
	.byte 0

scr_seq_D35R0101_map_scripts_2:
	.short VAR_UNK_40A8, 1, _EV_scr_seq_D35R0101_006 + 1
	.short 0

	.balign 4, 0
