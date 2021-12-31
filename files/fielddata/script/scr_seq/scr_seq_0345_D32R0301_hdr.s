#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0301.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D32R0301_013 + 1, 0
	.byte 1
	.word scr_seq_D32R0301_map_scripts_2-.-4
	.byte 0

scr_seq_D32R0301_map_scripts_2:
	.short VAR_UNK_4142, 1, _EV_scr_seq_D32R0301_003 + 1
	.short VAR_UNK_4142, 2, _EV_scr_seq_D32R0301_001 + 1
	.short VAR_UNK_4142, 3, _EV_scr_seq_D32R0301_004 + 1
	.short VAR_UNK_4142, 255, _EV_scr_seq_D32R0301_002 + 1
	.short 0

	.balign 4, 0
