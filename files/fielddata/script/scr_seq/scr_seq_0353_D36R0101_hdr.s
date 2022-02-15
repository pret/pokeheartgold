#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D36R0101_000 + 1, 0
	.byte 3
	.short _EV_scr_seq_D36R0101_021 + 1, 0
	.byte 1
	.word scr_seq_D36R0101_map_scripts_2-.-4
	.byte 0

scr_seq_D36R0101_map_scripts_2:
	.short VAR_UNK_40FE, 4, _EV_scr_seq_D36R0101_022 + 1
	.short 0

	.balign 4, 0
