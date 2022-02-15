#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0306.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_P01R0306_001 + 1, 0
	.byte 1
	.word scr_seq_P01R0306_map_scripts_2-.-4
	.byte 0

scr_seq_P01R0306_map_scripts_2:
	.short VAR_UNK_40CB, 5, _EV_scr_seq_P01R0306_003 + 1
	.short 0

	.balign 4, 0
