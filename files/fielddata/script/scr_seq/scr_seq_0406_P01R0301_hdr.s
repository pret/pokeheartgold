#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0301.h"
	.rodata
	.option alignment off

	.byte 3
	.short _EV_scr_seq_P01R0301_006 + 1, 0
	.byte 2
	.short _EV_scr_seq_P01R0301_007 + 1, 0
	.byte 4
	.short _EV_scr_seq_P01R0301_008 + 1, 0
	.byte 1
	.word scr_seq_P01R0301_map_scripts_2-.-4
	.byte 0

scr_seq_P01R0301_map_scripts_2:
	.short VAR_UNK_40DC, 0, _EV_scr_seq_P01R0301_005 + 1
	.short 0

	.balign 4, 0
