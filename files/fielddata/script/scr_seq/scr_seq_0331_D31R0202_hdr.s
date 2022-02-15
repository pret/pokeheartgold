#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0202.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D31R0202_000 + 1, 0
	.byte 1
	.word scr_seq_D31R0202_map_scripts_2-.-4
	.byte 0

scr_seq_D31R0202_map_scripts_2:
	.short VAR_UNK_414D, 1, _EV_scr_seq_D31R0202_001 + 1
	.short VAR_UNK_414D, 2, _EV_scr_seq_D31R0202_002 + 1
	.short VAR_UNK_414D, 3, _EV_scr_seq_D31R0202_003 + 1
	.short 0

	.balign 4, 0
