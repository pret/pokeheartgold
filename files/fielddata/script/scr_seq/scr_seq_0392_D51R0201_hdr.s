#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0201.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_D51R0201_002 + 1, 0
	.byte 1
	.word scr_seq_D51R0201_map_scripts_2-.-4
	.byte 0

scr_seq_D51R0201_map_scripts_2:
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 3, _EV_scr_seq_D51R0201_006 + 1
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 12, _EV_scr_seq_D51R0201_007 + 1
	.short 0

	.balign 4, 0
