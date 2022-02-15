#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T03_008 + 1, 0
	.byte 4
	.short _EV_scr_seq_T03_013 + 1, 0
	.byte 3
	.short _EV_scr_seq_T03_011 + 1, 0
	.byte 1
	.word scr_seq_T03_map_scripts_2-.-4
	.byte 0

scr_seq_T03_map_scripts_2:
	.short VAR_UNK_4083, 2, _EV_scr_seq_T03_012 + 1
	.short 0

	.balign 4, 0
