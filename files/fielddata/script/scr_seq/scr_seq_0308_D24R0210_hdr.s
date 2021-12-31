#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0210.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_D24R0210_map_scripts_2-.-4
	.byte 3
	.short _EV_scr_seq_D24R0210_001 + 1, 0
	.byte 0

scr_seq_D24R0210_map_scripts_2:
	.short VAR_UNK_40D1, 1, _EV_scr_seq_D24R0210_000 + 1
	.short 0

	.balign 4, 0
