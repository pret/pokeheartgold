#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0501.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D32R0501_013 + 1, 0
	.byte 1
	.word scr_seq_D32R0501_map_scripts_2-.-4
	.byte 0

scr_seq_D32R0501_map_scripts_2:
	.short VAR_UNK_4147, 1, _EV_scr_seq_D32R0501_003 + 1
	.short VAR_UNK_4147, 2, _EV_scr_seq_D32R0501_001 + 1
	.short VAR_UNK_4147, 3, _EV_scr_seq_D32R0501_004 + 1
	.short VAR_UNK_4147, 255, _EV_scr_seq_D32R0501_002 + 1
	.short 0

	.balign 4, 0
