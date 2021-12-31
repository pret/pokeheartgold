#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0101.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D32R0101_011 + 1, 0
	.byte 1
	.word scr_seq_D32R0101_map_scripts_2-.-4
	.byte 0

scr_seq_D32R0101_map_scripts_2:
	.short VAR_UNK_40E6, 0, _EV_scr_seq_D32R0101_000 + 1
	.short 0

	.balign 4, 0
