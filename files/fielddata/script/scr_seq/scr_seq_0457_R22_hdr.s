#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_R22_001 + 1, 0
	.byte 3
	.short _EV_scr_seq_R22_004 + 1, 0
	.byte 1
	.word scr_seq_R22_map_scripts_2-.-4
	.byte 0

scr_seq_R22_map_scripts_2:
	.short VAR_UNK_40FE, 1, _EV_scr_seq_R22_003 + 1
	.short 0

	.balign 4, 0
