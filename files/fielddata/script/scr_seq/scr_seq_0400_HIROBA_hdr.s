#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_HIROBA.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_HIROBA_map_scripts_2-.-4
	.byte 0

scr_seq_HIROBA_map_scripts_2:
	.short VAR_TEMP_x4003, 0, _EV_scr_seq_HIROBA_000 + 1
	.short 0

	.balign 4, 0
