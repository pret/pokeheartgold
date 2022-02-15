#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35R0201.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_R35R0201_map_scripts_2-.-4
	.byte 3
	.short _EV_scr_seq_R35R0201_009 + 1, 0
	.byte 2
	.short _EV_scr_seq_R35R0201_012 + 1, 0
	.byte 0

scr_seq_R35R0201_map_scripts_2:
	.short VAR_UNK_4118, 1, _EV_scr_seq_R35R0201_010 + 1
	.short 0

	.balign 4, 0
