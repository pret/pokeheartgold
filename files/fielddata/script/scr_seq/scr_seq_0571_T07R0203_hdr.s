#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0203.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T07R0203_008 + 1, 0
	.byte 3
	.short _EV_scr_seq_T07R0203_011 + 1, 0
	.byte 1
	.word scr_seq_T07R0203_map_scripts_2-.-4
	.byte 0

scr_seq_T07R0203_map_scripts_2:
	.short VAR_UNK_412C, 0, _EV_scr_seq_T07R0203_010 + 1
	.short 0

	.balign 4, 0
