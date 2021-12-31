#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27.h"
	.rodata
	.option alignment off

	.byte 3
	.short _EV_scr_seq_T27_000 + 1, 0
	.byte 2
	.short _EV_scr_seq_T27_015 + 1, 0
	.byte 1
	.word scr_seq_T27_map_scripts_2-.-4
	.byte 0

scr_seq_T27_map_scripts_2:
	.short VAR_UNK_4079, 1, _EV_scr_seq_T27_012 + 1
	.short 0

	.balign 4, 0
