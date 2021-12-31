#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T06_009 + 1, 0
	.byte 1
	.word scr_seq_T06_map_scripts_2-.-4
	.byte 0

scr_seq_T06_map_scripts_2:
	.short VAR_UNK_4130, 1, _EV_scr_seq_T06_013 + 1
	.short 0

	.balign 4, 0
