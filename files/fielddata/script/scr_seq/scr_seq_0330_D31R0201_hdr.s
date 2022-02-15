#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0201.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D31R0201_021 + 1, 0
	.byte 3
	.short _EV_scr_seq_D31R0201_022 + 1, 0
	.byte 1
	.word scr_seq_D31R0201_map_scripts_2-.-4
	.byte 0

scr_seq_D31R0201_map_scripts_2:
	.short VAR_UNK_414B, 1, _EV_scr_seq_D31R0201_003 + 1
	.short VAR_UNK_414B, 2, _EV_scr_seq_D31R0201_004 + 1
	.short VAR_UNK_414B, 3, _EV_scr_seq_D31R0201_007 + 1
	.short VAR_UNK_414B, 255, _EV_scr_seq_D31R0201_005 + 1
	.short 0

	.balign 4, 0
