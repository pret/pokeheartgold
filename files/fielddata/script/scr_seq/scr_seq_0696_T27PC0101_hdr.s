#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27PC0101.h"
	.rodata
	.option alignment off

	.byte 3
	.short std_wireless_reset_state, 0
	.byte 1
	.word scr_seq_T27PC0101_map_scripts_2-.-4
	.byte 0

scr_seq_T27PC0101_map_scripts_2:
	.short VAR_UNK_4133, 2, std_union_room_return
	.short VAR_UNK_4133, 1, std_wireless_colosseum_return
	.short VAR_UNK_410D, 0, _EV_scr_seq_T27PC0101_001 + 1
	.short 0

	.balign 4, 0
