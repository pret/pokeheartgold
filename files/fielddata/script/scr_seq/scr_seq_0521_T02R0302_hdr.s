#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0302.h"
	.rodata
	.option alignment off

	.byte 2
	.short std_trainer_house_reset, 0
	.byte 1
	.word scr_seq_T02R0302_map_scripts_2-.-4
	.byte 0

scr_seq_T02R0302_map_scripts_2:
	.short VAR_UNK_412E, 0, _EV_scr_seq_T02R0302_002 + 1
	.short VAR_UNK_412E, 5, _EV_scr_seq_T02R0302_003 + 1
	.short 0

	.balign 4, 0
