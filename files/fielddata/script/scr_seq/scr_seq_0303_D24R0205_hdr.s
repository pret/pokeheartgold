#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0205.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_D24R0205_map_scripts_2-.-4
	.byte 3
	.short _EV_scr_seq_D24R0205_001 + 1, 0
	.byte 2
	.short _EV_scr_seq_D24R0205_008 + 1, 0
	.byte 0

scr_seq_D24R0205_map_scripts_2:
	.short VAR_UNK_40CE, 1, _EV_scr_seq_D24R0205_000 + 1
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 2, _EV_scr_seq_D24R0205_006 + 1
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 9, _EV_scr_seq_D24R0205_007 + 1
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 11, _EV_scr_seq_D24R0205_009 + 1
	.short 0

	.balign 4, 0
