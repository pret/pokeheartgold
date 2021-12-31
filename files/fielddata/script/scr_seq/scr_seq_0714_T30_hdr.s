#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T30_005 + 1, 0
	.byte 1
	.word scr_seq_T30_map_scripts_2-.-4
	.byte 0

scr_seq_T30_map_scripts_2:
	.short VAR_UNK_407B, 1, _EV_scr_seq_T30_007 + 1
	.short 0

	.balign 4, 0
