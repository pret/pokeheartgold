#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08R0201.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T08R0201_000 + 1, 0
	.byte 1
	.word scr_seq_T08R0201_map_scripts_2-.-4
	.byte 0

scr_seq_T08R0201_map_scripts_2:
	.short VAR_UNK_4124, 1, _EV_scr_seq_T08R0201_001 + 1
	.short VAR_UNK_4124, 2, _EV_scr_seq_T08R0201_002 + 1
	.short 0

	.balign 4, 0
