#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1201.h"
	.rodata
	.option alignment off

	.byte 3
	.short _EV_scr_seq_T25R1201_001 + 1, 0
	.byte 1
	.word scr_seq_T25R1201_map_scripts_2-.-4
	.byte 0

scr_seq_T25R1201_map_scripts_2:
	.short VAR_UNK_4133, 6, _EV_scr_seq_T25R1201_002 + 1
	.short 0

	.balign 4, 0
